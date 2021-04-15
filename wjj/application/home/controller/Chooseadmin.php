<?php


namespace app\home\controller;

use think\db;
use think\Controller;

class Chooseadmin extends Controller
{
    public function index(){
        $data = session('admin.id');
        $arr = db('admin_user')->where('admin_id',$data)->find();
        return view('home@choose/choose_admin',compact('arr'));
    }

    public function jud_admin()
    {
        $data = input('sname');

        $ModelObj = db('survey_info')->where('survey_name',$data)->find();

        if($ModelObj){
            $this->error('创建失败');
        }else{
            return view('home@question/questionadmin',compact('data'));
        }


    }
}