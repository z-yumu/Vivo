<?php
namespace app\admin\controller;
use app\common\model\WeixinAccount as WeixinAccountModel;
use app\common\model\RegisterAccount as RegisterAccountModel;
use think\Controller;
use think\Session;
class User extends Base
{
   
     //显示微信客户表
    
    public function weixinlist()
    { 
        $weixinaccount= new WeixinAccountModel;
        $list=$weixinaccount->getlist();
        $this->assign('list',$list);
        return $this->fetch();  
    }
    public function registerlist()
    {
        $registeraccount = new RegisterAccountModel();
        $list = $registeraccount->getlist();
        $this->assign('list',$list);
        return $this->fetch();
    }
    
     /**
     * 禁止注册客户
     */
    public function forbid($id)
    {
        $registeraccount = new RegisterAccountModel();
        $res=$registeraccount->update(['status'=>0],['id'=>$id]);
        if($res){
        $this->success('禁止成功');
       }else{
        $this->error('禁止失败');
       }
            
    }
}
