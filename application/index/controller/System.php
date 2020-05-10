<?php
namespace app\index\controller;
use think\Controller;
use think\Db;
class System extends Controller
{
    public function status()
    {  
       $site=model('Systemsite')->get(1);
       if(!$site){
        return '<script>alert("网站维护中")</script>';
       }else{
       	$this->redirect('Index/index');
       } 
         
    }
}
