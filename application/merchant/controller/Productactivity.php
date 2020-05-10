<?php
namespace app\merchant\controller;
use think\Controller;
use think\Request;
use app\common\model\Product as ProductModel;
use app\common\model\ProductActivity as ProductActivityModel;
class Productactivity extends Base
{     
     //活动产品输出页面
    public function index()
    {
      $productactivity= new ProductActivityModel;
      //通过session获取商家的信息的id
      $merchantinfoid=session('merchantinfoid','','merchant');
      $list= $productactivity->merchantproductlist($merchantinfoid);
      $this->assign('list',$list);
      return $this->fetch();  
    }
  //活动商品列表的输出
    public function add($id,$bid,$sid)
    {
      $product= new ProductModel;
      $list= $product->get($id);
      $this->assign('list',$list);
      $this->assign('bid',$bid);
      $this->assign('sid',$sid);
      return $this->fetch(); 
    }
    //活动商品的保存
    public function addsave()
    {
      $productactivity= new ProductActivityModel;
      $merchantinfoid=session('merchantinfoid','','merchant');
        //获取全部数据
      $data=input('param.');
      $products=[
      "merchantinfoid" =>$merchantinfoid,
      "product_id" => $data['id'],
      "total" => $data['total'],
      "activity_price" =>$data['price'],
      "start_time" =>$data['start_time'],
      "end_time" => $data['end_time'],
      "status" => 2,
    ]; 
      $productid=$productactivity->savelist($products);
      if($productid){
        $this->success('添加成功','Productactivity/index');
       }else{
        $this->error('添加失败');
       }
    } 
    //活动商品编辑
    public function edit($id)
    {
      $productactivity= new ProductActivityModel;
      $list= $productactivity->get($id);
      $this->assign('list',$list);
     
      return $this->fetch(); 
    }  
    //活动商品编辑
    public function editsave($id)
    {
      $productactivity= new ProductActivityModel;
      $data=input('param.');
      $products=[
      "total" => $data['total'],
      "activity_price" =>$data['price'],
      "start_time" =>$data['start_time'],
      "end_time" => $data['end_time'],
      "status" => 2,
      ]; 
      $rs=$productactivity->update($products,['id'=>$id]);
      if($rs){
       $this->success('活动产品信息更新成功','Productactivity/index');
      }else{
       $this->error('活动产品信息更新失败');
      } 
    } 
    //活动产品的取消  
    public function productactivitycancel($id)
    {  
        $productactivity= new ProductActivityModel;
        $res=$productactivity->update(['status'=>4],['id'=>$id]);
        if($res){
        $this->success('取消成功');
       }else{
        $this->error('取消失败');
       }
            
    } 
    //活动产品的删除
     public function productactivitydelete($id)
    {  
        $productactivity= new ProductActivityModel;
        $res=$productactivity->update(['status'=>-1],['id'=>$id]);
        if($res){
        $this->success('删除成功');
       }else{
        $this->error('删除失败');
       }
            
    } 
   
}
