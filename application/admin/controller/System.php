<?php
namespace app\admin\controller;
use think\Controller;
use think\Db;
use app\common\model\Systemlist;
use app\common\model\Merchantlist;
use app\common\model\Admin as AdminModel;
class System extends Base
{     
 
    public function index()
    {
        // $this->assign('name',$name);
        return $this->fetch();  
    }
    //功能表单添加表输出
    public function listadd()
    {
        return $this->fetch();  
    }
    //员工功能表单添加表输出
    public function merchantlistadd()
    {
        return $this->fetch();  
    }
    //员工功能数据保存
    public function merchantlistsave()
    {
       //接收数据
       $data=$this->request->param();
        // dump($data);exit;
        //验证数据
        $validate =validate('System');
        if (!$validate->check($data)) {
            $this->error($validate->getError());
        }    
       $result=model('Merchantlist')->savelist($data);
       if($result){
        $this->success('添加成功');
       }else{
        $this->error('添加失败');
       }
    }
     /**
    * 员工功能列表的输出
    *
    * @return void
    * @author 
    **/
   public function merchantshowlist()
   {
      $show=model('Merchantlist')->getshow();
      $this->assign('show',$show);
     return $this->fetch();  
   }
   //员工功能大类编辑输出
   public function merchantlisteditb()
    {
        $id=input('param.id');
        $listedit=model('Merchantlist')->get($id);
        $this->assign('listedit',$listedit);
        return $this->fetch();  
    }
    //员工功能小类编辑输出
     public function merchantlisteditm()
    {
        $id=input('param.id');
        $listedit=model('Merchantlist')->get($id);
        $this->assign('listedit',$listedit);
        return $this->fetch();  
    }
     //员工管理各个功能项的编辑
    public function merchantlisteditsave()
   {
     $data=input('param.');

     // dump($data);exit;
     //验证数据
      $validate =validate('System');
      if (!$validate->scene('edit')->check($data)) {
          $this->error($validate->getError());
      }    
     $res=model('Merchantlist')->save($data,['id'=>$data['id']]);
     if($res){
      $this->success('成功',url('System/merchantshowlist'));
     }else{
      $this->error('失败');
     }
   }
    public function listeditb()
    {
        $id=input('param.id');
        $listedit=model('Systemlist')->get($id);
        $this->assign('listedit',$listedit);
        return $this->fetch();  
    }
    public function listeditm()
    {
        $id=input('param.id');
        $listedit=model('Systemlist')->get($id);
        $this->assign('listedit',$listedit);
        return $this->fetch();  
    }
    //各个功能项的编辑
    public function listeditsave()
   {
     $data=input('param.');

     // dump($data);exit;
     //验证数据
      $validate =validate('System');
      if (!$validate->scene('edit')->check($data)) {
          $this->error($validate->getError());
      }    
     $res=model('Systemlist')->save($data,['id'=>$data['id']]);
     if($res){
      $this->success('成功',url('System/showlist'));
     }else{
      $this->error('失败');
     }
   }
           
    public function categorysave()
    {
       //接收数据
       $data=$this->request->param();
        // dump($data);exit;
        //验证数据
        $validate =validate('System');
        if (!$validate->check($data)) {
            $this->error($validate->getError());
        }    
       $result=model('Systemlist')->savelist($data);
       if($result){
        $this->success('添加成功');
       }else{
        $this->error('添加失败');
       }
    }
   /**
    * undocumented function
    *
    * @return void
    * @author 
    **/
   public function showlist()
   {
      $show=model('Systemlist')->getshow();
      $this->assign('show',$show);
     return $this->fetch();  
   }
   
  

    //总后台——系统设置：基本信息
    
    public function systeminfo()
    {
        $id=input('param.id');
        $info=model('Systeminfo')->get($id);
        $this->assign('info',$info);
        return $this->fetch();  
    }

    //总后台——系统设置：基本信息更新
    public function systeminfosave()
   {
     $data=input('param.');
      $validate =validate('System');
      if (!$validate->scene('infoedit')->check($data)) {
          $this->error($validate->getError());
      }    
     $res=model('Systeminfo')->save($data,['id'=>$data['id']]);
     if($res){
      $this->success('成功');
     }else{
      $this->error('失败');
     }
   }
    //总后台——系统设置：网站seo
    
    public function systemseo()
    {
        
        $seo=model('Systemseo')->get(1);
        $this->assign('seo',$seo);
        return $this->fetch();  
    }

     //总后台——系统设置：seo信息更新
    public function systemseosave()
   {
     $data=input('param.');
      $validate =validate('System');
      if (!$validate->scene('infoedit')->check($data)) {
          $this->error($validate->getError());
      }    
     $res=model('Systemseo')->save($data,['id'=>$data['id']]);
     if($res){
      $this->success('成功');
     }else{
      $this->error('失败');
     }
   }
    //总后台——系统设置：网站开关
    
    public function systemsite()
    { 
        $site=model('Systemsite')->get(1);
        $this->assign('site',$site);
        return $this->fetch();  
    }
    //总后台——系统设置：网站开关更新
    public function systemsitesave()
    {
        $data=input('param.');
//         dump($data);
//        exit;
        //y已经是一个数组
        $res=model('Systemsite')->save($data,['id'=>1]);
       if($res){
        $this->success('成功');
       }else{
        $this->error('失败');
       }
        
    }
     //总后台——系统设置：角色
    
    public function roleadd()
    { 
        return $this->fetch();  
    }
    //总后台——系统设置：角色添加保存
    public function rolesave()
    {
        $data=input('param.');
        $validate =validate('System');
        if (!$validate->scene('infoedit')->check($data)) {
          $this->error($validate->getError());
        }  
        $res=model('role')->save($data);
       if($res){
        $this->success('成功');
       }else{
        $this->error('失败');
       }
        
    }
     //总后台——系统设置：角色
    
    public function rolelist()
    { 
        $role=model('role')->getrole();
        $this->assign('role',$role);
        return $this->fetch();  
    }
     //总后台——系统设置：权限管理清单
    public function authlist()
    { 
      //接收角色的id
      $id=input('param.id');
      $admin = new AdminModel();
        //$adminauthid = $admin->getauthid($id);
        // 这里是Admin的authid
//        dump( $adminauthid);
      $role=model('role')->get($id);
//      dump($role);
      $auth=$role['auth'];
      if(!empty($auth)){
         //把字符串打散为数组
        $auths=explode(',',$auth);
//          dump($auths);exit;
        }else{
          $auths='';
        }
      $show=model('Systemlist')->getshow();
      $this->assign('show',$show); //大类
      $this->assign('id',$id);
      $this->assign('auths',$auths); //数组
      return $this->fetch(); 

    }
    public function authsave()
    {
//        $me = $this->request->param(); request助手函数获取
        $data=input('param.');
//       dump($me);exit;
        $id=input('param.id');
        $auth=input('param.auth');
        if(!empty($auth)){
         //把数组转化为字符串
        $auths=implode(',',$auth);
        }else{
          $auths='';
        }
        $res=model('role')->isUpdate(true)->save(['id'=>$id,'auth'=>$auths]);
        if($res){
        $this->success('成功');
       }else{
        $this->error('失败');
       }
    }
      /**
    * 客户功能列表的输出
    *
    * @return void
    * @author 
    **/
   public function clientshowlist()
   {
      $show=model('clientlist')->getshow();
      $this->assign('show',$show);
     return $this->fetch();  
   }

    //客户功能表单添加表输出
    public function clientlistadd()
    {
        return $this->fetch();  
    }
    public function clientlistsave()
    {
    $data = input('param.');
    $validate = validate("System");
    //返回一个false
    if(!$validate->check($data)){
        $this->error($validate->getError());
    }
    $result = model('Clientlist')->savelist($data);
//    dump($result);
    if($result){
        $this->success('添加成功');
    }else{
        $this->error('添加失败');
    }
    }

    //员工功能大类编辑输出
    public function clientlisteditb()
    {
        $id=input('param.id');
        $listedit=model('Clientlist')->get($id);
        $this->assign('listedit',$listedit);
        return $this->fetch();
    }
    //员工功能小类编辑输出
    public function clientlisteditm()
    {
        $id=input('param.id');
        $listedit=model('Clientlist')->get($id);
        $this->assign('listedit',$listedit);
        return $this->fetch();
    }
    //员工管理各个功能项的编辑
    public function clientlisteditsave()
    {
        $data=input('param.');

        // dump($data);exit;
        //验证数据
        $validate =validate('System');
        if (!$validate->scene('edit')->check($data)) {
            $this->error($validate->getError());
        }
        $res=model('Clientlist')->save($data,['id'=>$data['id']]);
        if($res){
            $this->success('成功',url('System/clientshowlist'));
        }else{
            $this->error('失败');
        }
    }

    //管理员
    public function roledelete($id)
    {
       $res = model('role')->where('id',$id)->delete();
       if($res){
           $this->success("删除成功");
       }else{
           $this->error("删除失败");
       }
    }
}
