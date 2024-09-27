<!DOCTYPE html>
<html lang="en">

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <!-- Meta, title, CSS, favicons, etc. -->
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Ticketing System</title>
    <link rel="icon" type="image/x-icon" href="{{ URL::asset('/images/Logo.png') }}">
    <!-- Bootstrap -->
    <link rel="stylesheet" href="{{ URL::asset('assets/vendors/bootstrap/dist/css/bootstrap.min.css') }}" />
    <!-- Font Awesome -->
    <link rel="stylesheet" href="{{ URL::asset('assets/vendors/font-awesome/css/font-awesome.min.css') }}" />
    <!-- NProgress -->
    <link rel="stylesheet" href="{{ URL::asset('assets/vendors/nprogress/nprogress.css') }}" />
    <!-- Animate.css -->
    <link rel="stylesheet" href="{{ URL::asset('assets/vendors/animate.css/animate.min.css') }}" />
    <!-- Custom Theme Style -->
    <link rel="stylesheet" href="{{ URL::asset('assets/build/css/custom.min.css') }}" />
</head>
<style>
    @font-face {
        font-family: OpenSans-Regular;
        src: url(assets/css/fonts/OpenSans-Regular.ttf);
    }
    .login-from {
        color: white;
        background: #1032ba;
        background: -webkit-linear-gradient(to right, #556270, #122ebd);
        background: linear-gradient(to right, #556270, #183fca);
    }
    .site_title {
        text-overflow: ellipsis;
        overflow: inherit !important;
        font-weight: 400;
        font-size: 22px;
        width: 100%;
        color: #ECF0F1 !important;
        margin-left: 0 !important;
        line-height: 59px;
        display: block;
        height: 69px !important;
        margin: 0;
        padding-left: 10px;
    }
    body, .login_content h1{
        font-family: OpenSans-Regular;
    }
    .login_content{margin: 0 15px auto;}
    .login_content form input[type="text"], .login_content form input[type="email"], .login_content form input[type="password"]{
        border-radius: 3px;
        background-color: #efeded;
        border: none;
        box-shadow: none;
        margin:0 0 15px;
    }
    .login_content form input[type="text"]:focus, .login_content form input[type="email"]:focus, .login_content form input[type="password"]:focus{
        border: 1px solid #9E9EF7;
    }
    .btnBox{text-align: left;}
    .btnLogin{
        float: right;
        border: none;
        background: #7272fc;
        padding: 6px 22px;
        margin-right: 0px;
    }
    .btn-link{margin:initial; padding: 0 !important;font-size: 13px !important;text-decoration: auto;}


</style>

<body class="login login-from">
    <div>
        <a class="hiddenanchor" id="signup"></a>
        <a class="hiddenanchor" id="signin"></a>
        <div class="login_wrapper">
            <div class="animate form login_form"
                style="background:white; color:black; border:8px solid white;border-radius: 15px;">
                <section class="login_content">
                    <h1>Ticketing System</h1>

                    <form method="POST" action="{{ route('login') }}">
                        @csrf
                        <h1>Login</h1>
                        @if (session('message'))
                        <div class="alert alert-success" role="alert">
                            {{ session('message') }}
                        </div>
                        @endif
                       @if ($errors->any())
                            <div>
                                <p class="alert alert-danger"> {{ $errors->first() }}</p>

                            </div>
                        @endif

                        <div>
                            <input id="email" type="text" placeholder="Username" required=""
                                class="form-control @error('email') is-invalid @enderror" name="email"
                                value="{{ old('email') }}" required autocomplete="email" autofocus>
                            @error('email')
                            <span class="invalid-feedback" role="alert">
                                <strong>{{ $message }}</strong>
                            </span>
                            @enderror
                        </div>

                        <div>
                            <input id="password" type="password" placeholder="Password" required=""
                                class="form-control @error('password') is-invalid @enderror" name="password" required
                                autocomplete="current-password">
                            @error('password')
                            <span class="invalid-feedback" role="alert">
                                <strong>{{ $message }}</strong>
                            </span>
                            @enderror
                        </div>

                        <div class="btnBox">
                        @if (Route::has('password.request'))
                            <a class="underline text-sm text-gray-600 hover:text-gray-900 rounded-md focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-indigo-500" href="{{ route('password.request') }}">
                                {{ __('Forgot your password?') }}
                            </a>
                        @endif

                            <button type="submit" class="btn btn-primary login-from btnLogin">
                                {{ __('Login') }} <i class="fa fa-arrow-circle-right"></i>
                            </button>
                            <div style="clear: both"></div>
                        </div>
                        <div class="separator">
                            <div>
                                <p>©{{date('Y')}} All Rights Reserved By. MD. AZAM ALI .</p>
                            </div>
                        </div>
                    </form>
                </section>
            </div>

            <div></div>
            </form>
            </section>
        </div>
    </div>
    </div>
</body>

</html>
