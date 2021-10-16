<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Http;

class UserController extends Controller
{
    public function index() {
        return view('auth.register');
    }

    public function viewProfile() {

        if(!session('token')) {
            return redirect()->route('login');
        }

        return view('auth.profile');
    }

    public function updateProfile(Request $request) 
    {       
        // Validate request
        $this->validate($request,[
            'email'=>'required|email|max:255',
        ]);

        $body = [
            'email'=> $request->email,
            'name'=>$request->name,
            'id'=>session('id'),
        ];

        $headers = [
            'Content-Type'  => 'application/json',
         ];

        $baseURL = env('API_URL');
        
        $response = Http::withToken(session('token'))->withHeaders($headers)->post($baseURL.'/update',
             $body
        );

        $data = json_decode($response);
        
        if($data->error) {
            return redirect()->route('profile')->with(['message' => $data->message]); 
        }

        session(['name'=>$data->name, 'email'=>$data->email]);

        return redirect()->route('profile')->with(['message' => $data->message]);

    }
     
}
