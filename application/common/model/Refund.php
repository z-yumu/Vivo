<?php
namespace app\common\model;
use think\Model;
class Refund extends Model
{
    //保存退款信息
    public function savelist($data=[])
    {
        $result=$this->allowField(true)->save($data);
        if($result){
        	return $this->getData('id');
        }else{
        	return false;
        }
    }
   
      //获取退款列表
   public function getlist($registerid)
    {
        $where['status']=1;
        $where['client_id']=$registerid;
        $order=[
          'create_time'=>'desc',
          'id'=>'desc',
        ];
       return $this->where($where)
                   ->order($order)
                   ->select();
    }
    
}
