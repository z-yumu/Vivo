<?php
namespace app\common\model;
use think\Model;
class Pay extends Model
{ 
    //获取订单明细表
   public function getpay($merchantinfoid)
    {
        $order=[
          'id'=>'desc',
         ];
         return $this->where('merchant_id',$merchantinfoid)
                     ->order($order)
                     ->paginate(15);  
    } 
     //商家后台——获取结算中的表
   public function getbilllist($merchantinfoid)
    {
         $order=[
          'id'=>'desc',
         ];
         return $this->where('bill_status',0)
                     ->where('merchant_id',$merchantinfoid)
                     ->whereTime('create_time', 'last month')
                     ->field('merchant_id,sum(price) as price,bill_status')
                      ->group('merchant_id')
                      ->order($order)
                      ->paginate(15);
    } 
      //商家后台——获取结算中的表详单
   public function getbilldetails($merchantinfoid)
    {
         $order=[
          'id'=>'desc',
         ];
         return $this->where('bill_status',0)
                     ->where('merchant_id',$merchantinfoid)
                     ->whereTime('create_time', 'last month')
                      ->order($order)
                      ->paginate(15);
    } 
       //商家后台——已付款订单详细
   public function getbillsuccesslistdetails($billnumber)
    {
      $order=[
          'id'=>'desc',
         ];
         $where=[
          'bill_number'=>$billnumber,
          'bill_status'=>1,
          'status'=>1,
         ];
         return $this->where($where)
                     ->order($order)
                     ->paginate(15);    
    } 
     //获取订单列表
   public function getbill($name)
    {
        if(!empty($name)){
          $order=[
          'id'=>'desc',
          ];
          return $this->where('out_trade_no','like','%'.$name.'%')
                      ->where('bill_status',0)
                      ->whereTime('create_time', 'last month')
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
         return $this->where('bill_status',0)
                      ->whereTime('create_time', 'last month')
                      ->field('merchant_id,sum(price) as price,bill_status')
                      ->group('merchant_id')
                      ->order($order)
                      ->paginate(15);
        }   
    } 
      //获取已付款订单详细
   public function getpayordersuccesslist($billnumber)
    {
      $order=[
          'id'=>'desc',
         ];
         $where=[
          'bill_number'=>$billnumber,
          'bill_status'=>1,
          'status'=>1,
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
