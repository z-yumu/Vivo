<?php
namespace app\index\controller;
use think\Controller;
use app\common\model\ShippingAddress as ShippingAddressModel;
use app\common\model\Product as ProductModel;
use app\common\model\ProductPicture as ProductPictureModel;
use app\common\model\ProductSku as ProductSkuModel;
use app\common\model\ProductActivity as ProductActivityModel;
use app\common\model\Shopcart as ShopcartModel;
use app\common\model\Orderform as OrderformModel;
class Order extends Base
{
  public function index()
  {
    //1、客户身份验证
    if($this->getLoginUser()==-1) {
      return redirect('client/loginc/index')->remember();
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
        $this->assign('products',$products);   
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
      //对销售属性判断
      if($path<>0){
        $productskus=$productsku->where(['product_id'=>$productid,'path'=>$path])->find();
        if($productskus){
          $price=$productskus->price;
          $paths=explode(',',$path);
        }else{
           $this->error('销售属性存在异常'); 
        }   
      }else{
        $paths=$path;
        if($activity==1){
          $price=$products->rebate_price;
        }else{
          $price=$products->price;
        }  
      }
      $this->assign('paths',$paths);
      $this->assign('path',$path);
      $this->assign('price',$price);
      //获取客户的id
      $registerid=session('clientid','','client');
      //实例化地址
      $address= new ShippingAddressModel;
      $list=$address->where('client_id',$registerid)->select();
      $this->assign('list',$list);
      //获取客户收货地址的默认地址
      $addressdefault=$address->where(['client_id'=>$registerid,'default'=>1])->find();
      $this->assign('addressdefault',$addressdefault);
      
      //实例化产品图片
      $productpicture=new ProductPictureModel;
      //输出产品缩略图的默认图片
      $pictureindex=$productpicture->where(['product_id'=>$productid,'pictureindex'=>1])->find();
      $this->assign('pictureindex',$pictureindex);
      $num=(int)input('param.num');
      $this->assign('num',$num);
        $fare=(int)input('param.money');
        $this->assign('fare',$fare);
      return $this->fetch();   
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
  public function showdizhi($id){                           
      $address= new ShippingAddressModel;            
      $map['id']=$id;
      $data=$address->where($map)->find();
      if($data){
          return $data;
      }
   }
    public function shopcartorder(){                           
      $data=input('param.');
      $id=$data['id'];
      //获取客户的id
      $registerid=session('clientid','','client');
      //实例化地址
      $address= new ShippingAddressModel;
      $list=$address->where('client_id',$registerid)->select();
      $this->assign('list',$list);
      //获取客户收货地址的默认地址
      $addressdefault=$address->where(['client_id'=>$registerid,'default'=>1])->find();
      $this->assign('addressdefault',$addressdefault);
      
      $shopcart=new ShopcartModel;
      $shoplist =$shopcart->getshopcartproduct($id);
      $this->assign('id',$id);
      $this->assign('shoplist',$shoplist);
       return $this->fetch(); 
   }
   public function ordersave()
   {
       //立即购买的订单保存
       if($this->getLoginUser()==-1){
           //用户未登陆
           return $this->redirect('client/loginc/index')->remember();
       }else{
           $data = input('param.');
//           dump($data);exit();
           $validate = validate('Order');
           if (!$validate->check($data)){
               $this->error($validate->getError());
           }
           //检验商品是否存在
           $productid=(int)input('param.productid');
           $product = new ProductModel;
           $products = $product->where(['id'=>$productid,'status'=>1])->find();
           if(!$products){
              $this->error("该产品不存在或存在异常");
           }else{
               $order = new OrderformModel;
               //地址id
               $addressid = $data['addressid'];
               //获取客户的id
               $registerid=session('clientid','','client');
               //产品的订单号,随机数+时间
               $orderno=mt_rand(999, 9999).time();
               $orderdata=[
                   "product_id" => $products->id,
                   "out_trade_no" => $orderno,
                   "merchant_id" => $products->merchantinfoid,
                   "client_id" => $registerid,
                   "client_type" => 3,
                   "shippingaddress_id" =>$addressid,
                   "price" => $data['price'],
                   "buy_count" => $data['num'],
                   "attributes" => $data['path'],
               ];
               $orderid = $order->save($orderdata);
               if($orderid){
                   echo '购买成功';
               }
               else{
                   echo '购买失败';
               }
           }

       }
   }
    //购物车订单提交
    public function shopcartordersave()
    {
        //1、客户身份验证
        if($this->getLoginUser()==-1) {
            return redirect('client/loginc/index')->remember();
        }else{
            $data=input('param.');
            // dump($data);exit;
            $validate =validate('Order');
            if (!$validate->scene('shopcartorder')->check($data)) {
                $this->error($validate->getError());
            }
            $addressid=$data['addressid'];
            $shopcart=new ShopcartModel;
            $shopno=mt_rand(999, 9999).time();
            // 循环写入订单表
            $shopcartnum=count($data['shopcartid']);
            for($i=0; $i<$shopcartnum; $i++){
                unset($shops);
                unset($shopsdata);
                unset($shopcartid);
                $shops =$shopcart->where('id',$data['shopcartid'][$i])->find();
                $shopsdata=[
                    "product_id" => $shops->product_id,
                    "out_trade_no" => $shopno,
                    "merchant_id" => $shops->merchant_id,
                    "client_id" => $shops->client_id,
                    "client_type" => $shops->client_type,
                    "shippingaddress_id" =>$addressid,
                    "price" => $shops->price,
                    "buy_count" => $shops->buy_count,
                    "attributes" => $shops->attributes,
                ];
                $shopcartid = OrderformModel::create($shopsdata);
                if($shopcartid){
                    ShopcartModel::destroy($data['shopcartid'][$i]);
                }else{
                    return false;
                }
            }
            if(!$shopcartid){
                return false;
            }else{
                echo '写入成功';
            }
        }
    }

}
