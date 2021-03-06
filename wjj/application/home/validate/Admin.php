<?php

namespace app\home\validate;

use think\Validate;

class Admin extends Validate
{
    /**
     * 定义验证规则
     * 格式：'字段名'	=>	['规则1','规则2'...]
     *
     * @var array
     */	
	protected $rule = [
        'front_name' => 'require|number',
        'front_password' => 'require|number',
        'vcode'     => 'require|captcha'
    ];
    
    /**
     * 定义错误信息
     * 格式：'字段名.规则名'	=>	'错误信息'
     *
     * @var array
     */	
    protected $message = [
        'front_name.require' => '没有用户名就去注册一个懂？',
        'front_name.number'  => '账号是数字',
        'front_password.require' => '密码都记歪来？',
        'front_password.number'  => '密码是数字！！！！！！',
        'vcode.require'     => '验证码没写！！',
        
    ];
}
