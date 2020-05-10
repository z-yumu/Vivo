<?php
namespace app\common\model;
use think\Model;
class ProductActivity extends Model
{
   protected $type = [
        'start_time'  =>  'timestamp',
        'end_time'  =>  'timestamp',
    ];

      //首页获取活动商品列表
   public function getlistindex()
    {
        $where=[
         'status'=>1,
        ];
        $order=[
          'order'=>'asc',
          'id'=>'desc',
         ];
         return $this->where($where)
                     ->order($order)
                     ->select();  
    }
      //获取活动商品列表
   public function getlist()
    {
        $order=[
          'order'=>'asc',
          'id'=>'desc',
         ];
         return $this->order($order)
                     ->paginate(15);  
    }
      //添加产品的信息
    public function savelist($data=[])
    {
        $result=$this->allowField(true)->save($data);
        if($result){
          return $this->getData('id');
        }else{
          return false;
        }
    }
    public function product()
    {
        return $this->belongsTo('Product');
    }
     //获取产品列表
   public function merchantproductlist($merchantinfoid)
    { 
        $order=[
          'order'=>'asc',
          'id'=>'desc',
         ];
         return $this->where('merchantinfoid',$merchantinfoid)
                     ->order($order)
                     ->paginate(3); 
    }
}
