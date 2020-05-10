<?php
namespace app\common\model;
use think\Model;
class WeixinAccount extends Model
{
      //获取微信客户列表
   public function getlist()
    {
        $order=[
          'id'=>'desc',
        ];
       return $this->order($order)
                   ->paginate(15);
    }
    
}
