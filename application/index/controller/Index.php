<?php
namespace app\index\controller;
use think\Controller;
use app\common\model\Xuesheng;
use app\common\model\RegisterInfo as RegisterInfoModel;
// use think\Db;
use app\common\model\Product as ProductModel;
use think\Session;
class Index extends Base
{
    public function index($name='')
    {
        $register= new RegisterInfoModel;
        $registerid=session('clientid','','client');
        $info= $register->where('registerid',$registerid)->find();
        $this->assign('info',$info);
//        查询
//        $product = new ProductModel;
//        $list = $product->getlist($name);
//        $list = json_encode($list);
//        dump($list);exit();
//        session('name',$name);
//            $this->redirect('Search/index',['name'=>$name]);
//        $this->assign('list',$list);
        return $this->fetch();

    }
    public function search()
    {
//        $list = session('list');
//        $this->assign('list',$list);
    }
    
    
}
