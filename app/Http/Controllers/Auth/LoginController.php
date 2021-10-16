<?php

namespace App\Http\Controllers\Auth;
use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Http;
use Illuminate\Support\Facades\Session;
use Illuminate\Support\Facades\URL;
use App\Services\MailService;

class LoginController extends Controller
{
    protected $mailService;

    /**
     * Instantiate a new controller instance.
     *
     * @return void
     */
    public function __construct(MailService $mailService)
    {
        $this->mailService = $mailService;
    }

    public function index() {
        
        if(!session('token')) {
            return view('auth.login');
        }

        return redirect()->route('dashboard');
    }

    public function login(Request $request) 
    {       
        // Validate request
        $fields = $request->validate([
            'email' => 'required|string|max:255',
        ]);

        $body = [
            'email'=> $fields['email'],
        ];

        $baseURL = env('API_URL');

        $response = Http::accept('application/json')->get($baseURL.'/login', $body);

        $data = json_decode($response);
        
        if($data->error) {

            $message = $data->message;

            if($message==='The given data was invalid.') {
                $message='Email is not registerd';
                return redirect()->route('login')->with(['message' => $message]); 
            }
            
            return redirect()->route('login')->with(['message' => $message]);
        }

        // If successful then get token and expiry sent from server and create a temporary signed route and email user
        $token = $data->token->token;

        $link = URL::temporarySignedRoute('verify-login', now()->addMinutes(10),[
            'token' => $token,
        ]);

        // Send temporary route email to the user for them to login
        $emailDetails =  [
            'subject' => 'Login Route',
            'to_email' => $fields['email'],
            'url' => $link
        ];

        $this->mailService->sendMail(json_encode($emailDetails));

        return redirect()->route('loginsuccess')->with( ['message' => 'Please check your email to complete login'] );    
    }

    public function verifyLogin(Request $request) {

        if (!$request->hasValidSignature()) {
            
            $response = [
                'loginSuccess'=>false,
                'message' => 'Link expired' 
            ];

            return response($response, 401);
        }

        // Extract token from link which we will be using to verify with the backend
        $token = $request->token; 

        $baseURL = env('API_URL');

        $body = [
            'token'=> $request->token,
        ];

        $baseURL = env('API_URL');

        $response = Http::accept('application/json')->get($baseURL.'/verify-login', $body);

        $data = json_decode($response);
        
        if($data->error) {

            $message = $data->message;
            return redirect()->route('loginfail')->with( ['message' => $message] );
        }

        $token = $data->token;
        $user = $data->user;

        session(['token' => $token, 'name'=>$user->name, 'email'=>$user->email, 'id'=>$user->id]);

        return redirect()->route('dashboard');

    }

    public function logout() {    
        Session::flush();
        return redirect()->route('login');
    }

    public function loginfail() {
        return view('auth.loginfail');
    }

    public function loginsuccess() {
        return view('auth.loginsuccess');
    }
}
