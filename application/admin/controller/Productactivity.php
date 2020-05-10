<?php
namespace app\admin\controller;
use think\Controller;
use think\Request;
use app\common\model\ProductActivity as ProductActivityModel;
class Productactivity extends Base
{     
  //活动商品列表的输出
    public function index($name='')
    {
      $productactivity= new ProductActivityModel;
      $list= $productactivity->getlist($name);
      $this->assign('list',$list);
      return $this->fetch(); 
    }
    //活动商品列表的输出
    public function select()
    {
      $productactivity= new ProductActivityModel;
      $list= $productactivity->hasWhere('product', 
        function($query)
         {
          $query->where('name','like','%'.input('param.name').'%'); 
          })->paginate(1,false,[
                       'query'=>[
                        'name'=>input('param.name'),
                       ]
                    ]);
      $this->assign('list',$list);
      return $this->fetch(); 
    }
    /**
     * 活动商品通过操作
     */
    public function pass($id)
    {
       $productactivity= new ProductActivityModel; 
        $res=$productactivity->update(['status'=>1],['id'=>$id]);
        if($res){
        $this->success('通过成功','Productactivity/index');
       }else{
        $this->error('通过失败');
       }
            
    }
    /**
     * 活动商品不通过操作
     */
    public function nopass($id)
    {
        $productactivity= new ProductActivityModel; 
        $res=$productactivity->update(['status'=>3],['id'=>$id]);
        if($res){
        $this->success('设置成功','Productactivity/index');
       }else{
        $this->error('不通过失败');
       }
            
    }
    //活动商品
     /**
     * 活动商品禁止操作
     */
    public function forbid($id)
    {
        $productactivity= new ProductActivityModel;  
        $res=$productactivity->update(['status'=>0],['id'=>$id]);
        if($res){
        $this->success('禁止成功','Productactivity/index');
       }else{
        $this->error('禁止失败');
       }
            
    }
    /**
     * 商品推荐至首页
     */
    public function recommend($id)
    {
         $productactivity= new ProductActivityModel;    
        $res=$productactivity->update(['indextop'=>1],['id'=>$id]);
        if($res){
        $this->success('推荐成功','Productactivity/index');
       }else{
        $this->error('推荐失败');
       }
            
    }
    
   
}
