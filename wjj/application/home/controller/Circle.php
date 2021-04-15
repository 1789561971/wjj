<?php

namespace app\home\controller;

use think\Controller;

class Circle extends Controller
{
    public function index()
    {
        $arr = db('home_user')->where(['front_id' => session('front.id')])->find();
        $arrs = db('survey_info')->paginate(10);
        return view('home@/circle/circle', compact('arr', 'arrs'));
    }

    public function detailed(){
        $data_name = input();
        $info = db('survey_info')->where('survey_name',$data_name['front_name'])->find();
        $ques = db('question')->where('ques_sid',$info['survey_id'])->select();

                $arrs = [];
//                var_dump($ques);
               foreach ($ques as $key  => $value){
//                   var_dump($value);
                       $data = [
                           'title' => $info['survey_name'],
                           'brief' => $info['surve_brief'],
                           'ques' => [
                               'titile' => $value['ques_name'],
                               'type' => $value['ques_type'],
                               'opnub' => $value['ques_tion'],

                           ]
                       ];
                       if($data['ques']['type'] == ''){
                           array_push($arrs,$data);
                       }else{
                            $map = [
                                ['ques_sid','=', $value['ques_sid']],
                                ['ques_type','<>','']
                            ];
                           $ques_id = db('question')->where($map)->select();
//                           var_dump([$key]);
//
                           $opti = db('opti')->where('opti_wid',$ques_id[$key]['ques_id'])->select();
                           $oarr = [];
                           foreach ($opti as  $keys => $vlue){
                               array_push($oarr,$opti[$keys]['opti_text']);
                           }
                           foreach ($oarr as $kkk => $v){
                               $data = [
                                   'title' => $info['survey_name'],
                                   'brief' => $info['surve_brief'],
                                   'ques' => [
                                       'titile' => $value['ques_name'],
                                       'type' => $value['ques_type'],
                                       'opnub' => $value['ques_tion'],
                                       'opti' => $oarr
                                    ],
                               ];
                           }
                           array_push($arrs,$data);
                       }
               }

        return view('/home@circle/participate',compact('data_name','arrs'));
    }

    public function insert(){
        $data = input();
        var_dump($data);
        $answer_xid = trim($data['answer_xid']);
        $answer_pid  = db('survey_info')->where('survey_name',$data['answer_pid'])->value('survey_id');

        $answer_data = [
            'answer_pid' => $answer_pid,
            'answer_uid' => session('front.id'),
            'answer_date' => date("Y-m-d")
        ];
        $answer_dat = [
            'ans_id' => $answer_pid,
            'ordtm'  => $answer_xid,
            'an_data' => $data['stan']
        ];
        var_dump($answer_data,$answer_dat);
        db('answer')->insert($answer_data);
        db('answer_dat')->insert($answer_dat);
    }


}
