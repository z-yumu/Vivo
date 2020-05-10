<?php
namespace app\admin\validate;

use think\Validate;

class System extends Validate
{
    protected $rule = [
         'name'  =>  'require|max:25',
         'order'=>'require',
    ];
     protected $message  =   [
        'name.require' => '名称必须填写',
        'order.require' => '排序不能为空',
        'name.max'     => '名称最多不能超过25个字符',   
    ];
     protected $scene = [
        'edit'  =>  ['name','order'],
        'add'  =>  ['name','order'],
        'savecategoryattribute'  =>  ['name'],
        'infoedit'  =>  ['name'],

    ];
}
