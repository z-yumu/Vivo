<?php
namespace app\common\model;
use think\Model;
class ShippingAddress extends Model
{ 
     //总后台获取订单列表
   public function getlist($name)
    {
        if(!empty($name)){
          $order=[
          'id'=>'desc',
          ];
          return $this->where('out_trade_no','like','%'.$name.'%')
                   ->order($order)
                   ->paginate(15,false,[
                       'query'=>[
                        'name'=>$name,
                       ]
                    ]);
         }else{
           $order=[
          'id'=>'desc',
         ];
         return $this->order($order)
                   ->paginate(15);
        }   
    } 
     //商户获取订单列表
   public function merchantorderformlist($merchantinfoid)
    { 
        $order=[
          'order'=>'asc',
          'id'=>'desc',
         ];
         return $this->where('merchant_id',$merchantinfoid)
                     ->order($order)
                     ->paginate(15); 
    }
      public function merchant()
    {
        return $this->belongsTo('MerchantInfo','merchant_id');
    }
     public function savelist($data=[])
    {
        $result=$this->allowField(true)->save($data);
        if($result){
          return $this->getData('id');
        }else{
          return false;
        }
    }
}
