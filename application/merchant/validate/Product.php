<?php
namespace app\merchant\validate;

use think\Validate;

class Product extends Validate
{
    protected $rule = [
         'name'  =>  'require|max:30|token',
         'price'  =>  'require',
         'total'  =>  'require',
         'content'  =>  'require',
         'province'  =>  'require',
         'city'  =>  'require',
         'country'  =>  'require',
         'fare'  =>  'require',
    ];
     protected $message  =   [
        'name.require' => '名称必须填写',
        'price.require' => '价格必须填写',
        'total.require' => '数量必须填写',
        'content.require' => '产品内容必须填写',
        'province.require' => '产品所属省必须填写',
        'city.require' => '产品所属地区必须填写',
        'country.require' => '产品所属县市必须填写',
        'fare.require' => '运费必须填写',
        'order.require' => '排序不能为空',
        'name.max'     => '名称最多不能超过25个字符',   
    ];
     protected $scene = [
        'edit'  =>  ['name','order'],
        'add'  =>  ['name','price','total','picturebig[]','content','prov','city','country','fare'],
        'savecategoryattribute'  =>  ['name'],
        'infoedit'  =>  ['name'],

    ];
}
