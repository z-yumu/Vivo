<?php
namespace app\merchant\controller;
use think\Controller;
use phpoffice\Phpexcel;
use app\common\model\Orderform as OrderformModel;
class Orderform extends Base
{     
  //订单列表的输出
    public function orderlist($name='')
    {
      $orderform= new OrderformModel;
      $merchantinfoid=session('merchantinfoid','','merchant');
      $list= $orderform->merchantorderformlist($merchantinfoid);
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
     * 关闭订单操作
     */
    public function close($id)
    {
        $orderform= new OrderformModel;   
        $res=$orderform->update(['pay_status'=>-1],['id'=>$id]);
        if($res){
        $this->success('订单已关闭','Orderform/orderlist');
       }else{
        $this->error('关闭订单失败');
       }
            
    }
    
}
