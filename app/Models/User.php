<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Foundation\Auth\User as Authenticatable;
use Illuminate\Notifications\Notifiable;
use Illuminate\Support\Facades\Hash;
use Laravel\Sanctum\HasApiTokens;
use Illuminate\Support\Str;

class User extends Authenticatable
{
    use HasApiTokens, HasFactory, Notifiable;

    /**
     * The attributes that are mass assignable.
     *
     * @var string[]
     */
    protected $fillable = [
        'name',
        'email',
        'password',
    ];

    /**
     * The attributes that should be hidden for serialization.
     *
     * @var array
     */
    protected $hidden = [
        'password',
        'remember_token',
    ];

    /**
     * The attributes that should be cast.
     *
     * @var array
     */
    protected $casts = [
        'email_verified_at' => 'datetime',
    ];

    public function loginTokens() {

        return $this->hasMany(LoginToken::class);

    }

    public function sendLoginLink() {

        $plaintext = Str::random(32);

        $token = $this->loginTokens()->create([
            'token' => Hash::make($plaintext),
            'expires_at' => now()->addMinutes(10),
        ]);

        $response = [
            'error'=>false,
            'loginSuccess'=>true,
            'expires_at'=>$token->expires_at,
            'token'=>$token,
        ];

        return $response;

    }
}
