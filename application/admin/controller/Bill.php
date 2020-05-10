<?php
namespace app\admin\controller;
use think\Controller;
use phpoffice\Phpexcel;
use app\common\model\Pay as PayModel;
use app\common\model\Bill as BillModel;
class Bill extends Base
{     
  //订单列表的输出
    public function bill($name='')
    {
      $bill= new PayModel;
      $list= $bill->getbill($name);
      $this->assign('list',$list);
      return $this->fetch();  
    }
    

    public function excel($name=''){
        //1.从数据库中取出数据
        $orderform= new OrderformModel;
        $list= $orderform->getlist($name);
        //2.实例化PHPExcel类
         $objPHPExcel = new \PHPExcel;
        //3.激活当前的sheet表
        $objPHPExcel->setActiveSheetIndex(0);
        //4.设置表格头（即excel表格的第一行）
        $objPHPExcel->setActiveSheetIndex(0)
                ->setCellValue('A1', 'id')                      
                ->setCellValue('B1', '订单号')
                ->setCellValue('C1', '商家')
                ->setCellValue('D1', '产品名称')
                ->setCellValue('E1', '价格')
                ->setCellValue('F1', '数量')
                ->setCellValue('G1', '创建日期')
                ->setCellValue('H1', '结算状态');    
        //5.循环取出来的数组，将数据逐一添加到excel表格。
        for($i=0;$i<count($list);$i++){
            $objPHPExcel->getActiveSheet()->setCellValue('A'.($i+2),$list[$i]['id']);//id
            $objPHPExcel->getActiveSheet()->setCellValue('B'.($i+2),$list[$i]['out_trade_no']);//订单号
            $objPHPExcel->getActiveSheet()->setCellValue('C'.($i+2),merchantname($list[$i]['merchant_id']));//商家
            $objPHPExcel->getActiveSheet()->setCellValue('D'.($i+2),productname($list[$i]['product_id']));//产品名称
             $objPHPExcel->getActiveSheet()->setCellValue('E'.($i+2),$list[$i]['price']);//价格
              $objPHPExcel->getActiveSheet()->setCellValue('F'.($i+2),$list[$i]['buy_count']);//数量
               $objPHPExcel->getActiveSheet()->setCellValue('G'.($i+2),$list[$i]['create_time']);//时间
            $objPHPExcel->getActiveSheet()->setCellValue('H'.($i+2),paystatus($list[$i]['pay_status']));//付款状态
           
        }
        //6.设置保存的Excel表格名称
        $filename = '订单列表'.date('ymd',time()).'.xls';
        //7.设置当前激活的sheet表格名称；
        $objPHPExcel->getActiveSheet()->setTitle('订单');
        //8.设置浏览器窗口下载表格
        header("Content-Type: application/force-download");  
        header("Content-Type: application/octet-stream");  
        header("Content-Type: application/download");  
        header('Content-Disposition:inline;filename="'.$filename.'"');  
        //9.生成excel文件
        $objWriter = \PHPExcel_IOFactory::createWriter($objPHPExcel, 'Excel5');
        //10.下载文件在浏览器窗口
        $objWriter->save('php://output');
        exit;
    } 
    //商户查询输出
    public function merchantquery()
    {
      $orderform= new OrderformModel;
      $list =$orderform->hasWhere('merchant', function($query) {
          $query->where('name', 'like','%'.input('param.name').'%');
        })->paginate(1,false,[
                       'query'=>[
                        'name'=>input('param.name'),
                       ]
                    ]);
      $this->assign('list',$list);
      return $this->fetch();  
    }
    /**
     * 付款成功操作
     */
    public function paysuccess()
    {
        $bills= new billModel;
        $bill= new PayModel;
        $merchant_id=input('param.merchant_id');
        $price=input('param.price');
        $billnumber=time().mt_rand(100, 1000000);
        $paydata=[
         'merchant_id'=> $merchant_id,
         'price'=> $price,
         'bill_number'=> $billnumber,
         'bill_status'=> 1,
         'status'=> 1,
        ];
        $res=$bills->save($paydata);  
        $bill->where('merchant_id', $merchant_id)->whereTime('create_time', 'last month')->update(['bill_number' => $billnumber,'bill_status'=>1]); 
       if($res){
        $this->success('付款成功');
        }else{
        $this->error('付款失败');
        }  
        
            
    }
    /**
     * 付款成功操作
     */
    public function paysuccesslist()
    {
        $bills= new billModel;
        $list=$bills->getpaysuccesslist();
        $this->assign('list',$list);
        return $this->fetch();  
        
            
    }
     /**
     * 结算详单的输出
     */
    public function payordersuccess()
    {
        $bill= new PayModel;
        $billnumber=input('param.billnumber');
        $list=$bill->getpayordersuccesslist($billnumber);
        $this->assign('list',$list);
        return $this->fetch();  
       
    }
     /**
     * 商家禁止操作
     */
    public function forbid($id)
    {
        $info= new MerchantInfoModel;   
        $res=$info->update(['status'=>0],['id'=>$id]);
        if($res){
        $this->success('禁止成功','Merchant/index');
       }else{
        $this->error('禁止失败');
       }
            
    }
    //商家的详细信息显示
    
    public function info($id,$accountid)
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
}
