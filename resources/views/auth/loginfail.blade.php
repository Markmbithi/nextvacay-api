@extends('layouts.app')

@section('content')
    <div class="flex justify-center">
        <div class="w-4/12 bg-white p-6 rounded-lg">
            <div> {{ session()->get( 'message' ) }}  </div>
            <form action="{{route('login')}}" method="post">
                @csrf
                    <div>
                        <button type="submit" class="bg-blue-500 text-white px-4 py-3 rounded font-medium w-full">Register</button>
                    </div>
                </form>
        </div>
    </div>
@endsection