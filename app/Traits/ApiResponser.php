<?php
namespace App\Traits;
use Illuminate\Http\Response;

trait ApiResponser{

    public function jsonResponse($data=[], $code = Response::HTTP_OK){
        return response()->json($data, $code);
    }

    public function successResponse($data=null, $code = Response::HTTP_OK){
        return response()->json(['code'=>$code, 'data'=>$data], $code);
    }

    public function errorResponse($message="", $errors=[], $code= 400){
        return response()->json(['code'=>$code,'message'=>$message, 'errors'=>$errors], $code);
    }

}

?>