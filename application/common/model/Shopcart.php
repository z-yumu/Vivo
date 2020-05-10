<?php
namespace app\common\model;
use think\Model;
class Shopcart extends Model
{
    //添加主页导航的信息
    public function savelist($data=[])
    {
        $result=$this->allowField(true)->save($data);
        if($result){
        	return $this->getData('id');
        }else{
        	return false;
        }
    }
   
      //获取管理员列表
   public function getlist()
    {
        $where['status']=1;
        $order=[
          'order'=>'asc',
          'id'=>'desc',
        ];
       return $this->where($where)
                   ->order($order)
                   ->select();
    }
      //获取购物车列表
   
    public function getshopcart($registerid)
    {
      $order=[
        'id'=>'desc',
      ];
      return $this->where('client_id',$registerid)
                  ->field('merchant_id,sum(price) as price,create_time,product_id,status')
                  ->group('merchant_id')
                  ->order($order)
                  ->paginate(15);
    }
    public function getshopcartproduct($id)
    {
      $order=[
        'id'=>'desc',
      ];
      return $this->whereIn('id',$id)
                  ->field('merchant_id,sum(price*buy_count) as amount,create_time,product_id,status,id')
                  ->group('merchant_id')
                  ->order($order)
                  ->paginate(15);
    }
}
