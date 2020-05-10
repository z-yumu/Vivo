<?php
namespace app\admin\controller;
use think\Controller;
use think\Db;
use think\Image;
use think\Request;
use think\facade\Env;
use app\common\model\Product as ProductModel;
use app\common\model\Category as CategoryModel;
use app\common\model\SalesAttribute as SalesAttributeModel;
use app\common\model\SalesAttributeValue as SalesAttributeValueModel;
class Product extends Base
{     
  //商品列表的输出
    public function index($name='')
    {
        //直接查询，model层
      $product= new ProductModel;
      $list= $product->getlist($name);
      $this->assign('list',$list);
      return $this->fetch();  
    }
    /**
     * 商家通过操作
     */
    public function pass($id)
    {
        $product= new ProductModel;  
        $res=$product->update(['status'=>1],['id'=>$id]);
        if($res){
        $this->success('通过成功','Product/index');
       }else{
        $this->error('通过失败');
       }
            
    }
    /**
     * 商家通过操作
     */
    public function nopass($id)
    {
        $product= new ProductModel;  
        $res=$product->update(['status'=>3],['id'=>$id]);
        if($res){
        $this->success('审核成功','Product/index');
       }else{
        $this->error('不通过失败');
       }
            
    }
    /**
     * 商品推荐至首页
     */
    public function recommend($id)
    {
        $product= new ProductModel;  
        $res=$product->update(['indextop'=>1],['id'=>$id]);
        if($res){
        $this->success('推荐成功','Product/index');
       }else{
        $this->error('推荐失败');
       }
            
    }
     /**
     * 商品删除
     */
//     public function realdelete($id)
//     {
//         $product= new ProductModel;
//         $res=$product->where('id',$id)->delete();
//         if($res){
//         $this->success('删除成功');
//        }else{
//         $this->error('失败');
//        }
//
//     }

     /**
     * 商家禁止操作
     */
    public function forbid($id)
    {
        $product= new ProductModel;    
        $res=$product->update(['status'=>0],['id'=>$id]);
        if($res){
        $this->success('禁止成功','Product/index');
       }else{
        $this->error('禁止失败');
       }
            
    }
    //商品的详细信息显示
    
    public function info($id)
    { 
        $info= new MerchantInfoModel;
        $infos=$info->where('id',$id)->find();
        $account= new MerchantAccountModel;
        $accounts=$account->where('id',$accountid)->find();
        $company= new MerchantCompanyModel;
        $companys=$company->where('infoid',$id)->find();
        $settlement= new MerchantSettlementModel;
        $settlements=$settlement->where('infoid',$id)->find();
        $this->assign('infos',$infos);
        $this->assign('accounts',$accounts);
        $this->assign('companys',$companys);
        $this->assign('settlements',$settlements);
        return $this->fetch();  
    }
    //产品分类的输出
     public function categorylist()
   {
      $category= new CategoryModel;
      $show= $category->getshow();
      $this->assign('show',$show);
     return $this->fetch();  
   }
   //显示添加销售属性
     public function addsalesattribute($bid,$sid)
   {
      
      $salesattribute= new SalesAttributeModel;
      $salesattributes=$salesattribute->getsalesattributelist();
      $this->assign('bid',$bid);
      $this->assign('sid',$sid);
      $this->assign('salesattributes',$salesattributes);
      return $this->fetch();  
   }
   //异步返回选择销售属性显示
     public function getattr($attrid)
   {
     return json([
        'data'=>$attrid,
        ]);  
   }
   //保存销售属性，关联销售属性
     public function savesalesattribute()
   {
      $data=input('param.');
      $salesattribute= new SalesAttributeModel;
      $category= new CategoryModel;
      $salesattributeid=$data['salesattributeid'];
      if($salesattributeid==0){
          $res=$salesattribute->where('name',$data['name'])->find();
          if($res){
          $this->error('已有此销售属性，请选择');
          }else{
          $category = $category->get($data['category_id']);
          $category->salesattributes()->save(['name'=>$data['name']]);
           $this->success('添加成功','Product/categorylist');
          }
      }else{
          $category = $category->get($data['category_id']);
          // 增加关联的中间表数据
          $category->salesattributes()->attach($salesattributeid);
          $this->success('添加成功','Product/categorylist'); 
      }  
    }
    //删除销售属性（中间表）
     public function deletesalesattribute($said,$cid)
   {
      $salesattribute= new SalesAttributeModel;
      $category= new CategoryModel;
      $category = $category->get($cid);
      $res=$category->salesattributes()->detach($said);
      $this->success('删除成功','Product/categorylist');
    }
    //添加销售属性值页面的显示
    public function addsalesattributevalue($cid,$said)
    {
        $this->assign('cid',$cid);
        $this->assign('said',$said);
        return $this->fetch();  
    }
    //类目属性值的保存
    public function savesalesattributevalue()
    {
       $salesattributevalue= new SalesAttributeValueModel;
       //接收数据
       $data=$this->request->param();
        // dump($data);exit;
        //验证数据
        $validate =validate('System');
        if (!$validate->scene('savecategoryattribute')->check($data)) {
            $this->error($validate->getError());
        }  
       $res=$salesattributevalue->where('name',$data['name'])->find();
       if(!$res){
           $result=$salesattributevalue->savelist($data);
           if($result){
            $this->success('添加成功','Product/categorylist');
           }else{
            $this->error('添加失败');
           }
       }else{
         $this->error('已有此销售属性值','Product/categorylist');
       }
    }
      /**
     * 删除销售属性值
     */
    public function deletesalesattributevalue($id)
    {
      $salesattributevalue= new SalesAttributeValueModel;
      $res=$salesattributevalue->update(['status'=>-1],['id'=>$id]);
        if($res){
        $this->success('删除成功','Product/categorylist');
       }else{
        $this->error('删除失败');
       }      
    }
    public function rdelete($id)
    {
        $result = model("Product")->where('id',$id)->delete();
        if($result){
            $this->success('删除成功');
        }else{
            $this->error('删除失败');
        }
    }

}
