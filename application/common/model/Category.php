<?php
namespace app\common\model;
use think\Model;
use think\model\concern\SoftDelete;
class Category extends Model
{
    use SoftDelete;
    protected $deleteTime = 'delete_time';//
    
    //输出产品分类的大类
    public function getfirstcategory()
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
    //添加产品的分类
    public function savelist($data=[])
    {
        $result=$this->allowField(true)->save($data);
        if($result){
        	return $this->getData('id');
        }else{
        	return false;
        }
    }
    //显示产品分类的列表
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
     //检查是否存在产品子类
    public function checksubcategory($id)
    {
      $field='id,parent_id,status';
      $where['status']=1;
      $where['parent_id']=$id;
      $cate=$this->field($field)
                 ->where($where)
                 ->find();
      return $cate;
    }
  //多对多的关联
  public function salesattributes()
    {
        return $this->belongsToMany('SalesAttribute');
    }
    // 定义一对多关联
    public function categorybrands()
    {
        // 获取类目属性
        return $this->hasMany('CategoryBrand');
    }
    // 定义多对多关联
    public function salesAttribute()
    {
        // 用户 BELONGS_TO_MANY 角色
        return $this->belongsToMany('SalesAttribute', 'category_sales_attribute');
    }
     // 定义一对多关联
    public function categoryattributes()
    {
        // 获取类目属性
        return $this->hasMany('CategoryAttribute');
    }
}
