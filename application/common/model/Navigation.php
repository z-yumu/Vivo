<?php
namespace app\common\model;
use think\Model;
class Navigation extends Model
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
    
}
