<?php
// +----------------------------------------------------------------------
// | ThinkPHP [ WE CAN DO IT JUST THINK ]
// +----------------------------------------------------------------------
// | Copyright (c) 2006-2016 http://thinkphp.cn All rights reserved.
// +----------------------------------------------------------------------
// | Licensed ( http://www.apache.org/licenses/LICENSE-2.0 )
// +----------------------------------------------------------------------
// | Author: 流年 <liu21st@gmail.com>
// +----------------------------------------------------------------------

// 应用公共文件
// 状态显示函数
function status($value)
{
    $status = [-1=>'下架',0=>'禁用',1=>'正常',2=>'待审核',3=>'不通过',4=>'取消',6=>""];
    return $status[$value];
}
// 付款状态显示函数
function paystatus($value)
{
    $status = [-3=>'退款已完成',-2=>'退款中',-1=>'订单已关闭',0=>'未付款',1=>'已付款'];
    return $status[$value];
}
// 状态显示函数
function billstatus($value)
{
    $status = [0=>'未结算',1=>'已结算'];
    return $status[$value];
}

// 物流状态显示函数
function logisticsstatus($value)
{
    $status = [0=>'未发货',1=>'已发货',2=>'已收货'];
    return $status[$value];
}
// 管理员角色显示函数
function auth($id)
{
   $role=Db::table('role')->where('id',$id)->value('name');
   return $role;
}
// 显示商家名称
function merchantname($id)
{
   $merchant=Db::table('merchant_info')->where('id',$id)->value('name');
   return $merchant;
}
// 类目属性的循环输出
function categoryattribute($id)
{
   $map['category_id']=$id;
   $map['status']=1;
   $categoryattribute=Db::table('category_attribute')->where($map)->select();
   foreach ($categoryattribute as $n => $value) {
   	$map1['category_attribute_id']=$value['id'];
    $map1['status']=1;
   	$categoryattribute[$n]['child']=Db::table('category_attribute_value')->where($map1)->select();
    // dump($categoryattribute[$n]['child']);
   }
   return $categoryattribute;
}
// 显示分类的名称
function categoryname($id)
{
   $name=Db::table('category')->where('id',$id)->value('name');
   return $name;
}
// 显示类目属性的名称
function categoryattributename($id)
{
   $name=Db::table('category_attribute')->where('id',$id)->value('name');
   return $name;
}
// 显示类目属性值的名称
function categoryattributevaluename($id)
{
   $name=Db::table('category_attribute_value')->where('id',$id)->value('name');
   return $name;
}
// 类目品牌的循环输出
function categorybrand($id)
{
   $map['category_id']=$id;
   $map['status']=1;
   $categorybrand=Db::table('category_brand')->where($map)->select();
   return $categorybrand;
}
// 销售属性的循环输出
function salesattribute($id)
{
   $map['category_id']=$id;
   $map['status']=1;
   $salesattribute=Db::table('category_sales_attribute')->where($map)->select();
   foreach ($salesattribute as $n => $value) {
    $map1['sales_attribute_id']=$value['sales_attribute_id'];
    $map1['status']=1;
    $salesattribute[$n]['child']=Db::table('sales_attribute_value')->where($map1)->select();
    // dump($categoryattribute[$n]['child']);
   }
   return $salesattribute;
}

// 显示销售属性的名称
function salesattributename($id)
{
   $name=Db::table('sales_attribute')->where('id',$id)->value('name');
   return $name;
}
// 根据销售属性值的id输出销售属性名称
function valuesalesattributename($id)
{
   if($id){
    $salesattributeid=Db::table('sales_attribute_value')->where('id',$id)->value('sales_attribute_id');
    $name=Db::table('sales_attribute')->where('id',$salesattributeid)->value('name');
    return $name;
   }else{
    return '无';
   }
   
}
// 显示销售属性值的名称
function salesattributevaluename($id)
{
  
   $name=Db::table('sales_attribute_value')->where('id',$id)->value('name');
   return $name;
}
// 显示订单销售属性值的名称
function orderformsalesattributevaluename($attributes,$id)
{
   if($attributes==1){
    $name=Db::table('orderform_sales_attribute_value')->where('orderform_id',$id)->select();
    return $name;
   }else{
    return '无';
   }
   
}
// 显示订单销售属性的名称
// $id为订单销售属性值的id
function orderformsalesattributename($id)
{
   if($id){
    $salesattributeid=Db::table('sales_attribute_value')->where('id',$id)->value('sales_attribute_id');
    $name=Db::table('sales_attribute')->where('id',$salesattributeid)->value('name');
    return $name;
   }else{
    return '无';
   }
   
}
// 物流信息表中显示订单号
function logisticproductouttradeno($orderformid)
{
    $name=Db::table('orderform')->where('id',$orderformid)->value('out_trade_no');
   return $name;
   
}
// 显示商品的名称
function productname($id)
{
   $name=Db::table('product')->where('id',$id)->value('name');
   return $name;
}
// 显示银行名称
function merchantbankname($id)
{
   $merchantbank=Db::table('merchant_settlement')->where('infoid',$id)->value('bank');
   return $merchantbank;
}
// 显示银行户名
function merchantbankaccountname($id)
{
   $merchantbank=Db::table('merchant_settlement')->where('infoid',$id)->value('name');
   return $merchantbank;
}
// 显示开户银行
function merchantbankaddress($id)
{
   $merchantbank=Db::table('merchant_settlement')->where('infoid',$id)->value('province');
   return $merchantbank;
}
// 显示银行网点
function merchantbankbranch($id)
{
   $merchantbank=Db::table('merchant_settlement')->where('infoid',$id)->value('branch');
   return $merchantbank;
}
// 显示银行账号
function merchantbanknumber($id)
{
   $merchantbank=Db::table('merchant_settlement')->where('infoid',$id)->value('number');
   return $merchantbank;
}
// 显示随机码
function randkeys($length)
{
   $key='';
   $pattern = '1234567890abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLOMNOPQRSTUVWXYZ';
   for($i=0;$i<$length;$i++)
   {
    $key.=$pattern{mt_rand(0,62)};
   }
   return $key;
}
// 显示客户名称
function clientname($id)
{
   $client=Db::table('orderform')->where('id',$id)->find();
   if($client['client_type']==1){
     $name=Db::table('weixin_info')->where('id',$client['client_id'])->value('name');
     return $name;
   }elseif($client['client_type']==2){
     $name=Db::table('qq_info')->where('id',$client['client_id'])->value('name');
     return $name;
   }else{
      $name=Db::table('register_info')->where('id',$client['client_id'])->value('name');
     return $name;
   }

}
//结算日期显示
function billtime(){
$result=date("Y-m",strtotime("last month")) ;
return $result;
}
//评论时间
function commenttime($time)
{
//    $time = strtotime($time);
//    $res = date('Y-m-d',$time);
    $res = date("Y-m-d",strtotime(date('Y',$time).'-'.(date('m',$time))));
    return $res;
}
//已付款的结算单数
function billsum($billnumber){
$sum=Db::table('pay')->where('bill_number',$billnumber)->count();
return $sum;
}
//结算日期显示
function billsuccesstime($time){
$time=strtotime($time);
$result=date("Y-m",strtotime(date('Y',$time).'-'.(date('m',$time)-1)));
return $result;
}
// 输出分组的订单列表
function order($merchant_id,$out_trade_no)
{
    $name=Db::table('orderform')->where(['merchant_id'=>$merchant_id,'out_trade_no'=>$out_trade_no])->select();
    return  $name;
}
// 返回物流信息的expcode
function getlogistics1($out_trade_no,$merchant_id)
{
    $name=Db::table('orderform_logistics')->where(['merchant_id'=>$merchant_id,'out_trade_no'=>$out_trade_no])->find();
    return  $name['expcode'];
}
// 返回物流信息的expno
function getlogistics2($out_trade_no,$merchant_id)
{
    $name=Db::table('orderform_logistics')->where(['merchant_id'=>$merchant_id,'out_trade_no'=>$out_trade_no])->find();
    return  $name['expno'];
}
// 类目小类的循环输出
function categorysmall($id)
{
   $map['category_id']=$id;
   $map['status']=1;
   $categorybrand=Db::table('category_small')->where($map)->select();
   return $categorybrand;
}
function subtext($text, $length)
{ 
if(mb_strlen($text, 'utf8') > $length)
return mb_substr($text,0,$length,'utf8').' …';
return $text;
}
// 显示商品的图片
function productpicture($id)
{
    
   $name=Db::table('product_picture')->where(['product_id'=>$id,'pictureindex'=>1])->value('picturebig');
   return $name;
}
//显示头像
function headpicture($id)
{

    $name=Db::table('register_info')->where(['registerid'=>$id,'status'=>1])->value('headpicture');
    return $name;
}
// 主页显示的大类产品信息
function indexproduct($id)
{
   $map['category_id']=$id;
   $map['status']=1;
   $map['indextop']=1;
   $name=Db::table('product')->where($map)->select();
   return $name;
}
// 产品销售属性值的输出
function productattributevalue($product_id,$sales_attribute_id)
{
   $map['product_id']=$product_id;
   $map['sales_attribute_id']=$sales_attribute_id;
   $productattributevalue=Db::table('product_sales_attribute_value')->where($map)->select();
   return $productattributevalue;
}
// 显示品牌的名称
function brandname($id)
{
   $name=Db::table('category_brand')->where('id',$id)->value('name');
   return $name;
}

// 输出分组的购物车商品列表
function shopcart($merchant_id,$register)
{
    $name=Db::table('shopcart')->where(['merchant_id'=>$merchant_id,'client_id'=>$register])->select();
    return  $name;
}
//输出收藏夹
function collection($merchant_id)
{
    $name=Db::table('collection')->where('merchant_id',$merchant_id)->select();
    return  $name;
}
// 输出分组的购物车商品列表
function shopcartorder($merchant_id,$id)
{
  $map['merchant_id']=$merchant_id;
  // $map['id']=$id;
  $name=Db::table('shopcart')->where($map)->whereIn('id',$id)->select();
  return  $name;
}
//把购物车里面销售属性值的id，由字符串转化为数组，然后遍历出销售属性的名称和销售属性值的名称
function shopcartattribute($path)
{
    if($path<>0){
      $paths=explode(',',$path);
      $attributes = "";
      foreach ($paths as $value) {
        // 根据销售属性值的id输出销售属性名称
        $name=valuesalesattributename($value);
        // 显示销售属性值的名称
        $namevalue=salesattributevaluename($value);
        //循环拼接销售属性
        $attributes.=$name.':'.$namevalue.';';
      }
      return $attributes;
    }else{
      return '无';
    }
}
function productcomment($id)
{
    //显示评论
    $content = Db::table('comment')->where('product_id',$id)->select();
    return $content;
}
function clientcommentname($id)
{
    $name =  Db::table("register_account")->where('id',$id)->value("name");
    return $name;
}

function productactivitylist()
{
    $list = Db::table("product_activity")->where(["status"=>1])->select();
    return $list;
}