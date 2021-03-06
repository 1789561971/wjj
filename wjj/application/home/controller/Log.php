<?php

namespace app\home\controller;
use think\Controller;
use think\Db;
use think\facade\Request;
use app\home\validate\Admin;
use app\home\validate\Reg;

class Log extends Controller
{
    public function inserts(){
            $data = input();

            $ret = $this->validate($data,Admin::class);

            if($ret !== true){
                return $this->error($ret);
             }else{

                $result = db('home_user')->where(['front_name' => $data['front_name'],'front_password' => $data['front_password']])->find();

                $sult=db('admin_user')->where(['admin_name' => $data['front_name'],'admin_password' => $data['front_password']])->find();
                if ($sult) {
                    session('admin.id',$sult['admin_id']);
                    $this->success('登录成功','/admin/index/index');
                }else if($result){
                    session('front.id',$result['front_id']);
                    $this->success('登录成功','./home/information');
                }else{
                    $this->error('登录失败');
                }
            }
    }
    public function register(){
        $date=input('');

        $ret = $this->validate($date,Reg::class);
            if($ret !== true){
                return $this->error($ret);
             }else{
                //判断数据库是否存在该账号
                    $result = db('home_user')->where(['front_name' => $date['front_name'],'front_password' => $date['front_password']])->find();
                    if($result === null){
                        db('home_user')->strict(false)->insert($date);
                        $this->success('注册成功');
                    }else{
                        $this->error('注册失败');
                    }
                
                
            }
    }
}
