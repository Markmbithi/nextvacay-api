<?php

namespace App\Http\Controllers\Auth;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\User;
use Illuminate\Support\Facades\Hash;

class RegisterController extends Controller
{
    public function index() {
        return view('auth.register');
    }

    public function register(Request $request) 
    {       
        // Validate request
        $this->validate($request,[
            'name'=>'required|max:255',
            'email'=>'required|email|max:255',
        ]);

        $body = [
            'name'=> $request->name,
            'email'=> $request->email,
        ];

        $body = [
            'email'=> $fields['email'],
        ];

        $baseURL = env('API_URL');

        $response = Http::accept('application/json')->get($baseURL.'/register', $body);
        
        $data = json_decode($response);
        
        if($data->error) {

            $message = $data->message;

            if($message==='The given data was invalid.') {
                $message='User not registered';
                return redirect()->route('register')->with(['message' => $message]); 
            }
            
            return redirect()->route('register')->with(['message' => $message]);
        }

        return redirect()->route('register')->with( ['message' => $message] );

    }   
}