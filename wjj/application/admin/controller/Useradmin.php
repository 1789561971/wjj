<?php


namespace app\admin\controller;


use think\Controller;
use think\Db;
use think\Request;

class userAdmin extends Controller
{

    public function index(){
        $arr = Db::table('home_user')->paginate(5);
        return view('admin@index/Useradmin',compact('arr'));
    }

    public function del(){
        $id = input('id');
        $sql = Db::table('home_user')->where('front_id',$id)->delete();
        if ($sql){
            $this->success('删除成功');
        }else{
            $this->error('失败');
        }
    }
    public function SelText(){
        $tit = input('SelText');
        $arr = Db::table('home_user')->where('front_name','like','%'.$tit.'%')->paginate();
        return view('admin@/index/Useradmin',compact('arr'));
    }
    public function mod(Request $request){
        $data = input('post.');
        if($data){
            $datas = [
                'front_name' => $data['front_name'],
                'front_password' => $data['front_password'],
                'front_sid' => $data['front_sid'],
                'front_account' => $data['front_account'],
                'front_email' => $data['front_email'],
                'front_phone' => $data['front_phone'],
                'front_wechat' => $data['front_wechat']
            ];
            $request = Db::table('home_user')->where('front_id',$data['front_id'])->update($datas);
            if($request){
                $this->success('修改成功','/admin/Useradmin/index');
            }else{
                $this->error('修改失败');
            }
        }else{
            $id = $request->param('id');
            $arr = Db::table('home_user')->where('front_id',$id)->find();
            return view('admin@index/edit',compact('arr','id'));

        }
    }
    public function new(Request $request){
        $data = input('post.');
        if($data){
            $datas = [
                'front_name' => $data['front_name'],
                'front_password' => $data['front_password'],
                'front_sid' => $data['front_sid'],
                'front_account' => $data['front_account'],
                'front_email' => $data['front_email'],
                'front_phone' => $data['front_phone'],
                'front_wechat' => $data['front_wechat']
            ];
            $request = Db::table('home_user')->where('front_id',$data['front_id'])->insert($datas);
            if($request){
                $this->success('新建成功','/admin/Useradmin/index');
            }else{
                $this->error('新建失败');
            }
        }else{
            $id = $request->param('id');
            $arr = Db::table('home_user')->where('front_id',$id)->find();
            return view('admin@index/new',compact('arr','id'));

        }
    }
}