<?php

namespace App\Http\Controllers;

use Illuminate\Support\Facades\DB;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;

use App\Traits\ApiResponser;

class SalesController extends Controller
{
	use ApiResponser;

	public function list(Request $request){
		$client_code = $request->client_code;

		$listInventory=DB::table('inventory')->select(['name','price','amount','unit'])->where('client_code',$client_code)->get();

		$data=[
			'total_data'=>count($listInventory),
			'data_list'=>$listInventory
		];
		return $this->successResponse($data);
	}
}