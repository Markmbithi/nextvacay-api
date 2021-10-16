<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>NextVacay</title>
    <link rel="stylesheet" href="{{ asset('css/app.css') }}">
</head>
<body class="bg-gray-200">
    <nav class="p-6 bg-white flex justify-between mb-6">
        <ul class="flex items-center">
            <li>
                <a href="" class="p-3">Home</a>
            </li>
            @if (session('token'))
            <li>
                <a href="" class="p-3">Dashboard</a>
            </li>
            @endif
        </ul>

        <ul class="flex items-center">
            @if (session('token'))
                <li>
                    <a href="#" class="p-3">{{ session('name') }}</a>
                </li>
                <li>
                    <a href="{{ route('profile') }}" class="p-3">Profile</a>
                </li>
                <li>
                    <a href="{{ route('logout') }}" class="p-3">Logout</a>
                </li>
            @else
                <li>
                    <a href="" class="p-3">Login</a>
                </li>
                <li>
                    <a href="{{route('register')}}" class="p-3">Register</a>
                </li>
            @endif      
        </ul>
    </nav>
    @yield('content')
</body>
</html>