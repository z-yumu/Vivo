<?php
namespace app\common\model;
use think\Model;
class Role extends Model
{
    protected function base()
    {
        
    }

    public function getrole()
    {
       $order=[
          'order'=>'asc',
          'id'=>'desc',
        ];
       return $this->order($order)
                   ->select();
    }
    //获取角色信息
    public function getroleinfo($authid)
    {
       $role = $this->where('id', $authid)->field('id,name,description,auth,status')->find();
        if ($role && 1 == $role->status) {
            // 返回用户数据
            return $role->toArray();
        } else {
            return false;
        }
    }
   
}
