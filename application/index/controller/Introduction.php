<?php
namespace app\index\controller;
use think\Controller;
use app\common\model\ProductPicture as ProductPictureModel;
use app\common\model\Product as ProductModel;
use app\common\model\ProductActivity as ProductActivityModel;
use app\common\model\ProductExtract as ProductExtractModel;
use app\common\model\Orderform as OrderformModel;
use app\common\model\ProductSalesAttribute as ProductSalesAttributeModel;
use app\common\model\ProductSku as ProductSkuModel;
use app\common\model\ProductCategoryAttributeValue as ProductCategoryAttributeValueModel;
use app\common\model\ProductCategoryBrand as ProductCategoryBrandModel;

// use think\Db;
class Introduction extends Base
{
    public function index($id)
    {
        //实例化产品图片
        $productpicture=new ProductPictureModel;
        //实例化产品
        $product=new ProductModel;
        //实例化活动产品
        $productactivity=new ProductActivityModel;
        //实例化产品物流
        $productextract=new ProductExtractModel;
        //实例化产品订单
        $orderform=new OrderformModel;
        //实例化产品的销售属性
        $productsalesattribute=new ProductSalesAttributeModel;
        //实例化产品的类目属性
        $productcategoryattributevalue=new ProductCategoryAttributeValueModel;
        //实例化产品的品牌
        $productcategorybrand=new ProductCategoryBrandModel;
        //验证传递id的合法性
        if(!intval($id)){
        	$this->error('id不合法');
        }
        //查询id对应的产品信息
        $products=$product->where(['id'=>$id,'status'=>1])->find();
        //判断产品是否存在或异常情况
        if(!$products){
          $this->error('该产品不存在或存在异常');	
        }else{
         $this->assign('products',$products);	
        }
        //查询活动产品的信息
        $productactivitys=$productactivity->whereBetweenTimeField('start_time','end_time')->where(['product_id'=>$id,'status'=>1])->find();
        //判断活动产品是否存在
        if(!$productactivitys){
        	$productactivitys=0;
           $this->assign('productactivitys',$productactivitys);	
        }else{
         $this->assign('productactivitys',$productactivitys);	
        }
        //输出产品缩略图的默认图片
        $pictureindex=$productpicture->where(['product_id'=>$id,'pictureindex'=>1])->find();
        //输出产品所以的缩略图片
        $picture=$productpicture->where('product_id',$id)->select();
         //查询产品的物流信息
        $productextracts=$productextract->where('product_id',$id)->find();
        //统计产品月销售量
        $productsum=$orderform->where('product_id',$id)->sum('buy_count');
        //输出产品产品销售属性
        // dump($products->salesattribute);exit;
        if($products->salesattribute==1){
          $attribute=$productsalesattribute->where('product_id',$id)->select();
        }else{
           $attribute='';
        }
         //输出产品品牌名称输出
        if($products->categorybrand==1){
          $brand=$productcategorybrand->where('product_id',$id)->find();
        }else{
           $brand='';
        }
        //输出产品类目名称输出
        if($products->categoryattribute==1){
          $categoryattributevalue=$productcategoryattributevalue->where('product_id',$id)->select();
        }else{
           $categoryattributevalue='';
        }
        $this->assign('productextracts',$productextracts);
        $this->assign('pictureindex',$pictureindex);
        $this->assign('picture',$picture);
        $this->assign('productsum',$productsum);
        $this->assign('attribute',$attribute);
        $this->assign('brand',$brand);
        $this->assign('categoryattributevalue',$categoryattributevalue);
        return $this->fetch();  
    }
    public function showprice()
    {                           
      $productsku=new ProductSkuModel;
      $map['product_id']=input("productid");
      $map['path']=input("path");
      $data=$productsku->where($map)->field("path,product_id,price,nums")->find();
      if($data){
        return $data;
      }

    }
    
    
}
