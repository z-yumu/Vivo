<?php
namespace app\client\controller;
use PHPMailer\PHPMailer\PHPMailer;
use PHPMailer\PHPMailer\Exception;
use app\common\model\RegisterAccount as RegisterAccountModel;
use app\common\model\RegisterInfo as RegisterInfoModel;
use think\Controller;
use think\Db;
use AlibabaCloud\Client\AlibabaCloud;
use AlibabaCloud\Client\Exception\ClientException;
use AlibabaCloud\Client\Exception\ServerException;
class Register extends Controller
{
	//客户注册第一步输入邮箱显示界面
	public function email()
	{   
        $account= new RegisterAccountModel;
        $accounts=$account->where('status',0)
                          ->whereTime('create_time','<','-24 hours')
                          ->delete();
       return $this->fetch();
	} 
	//客户的邮箱发送一个验证码
	public function sendemail()
	{  
		//验证数据是否有此邮箱
		$email=input('param.email');
		$verifycode=randkeys(8);
        $account= new RegisterAccountModel;
        $accounts=$account->where('email',$email)->find();
        if($accounts){
	        $this->error('邮箱已存在');
	       }else{
	       // 实例化
		   $mail = new PHPMailer(true);
				try {
				    //第一部分：服务器的设置
				    
				    $mail->SMTPDebug = 2; // Enable verbose debug output；启用详细的调试输出
				    $mail->isSMTP();// Set mailer to use SMTP ；设置邮箱的SMTP
				    $mail->Host       = 'smtp.qq.com';  // Specify main and backup SMTP servers；指定主要和备用的服务器
				    $mail->SMTPAuth   = true;// Enable SMTP authentication；启用SMTP身份验证
				    $mail->Username   = '458675926@qq.com'; // SMTP username；SMTP用户名
				    $mail->Password   = 'cmzvgcadwxwwcbbh';// SMTP password；SMTP密码
				    $mail->SMTPSecure = 'ssl';// Enable TLS encryption, `ssl` also accepted；启用TLS加密，`ssl`也被接受
				    $mail->Port       = 465;// TCP port to connect to；要连接的TCP端口

				    //第二部分：Recipients；收件人
				     
				    $mail->setFrom('458675926@qq.com', 'vivo商城');//发送邮件邮箱
				    $mail->addAddress($email, '验证码接收');     
				    // Add a recipient；添加收件人
				    // $mail->addAddress('ellen@example.com');              
				    //  // Name is optional；名称是可以选的
				    // $mail->addReplyTo('info@example.com', 'Information');
				    // $mail->addCC('cc@example.com');
				    // $mail->addBCC('bcc@example.com');

				    // 第三部分：Attachments；附件
				    
				    // $mail->addAttachment('/var/tmp/file.tar.gz');         
				    // // Add attachments；添加附件
				    // $mail->addAttachment('/tmp/image.jpg', 'new.jpg');    
				    // Optional name可选名称

				    // 第三部分：Content；内容
				     
				    $mail->isHTML(true);  // Set email format to HTML
				    $mail->Subject = 'Vivo商城验证码';
				    $mail->Body    = '你好，你在Vivo商城注册验证码为：'.$verifycode;
				    // $mail->AltBody = 'This is the body in plain text for non-HTML mail clients';
				    $mail->send();

				    $data=[
		              'email'=>$email,
		              'verifycode'=>strtolower($verifycode),
		             ];
		             $res=$account->save($data);
		             $registerid=$account->id;
		             session('registerid', $registerid);
			         $this->redirect('emailcode',['email'=>$email]);
				} catch (Exception $e) {
				    echo "邮件发送失败: {$mail->ErrorInfo}";
				}  
	         
             
	    }
		
	}  
	//客户——显示输入邮箱验证码
	public function emailcode()
	{  
	    $email=input('param.email');
	    $this->assign('email',$email);
	    return $this->fetch();  
	}   
	//检验邮箱的验证码是否正确
	public function emailcodecheck(){
	    $emailcode=input('param.emailcode');
	    $email=input('param.email');
	    $emailcodes=strtolower($emailcode);
	    $account= new RegisterAccountModel;
	    $res=$account->where('email',$email)
	                 ->where('verifycode',$emailcodes)
	                 ->update(['status' => 1]);
		if($res){
		     $this->redirect('account',['email'=>$email]);
		     }else{
		      $this->error('失败');
		} 
	}   
    // 显示账号的登录界面
	 public function account()
	{   
       
       $account= new RegisterAccountModel; 
       $email=input('param.email');
	   $this->assign('email',$email);
       return $this->fetch();
	} 
	//验证手机是否重复
	 public function checkmobile($mobile)
	{   
       $account= new RegisterAccountModel; 
       $res=$account->where('mobile',$mobile)->find();
        if($res){
	       return 1;
	       }else{
           return 0;
	       }
	} 
	//手机验证码发送
	 public function mobilesend($mobile)
	{   
       $account= new RegisterAccountModel;
       $verifycode=randkeys(4);
       session('mcode',$verifycode);
       $arr=array('code' =>$verifycode);
       $codes=json_encode($arr);
       // $res=$account->where('mobile',$mobile)->find();
		        // Download：https://github.com/aliyun/openapi-sdk-php
		// Usage：https://github.com/aliyun/openapi-sdk-php/blob/master/README.md
        $alibaba=new AlibabaCloud;
        $re=$alibaba->accessKeyClient('LTAI4FhEj4GmSaeuaaJCcTeP', 'KarI4qLp3hjwNKT828ba97UQBAxdbn')
		                        ->regionId('cn-qinzhou')
		                        ->asDefaultClient();

		try {
		    $result = AlibabaCloud::rpc()
		                          ->product('Dysmsapi')
		                          // ->scheme('https') // https | http
		                          ->version('2017-05-25')
		                          ->action('SendSms')
		                          ->method('POST')
		                          ->host('dysmsapi.aliyuncs.com')
                      ->options([
                                'query' => [
                              'RegionId' => "cn-qinzhou",
                              'PhoneNumbers' => $mobile,
                              'SignName' => "于木的商城",
                              'TemplateCode' => "SMS_186617361",
                              'TemplateParam' =>$codes,
                                ],
                                ])
		                          ->request();
		   if($result['Code']=='OK'){
		   	return 1;
		   }else{
		   	return 0;
		   }
		    print_r($result->toArray());
		} catch (ClientException $e) {
		    echo $e->getErrorMessage() . PHP_EOL;
		} catch (ServerException $e) {
		    echo $e->getErrorMessage() . PHP_EOL;
		}

	} 
  //手机验证码确认
	 public function mobilecode($mobilecode)
	{   
		
        $mcode=session('mcode');
        if(strtolower($mobilecode)!=strtolower($mcode)){
	       return 1;
	       }else{
           return 0;
	       }
	} 
    //验证会员名是否重复
	 public function checkaccountname($accountname)
	{   
       $account= new RegisterAccountModel; 
       $res=$account->where('name',$accountname)->find();
        if($res){
	       return 1;
	       }else{
           return 0;
	       }
	} 
	// 保存账号信息
	public function accountsave()
	{   
       
       $account= new RegisterAccountModel;
       $registerinfo= new RegisterInfoModel;
       $data=input('param.');
       $email=$data['email'];
       $code=mt_rand(100,10000);
       $password=md5($data['password'].$code);
       $dataaccount=[
          'password'=>$password,
          'code'=>$code,
          'mobile'=>$data['mobile'],
          'name'=>$data['accountname'],
       ];
        $res=$account->where('email',$email)
	                 ->update($dataaccount);
	    $registerid=session('registerid');
	    $resinfo=$registerinfo->save(['registerid'=>$registerid]);
        $this->redirect('successaccount');
	} 
	// 注册成功的显示
	public function successaccount()
	{   
       
        return $this->fetch();
	} 
}