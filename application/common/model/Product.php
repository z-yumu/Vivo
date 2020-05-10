<?php
namespace app\common\model;
use think\Model;
class Product extends Model
{
      //获取产品列表
   public function getlist($name)
    {
        if(!empty($name)){
          $order=[
          'order'=>'asc',
          'id'=>'desc',
          ];
          //模糊查询
          return $this->where('name','like','%'.$name.'%')
                   ->order($order)
                   ->paginate(15,false,[
                       'query'=>[
                        'name'=>$name,   //复杂分页
                       ]
                    ]);
         }else{
           $order=[
          'order'=>'asc',
          'id'=>'desc',
         ];
         return $this->order($order)
                     ->paginate(15);
        }   
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
     //获取产品列表
   public function merchantproductlist($name,$merchantinfoid)
    {
        if(!empty($name)){
          $order=[
          'order'=>'asc',
          'id'=>'desc',
          ];
          return $this->where('name','like','%'.$name.'%')
                      ->where('merchantinfoid',$merchantinfoid)
                   ->order($order)
                   ->paginate(1,false,[
                       'query'=>[
                        'name'=>$name,
                       ]
                    ]);
         }else{
           $order=[
          'order'=>'asc',
          'id'=>'desc',
         ];
         return $this->where('merchantinfoid',$merchantinfoid)
                    ->order($order)
                     ->paginate(15);
        }   
    }

      //前端获取子类产品列表
   public function getproducts($se_category_id,$sort)
    {
        //判断查询$sort
       if($sort==1){ 
        $where=[
         'status'=>1,
         'se_category_id'=>$se_category_id,
        ];
        $order=[
          'buy_count'=>'desc',
          'order'=>'asc',
          'price'=>'asc', 
          'id'=>'desc',
         ];
         return $this->where($where)
                     ->order($order)
                     ->paginate(15);
        }elseif($sort==2){
        $where=[
         'status'=>1,
         'se_category_id'=>$se_category_id,
        ];
        $order=[
          'buy_count'=>'desc',
          'order'=>'asc',
          'price'=>'asc', 
          'id'=>'desc',
         ];
         return $this->where($where)
                     ->order($order)
                     ->paginate(15); 
        }elseif($sort==3){
          $where=[
         'status'=>1,
         'se_category_id'=>$se_category_id,
        ];
        $order=[
          'price'=>'asc', 
          'buy_count'=>'desc',
          'order'=>'asc',
          'id'=>'desc',
         ];
         return $this->where($where)
                     ->order($order)
                     ->paginate(15); 
        }
    }
     //前端获取小类产品列表
   public function getsmallcategoryproducts($categorysmall_id)
    {
        $where=[
         'status'=>1,
         'categorysmall_id'=>$categorysmall_id,
        ];
        $order=[
          'order'=>'asc',
          'id'=>'desc',
         ];
         return $this->where($where)
                     ->order($order)
                     ->paginate(15);
    }
}
