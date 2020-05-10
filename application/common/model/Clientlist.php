<?php
namespace app\common\model;
use think\Model;
use think\model\concern\SoftDelete;
class Clientlist extends Model
{
    use SoftDelete;
    protected $deleteTime = 'delete_time';//

    public function getfirstmerchant()
    {
        $data=[
          'status'=>1,
          'parent_id'=>0
        ];
        $order=[
          'order'=>'asc',
          'id'=>'desc',
        ];
        return $this->where($data)
                    ->order($order)
                    ->select();
    }
    public function savelist($data=[])
    {
        $result=$this->allowField(true)->save($data);
        if($result){
        	return $this->getData('id');
        }else{
        	return false;
        }
    }
     public function getshow()
    {
      $field='id,parent_id,name,link,order,status';
      $order['order']='asc';
      $data=$this->field($field)
                 ->order($order)
                 ->select();
                
      $list=$this->tree($data);
      return $list;
    }
    //分类输出
    public function getlist()
    {
      $field='id,parent_id,name,link,order,iconb,iconm';
      $where['status']=1;
      $order['order']='asc';
      $data=$this->field($field)
                 ->where($where)
                 ->order($order)
                 ->select();
                
      $list=$this->tree($data);
      return $list;
    }

    //递归返回值
    public function tree($data,$name='child',$parent_id=0)
    {
       $arr=array();
       foreach ($data as $key => $value) {
        if($value['parent_id']==$parent_id){
         $arr[]=$value;
         $value[$name]=$this->tree($data,$name,$value['id']);
         }
       }
       return $arr; 
    }
}
