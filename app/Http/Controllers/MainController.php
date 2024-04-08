<?php

namespace App\Http\Controllers;
use App\Models\User;
use Illuminate\View\View;
use App\Models\Announcement;
use Illuminate\Support\Facades\DB;
use Illuminate\Http\Request;
//use Illuminate\Support\Facades\URL;
use Illuminate\Http\RedirectResponse;
use Illuminate\Support\Facades\Auth;
//use Illuminate\Routing\UrlGenerator;

class MainController extends Controller
{
    /**
     * Show the profile for a given user.
     */
    public function main(Request $request): View
    {
        $data['title'] = 'Announcement';
		$data['msg'] = '';
        $data['base_url'] = url()->to('/').'/';

        if($request->session()->get('login')){
			$data['msg']='';
            return view('pages.dashboard', [
                'ret' => $data
            ]);
		}
		
		$data['msg']='Failed to fetch list of announcement.';
        return view('pages.public_announcement', [
            'ret' => $data
        ]);
    }

    public function allanouncement(Request $request)
    {
        $data['list'] =  DB::table('announcement')
                        ->selectRaw('title,content,start_date,end_date,first_name,last_name,name,announcement.date_created')
                        ->leftJoin('users', 'users.id', '=', 'announcement.user_id')
                        ->where('announcement.active', 1)
                        ->orderBy('announcement.date_created', 'desc')
                        ->get();
        //update past end_date to inactive
        DB::table('announcement')
              ->whereRaw('end_date <= CURDATE()')
              ->update(['active'=>0]);
		$data['msg']="";
		if($data['list']->count() >0){
			return response()->json($data);
		}
        $data['msg']='no announcement'; 
        return response()->json($data);
    }

    public function myannouncement(Request $request){
        $data['list'] = DB::table('announcement')->where('user_id',$request->user_id)->get();
		$data['msg']="";
		if($data['list']->count() >0){
			return response()->json($data);
		}
		$data['msg']='Your Announcement is Empty';
		return response()->json($data);
    }
    public function saveannouncement(Request $request){
        $data = [
            'user_id' => $request->user_id,
            'title' =>  $request->title,
            'content' => $request->content,
            'start_date' => date('Y-m-d',strtotime($request->startdate)),
            'end_date' => date('Y-m-d',strtotime($request->enddate)),
        ];
        $isSave=DB::table('announcement')->insert($data);
        $ret['msg']="";
        if($isSave){
            return response()->json($ret);
        }
        $ret['msg']='Failed to save new announcement.';
        return response()->json($ret);
    }
    public function updateannouncement(Request $request){
        $data = [
			'title' =>  $request->title,
			'content' => $request->content,
			'start_date' => date('Y-m-d',strtotime($request->startdate)),
			'end_date' => date('Y-m-d',strtotime($request->enddate)),
        ];
        $isSave=DB::table('announcement')
            ->where('id', $request->id)
            ->update($data);

		$ret['msg']="";
		if($isSave){
			return response()->json($ret);
		}
		$ret['msg']='Failed to save new announcement.';
		return response()->json($ret);
    }
    public function deleteannouncement(Request $request){
        $ret['msg']="";
        $isDelete=DB::table('announcement')->where('id', '=', $request->id)->delete();
		if($isDelete){
			return response()->json($ret);
		}
		$ret['msg']='Failed to save new announcement.';
		return response()->json($ret);
    }
    public function editannouncement(Request $request){
        $dat = DB::table('announcement')
                        ->where('id', $request->id);
        $ret['list']=$dat->first();
		$ret['msg']="";
		if($dat->count() >0){
			return response()->json($ret);
		}
		$ret['msg']='Failed to get announcement details.';
		return response()->json($ret);
	}
}
