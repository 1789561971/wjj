<?php

namespace app\home\controller;

use think\Controller;
use think\Request;
use think\Db;
use app\home\model\ChooseModel;
use app\home\validate\ChooseValidate;

class Choose extends Controller
{
    //调用创建问卷视图 
    public function index()
    {
        $data = session('front.id');
        $arr = db('home_user')->where('front_id',$data)->find();
    	return view('home@choose/choose',compact('arr'));
    }
    //判断标题是否已存在
    public function jud()
    {
    	$data = input('sname');

		$ModelObj = db('survey_info')->where('survey_name',$data)->find();

		if($ModelObj){
			$this->error('创建失败');
		}else{
			return view('home@question/question',compact('data'));
		}


    }
}
