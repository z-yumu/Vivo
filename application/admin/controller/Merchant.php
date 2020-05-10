<?php
namespace app\admin\controller;
use think\Controller;
use think\Db;
use think\Image;
use think\Request;
use think\facade\Env;
use app\common\model\MerchantInfo as MerchantInfoModel;
use app\common\model\MerchantAccount as MerchantAccountModel;
use app\common\model\MerchantCompany as MerchantCompanyModel;
use app\common\model\MerchantSettlement as MerchantSettlementModel;
class Merchant extends Base
{     
  //商家列表的输出
    public function index($name='')
    {
      $info= new MerchantInfoModel;
      $list= $info->getlist($name);
      $this->assign('list',$list);
      return $this->fetch();  
    }
    /**
     * 商家通过操作
     */
    public function pass($id)
    {
        $info= new MerchantInfoModel;   
        $res=$info->update(['status'=>1],['id'=>$id]);
        if($res){
        $this->success('通过成功','Merchant/index');
       }else{
        $this->error('通过失败');
       }
            
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
    //添加员工
    public function add()
    {
        return $this->fetch();
    }
}
