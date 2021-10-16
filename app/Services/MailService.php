<?php

namespace App\Services;

use App\Mail\MyMailer;
use Mail;

class MailService
{

    public function sendMail($emailDetails) {

        $emailDetail=json_decode($emailDetails);

        $to_email=$emailDetail->to_email;
        $url=$emailDetail->url;
           
        $details = [
            'title' => 'Login link from Nextvacacy.com',
            'url' => $url
        ];
  
        return Mail::to($to_email)->send(new MyMailer($details));

    }
    
}
