<?php
namespace app\admin\controller;
use think\Controller;
use app\common\model\Admin;
use app\common\model\Role;
use think\Db;
class Base extends Controller
{
     //初始化控制器
   protected function initialize()
    { 
       //验证登录
       $admininfo=$this->getAdminInfo();
       if(!$admininfo){
       	return $this->redirect('login/index');
       }else{
	       $authid=$admininfo['authid'];
	       $authinfo=$this->getAdminRole($authid);
	       $auth=$authinfo['auth'];
	        if(!empty($auth)){
	         //把字符串转化为数组
	        $auths=explode(',',$auth);
	         // dump($auths);exit;
	        }else{
	          $auths='';
	        }
	       $this->assign('auths',$auths);
	       $this->assign('admininfo',$admininfo);
	       $firstmerchant=model('Merchantlist')->getfirstmerchant();
	       $this->assign('firstmerchant',$firstmerchant);
	        $firstcategory=model('Systemlist')->getfirstcategory();
	       $this->assign('firstcategory',$firstcategory);
	       $showlist=model('Systemlist')->getlist();
	       $this->assign('showlist',$showlist); 
       }  
    }
	/**
	 * 获取用户信息
	 * @param  Session  $用户的id
	 * @return stringr 获取成功返回用户信息，失败-返回false
	 */
	public function getAdminInfo()
	{
	    $adminid=Session('aid');
	    $admin= new Admin;
	    $admininfo=$admin->info($adminid);
	    if($admininfo){
	    	return $admininfo;
	    }else{
	    	return false;
	    }

	}
	/**
	 * 获取管理员权限
	 * @param  Session  $用户的id
	 * @return stringr 获取成功返回用户信息，失败-返回false
	 */
	public function getAdminRole($authid)
	{
	    $role= new Role;
	    $roleinfo=$role->getroleinfo($authid);
	    if($roleinfo){
	    	return $roleinfo;
	    }else{
	    	return false;
	    }

	}
    //排序
   public function listorder($id,$order,$controller)
   {
     $res=model($controller)->save(['order'=>$order],['id'=>$id]);
     if($res){
      $this->success('排序成功');
     }else{
      $this->error('排序失败');
     }
   }
   /**
     * 删除广告
     */
    public function delete($id='',$controller='')
    {  
        $res=model($controller)->update(['status'=>-1],['id'=>$id]);
        if($res){
        $this->success('删除成功');
       }else{
        $this->error('删除失败');
       }
            
    }
    public function normal($id='',$controller=''){
        $res = model($controller)->update(['status'=>1],["id"=>$id]);
        if($res){
            $this->success('恢复成功');
        }else{
            $this->error('恢复失败');
        }
    }
    //真删除
    public function realdelete($id,$controller)
    {
         $res = model($controller)->where('id',$id)->delete();
        if($res){
            $this->success('删除成功');
        }else{
            $this->error('删除失败');
        }
    }
}
