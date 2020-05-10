<?php
namespace app\common\model;
use think\Model;
class ProductSalesAttribute extends Model
{
       //显示销售属性列表
   public function getsalesattributelist()
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

    //保存类目的属性
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
