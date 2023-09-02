<?php

namespace App\Http\Middleware;

use Illuminate\Support\Facades\DB;
use Closure;

class ApiKeyMiddleware
{
    /**
     * Handle an incoming request.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \Closure  $next
     * @return mixed
     */
    public function handle($request, Closure $next)
    {
        $validApi = DB::table('client_api')->where('api_key', $request->key)->first();
        if($validApi){
            if($validApi->status=='deactive'){
                return response(['message'=>'Unauthorized Access'], 400);
            } 

            $request->merge(['client_code' => $validApi->client_code]);
            return $next($request);
        }

        return response(['message'=>'Unauthorized Access'], 400);
    }
}
