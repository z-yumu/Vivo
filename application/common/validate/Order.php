<?php
namespace app\common\validate;
use think\Validate;
class Order extends Validate
{
     protected $rule = [
         'addressid'  =>  'require|token',
         'productid'=>'require',
//         'path'=>'require',
         'price'=>'require',
         'num'=>'require',
    ];
     protected $message  =   [
        'name.require' => '收货地址必须选择',
        'productid.require' => '未提交产品的id',
//        'path.require' => '未提交产品的销售属性',
        'price.require' => '未提交产品的价格', 
        'num.require' => '未提交产品的数量',   
    ];
     protected $scene = [
        'shopcartorder'  =>  ['addressid'],
    ];
    
}
