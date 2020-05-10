<?php
namespace app\index\controller;
use think\Controller;
use app\common\model\Product as ProductModel;
use think\Session;
class Search extends Base
{
    public function index()
    {
        //直接查询，model层
        $name = $this->request->param("index_none_header_sysc");
//        dump($name);exit();
        $product= new ProductModel;
        $list= $product->getlist($name);
        $this->assign('list',$list);
        return $this->fetch();
    }
 	/**
     * 输出子类产品
     * @return integer $se_category_id产品类别的id
     */
    public function productcategory($se_category_id,$sort=1)
    {
          //实例化产品
        $product=new ProductModel;
        
        $products=$product->getproducts($se_category_id,$sort);
        $this->assign('products',$products);
        $this->assign('se_category_id',$se_category_id);	
        return $this->fetch(); 
    }   
    /**
     * 输出小类产品
     * @return integer $se_category_id产品类别的id
     */
    public function productsmallcategory($categorysmall_id,$se_category_id)
    {
          //实例化产品
        $product=new ProductModel;
        
        $products=$product->getsmallcategoryproducts($categorysmall_id);
        $this->assign('categorysmall_id',$categorysmall_id); 
        $this->assign('se_category_id',$se_category_id);  
        $this->assign('products',$products);  
        return $this->fetch(); 
    }   
}
