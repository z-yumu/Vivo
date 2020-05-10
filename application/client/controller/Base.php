<?php
namespace app\client\controller;
use think\Controller;
use app\common\model\RegisterAccount as RegisterAccountModel;
use think\Db;
class Base extends Controller
{
   //初始化控制器
   protected function initialize()
    { 
       //验证登录
       $client=session('clientid','','client');
       if(!$client){
       	return $this->redirect('login/index');
       }
       $showlist=model('clientlist')->getlist();
	   $this->assign('showlist',$showlist); 
    }
}
