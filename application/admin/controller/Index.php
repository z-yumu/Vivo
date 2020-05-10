<?php
namespace app\admin\controller;
use think\Controller;
use think\Db;
class Index extends Base
{
    public function index()
    {
       
        // $this->assign('name',$name);
       
        return $this->fetch();  
    }
    public function jieshao()
    {
       
        // $this->assign('name',$name);
       
        return $this->fetch();  
    }
      
}
