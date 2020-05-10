<?php
namespace app\common\model;
use think\Model;
class MerchantAccount extends Model
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
    /**
     * 商家登录
     * @param  string  $username 用户名
     * @param  string  $password 用户密码
     * @return integer 登录成功-用户ID，登录失败-返回0或-1
     */
    public function login($account, $password)
    {
        $where['name|mobile|email']=$account;
        $where['status']=1;
        $merchant=$this->where($where)->find();
        if($merchant){
          if(md5($password.$merchant->code)!=$merchant->password){
            // $this->error='密码错误';
            return 0;
          }else{
            return $merchant->id;
          }
        }else{
          // $this->error='用户名不存在或者被禁用';
          return -1;
        }
    }
     public function info($merchantid)
    {
        $merchant = $this->where('id', $merchantid)->field('id,status')->find();
        if ($merchant && 1 == $merchant->status) {
            // 返回用户数据
            return $merchant->toArray();
        } else {
            return false;
        }
    }
}
