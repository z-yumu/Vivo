<?php
namespace app\common\model;
use think\Model;
class ProductPicture extends Model
{
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
