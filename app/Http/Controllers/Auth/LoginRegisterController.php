<?php

namespace App\Http\Controllers\Auth;

use App\Models\User;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\DB;

class LoginRegisterController extends Controller
{
    public function __construct()
    {
        //$this->auth = $auth;
        //$this->middleware('guest')->except([
        //    'logout', 'dashboard'
        //]);
        //$this->authorizeResource(Post::class);
    }

    public function store(Request $request)//: View
    {
        $ret['msg']='';
        //check if user or email if not exist 
        if(DB::table('users')->where('name', $request->name)->exists()){
			$ret['msg']="Username already exist.";
			return response()->json($ret);
		}
        if(DB::table('users')->where('email', $request->email)->exists()){
			$ret['msg']="Email already exist.";
			return response()->json($ret);
		}

        $isSave=User::create([
            'name' => $request->name,
            'email' => $request->email,
            'first_name'=> $request->first_name,
            'last_name'=> $request->last_name,
            'password' => Hash::make($request->password)
        ]);
        
        $credentials = $request->only('name', 'password');
        
        $isSuccess=Auth::attempt($credentials);
        //Auth::login($user);
        $request->session()->regenerate();

        if(!$isSuccess){
            $ret['msg']='Failed to save new announcement.';
        }
        $user=Auth::user();
        /*session('login',$user->only(['id', 'name', 'first_name', 'last_name','email']));
        session('first_name', $user->only(['first_name']));
        session('last_name', $user->only(['last_name']));
        session('user_id', $user->only(['id']));*/
        $request->session()->put('login', $user->only(['id', 'name', 'first_name', 'last_name','email']));
        $request->session()->put('first_name', $user->first_name);
        $request->session()->put('last_name', $user->last_name);
        $request->session()->put('user_id', $user->id);
        return response()->json($ret);
    }
   
    public function authenticate(Request $request)
    {
        /*$credentials = $request->validate([
            'email' => 'required|email',
            'password' => 'required'
        ]);*/
        $ret['msg']="";
        $credentials = $request->only('name', 'password');
        if(Auth::attempt($credentials))
        {
            $request->session()->regenerate();
            $user=Auth::user();
            $request->session()->put('login', $user->only(['id', 'name', 'first_name', 'last_name','email']));
            $request->session()->put('first_name', $user->first_name);
            $request->session()->put('last_name', $user->last_name);
            $request->session()->put('user_id', $user->id);
            
            /*session('login',$user->only(['id', 'name', 'first_name', 'last_name','email']));
            session('first_name', $user->only(['first_name']));
            session('last_name', $user->only(['last_name']));
            session('user_id', $user->only(['id']));*/
            //session(['user_id' => 'value']) 
            return response()->json($ret);
        }
        $ret['msg']='Invalid username or password.';
        return response()->json($ret);        
    } 
    
    public function dashboard()
    {
        if(Auth::check())
        {
            return view('pages.dashboard');
        }
        
        return redirect()->route('public_announcement');
    } 
    
    /**
     * Log out the user from application.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function logout(Request $request)
    {
        Auth::logout();
        $request->session()->invalidate();
        $request->session()->regenerateToken();
        return redirect()->route('public_announcement')
            ->withSuccess('You have logged out successfully!');
    }    

}
