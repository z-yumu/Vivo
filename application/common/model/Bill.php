<?php
namespace app\common\model;
use think\Model;
class Bill extends Model
{ 
     //获取订单列表
   public function getpaysuccesslist()
    {
      $order=[
          'id'=>'desc',
         ];
         $where=[
          'bill_status'=>1,
          'status'=>1,
         ];
         return $this->where($where)
                     ->order($order)
                     ->paginate(15);    
    } 
      //商家后台——已付款列表输出
   public function getbillsuccesslist($merchantinfoid)
    {
      $order=[
          'id'=>'desc',
         ];
         $where=[
          'bill_status'=>1,
          'status'=>1,
          'merchant_id'=>$merchantinfoid,
         ];
         return $this->where($where)
                     ->order($order)
                     ->paginate(15);    
    } 
      public function merchant()
    {
        return $this->belongsTo('MerchantInfo','merchant_id');
    }
    
}
