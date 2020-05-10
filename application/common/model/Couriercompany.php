<?php
namespace app\common\model;
use think\Model;
class Couriercompany extends Model
{ 
   //输出产品分类的大类
    public function getlist()
    {
        $data=[
          'status'=>1,
        ];
        $order=[
          'order'=>'asc',
          'id'=>'desc',
        ];
        return $this->where($data)
                    ->order($order)
                    ->select();
    }
    
}
