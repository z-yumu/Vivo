<?php
namespace app\index\controller;
use think\Controller;
use think\Db;
class Base extends Controller
{
     //初始化控制器
   protected function initialize()
    {
        //网站开关
       $site=model('Systemsite')->get(1);
    //如果不存在
       if(!$site){
         $this->redirect('System/status');
       }
      $navigation=model('Navigation')->getlist();
	   $this->assign('navigation',$navigation); 
	   $category=model('Category')->getshow();
	   $this->assign('category',$category);
     $registerid=session('clientid','','client');
     //购物车的数量
     $shopnum=model('Shopcart')->where('client_id',$registerid)->count();
     $this->assign('shopnum',$shopnum);
	   $ad=model('Ad')->getlist();
	   $this->assign('ad',$ad);
	   $productactivity=model('ProductActivity')->getlistindex();
	   $this->assign('productactivity',$productactivity);
    }   
     
}
