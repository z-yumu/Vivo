<?php
namespace app\common\model;
use think\Model;
class OrderformLogistics extends Model
{ 
   //添加订单物流的信息
    public function savelist($data=[])
    {
        $result=$this->allowField(true)->save($data);
        if($result){
          return $this->getData('id');
        }else{
          return false;
        }
    }
     //获取活动商品列表
   public function getlist($merchantinfoid)
    {
        $order=[
          'order'=>'asc',
          'id'=>'desc',
         ];
         return $this->where('merchant_id',$merchantinfoid)
                     ->order($order)
                     ->paginate(15);  
    }
    
}
