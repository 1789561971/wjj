<?php

namespace app\home\controller;

use think\Controller;
use think\Request;

class Information extends Controller
{
    //调用用户信息视图
    public function index()
    {
    	$data = session('front.id');
    	$arr = db('home_user')->where('front_id',$data)->find();
        return view('home@information/info',compact('arr'));
    }

    public function userEdit()
    {
    	$data = session('front.id');
    	$edit = input('front_name');
    	
    	$ModelObj = db('home_user')->where('front_id',$data)->update(['front_name' => $edit]);

		if($ModelObj){
			$this->success('修改成功');
		}else{
			$this->error('修改失败');
		}

    }

    public function passEdit()
    {
    	$data = session('front.id');
    	$edit = input('password');
    	
    	$ModelObj = db('home_user')->where('front_id',$data)->update(['front_password' => $edit]);

		if($ModelObj){
			$this->success('修改成功');
		}else{
			$this->error('修改失败');
		}
    }

}
