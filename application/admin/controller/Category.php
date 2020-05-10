<?php
namespace app\admin\controller;
use app\common\model\CategorySmall;
use think\Controller;
use think\Db;
use app\common\model\Category as CategoryModel;
use app\common\model\CategoryAttribute as CategoryAttributeModel;
use app\common\model\CategoryAttributeValue as CategoryAttributeValueModel;
use app\common\model\CategoryBrand as CategoryBrandModel;
use app\common\model\CategorySmall as CategorySmallModel;
class Category extends Base
{     
 
    public function index()
    {
        // $this->assign('name',$name);
        return $this->fetch();  
    }
    //产品分的添加页面的显示
    public function add()
    {
         $category= new CategoryModel;
         $firstcategorys=$category->getfirstcategory();
         $this->assign('firstcategorys',$firstcategorys);
        return $this->fetch();  
    }
     //产品分类的添加保存
    public function categorysave()
    {
      $category= new CategoryModel;
       //接收数据
       $data=$this->request->param();
        // dump($data);exit;
        //验证数据
        $validate =validate('System');
        if (!$validate->check($data)) {
            $this->error($validate->getError());
        }    
       $result=$category->savelist($data);
       if($result){
        $this->success('添加成功');
       }else{
        $this->error('添加失败');
       }
    }
    //产品分类的输出
     public function categorylist()
   {
      $category= new CategoryModel;
      $show= $category->getshow();
      $this->assign('show',$show);
     return $this->fetch();  
   }
   // //产品类别排序
   // public function listorder($id,$order)
   // {
   //   $category= new CategoryModel;
   //   $res=$category->update(['order'=>$order],['id'=>$id]);
   //   if($res){
   //    $this->success('排序成功');
   //   }else{
   //    $this->error('排序失败');
   //   }
   // }
   //产品大类的编辑表单
    public function categoryeditb($id)
    {
        $category= new CategoryModel;
        $categorys=$category->where('id',$id)->find();
        $this->assign('categorys',$categorys);
        return $this->fetch();  
    }
    public function categoryeditm($id)
    {
        $category= new CategoryModel;
        $firstcategorys=$category->getfirstcategory();
        $categorys=$category->where('id',$id)->find();
         $this->assign('firstcategorys',$firstcategorys);
        $this->assign('categorys',$categorys);
        return $this->fetch();  
    }
      //产品分类编辑的保存
    public function categoryeditsave()
   {
     $data=input('param.');

     // dump($data);exit;
     //验证数据
      $validate =validate('System');
      if (!$validate->scene('edit')->check($data)) {
          $this->error($validate->getError());
      }
     $category= new CategoryModel;    
     $res=$category->update($data,['id'=>$data['id']]);
     if($res){
      $this->success('成功',url('Category/categorylist'));
     }else{
      $this->error('失败');
     }
   }
   /**
     * 删除产品分类
     */
    // public function delete($id)
    // {
    //    $category= new CategoryModel; 
    //    $check=$category->checksubcategory($id);
    //    if($check){
    //     $this->error('请先删除子类');
    //    }else{
    //         $res=$category->update(['status'=>-1],['id'=>$id]);
    //         if($res){
    //         $this->success('删除成功','Category/categorylist');
    //        }else{
    //         $this->error('删除失败');
    //        }
    //    }      
    // }
    //添加类目属性页面的显示
    public function addcategoryattribute($id)
    {
        $category= new CategoryModel;
        $categorys=$category->where('id',$id)->find();
         $this->assign('categorys',$categorys);
        return $this->fetch();  
    }
     //类目属性的保存
    public function savecategoryattribute()
    {
       $categoryattribute= new CategoryAttributeModel;
       //接收数据
       $data=$this->request->param();
        // dump($data);exit;
        //验证数据
        $validate =validate('System');
        if (!$validate->scene('savecategoryattribute')->check($data)) {
            $this->error($validate->getError());
        }    
       $result=$categoryattribute->savelist($data);
       if($result){
        $this->success('添加成功','Category/categorylist');
       }else{
        $this->error('添加失败');
       }
    }
    
    /**
     * 删除类目属性
     */
    public function deletecategoryattribute($id)
    {
       $categoryattribute= new CategoryAttributeModel;
        $res=$categoryattribute->where('id',$id)->delete();
        if($res){
        $this->success('删除成功','Category/categorylist');
       }else{
        $this->error('删除失败');
       }      
    }
    //添加类目属性值页面的显示
    public function addcategoryattributevalue($cid,$caid)
    {
        $this->assign('cid',$cid);
        $this->assign('caid',$caid);
        return $this->fetch();  
    }
     //类目属性值的保存
    public function savecategoryattributevalue()
    {
       $categoryattributevalue= new CategoryAttributeValueModel;
       //接收数据
       $data=$this->request->param();
        // dump($data);exit;
        //验证数据
        $validate =validate('System');
        if (!$validate->scene('savecategoryattribute')->check($data)) {
            $this->error($validate->getError());
        }    
       $result=$categoryattributevalue->savelist($data);
       if($result){
        $this->success('添加成功','Category/categorylist');
       }else{
        $this->error('添加失败');
       }
    }

     /**
     * 删除类目属性值
     */
    public function deletecategoryattributevalue($id)
    {
      $categoryattributevalue= new CategoryAttributeValueModel;
      $res=$categoryattributevalue->update(['status'=>-1],['id'=>$id]);
        if($res){
        $this->success('删除成功','Category/categorylist');
       }else{
        $this->error('删除失败');
       }      
    }
    //添加类目品牌页面的显示
    public function addcategorybrand($cid)
    {
        $this->assign('cid',$cid);
        return $this->fetch();  
    }
    //类目品牌的保存
    public function savecategorybrand()
    {
       $categorybrand= new CategoryBrandModel;
       //接收数据
       $data=$this->request->param();
        // dump($data);exit;
        //验证数据
        $validate =validate('System');
        if (!$validate->scene('savecategoryattribute')->check($data)) {
            $this->error($validate->getError());
        }    
       $result=$categorybrand->savelist($data);
       if($result){
        $this->success('添加成功','Category/categorylist');
       }else{
        $this->error('添加失败');
       }
    }
     /**
     * 删除类目属性值
     */
    public function deletecategorybrand($id)
    {
      $categorybrand= new CategoryBrandModel;
      $res=$categorybrand->update(['status'=>-1],['id'=>$id]);
        if($res){
        $this->success('删除成功','Category/categorylist');
       }else{
        $this->error('删除失败');
       }      
    }
    public function deletecategorysmall($id)
    {
        $categorysmall = new CategorySmallModel;
        $res = $categorysmall->where('id',$id)->delete();
        if($res){
          $this->success("删除成功","Category/categorylist");
        }else{
            $this->error("删除失败");
        }
    }
    //添加类目小类页面的显示
    public function addcategorysmall($cid)
    {
        $this->assign('cid',$cid);
        return $this->fetch();  
    }
    //类目品牌的保存
    public function savecategorysmall()
    {
       $categorysmall= new CategorySmallModel;
       //接收数据
       $data=$this->request->param();
        // dump($data);exit;
        //验证数据
        $validate =validate('System');
        if (!$validate->scene('savecategoryattribute')->check($data)) {
            $this->error($validate->getError());
        }    
       $result=$categorysmall->savelist($data);
       if($result){
        $this->success('添加成功','Category/categorylist');
       }else{
        $this->error('添加失败');
       }
    }
}
