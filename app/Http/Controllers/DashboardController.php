<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

class DashboardController extends Controller
{
    
    public function index(Request $request) {
        if(!session('token')) {
          
            return redirect()->route('login');
        }
        return view('dashboard');      
    }
}
