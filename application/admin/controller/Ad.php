<?php
namespace app\admin\controller;
use think\Controller;
use think\Db;
use think\Image;
use think\Request;
use think\facade\Env;
use app\common\model\Ad as AdModel;
use app\common\model\Product as ProductModel;
class Ad extends Base
{     
 
    public function index()
    {
        // $this->assign('name',$name);
        return $this->fetch();  
    }
    //广告的添加页面的显示
    public function add()
    {
        return $this->fetch();  
    }

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
            $image->thumb(1010, 455, Image::THUMB_CENTER);
            // 保存图片（以当前时间戳）
            $saveName = $request->time() . '.png';
            $image->save('static/uploads/head picture/' . $saveName);
            //返回前端图片地址
            return json([
                'src'=>'/static/uploads/head picture/' . $saveName,
                ]);
            
        }    
    } 
       //广告信息的添加保存
    public function save()
    {
        $ad= new AdModel;
       //接收数据
       $data=$this->request->param();
       // dump($data);exit;
        //验证数据
        $validate =validate('System');
        if (!$validate->check($data)) {
            $this->error($validate->getError());
        }  
       $datas=[
          "name" => $data['name'],
          "type" => $data['type'],
          "order" => $data['order'],
          "link" => $data['link'],
          "status" => $data['status'],
          "picture" => $data['picture'],
       ]; 
       $result=$ad->savelist($datas);
       if($result){
        $this->success('添加成功');
       }else{
        $this->error('添加失败');
       }
    }
    //主页导航的输出
     public function list()
   {
      $ad= new AdModel;
      $list= $ad->getlist();
      $this->assign('list',$list);
     return $this->fetch();  
   }
   //  //广告排序
   // public function listorder($id,$order)
   // {
   //   $ad= new AdModel;
   //   $res=$ad->update(['order'=>$order],['id'=>$id]);
   //   if($res){
   //    $this->success('排序成功');
   //   }else{
   //    $this->error('排序失败');
   //   }
   // }
   //广告的编辑表单
    public function edit($id)
    {
        $ad= new AdModel;
        $ads=$ad->where('id',$id)->find();
        $this->assign('ads',$ads);
        return $this->fetch();  
    }
    
      //主页导航编辑的保存
    public function editsave()
   {
     $data=input('param.');

     // dump($data);exit;
     //验证数据
      $validate =validate('System');
      if (!$validate->scene('edit')->check($data)) {
          $this->error($validate->getError());
      }
     $ad= new AdModel;    
     $res=$ad->update($data);
     if($res){
      $this->success('成功',url('Ad/list'));
     }else{
      $this->error('失败');
     }
   }
   /**
     * 删除广告
     */
     public function testdelete($id)
     {
         $product = new ProductModel;
         $res=$product->update(['status'=>-1],['id'=>$id]);
//         dump($res);exit();
         if($res){
             return json_encode(['code'=>1,'message'=>'删除成功！']);
         }else{
             return json_encode(['code'=>0,'message'=>'删除失败！']);
         }
     }
}
