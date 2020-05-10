<?php
namespace app\merchant\controller;
use think\Controller;
use think\Image;
use think\Request;
use think\facade\Env;
use app\common\model\MerchantInfo as MerchantInfoModel;
use app\common\model\MerchantCompany as MerchantCompanyModel;
use app\common\model\MerchantAccount as MerchantAccountModel;
use app\common\model\MerchantSettlement as MerchantSettlementModel;
class Shop extends Base
{
    //店铺开通申请
    public function openshop()
    {
      $merchantid=session('merchantid','','merchant');
	    $merchant= new MerchantInfoModel;
      $rs=$merchant->where('accountid',$merchantid)->find();
      if($rs){
        $this->error('已申请', 'Shop/checkshop');
      }
	    $merchantinfos=$merchant->infos($merchantid);
	    $this->assign('merchantinfos',$merchantinfos);
      $this->assign('merchantid',$merchantid);    
      return $this->fetch();  
    } 
    //店铺开通申请商铺图片异步保存
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
            $image->thumb(150, 150, Image::THUMB_CENTER);
            // 保存图片（以当前时间戳）
            $saveName = $request->time() . '.png';
            $image->save('uploads/merchant/merchant' . $saveName);
            //返回前端图片地址
            return json([
                'src'=>'/uploads/merchant/merchant' . $saveName,
                ]);
            
        }    
    } 
    //店铺开通申请执照图片异步保存申请
    public function picture2(Request $request)
    {
         // 获取表单上传文件
        $file = $request->file('image');
        if (true !== $this->validate(['image' => $file], ['image' => 'require|image'])) {
            $this->error('请选择图像文件');
        } else {
            // 读取图片
            $image = Image::open($file);
            //生成缩略图
            $image->thumb(280, 380, Image::THUMB_CENTER);
            // 保存图片（以当前时间戳）
            $saveName = $request->time() . '.png';
            $image->save('uploads/merchant/merchant' . $saveName);
            //返回前端图片地址
            return json([
                'src'=>'/uploads/merchant/merchant' . $saveName,
                ]);
            
        }    
    } 
    //店铺开通申请的信息保存
    public function save()
    {
        $data=input('param.');  
        $merchant= new MerchantInfoModel;
        $merchantcompany= new MerchantCompanyModel;
        $merchantsettlement= new MerchantSettlementModel;
        $rs=$merchant->where('accountid',$data['merchantid'])->find();
        if($rs){
            $this->error('信息已存在');
        }
        $datainfo=[
          'accountid'=>$data['merchantid'],
          'name'=>$data['shopname'],
          'operating'=>$data['operating'],
          'picture'=>$data['picture'],
          'province'=>$data['province'],
          'city'=>$data['city'],
          'country'=>$data['country'],
          'address'=>$data['address'],
          'contant'=>$data['contant'],
          'mobile'=>$data['mobile'],
          'qq'=>$data['qq'],
        ];
        $infoid=$merchant->savelist($datainfo);
        $datacompany=[
          'infoid'=>$infoid,
          'name'=>$data['companyname'],
          'license'=>$data['companylicense'],
          'image'=>$data['companypicture'],
          'address'=>$data['companyaddress'],
          'person'=>$data['companyperson'],        
        ];
        $companyid=$merchantcompany->savelist($datacompany);
        $datasettlement=[
          'infoid'=>$infoid,
          'name'=>$data['settlementname'],
          'bank'=>$data['settlementbank'],
          'province'=>$data['settlementprovince'],
          'city'=>$data['settlementcity'],
          'branch'=>$data['settlementbranch'],
          'number'=>$data['settlementnumber'],        
        ];
        $settlementid=$merchantsettlement->savelist($datasettlement);
         $this->success('提交成功', 'Shop/checkshop');
    }
    //店铺开通申请后的跳转界面
     public function checkshop()
    {      
        return $this->fetch();  
    }
    //商家登录手机账号的修改输出界面
    public function mobile()
    {      
        $merchantid=session('merchantid','','merchant');
        $merchantaccount= new MerchantAccountModel;
        $accountmobile=$merchantaccount->where('id',$merchantid)->find();
        $this->assign('accountmobile',$accountmobile);
        return $this->fetch(); 
    }
    //商家登录手机账号的修改的信息保存
     public function mobilesave($mobile,$id)
    { 
        $merchantaccount= new MerchantAccountModel;
        $re=$merchantaccount->where('mobile',$mobile)->find();
        if($re){
        $this->error('手机号号重复，请重新输入');
        }else{
           $res=$merchantaccount->update(['mobile'=>$mobile],['id'=>$id]);
           if($res){
            $this->success('新手机号修改成功','index/jieshao');
           }else{
            $this->error('新手机号修改失败');
           }
        }
    }
    //商家登录邮箱的修改输出界面
    public function email()
    {      
        $merchantid=session('merchantid','','merchant');
        $merchantaccount= new MerchantAccountModel;
        $accountemail=$merchantaccount->where('id',$merchantid)->find();
        $this->assign('accountemail',$accountemail);
        return $this->fetch(); 
    }
    //商家登录手机账号的修改的信息保存
     public function emailsave($email,$id)
    { 
        $merchantaccount= new MerchantAccountModel;
        $re=$merchantaccount->where('email',$email)->find();
        if($re){
        $this->error('邮箱重复，请重新输入');
        }else{
           $res=$merchantaccount->update(['email'=>$email],['id'=>$id]);
           if($res){
            $this->success('新邮箱修改成功','index/jieshao');
           }else{
            $this->error('新邮箱修改失败');
           }
        }
    }
    //商家登录邮箱的修改输出界面
    public function password()
    {      
        $merchantid=session('merchantid','','merchant');
        $merchantaccount= new MerchantAccountModel;
        $accountpassword=$merchantaccount->where('id',$merchantid)->find();
        $this->assign('accountpassword',$accountpassword);
        return $this->fetch(); 
    }
    /**
     * 修改管理员密码
     */
    public function passwordsave($id,$code,$password)
    {
       $merchantaccount= new MerchantAccountModel;
       $password=md5($password.$code);
       $rs=$merchantaccount->update(['password'=>$password],['id'=>$id]);
       if($rs){
        $this->success('密码修改成功','index/jieshao');
       }else{
        $this->error('密码修改失败');
       }
       
    }
     //商家基本信息的修改输出界面
    public function info()
    {      
        $merchantid=session('merchantid','','merchant');
        $merchant= new MerchantInfoModel;
        $infos=$merchant->where('accountid',$merchantid)->find();
        $this->assign('infos',$infos);
        return $this->fetch(); 
    }
    /**
     * 商家基本信息的修改保存
     */
    public function infosave($id)
    {
       
       $data=input('param.');
       // dump($data);exit;
       $merchant= new MerchantInfoModel;
       $datainfo=[
          'name'=>$data['name'],
          'operating'=>$data['operating'],
          'picture'=>$data['picture'],
          'province'=>$data['prov'],
          'city'=>$data['city'],
          'country'=>$data['country'],
          'address'=>$data['address'],
          'contant'=>$data['contant'],
          'mobile'=>$data['mobile'],
          'qq'=>$data['qq'],
        ];
       $rs=$merchant->update($datainfo,['id'=>$id]);
       if($rs){
        $this->success('基本信息修改成功','index/jieshao');
       }else{
        $this->error('基本信息修改失败');
       }
       
    }
    public function settlement()
    {      
        $merchantid=session('merchantid','','merchant');
        $merchant= new MerchantInfoModel;
        $infoid=$merchant->where('accountid',$merchantid)->value('id');
        $merchantsettlement= new MerchantSettlementModel;
        $settlements=$merchantsettlement->where('infoid',$infoid)->find();
        $this->assign('settlements',$settlements);
        return $this->fetch();
    }
     public function settlementsave($id)
    { 
       $data=input('param.');
       // dump($data);exit;
       $merchantsettlement= new MerchantSettlementModel;
       $datasettlement=[
          'name'=>$data['name'],
          'number'=>$data['number'],
          'bank'=>$data['bank'],
          'province'=>$data['province'],
          'city'=>$data['city'],
          'branch'=>$data['branch'],
        ];
       $rs=$merchantsettlement->update($datasettlement,['id'=>$id]);
       if($rs){
        $this->success('账户信息修改成功','index/jieshao');
       }else{
        $this->error('账户信息修改失败');
       }

    }

}
