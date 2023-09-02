<?php

namespace App\Http\Controllers;

use Illuminate\Support\Facades\DB;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;

use App\Traits\ApiResponser;

class ProductController extends Controller
{
	use ApiResponser;

	public function list(Request $request){
		$client_code = $request->client_code;

		$select = [
			'category',
			'product_id as id',
			'product_name as name',
			'price',
			'description',
			'images',
		];

		$list=DB::table('product')->select($select)
		->where('client_code',$client_code)
		->where('status','enabled')
		->orderBy('category')
		->orderBy('product_name')
		->get();

		foreach ($list as $key => $value) {
			$product_id = $list[$key]->id;

			$images = $list[$key]->images;
			if(is_null($images)){
				$list[$key]->images='';
			}else{
				$list[$key]->images=url('images/'.$images);
			}

			$desc = $list[$key]->description;
			if(is_null($desc)){
				$list[$key]->description='';
			}

			$variantData = DB::table('product_variant')->select(['variant_name as name','price as additional_price'])->where('product_id',$product_id)->orderBy('price')->get();
			$list[$key]->variants=$variantData;
		}

		$data=[
			'total_data'=>count($list),
			'data_list'=>$list
		];
		return $this->successResponse($data);
	}
}