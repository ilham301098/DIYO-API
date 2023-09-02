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

		$select=[
			'sales_id',
			'total_price',
			'created_at',
			'payment_method'
		];

		$list=DB::table('sales')->select($select)->where('client_code',$client_code)->get();

		$data=[
			'total_data'=>count($list),
			'data_list'=>$list
		];
		return $this->successResponse($data);
	}

	public function detail(Request $request){
		$client_code = $request->client_code;
		$sales_id = $request->sales_id;

		try{
			$select=[
				'sales_id as id',
				'total_price as total',
				'created_at',
				'payment_method'
			];

			$list=DB::table('sales')->select($select)
			->where('client_code',$client_code)
			->where('sales_id',$sales_id)
			->first();

			if(!$list){
				return $this->errorResponse('Sales Id '.$sales_id.' tidak ditemukan',[],404);
			}

			$list->created_at=date('d F Y H:i:s',strtotime($list->created_at));

			$selectCart=[
				'product_id',
				'product_name',
				'price',
				'variants',
			];

			$cart=DB::table('sales_detail')->select($selectCart)->where('sales_id',$sales_id)->get();
			foreach ($cart as $key => $value) {
				$variants=$cart[$key]->variants;
				if(!is_null($variants)){
					$variants=json_decode($variants,true);
				}else{
					$variants=[];
				}
				
				$cart[$key]->variants=$variants;
				if($variants==[]){
					unset($cart[$key]->variants);
				}
			}
			$list->cart=$cart;

			return $this->successResponse($list);
		}catch(\Exception $e){
			return $this->errorResponse('Terjadi Kesalahan, Silahkan coba kembali beberapa saat',[$e->getMessage()],400);
		}
	}

}