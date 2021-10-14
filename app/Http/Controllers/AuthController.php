<?php

namespace App\Http\Controllers;
use App\Services\UserService;
use App\Models\LoginToken;
use Illuminate\Http\Request;
use App\Models\User;

class AuthController extends Controller
{

    private $userService;

    public function __construct(UserService $userService)
    {
        $this->userService = $userService;
    }
    // Register the user
    public function register(Request $request) {
        
        $fields = $request->validate([
            'name' => 'required|string',
            'email' => 'required|string|unique:users,email',
        ]);

        $user = User::create([
            'name' => $fields['name'],
            'email' => $fields['email'],
            'password' => bcrypt('password')
        ]);

        if(!$user) {
            
            $response = [
                'registered' => false,
                'message' => 'Please register later' 
            ];

            return response($response, 401);
        }

        // Inform user to proceed to login
        $response = [
            'registered' => true,
            'message' => 'Proceed to login' 
        ];

        return response($response, 201);            
    }

    // Verifies the token in the link clicked in the email on the portal front end
    public function verifyLogin(Request $request) {

        // Check if token exists
        $token = LoginToken::where('token', $request->token)->first();

        if(!$token) {
            $response = [
                'loginSuccess'=>false,
                'message' => 'Invalid token, Please log in again' 
            ];

            return response($response, 401);
        }

        // Check if link is valid
        if(!$token->isValid()) {
            $response = [
                'loginSuccess'=>false,
                'message' => 'Invalid link, Please log in again' 
            ];

            return response($response, 401);
        }  
        
        // Generate token and send to front end
        $email = $token->user->email;
        $user = User::where('email', $email)->first();

        if(!$user) {
            $response = [
                'loginSuccess'=>false,
                'message' => 'Problem, please log in later' 
            ];

            return response($response, 401);
        }
        
        $authtoken = $user->createToken('vacaytoken')->plainTextToken;

        if(!$authtoken) {
            $response = [
                'loginSuccess'=>false,
                'message' => 'Problem, please log in later' 
            ];

            return response($response, 401);
        }
        
        // Consume the link to make it unusable in the future
        $token->consume();
        
        $response = [
            'error'=>false,
            'loginSuccess'=>true,
            'user'=>$token->user,
            'token'=>$authtoken,
        ];

        return response($response,201);
        
    }

    public function login(Request $request) {
        $data = $request->validate([
            'email' => ['required', 'email','exists:users,email']
        ]);      

        $user = $this->userService->email($data['email']);

        if(!$user) {
            return response([
                'loginSuccess'=>false,
                'message' => 'Please register to access profile'
            ], 401);
        }

        // Send a login link to them
        return response($user->sendLoginLink(),201);

    }

    // Logout the user
    public function logout()
    {
        auth()->user()->tokens()->delete();

        return response()->json([
            'message'=>'Signed Out',
        ]);
    }
}
