<?php
namespace app\merchant\controller;
use think\Controller;
use phpoffice\Phpexcel;
use app\common\model\Orderform as OrderformModel;
use app\common\model\ShippingAddress as ShippingAddressModel;
use app\common\model\Couriercompany as CouriercompanyModel;
use app\common\model\OrderformLogistics as OrderformLogisticsModel;

class Logistics extends Base
{     
     public function index()
    {
    
      return $this->fetch();  
    }
    public function jieguo($expCode,$expNo)
    {
      $this->assign('expCode',$expCode);
      $this->assign('expNo',$expNo);
      return $this->fetch();  
    }
  //发货表单的输出
    public function add($id,$shippingaddressid)
    {
      //客户收货地址实例化
      $shippingaddress= new ShippingAddressModel;
      //订单数据实例化
      $orderform= new OrderformModel;
      //快递公司数据实例化
      $couriercompany= new CouriercompanyModel;
      //get获取订单的信息
      $orderforms=$orderform->get($id);
      //查询客户收货地址
      $address=$shippingaddress->where('id',$shippingaddressid)->find();
      //查询快递公司
      $couriercompanys=$couriercompany->getlist();
      $this->assign('address',$address);
      $this->assign('orderforms',$orderforms);
      $this->assign('couriercompanys',$couriercompanys);
      return $this->fetch();  
    }
    //发货信息的保存
    public function addsave()
    {
       //物流数据实例化
      $orderformlogistics= new OrderformLogisticsModel;
      //订单数据实例化
      $orderform= new OrderformModel;
        //获取全部数据
      $data=input('param.');
      // dump($data);exit;
      //检查物流发货表中是否此订单已发货
      $res=$orderformlogistics->where('orderform_id',$data['orderform_id'])->find();
      if($res){
        $this->error('此订单已发货','Orderform/orderlist');
      }
      //物流信息数据封装
      $datas=[
      "orderform_id" => $data['orderform_id'],
      "product_id" => $data['product_id'],
      "out_trade_no" => $data['out_trade_no'],
      "merchant_id" => $data['merchant_id'],
      "salesattribute" => $data['salesattribute'],
      "area" => $data['area'],
      "address" => $data['address'],
      "addressname" => $data['addressname'],
      "addressmobilephone" => $data['addressmobilephone'],
      "expcode" => $data['expcode'],
      "expno" =>$data['expno'],
      "status" => 1,
      ]; 
      $orderformlogisticsid=$orderformlogistics->savelist($datas);
      if($orderformlogisticsid){
         //如果发货成功改变订单表里面的状态
          $res=$orderform->update(['logistics_status'=>1],['id'=>$data['orderform_id']]);
           if($res){
             $this->success('添加成功','logistics/logisticlist');
           }else{
            $this->error('发货更新失败');
           }
      }else{
        $this->error('添加失败');
       }
    } 
     public function logisticlist()
    {
      //物流数据实例化
     $orderformlogistics= new OrderformLogisticsModel;
     $merchantinfoid=session('merchantinfoid','','merchant');
     $logistics=$orderformlogistics->getlist($merchantinfoid);
     $this->assign('logistics',$logistics);
      return $this->fetch();  
    }


    public function searchlogistic($expCode,$expNo)
    {
      $this->assign('expCode',$expCode);
      $this->assign('expNo',$expNo);
      return $this->fetch();  
    }
    
   
    
}
