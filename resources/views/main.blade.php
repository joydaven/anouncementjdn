@include('templates.header')
    @guest
        @section('public')
        @show
    @endguest
    @auth
        @yield('content')
    @endauth
@include('templates.footer')