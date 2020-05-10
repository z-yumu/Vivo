<?php
namespace app\admin\controller;
use app\common\model\Admin as AdminModel;
use think\Controller;
use think\Session;
class Login extends Controller
{
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
    public function doLogin($name, $password,$code)
    {
       // if(!captcha_check($code)){
       //      $this->error('验证码错误');
       //  };
       $keep=input('param.keep');
       $admin= new AdminModel;
       $adminid=$admin->login($name,$password);
       if($adminid==0){
        $this->error('密码错误');
       }elseif($adminid==-1){
         $this->error('用户不存在或被禁用');
       }else{
        session('aid', $adminid);
        if(isset($keep)){
          cookie('name',$name,3600);
          cookie('password',$password,3600);
        }else{
          cookie('name',null);
          cookie('password',null);
        }
        // $aid= session('aid');
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
            session(null);
            $this->success('成功退出登录','login/index');

        }
}

