<?php
namespace app\admin\controller;
use app\common\model\Admin as AdminModel;
use app\common\model\Role;
use think\Controller;
use think\Session;
class Admin extends Base
{
    public function index()
    {
        // $this->assign('name',$name);
        return $this->fetch();  
    }
     
     //总后台——系统系统管理员
    
    public function list()
    { 
        $admin= new AdminModel;
        $list=$admin->getlist();
        $this->assign('list',$list);
        return $this->fetch();  
    }
    /**
     * 显示添加管理员表单
     */
    public function adminadd()
    {
       $role=new Role;
       $roles=$role->getrole();
       $this->assign('roles',$roles);
       return $this->fetch();  
    }
    /**
     * 保存添加管理员的信息
     */
    public function adminsave()
    {
       $data=input('param.');
       $admin= new AdminModel;
       $result=$admin->register($data);
       if($result==0){
        $this->error('用户已存在');
       }else{
        $this->success('添加成功');
       }
    }
    /**
     * 显示修改管理员密码页面
     */
    public function adminpassword($id)
    {
       $admin= new AdminModel;
       $admins=$admin->where('id',$id)->find();
       $this->assign('admins',$admins);
       return $this->fetch();  
    }
    /**
     * 修改管理员密码
     */
    public function adminpasswordsave($id,$code,$newpassword)
    {
       $admin= new AdminModel;
       $password=md5($newpassword.$code);
       $admins=$admin->update(['password'=>$password],['id'=>$id]);
       if($admins){
        $this->success('密码修改成功','Admin/list');
       }else{
        $this->error('密码修改失败');
       }
       
    }
    // /**
    //  * 删除管理员
    //  */
    // public function delete($id)
    // {
    //    $admin= new AdminModel;
    //    $admins=$admin->update(['status'=>-1],['id'=>$id]);
    //    if($admins){
    //     $this->success('删除成功','Admin/list');
    //    }else{
    //     $this->error('删除失败');
    //    }
       
    // }

     //管理员的信息显示
    
    public function info()
    { 
        $admin= new AdminModel;
        $info=$admin->where('id',session('aid'))->find();
        $this->assign('info',$info);
        return $this->fetch();  
    }
    //管理员的登录名显示
    
    public function adminname()
    { 
        $admin= new AdminModel;
        $info=$admin->where('id',session('aid'))->find();
        $this->assign('info',$info);
        return $this->fetch();  
    }

     //管理员的登录账号的修改
    
    public function adminnamesave($name,$id)
    { 
        $admin= new AdminModel;
        $re=$admin->where('name',$name)->find();
        if($re){
        $this->error('新账号重复，请重新输出');
        }else{
           $res=$admin->update(['name'=>$name],['id'=>$id]);
           if($res){
            $this->success('新账号修改成功','Admin/info');
           }else{
            $this->error('新账号修改失败');
           }
        }
    }
     //管理员的基本信息修改显示
    
    public function infomation()
    { 
        $admin= new AdminModel;
        $info=$admin->where('id',session('aid'))->find();
        $this->assign('info',$info);
        return $this->fetch();  
    }
     //管理员的基本信息的修改
    
    public function infomationsave($id)
    { 
        $data=input('param.');
        $admin= new AdminModel;
        $res=$admin->update($data,['id'=>$id]);
        if($res){
          $this->success('修改成功','Admin/info');
        }else{
          $this->error('修改失败');
        }
    }
    /**
     * 显示修改管理员密码页面
     */
    public function adminspassword()
    {
       $admin= new AdminModel;
       $admins=$admin->where('id',session('aid'))->find();
       $this->assign('admins',$admins);
       return $this->fetch();  
    }
}
