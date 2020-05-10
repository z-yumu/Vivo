<?php
namespace app\admin\controller;
use think\Controller;
use think\Db;
use app\common\model\Navigation as NavigationModel;
class Navigation extends Base
{     
 
    public function index()
    {
        // $this->assign('name',$name);
        return $this->fetch();  
    }
    //主页导航的添加页面的显示
    public function add()
    {
        return $this->fetch();  
    }
     //主页导航信息的添加保存
    public function save()
    {
        $navigation= new NavigationModel;
       //接收数据
       $data=$this->request->param();
        // dump($data);exit;
        //验证数据
        $validate =validate('System');
        if (!$validate->check($data)) {
            $this->error($validate->getError());
        }    
       $result=$navigation->savelist($data);
       if($result){
        $this->success('添加成功');
       }else{
        $this->error('添加失败');
       }
    }
    //主页导航的输出
     public function list()
   {
      $navigation= new NavigationModel;
      $list= $navigation->getlist();
      $this->assign('list',$list);
     return $this->fetch();  
   }
   // //主页导航排序
   // public function listorder($id,$order)
   // {
   //   $navigation= new NavigationModel;
   //   $res=$navigation->update(['order'=>$order],['id'=>$id]);
   //   if($res){
   //    $this->success('排序成功');
   //   }else{
   //    $this->error('排序失败');
   //   }
   // }
   //主页导航的编辑表单
    public function edit($id)
    {
        $navigation= new NavigationModel;
        $navigations=$navigation->where('id',$id)->find();
        $this->assign('navigations',$navigations);
        return $this->fetch();  
    }
    
      //主页导航编辑的保存
    public function editsave()
   {
     $data=input('param.');

     // dump($data);exit;
     //验证数据
      $validate =validate('System');
      if (!$validate->scene('edit')->check($data)) {
          $this->error($validate->getError());
      }
     $navigation= new NavigationModel;    
     $res=$navigation->update($data);
     if($res){
      $this->success('成功',url('Navigation/list'));
     }else{
      $this->error('失败');
     }
   }
   /**
     * 删除产品分类
     */
    // public function delete($id)
    // {
    //    $navigation= new NavigationModel; 
    //     $res=$navigation->update(['status'=>-1],['id'=>$id]);
    //     if($res){
    //     $this->success('删除成功','Navigation/list');
    //    }else{
    //     $this->error('删除失败');
    //    }
            
    // }
}
