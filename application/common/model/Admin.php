<?php
namespace app\common\model;
use think\Model;
class Admin extends Model
{
    protected function base()
    {
        
    }

  /**
     * 管理员登录
     * @param  string  $username 用户名
     * @param  string  $password 用户密码
     * @return integer 登录成功-用户ID，登录失败-返回0或-1
     */
    public function login($name, $password)
    {
        $where['name']=$name;
        $where['status']=1;
        $admin=$this->where($where)->find();
        if($admin){
          if(md5($password.$admin->code)!=$admin->password){
            // $this->error='密码错误';
            return 0;
          }else{
            return $admin->id;
          }
        }else{
          // $this->error='用户名不存在或者被禁用';
          return -1;
        }
    }
     /**
     * 获取用户信息
     * @param  integer  $adminid 管理员的主键
     * @return array|integer 成功返回数组，失败-返回 false
     */
    public function info($adminid)
    {
        $admin = $this->where('id', $adminid)->field('id,name,email,mobile,status,authid')->find();
        if ($admin && 1 == $admin->status) {
            // 返回用户数据
            return $admin->toArray();
        } else {
            return false;
        }
    }
  //获取管理员列表
   public function getlist()
    {
       $order=[
          'order'=>'asc',
          'id'=>'desc',
        ];
       return $this->order($order)
                   ->select();
    }
    
     /**
        * 添加管理员
        * @param  string  $data 管理员的全部信息
        * @return integer 添加成功-用户ID，添加失败-返回0或-1
        */
       public function register($data=[])
       {
           $name=$data['name'];
           $where['name']=$name;
           $admin=$this->where($where)->find();
           if($admin){
            return 0; //用户存在
           }else{
            $code=mt_rand(100,10000);
            $password=md5($data['password'].$code);
            $datas=[
             'name'=>$name,
             'password'=>$password,
             'code'=>$code,
             'mobile'=>$data['mobile'],
             'authid'=>$data['role'],
             'qq'=>$data['qq'],
             'email'=>$data['email'],
            ];
            $result=$this->save($datas);
              if($result){
                return $this->getData('id');
              }else{
                return -1;
              }
           }
       }
    //  public function getAuthidAttr($value)
    // {
         
    //      $where['authid']=$value;
    //      $role=$this->where($where)->find();
    //      $roles=$role->belongsTo('Role','authid');
    //      return $roles['name'];
    // }

    //测试
        public function getauthid($id){
           $authid = $this->where("id",$id)->value("authid");
           return($authid);
        }
    
}
