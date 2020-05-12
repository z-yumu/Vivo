<?php
namespace app\client\controller;
use app\common\model\RegisterInfo as RegisterInfoModel;
use app\common\model\RegisterAccount as RegisterAccountModel;
use app\common\model\Question as QuestionModel;
use app\common\model\Answer as AnswerModel;
use app\common\model\ShippingAddress as ShippingAddressModel;
use app\common\model\Orderform as OrderformModel;
use app\common\model\OrderformLogistics as OrderformLogisticsModel;
use app\common\model\Refund as RefundModel;
use app\common\model\Comment as CommentModel;
use app\common\model\Collection as CollectionModel;
use app\common\model\Product as ProductModel;
use think\Request;
use think\Controller;
use think\Image;

// use think\Db;
class Personal extends Base
{
     //头像
    public function picture(Request $request)
    {
        // 获取表单上传文件
        $file = $request->file('image');
        if (true !== $this->validate(['image' => $file], ['image' => 'require|image'])) {
            $this->error('请选择图像文件');
        } else {
            // 读取图片
            $image = Image::open($file);
            //生成缩略图
            $image->thumb(1010, 455, Image::THUMB_CENTER);
            // 保存图片（以当前时间戳）
            $saveName = $request->time() . '.png';
            $image->save('static/uploads/ad/banner/' . $saveName);
            //返回前端图片地址
            return json([
                'src'=>'/static/uploads/ad/banner/' . $saveName,
            ]);

        }
    }
    //输出个人信息
    public function information()
    {   
        $register= new RegisterInfoModel;
        $registerid=session('clientid','','client');
        $info= $register->where('registerid',$registerid)->find();
        $this->assign('info',$info);
        return $this->fetch();    

    }
    //更新个人信息
    public function editsave()
    {   
      $data=input('param.');
      $register= new RegisterInfoModel;
      $datainfo=[
          'headpicture'=>$data['picture'],
          'nicename'=>$data['nicename'],
          'name'=>$data['name'],
          'mobile'=>$data['mobile'],
          'qq'=>$data['qq'],
          'email'=>$data['email'],
        ];
       $rs=$register->update($datainfo,['id'=>$data['id']]);
       if($rs){
        $this->success('信息保存成功','index/index');
       }else{
        $this->error('信息保存成功失败');
       }   

    }
    //安全设置
    public function safety()
    {   
        $registerid=session('clientid');
        $this->assign('registerid',$registerid);
        return $this->fetch();    
    }
     //客户密码修改页面输出
    public function password()
    {   
       $registerid=session('clientid','','client');
        $this->assign('registerid',$registerid);
        return $this->fetch();       
    }
    //客户手机号修改页面输出
    public function bindphone()
    {   
        $registerid=session('clientid','','client');
        $this->assign('registerid',$registerid);
        return $this->fetch();       
    }
    //客户邮箱修改页面输出
    public function email()
    {   
        $registerid=session('clientid');
        $this->assign('registerid',$registerid);
        return $this->fetch();       
    }
    //客户安全问题修改页面输出
    public function question()
    {   
        $question= new QuestionModel;
        $list=$question->getlist();
        $registerid=session('clientid','','client');
        $this->assign('list',$list);
        $this->assign('registerid',$registerid);
        return $this->fetch();       
    }
    //客户安全问题修改页面输出
    public function answersave()
    {   
        $answer= new AnswerModel;
        $data=input('param.');
        $answerdata=[
        'question1'=>$data['question1'],
        'question2'=>$data['question2'],
        'answer1'=>$data['answer1'],
        'answer2'=>$data['answer2'],
        'registerid'=>$data['registerid'],
        ];
        $res=$answer->where('registerid',$data['registerid'])->find();
        if($res){
            $rs=$answer->update($answerdata,['registerid'=>$data['registerid']]);
            if($rs){
              $this->success('信息保存成功');
             }else{
              $this->error('信息保存成功失败');
             }   
         }else{
           $rs=$answer->savelist($answerdata);
           if($rs){
            $this->success('信息保存成功');
            }else{
            $this->error('信息保存成功失败');
             }   
         }  
    }
    //地址页面输出
    public function address()
    {   
        $registerid=session('clientid','','client');
        $address= new ShippingAddressModel;
        $list=$address->where('client_id',$registerid)->select();
        $this->assign('list',$list);
        return $this->fetch();            
    }
    //异步修改默认地址
    public function addressindex($id)
    {  
      $registerid=session('clientid','','client');
      $address= new ShippingAddressModel;
      $res=$address->where('client_id',$registerid)->where('id','<>',$id)->where('default',1)->setField('default',0);
      $re=$address->where('id',$id)->setField('default',1);
      return $re;
    }
     //保存新增地址
    public function addresssave()
    {  
      $registerid=session('clientid','','client');
      $address= new ShippingAddressModel;
      $data=input('param.');
      // dump($data);
      $dataaddress=[
          'name'=>$data['name'],
          'mobilephone'=>$data['mobilephone'],
          'zipcode'=>$data['zipcode'],
          'province'=>$data['province'],
          'city'=>$data['city'],
          'country'=>$data['country'],
          'address'=>$data['address'],
          'client_id'=>$registerid,
          'default'=>0,
          'status'=>1,
        ];
        $addressid=$address->savelist($dataaddress);
        if($addressid){
        $this->success('添加成功');
       }else{
        $this->error('添加失败');
       }
    }
    //地址修改页面输出
    public function addressedit($id)
    {   
        $address= new ShippingAddressModel;
        $list=$address->where('id',$id)->find();
        $this->assign('list',$list);
        return $this->fetch();            
    }
     //更新地址的保存
    public function addresseditsave($id)
    {  
      $address= new ShippingAddressModel;
      $data=input('param.');
       // dump($data);exit;
      $dataaddress=[
          'name'=>$data['name'],
          'mobilephone'=>$data['mobilephone'],
          'zipcode'=>$data['zipcode'],
          'province'=>$data['province'],
          'city'=>$data['city'],
          'country'=>$data['country'],
          'address'=>$data['address'],
        ];
        $res=$address->update($dataaddress,['id'=>$id]); 
        if($res){
        $this->success('更新成功','Personal/address');
       }else{
        $this->error('更新失败');
       }
    }

    //订单管理列表
    public function order()
    {
      $registerid=session('clientid','','client');
      $orderform= new OrderformModel;
      $order=$orderform->getorder($registerid);
//      dump($order);exit();
      $this->assign('order',$order);
      return $this->fetch(); 
    }
   
    //订单详情
     public function orderinfo($out_trade_no, $merchant_id)
     {
        $registerid=session('clientid','','client');
        $orderform= new OrderformModel;
        $address= new ShippingAddressModel;
        //查询详单的产品
        $orderinfos=$orderform->getorderinfo($registerid,$out_trade_no, $merchant_id);
       //查询订单的详细信息
       $order=$orderform->where('out_trade_no',$out_trade_no)->find();
       //获取收货地址的id
       $addressid=$order->shippingaddress_id;
      //付款状态
       $pay_status=$order->pay_status;
      //发货信息
       $logistics_status=$order->logistics_status;
       //查询收货地址的详细地址
       $list=$address->where('id',$addressid)->find();
       $orderformlogistics= new OrderformLogisticsModel;
    
      $this->assign('list',$list);
       $this->assign('pay_status',$pay_status);
       $this->assign('logistics_status',$logistics_status);

       // dump($addressid);exit;
        $this->assign('orderinfos',$orderinfos);
      return $this->fetch(); 
     }  
    //确认收货
       public function receipt($merchant_id,$out_trade_no)
       {
        $orderform= new OrderformModel;
        $res=$orderform->where('merchant_id',$merchant_id)->where('out_trade_no',$out_trade_no)->setField('logistics_status',2);
        if($res<>0){
          $this->success('更新成功');
         }else{
          $this->error('更新失败');
         }
       } 
  /**
       * 订单退款的输出
       * @param  string  $id 订单id
       */
      public function refund($id)
      {
         $orderform= new OrderformModel;
         $order=$orderform->where('id',$id)->find();
         $this->assign('order',$order);
         return $this->fetch();
      }      
       /**
       * 订单退款的输出
       * @param  string  $id 订单id
       */
      public function refundsave()
      {
         $registerid=session('clientid','','client');
         $refund= new RefundModel;
         $orderform= new OrderformModel;
         $data=input('param.');
          $refunddata=[
          'orderform_id'=>$data['orderform_id'],
          'merchant_id'=>$data['merchant_id'],
          'product_id'=>$data['product_id'],
          'orderformattributes'=>$data['orderformattributes'],
          'client_id'=>$registerid,
          'refundtype'=>$data['refundtype'],
          'refundreason'=>$data['refundreason'],
          'refundmoney'=>$data['refundmoney'],
          'refundinfo'=>$data['refundinfo'],
          'status'=>1,
        ];
        $refundid=$refund->savelist($refunddata);
        $res=$orderform->where('id',$data['orderform_id'])->setField('pay_status',-2);
         if($refundid){
         $this->success('提交成功');
         }else{
         $this->error('提交失败');
         }
      }     
       /**
       * 退款售后的输出
       * @param  
       */
      public function change()
      {
         $registerid=session('clientid','','client');
         $refund= new RefundModel;
         $refunds=$refund->getlist($registerid);
         $this->assign('refunds',$refunds);
         return $this->fetch();
      }  
      /**
       * 商品的评价
       * @param  
       */
      public function comment()
      {
         $registerid=session('clientid','','client');
         $comment= new CommentModel;
         $comments=$comment->getlist($registerid);
         $this->assign('comments',$comments);
         return $this->fetch();
      }      
      /**
       * 收藏产品的输出
       * @param  
       */
      public function collection()
      {
         $registerid=session('clientid','','client');
         $collection= new CollectionModel;
         $product= new ProductModel;
         $collections=$collection->where('client_id',$registerid)->column('product_id');
         // dump($collections);exit;
        $products= $product->select();
        $this->assign('collections',$collections);
        $this->assign('products',$products);
         return $this->fetch();
      }
    /**
     * 评论区
     * @param
     */
    public function commentcontent($pid,$orderid,$clientid)
    {
//        dump($pid);商品id
//        dump($orderid);订单id
//        dump($clientid);客户id
        $this->assign('productid',$pid);
        $this->assign('orderid',$orderid);
        $this->assign('clientid',$clientid);
        return $this->fetch();
    }
    //商品评价的保存
    public function commentsave()
    {
        $data = input('param.');
//        dump($data["content"]);exit();
        //实例化评论
        $comment = new CommentModel;
        //实例化订单
        $order = new OrderformModel;
       $commentdata = [
          'product_id'=>$data['productid'],
            'orderform_id'=>$data['orderid'],
            'client_id'=>$data['clientid'],
           'content'=>$data["content"],
                'status'=>1
        ];
        $res = $comment->save($commentdata);
        if ($res){
            $order->where('id',$data['orderid'])->update(['comment_status'=>1]);
            $this->success("评论成功",'comment');
        }else{
            $this->error("评论失败");
        }

    }
       
}
