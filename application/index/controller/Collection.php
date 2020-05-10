<?php
namespace app\index\controller;
use think\Controller;
use think\Db;
use app\common\model\ShippingAddress as ShippingAddressModel;
use app\common\model\Product as ProductModel;
use app\common\model\ProductPicture as ProductPictureModel;
use app\common\model\ProductSku as ProductSkuModel;
use app\common\model\ProductActivity as ProductActivityModel;
use app\common\model\Collection as CollectionModel;
class Collection extends Base
{
  public function index()
   {
     //1、客户身份验证
      if($this->getLoginUser()==-1) {
        return -2;
      }else{
        $data=input('param.');
        return redirect('shopadd')->params($data);
      }
   }
   public function index2($productid)
   {
     //1、客户身份验证
      if($this->getLoginUser()==-1) {
        return redirect('client/loginc/index')->remember();
      }else{
        return redirect('index/Introduction/index',['id'=>$productid]);
      }
   }
   function shopadd()
   {
      //1、客户身份验证
      if($this->getLoginUser()==-1) {
        return -2;
      }else{
          $data=input('param.');
        
          //获取产品的id
          $productid=(int)input('param.productid');
          //2、检验产品是否存在
             //实例化产品
          $product=new ProductModel;
              //实例化活动产品
              //查询id对应的产品信息
          $products=$product->where(['id'=>$productid,'status'=>1])->find();
              //判断产品是否存在或异常情况
          if(!$products){
            $this->error('该产品不存在或存在异常');  
          }else{
            $merchantid=$products->merchantinfoid;
          }
          //3、检验产品是否正在活动期间
          $productactivity=new ProductActivityModel;
           //查询活动产品的信息
          $productactivitys=$productactivity->whereBetweenTimeField('start_time','end_time')->where(['product_id'=>$productid,'status'=>1])->find();
          //判断活动产品是否存在
          if($productactivitys){
             $activity=1;
          }else{
             $activity=0;
          }
          //4、检验销售属性是否存在
          //产品sku实例化
          $productsku=new ProductSkuModel;
          $path=input('param.path');
          // dump($path);
          //对销售属性判断
          if($path<>0){
            $productskus=$productsku->where(['product_id'=>$productid,'path'=>$path])->find();
            if($productskus){
              $price=$productskus->price;
            }else{
               $this->error('销售属性存在异常'); 
            }   
          }else{
            if($activity==1){
              $price=$products->rebate_price;
            }else{
              $price=$products->price;
            }  
          }
          //获取客户的id
          $registerid=session('clientid','','client');
          $num=(int)input('param.num');
          $collection=new CollectionModel;
          //判断购物车是否已有此产品
          $res0=$collection->where(['product_id'=>$productid])->find();
          if($res0){
             return -1;
          }else{
            $productdata=[
             'product_id'=>$productid,
             'merchant_id'=>$merchantid,
             'client_id'=>$registerid,
             'price'=>$price,
             'buy_count'=>$num,
              'attributes'=>$path,
            ];
            $res=$collection->savelist($productdata);
            if($res){
               return 1;
            }else{
              return 0;
            }
          }
         
      }
    }
   function getLoginUser()
  {
     //验证登录
     $client=session('clientid','','client');
     if(!$client){
      return -1;
     }else{
       return $client;
     }  
  }  
  public function collectionlist()
   {
     //获取收藏夹
      if($this->getLoginUser()==-1) {
        return redirect('client/loginc/index')->remember();
      }else{
        $collection=new CollectionModel;
        $registerid=session('clientid','','client');
        $collectionlist = $collection->getlist($registerid);
//        dump($collectionlist);exit();
        $this->assign('collectionlist',$collectionlist);
        return $this->fetch(); 
      }
   }

   public function shopnum($num,$item)
   {
     //1、客户身份验证
      if($this->getLoginUser()==-1) {
        return -1;
      }else{
        $shopcart=new ShopcartModel;
        $res =$shopcart->where('id',$item)->setField('buy_count', $num);
        if($res==0){
          return 0;
        }else{
          return 1;
        }
      }
   }
   public function delete($id)
   {
        $collection = new CollectionModel;
        $res = $collection->where('product_id',$id)->update(['status'=>0]);
        if ($res){
            $this->success("删除成功");
        }else{
            $this->error('删除失败');
        }

   }

}
