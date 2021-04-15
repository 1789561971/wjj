<?php


namespace app\home\controller;
use think\Request;
use think\Db;
use think\Controller;

class create extends Controller
{
    public function index(){
    	$arrs=db('survey_info')->paginate(2);
    	$arr = db('home_user')->where(['front_id' => session('front.id')])->find();
        return view("home@/index/create",compact('arr','arrs'));
    }
    public function send(Request $request){
        $inp=input();
        $data=date('yy-m-d H:i:s');
        if ($inp) {
            $datas = [
                'survey_send_time' => $inp['survey_start_time'] 
            ];
            $request = db('survey_info')->where('user_id',session('front.id'))->update(['survey_add_time'=>$data]);
            $request = db('survey_info')->where('user_id',session('front.id'))->update($datas);
            if($request){
                $this->success('保存成功','/home/Create/index');
            }else{
                $this->error('保存失败');
            }
        }
    }
    public function quit(){
        $id = input('id');
        $sql = Db::table('survey_info')->where('survey_id',$id)->delete();
        if ($sql){
            $this->success('删除成功');
        }else{ 
            $this->error('删除失败');
        }
    }
}