<?php

namespace app\home\controller;

use think\Controller;
use think\Request;

class Quit extends Controller
{
    
    public function index()
    {
        $arr = db('home_user')->where(['front_id' => session('front.id')])->find();
        return view('home@/quit',compact('arr'));
    }
}
