<?php

namespace App\Http\Controllers;
use App\Services\UserService;
use App\Models\LoginToken;
use Illuminate\Http\Request;
use App\Models\User;
use Illuminate\Database\Eloquent\ModelNotFoundException;
use Illuminate\Http\Client\ResponseSequence;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Hash;
use Laravel\Sanctum\PersonalAccessToken;

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

        //$token = $user->createToken('vacaytoken')->plainTextToken;

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

    // Verify Login Verifies the link clicked in the email
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
        // Return the token
        
        // $token->consumed_at = now();
        // $token->save();
        $response = [
            'error'=>false,
            'loginSuccess'=>true,
            'isConsumed'=>$token->isConsumed(),
            'isExpired'=>$token->isExpired(),
            'isValid'=>$token->isValid(),
            'user'=>$token->user,
            'token'=>$authtoken,
        ];

        //session()->flash('success', true);

        return response($response);
        
    }

    public function login(Request $request) {
        $data = $request->validate([
            'email' => ['required', 'email','exists:users,email']
        ]);

        // Check if user exists
        //$user = User::where('email','=',$data['email'])->first();
        //$users = DB::table('users')->where('email', $data['email'])->get();
        

            $user = $this->userService->email($data['email']);

            //return $user;

        // if user is not found
        if(!$user) {
            return response([
                'loginSuccess'=>false,
                'message' => 'Please register to access profile'
            ], 401);
        }

        // // Send a login link to them
        return response($user->sendLoginLink(),201);

        // Send a JSON response to ask them to check mail

        // $token = $user1->createToken('vacaytoken')->plainTextToken;
        
        // $personalAccessToken = PersonalAccessToken::findToken($request->token);
        // $user = $personalAccessToken->tokenable;
        // auth()->login($user);
        // $username = auth()->user()->name; 

        // session()->flash('success', true);

        // return response()->json([
        //     'personalAccessToken'=>$personalAccessToken,
        //     'user'=>$user,
        //     'username'=>$username,
        //     'loginSuccess'=>true,
        //     'message'=>'Please check email for login link'
        // ]);
    }

    // Logout the user
    public function logout()
    {
        auth()->user()->tokens()->delete();

        return response()->json([
            'message'=>'Signed Out',
        ]);
    }
    
    public function updateProfile(Request $request) {
        
        // Validate the data
        $validatedData = $request->validate([
            'email'=> 'required|string|email|unique:users,email|max:255',
        ]);

        // Update the profile data
        // $user = UserDB::update(`update users set email = $validatedData['email'] where name = ?`, ['John']);([
        //     'email'=> $validatedData['email'],
        // ]);

        $token = $user->createToken('auth_token')->plainTextToken;

        return response()->json([
            'access_token' => $token,
            'token_type' => 'Bearer',
        ]);        
    }
}
