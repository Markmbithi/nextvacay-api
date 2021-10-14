<?php

namespace App\Services;

use App\Models\User;
use Illuminate\Database\Eloquent\ModelNotFoundException;

class UserService
{
    public function search($user_id)
    {
        $user = User::find($user_id);
        
        if (!$user) {
            throw new ModelNotFoundException('User not found by ID ' . $user_id);
        }
        
        return $user;
    }

    public function email($email) {
        
        $user = User::where('email','=',$email)->first();
        
        if (!$user) {
            throw new ModelNotFoundException('User not found by email ' . $email);
        }
        
        return $user;
    }

}