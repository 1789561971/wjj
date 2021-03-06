<?php

namespace app\home\controller;

use think\Controller;
use think\Request;
use think\Db;

class Question extends Controller
{
    //调用问卷视图
    public function index()
    {
    	return view('home@question/question');
    }

    public function getDate(){
        $data = input();
        $survey_data = [
            'survey_id' => '',
            'survey_name'   => $data['survey_name'],
            'surve_brief'   => $data['surve_brief'],
            'inser_time'    => $data['inser_time'],
            'user_id'       =>  session('front.id'),
        ];
        /*保存问卷表信息*/
        db('survey_info')->strict(false)->insert($survey_data);
        /*获取当前问卷的id*/
        $qindon =  db('survey_info')->where('survey_name',$data['survey_name'])->find();

        session('survey_id',$qindon['survey_id']);
        /*保存问题表的信息*/
        $quer_tion = (int)$data['ques_tion'];
        $ques_name = $data['ques_name'];
        $quer_tyoe = $data['ques_type'];
        $quer_sid = $qindon['survey_id'];

        $quer_arr =[
            'ques_name' => $ques_name,
            'ques_type' => $quer_tyoe,
            'ques_sid'  => $quer_sid,
            'ques_tion' => $quer_tion,
        ];
        $topic_id = db('question')->strict(false)->insertGetId($quer_arr);
           foreach ($data['opti'] as $key => $value){
               var_dump($key);
               var_dump($value);
               $opti = [
                   'opti_wid'  => $topic_id,
                   'opti_nono' => $value[0][0],
                   'opti_text' => $data['span'][$key],
                   'opti_state'=> $data['state'][$key]
               ];
               db('opti')->strict(false)->insert($opti);
           }


    }
    public function getDates()
    {
        $data = input();
        var_dump($data);

        /*保存问题表的信息*/
        $quer_tion = (int)$data['ques_tion'];
        $ques_name = $data['ques_name'];
        $quer_tyoe = $data['ques_type'];


        $quer_arr = [
            'ques_name' => $ques_name,
            'ques_type' => $quer_tyoe,
            'ques_sid' => session('survey_id'),
            'ques_tion' => $quer_tion,
        ];
        $topic_id = db('question')->strict(false)->insertGetId($quer_arr);
        foreach ($data['optis'] as $key => $value) {
            var_dump($key);
            var_dump($value);
            $opti = [
                'opti_wid' => $topic_id,
                'opti_nono' => $value[0][0],
                'opti_text' => $data['span'][$key],
                'opti_state' => $data['state'][$key]
            ];
            db('opti')->strict(false)->insert($opti);
        }


    }
    public function getDate_blanks(){
        $data = input();
        var_dump($data);
        $survey_data = [
            'survey_id' => '',
            'survey_name'   => $data['survey_name'],
            'surve_brief'   => $data['surve_brief'],
            'inser_time'    => $data['inser_time'],
            'user_id'       =>  session('front.id'),
        ];
//        /*保存问卷表信息*/
        db('survey_info')->strict(false)->insert($survey_data);
//        /*获取当前问卷的id*/
        $qindon =  db('survey_info')->where('survey_name',$data['survey_name'])->find();
        session('survey_id',$qindon['survey_id']);
//        /*保存问题表的信息*/
        $quer_tion = (int)$data['ques_tion'];
        $ques_name = $data['ques_name'];
        $quer_sid = $qindon['survey_id'];
        $quer_tyoe = $data['ques_type'];

        $quer_arr =[
            'ques_name' => $ques_name,
            'ques_type' => $quer_tyoe,
            'ques_sid'  => $quer_sid,
            'ques_tion' => $quer_tion,
        ];
        $topic_id = db('question')->strict(false)->insertGetId($quer_arr);
        foreach ($data['opti'] as $key => $value){
        $opti = [
            'opti_wid'  => $topic_id,
            'opti_nono' => $value[0][0],
            'opti_text' => $data['text'][$key],
        ];
        db('opti')->strict(false)->insert($opti);
    }
    }

    public function getDate_blankes(){
        $data = input();
        var_dump($data);
//        /*保存问题表的信息*/
        $quer_tion = (int)$data['ques_tion'];
        $ques_name = $data['ques_name'];
        $quer_sid = session('survey_id');
        $quer_tyoe = $data['ques_type'];

        $quer_arr =[
            'ques_name' => $ques_name,
            'ques_type' => $quer_tyoe,
            'ques_sid'  => $quer_sid,
            'ques_tion' => $quer_tion,
        ];
        $topic_id = db('question')->strict(false)->insertGetId($quer_arr);
        foreach ($data['optis'] as $key => $value){
            $opti = [
                'opti_wid'  => $topic_id,
                'opti_nono' => $value[0][0],
                'opti_text' => $data['span'][$key],
            ];
            db('opti')->strict(false)->insert($opti);
        }
    }
}
