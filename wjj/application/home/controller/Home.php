<?php

namespace app\home\controller;

use think\Controller;

class Home extends Controller
{
    public function index(){
    	return view('home@/home');
    }
}
