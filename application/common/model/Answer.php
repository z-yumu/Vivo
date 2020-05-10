<?php
namespace app\common\model;
use think\Model;
class Answer extends Model
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
    //添加信息
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
