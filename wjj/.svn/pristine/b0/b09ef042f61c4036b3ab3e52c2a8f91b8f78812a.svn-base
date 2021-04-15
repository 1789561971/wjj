<?php
namespace app\admin\controller;
use think\Controller;
use think\Db;
use think\Model;
use think\Request;
use think\model\concern\SoftDelete;
use think\Paginator;
file_put_contents('ajax.txt',print_r($_POST,true));
class Index extends Controller
{
    public function index()
    {
        $arr = Db::table('survey_info')->paginate(15);
        return view('admin@index/index',compact('arr'));
    }

    public function del(){
        $id = input('id');
        $sql = Db::table('survey_info')->where('survey_id',$id)->delete();
        if ($sql){
            $this->success('删除成功');
        }else{ 
            $this->error('失败');
        }
    }
    public function softDelete(){
           //Model::destroy(300);
            $user = Model::select();
            return json($user);
    }
    public function SelText(){
        $tit = input('SelText');
        $arr = Db::table('survey_info')->where('survey_name','like','%'.$tit.'%')->paginate();
        return view('admin@index/index',compact('arr'));
    }

    public function detailed(){
        $data_name = input();
        var_dump($data_name);
        $info = db('survey_info')->where('survey_name',$data_name['front_name'])->find();
        $ques = db('question')->where('ques_sid',$info['survey_id'])->select();
        $opti_data = [];
        foreach ($ques as $key => $value){
            $opti = db('opti')->where('opti_wid',$value['ques_id'])->select();
            array_push($opti_data,$opti);
        }
        return view('/home@circle/participate',compact('data_name','info','ques','opti_data'));
    }

}
