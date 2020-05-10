<?php
namespace app\merchant\controller;
use think\Controller;
use app\common\model\Xuesheng;
// use think\Db;
class Index extends Base
{
    public function index()
    {
        
        return $this->fetch();  
    }
     public function jieshao()
    {
       
        // $this->assign('name',$name);
       
        return $this->fetch();  
    }
    
}
