<?php


namespace app\home\controller;
use think\Controller;
use think\db;

class Statistics extends Controller
{
    public function index(){
        $id = input('get.id');
        $home_data = db('survey_info')->where('survey_id',$id)->value('survey_id');
        $quest = db('question')->where('ques_sid',$home_data)->select();

        $arr = [];
        $arrs = [];
        $soop = [];
       foreach ($quest as $key => $value){
           $mas = [
               ['ques_sid','=', $value['ques_sid']],
               ['ques_type','=','']
           ];
           $op = db('question')->where($mas)->select();
                $arr = [
                    'title' => $value['ques_name'],
                    'type' => $value['ques_type'],
                ];
            if ($arr['type'] == ''){
                $arr = [
                    'title' => $value['ques_name'],
                    'type' => $value['ques_type'],
                    'soopti' => '选项'.count($op),
                ];
                array_push($arrs,$arr);
            }else{
                $ong = [];
                $nubs = [];
                $name = db('opti')->where('opti_wid',$value['ques_id'])->select();
                foreach ($name as $kkk => $val){
                    array_push($ong,$val['opti_text']);
                }

                foreach ($ong as $keys => $values){
                    $map = [
                        ['ans_id','=', $value['ques_sid']],
                        ['an_data','=',$values]
                    ];
                    $nub = db('answer_dat')->where($map)->select();
                    array_push($nubs,count($nub));
                }
                $arr = [
                    'title' => $value['ques_name'],
                    'type' => $value['ques_type'],
//                    'name' => $ong,
//                    'nub' => $nubs,

                    'ques' => [
                        [
                            'name' => $ong,
                            'nub' => $nubs
                        ]
                    ],


                ];

                array_push($arrs,$arr);
            }
       }
//        var_dump($arrs);
//    foreach ($arrs as $ovov){
//        if(is_array($ovov)){
//            var_dump($ovov['ques']['name']);
//            var_dump($ovov['ques']['nub']);
//        }else{
//            var_dump(1111);
//        }
//
//
//    }
        return view('home@/statistics/statistics',compact('arrs'));

    }

    public function ajaxdata(){
        $datas = input();
        $dataon = db('question')->where('ques_sid',$datas['id'])->select();
        $data = [];
        $data['data'] = $dataon;
        $data['length'] = count($dataon);
        return json($data);

    }

}