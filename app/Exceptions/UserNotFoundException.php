<?php

namespace App\Exceptions;

use Exception;

class UserNotFoundException extends Exception
{
    public function render($request)
    {       
        return response()->json(["error1" => true, "message" => $this->getMessage()]);       
    }
}
