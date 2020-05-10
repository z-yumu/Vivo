<?php
namespace app\merchant\controller;
use think\Controller;
use app\common\model\MerchantInfo as MerchantInfoModel;
use app\common\model\MerchantAccount as MerchantAccountModel;
use think\Db;
class Base extends Controller
{
   //初始化控制器
   protected function initialize()
    { 
       //验证登录
       $merchantaccount=$this->getMerchantAccount();
       if(!$merchantaccount){
       	return $this->redirect('login/index');
       }else{
       	 $merchantinfos=$this->getMerchantInfo();
         if($merchantinfos){
         	$this->assign('merchantinfostatus',1);
         	session('merchantinfoid', $merchantinfos['id'],'merchant');
         }
       }  
       $showlist=model('Merchantlist')->getlist();
	   $this->assign('showlist',$showlist); 
	   $firstcategorys=model('Category')->getfirstcategory();
       $this->assign('firstcategorys',$firstcategorys);     
    }
	/**
	 * 获取商家信息
	 * @param  Session  $用户的id
	 * @return stringr 获取成功返回用户信息，失败-返回false
	 */
	public function getMerchantInfo()
	{
	    $merchantid=session('merchantid','','merchant');
	    $merchant= new MerchantInfoModel;
	    $merchantinfos=$merchant->info($merchantid);
	    if($merchantinfos){
	    	return $merchantinfos;
	    }else{
	    	return false;
	    }
	}
	public function getMerchantAccount()
	{
	    $merchantid=session('merchantid','','merchant');
	    $merchant= new MerchantAccountModel;
	    $merchantaccountid=$merchant->info($merchantid);
	    if($merchantaccountid){
	    	return $merchantaccountid;
	    }else{
	    	return false;
	    }
	}

}
