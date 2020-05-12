<?php
namespace app\common\model;
use think\Model;
class Orderform extends Model
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
     /**
     * 客户待付款订单表
     * @param  integer  registerid客户的id 
     */
    public function getorder($registerid)
    {
      $order=[
        'create_time'=>'desc',
        'id'=>'desc',
      ];
      return $this->where('client_id',$registerid)
                  ->field('id,client_id,merchant_id,out_trade_no,sum(price) as price,create_time,product_id,pay_status,logistics_status,comment_status,buy_count')
                  ->group('merchant_id,out_trade_no')
                  ->order($order)
                  ->paginate(15);
    }
    /**
     * 订单详情的输出
     * @param  integer  $registerid客户的id 
     * @param  string  $out_trade_no内部订单号 
     * @param  integer  $merchant_id商家id 
     */
    public function getorderinfo($registerid,$out_trade_no, $merchant_id)
    {
      $order=[
        'create_time'=>'desc',
        'id'=>'desc',
      ];
      return $this->where('client_id',$registerid)
                  ->where('out_trade_no',$out_trade_no)
                  ->where('merchant_id',$merchant_id)
                  ->field('merchant_id,out_trade_no,sum(price) as price,create_time,product_id,pay_status,logistics_status')
                  ->group('merchant_id,out_trade_no')
                  ->order($order)
                  ->paginate(15);
    }
  //
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
