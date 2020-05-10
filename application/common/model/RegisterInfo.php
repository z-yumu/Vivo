<?php
namespace app\common\model;
use think\Model;
class RegisterInfo extends Model
{
      //获取商家列表
   public function getlist($name)
    {
        if(!empty($name)){
          $order=[
          'order'=>'asc',
          'id'=>'desc',
          ];
          return $this->where('name','like','%'.$name.'%')
                   ->order($order)
                   ->paginate(1,false,[
                       'query'=>[
                        'name'=>$name,
                       ]
                    ]);
         }else{
           $order=[
          'order'=>'asc',
          'id'=>'desc',
         ];
         return $this->order($order)
                   ->paginate(3);
        }   
    }
     /**
     * 获取商家信息
     * @param  integer  $adminid 管理员的主键
     * @return array|integer 成功返回数组，失败-返回 false
     */
    public function info($merchantid)
    {
        $merchant = $this->where('accountid', $merchantid)->field('id,name,status')->find();
        if ($merchant && 1 == $merchant->status) {
            // 返回用户数据
            return $merchant->toArray();
        } else {
            return false;
        }
    }
     public function infos($merchantid)
    {
        $merchant = $this->where('accountid', $merchantid)->field('id,name,province,city,country,status')->find();
        if ($merchant) {
            // 返回用户数据
            return $merchant->toArray();
        } else {
            return false;
        }
    }
    //保存商家基本信息
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
