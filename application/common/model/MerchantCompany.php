<?php
namespace app\common\model;
use think\Model;
class MerchantCompany extends Model
{
      //获取商家列表
   public function getlist()
    {
        $order=[
          'order'=>'asc',
          'id'=>'desc',
        ];
       return $this->order($order)
                   ->paginate(3);
    }
     //保存公司信息
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
