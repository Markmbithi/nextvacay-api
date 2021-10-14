<?php

namespace App\Http\Controllers;

use App\Models\User;
use Illuminate\Http\Request;

class UserController extends Controller
{
    public function update(Request $request) {
        
        $fields = $request->validate([
            'name' => 'required|string',
            'email' => 'required|string|unique:users,email',
        ]);

        $id = $request->id;
        
        $user = User::find($id);

        if(!$user) {
            
            $response = [
                'updated' => false,
                'message' => 'User does not exist' 
            ];

            return response($response, 401);
        }

        $update = $user->update(['email'=>$fields['email'],'name'=>$fields['name']]);

        if(!$update) {
            $response = [
                'error'=>true,
                'updated' => false,
                'message' => 'Please try later' 
            ];
            return response($response, 401);
        }

        // Get user data and send back
        $user = User::find($id);

        $response = [
            'error'=>false,
            'updated' => true,
            'message' => 'Updated successfully',
            'name'=> $user->name,
            'email'=> $user->email
        ];

        return response($response, 201);                 
    }
}
