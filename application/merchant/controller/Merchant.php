<?php
namespace app\merchant\controller;
use think\Controller;
use app\common\model\Xuesheng;
// use think\Db;
class Merchant extends Base
{
    public function openshop()
    {
        
        return $this->fetch();  
    }
     public function jieshao()
    {
       
        // $this->assign('name',$name);
       
        return $this->fetch();  
    }
    
}
