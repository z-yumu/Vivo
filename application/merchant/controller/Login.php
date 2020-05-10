<?php
namespace app\merchant\controller;
use app\common\model\MerchantAccount as MerchantAccountModel;
use think\Controller;
use think\Session;
class Login extends Controller
{
    //输出登录页面
    public function index()
    {
        return $this->fetch();  
    }
    /**
     * 管理员登录
     * @param  string  $username 用户名
     * @param  string  $password 用户密码
     * @return integer 
     */
    public function doLogin($account, $password,$code)
    {
       // if(!captcha_check($code)){
       //      $this->error('验证码错误');
       //  };
       $keep=input('param.keep');
       $merchantaccount= new MerchantAccountModel;
       $merchantaccountid=$merchantaccount->login($account,$password);
       if($merchantaccountid==0){
        $this->error('密码错误');
       }elseif($merchantaccountid==-1){
         $this->error('用户不存在或被禁用');
       }else{
        session('merchantid', $merchantaccountid,'merchant');
        if(isset($keep)){
          cookie('account',$account,3600);
          cookie('password',$password,3600);
        }else{
          cookie('account',null);
          cookie('password',null);
        }
        // $aid= session('merchantid','','merchant');
        // dump($aid);exit;
        $this->redirect('index/index');
       }
    }
      /**
         * 退出登录
         * @return integer 登录成功-用户ID，登录失败-返回0或-1
         */
        public function loginout()
        {
            session(null, 'merchant');
            $this->success('成功退出登录','login/index');

        }
}

