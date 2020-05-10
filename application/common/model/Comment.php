<?php
namespace app\common\model;
use think\Model;
class Comment extends Model
{
      //获取商品评论列表
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
