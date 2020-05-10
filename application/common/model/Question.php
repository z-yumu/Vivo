<?php
namespace app\common\model;
use think\Model;
class Question extends Model
{
      //获取管理员列表
   public function getlist()
    {
        $where['status']=1;
        $order=[
          'id'=>'desc',
        ];
       return $this->where($where)
                   ->order($order)
                   ->select();
    }
    
}
