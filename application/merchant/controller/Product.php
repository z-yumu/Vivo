<?php
namespace app\merchant\controller;
use think\Controller;
use think\Image;
use think\Request;
use think\facade\Env;
use app\common\model\Category as CategoryModel;
use app\common\model\Product as ProductModel;
use app\common\model\ProductCategoryBrand as ProductCategoryBrandModel;
use app\common\model\ProductCategoryAttributeValue as ProductCategoryAttributeValueModel;
use app\common\model\SalesAttributeValue as SalesAttributeValueModel;
use app\common\model\ProductSalesAttribute as ProductSalesAttributeModel;
use app\common\model\ProductSalesAttributeValue as ProductSalesAttributeValueModel;
use app\common\model\ProductSku as ProductSkuModel;
use app\common\model\ProductPicture as ProductPictureModel;
use app\common\model\ProductAddress as ProductAddressModel;
use app\common\model\ProductExtract as ProductExtractModel;
use app\common\model\ProductService as ProductServiceModel;


class Product extends Base
{
  //产品输出页面
  public function index($name='')
  {
    $product= new ProductModel;
    //通过session获取商家的信息的id
    $merchantinfoid=session('merchantinfoid','','merchant');
    $list= $product->merchantproductlist($name,$merchantinfoid);
    $this->assign('list',$list);
    return $this->fetch();  
  }
  //产品输出页面
  public function shipin()
  {
    
    return $this->fetch();  
  }
  //输出产品添加类别清单
  public function categorylist()
  {
    $category= new CategoryModel;
    $show= $category->getshow();
    $this->assign('show',$show);
    return $this->fetch(); 
  } 
    //添加产品页面的输出显示页面
  public function add()
  {
    $bid=input('param.bid');
    $sid=input('param.sid'); 
    $this->assign('bid',$bid);
    $this->assign('sid',$sid);
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
          // 返回图片的高度
          $width = $image->width(); 
          // 返回图片的高度
          $height = $image->height(); 
          //放大镜：原始尺寸
          $image->thumb($width, $height, Image::THUMB_SCALING);
          // 保存图片（以当前时间戳）
          $saveNamefang = $request->time() . '.png';
          $image->save('static/uploads/product/fang/fang' . $saveNamefang);

          //标准图片：350*350 固定尺寸缩放
          $image->thumb(350, 350, Image::THUMB_FIXED);
          // 保存图片（以当前时间戳）
          $saveNamebig = $request->time() . '.png';
          $image->save('static/uploads/product/big/big' . $saveNamebig);
          //小图片显示
          $image->thumb(60, 60, Image::THUMB_FIXED);
          // 保存图片（以当前时间戳）
          $saveNamesmall = $request->time() . '.png';
          $image->save('static/uploads/product/small/small' . $saveNamesmall);
          //返回前端图片地址
          return json([
              'srcbig'=>'/static/uploads/product/big/big' . $saveNamebig,
              'srcsmall'=>'/static/uploads/product/small/small' . $saveNamesmall,
              'srcfang'=>'/static/uploads/product/fang/fang' . $saveNamefang,
              ]);
          
      }    
  } 
    //添加产品页面的输出显示页面
  public function save()
  {
    //获取全部数据
    $data=input('param.');
//    dump($data);
    //通过session获取商家的信息的id
    $merchantinfoid=session('merchantinfoid','','merchant');
    //对产品数据的验证
    $validate =validate('Product');
    if (!$validate->scene('add')->check($data)) {
        $this->error($validate->getError());
    }
    //判断品牌是否为空，不为空$categorybrand赋值为1，否则0
    if (empty($data['categorybrand_id'])){
        $categorybrand=0;
    }else{
        $categorybrand=1;
    } 
    //判断类目属性值是否为空，不为空$categoryattributevalue赋值为1，否则0
    if(isset($data['categoryattributevalue_id'])){
      //implode将数组转化为字符串
      if (empty(implode("",$data['categoryattributevalue_id']))){
          $categoryattributevalue=0;
      }else{
          $categoryattributevalue=1;
      }      
    }else{
        $categoryattributevalue=0;
    }   
    //判断销售属性值是否为空，不为空$salesattributevalue赋值为1，否则0
    if (empty($data['salesattributevalue'])){
      $salesattributevalue=0;
    }else{
      $salesattributevalue=1;
    }  
    //判断产品服务是否为空，不为空$service赋值为1，否则0
    if (empty($data['service'])){
      $service=0;
    }else{
      $service=1;
    }  
    // 一、基本信息写入数据库
    // 一1、产品表(product)写入的数据
    $products=[
      "category_id" => $data['category_id'],
      "se_category_id" => $data['se_category_id'],
      "categorysmall_id" => $data['categorysmall_id'],
      "merchantinfoid" =>$merchantinfoid,
      "name" => $data['name'],
      "categorybrand" => $categorybrand,
      "categoryattribute" => $categoryattributevalue,
      "salesattribute" => $salesattributevalue,
      "price" => $data['price'],
      "total_count" => $data['total'],
      "description" => $data['content'],
      "status" => 2,
      "server" => $service,
    ]; 
     // dump($products);exit;
    $product= new ProductModel;
    $productid=$product->savelist($products);
    if(!$productid){
      return false;
    }
    //一2、品牌表(product_category_brand)写入数据
    if($categorybrand==1){
      $categorybranddata=[
        "product_id" => $productid,
        "category_brand_id" =>$data['categorybrand_id'],
      ];
      $productcategorybrand= new ProductCategoryBrandModel;
      $brandid=$productcategorybrand->savelist($categorybranddata);
      if(!$brandid){
      return false;
      }
    }
    //一3、类目属性表(product_category_attribute_value)写入数据
    if($categoryattributevalue==1){
      $categoryattributenum=count($data['categoryattributevalue_id']);
      for($i=0; $i<$categoryattributenum; $i++){
        if(!empty($data['categoryattributevalue_id'][$i])){
          $categoryattributedata=[
            "product_id" => $productid,
            "category_attribute_id" =>$data['categoryattribute_id'][$i],
            "category_attribute_value_id" =>$data['categoryattributevalue_id'][$i],
          ]; 
          $categoryattributeid = ProductCategoryAttributeValueModel::create($categoryattributedata);
          if(!$categoryattributeid){
          return false;
          } 
        }  
      }
    }
    //二、销售属性信息   
    if($salesattributevalue==1){
      //二1、销售属性表(product_sales_attribute)循环写入数据
      $salesattributenum=count($data['salesattribute_id']);
      for($i=0; $i<$salesattributenum; $i++){
        $salesattributedata=[
        "product_id" => $productid,
        "sales_attribute_id" => $data['salesattribute_id'][$i],
        ]; 
        $salesattributeid = ProductSalesAttributeModel::create($salesattributedata);
        if(!$salesattributeid){
             return false;
        } 
      }
      
     //二2、销售属性值表(product_sales_attribute_value)循环写入数据
      $salesattributevaluenum=count($data['salesattributevalue']);
          // dump($productattributevaluenum);exit;
      for($j=0; $j<$salesattributevaluenum; $j++){
       // dump($data['productattributevalue'][$j]);exit;
        $map2['name']=$data['salesattributevalue'][$j];
        $info= SalesAttributeValueModel::where($map2)->find();
        // dump($info);exit;
        $salesattributeid=$info["sales_attribute_id"];
        $salesattributevalueid=$info["id"];
        $salesattributevaluedata=[
          "product_id" => $productid,
          "sales_attribute_id" => $salesattributeid,
          "sales_attribute_value_id" =>$salesattributevalueid,
        ];  
        $salesattributevalueid = ProductSalesAttributeValueModel::create($salesattributevaluedata); 
        if(!$salesattributevalueid){
        return false;
        } 
      }
      //二3、SKU表(product_sku)循环写入数据
      $skunum=count($data['nums']);
      for($i=0; $i<$skunum; $i++){
        $spec=$data['spec'][$i];
        //把字符串转化为数组
        $specs=explode(',',$spec);
        $specsid=array();
        foreach($specs as $key=>$val){
          $map3["name"]=$val;
          $info= SalesAttributeValueModel::where($map3)->find();
          array_push($specsid,$info["id"]);            
        }
    
          //把数组转化成字符串
        $path=implode(",",$specsid);
        $price=$data['prices'][$i];
        $nums=$data['nums'][$i];
        $skudata=[
          'price' => $price,
          'nums' => $nums,
          'product_id' => $productid,
          'path' =>$path,
        ];
        $skuid = ProductSkuModel::create($skudata); 
        if(!$skuid){
        return false;
        } 
        unset($specsid);
        unset($path);
        unset($price);
        unset($nums);
      }   
    }
    //三、图文信息
    //三1、产品缩略图表(product_picture)循环写入数据
    $picturenum=count($data['picturefang']);
    for($i=0; $i<$picturenum; $i++){
      if($data['Fruit']==$data['picturebig'][$i]){
          $pictureindex=1;
      }else{
          $pictureindex=0;
      }
      $picturedata=[
        "product_id" => $productid,
        "picturefang" => $data['picturefang'][$i],
        "picturebig" => $data['picturebig'][$i],
        "picturesmall" => $data['picturesmall'][$i],
        "pictureindex" => $pictureindex,
      ]; 
      $pictureid = ProductPictureModel::create($picturedata); 
      if(!$pictureid){
      return false;
      } 
    }
    //四、物流信息
    //四1、地址表(product_address)写入数据
    $addressdata=[
        "product_id" => $productid,
        "province" =>$data['province'],
        "city" =>$data['city'],
        "country" =>$data['country'],
    ];
    $address= new ProductAddressModel;
    $addressid=$address->savelist($addressdata);
    //四2、运输信息表(product_extract)写入数据
    $extractdata=[
      "product_id" => $productid,
      "extract" =>$data['extract'],
      "transportfree" =>$data['transportfree'],
      "fare" =>$data['fare'],
    ];
    $extract= new ProductExtractModel;
    $extractid=$extract->savelist($extractdata);
    //五、产品服务
    //1、服务表(product_service)循环写入数据
    if($service==1){
      $servicenum=count($data['service']);
      for($i=0; $i<$servicenum; $i++){
           $servicedata=[
           "product_id" => $productid,
           "service" => $data['service'][$i],
           ]; 
           $serviceid = ProductServiceModel::create($servicedata);
           if(!$serviceid){
             return false;
           }
      }
      $this->redirect('Product/index'); 
    }else{
      $this->redirect('Product/index');
    }     
  } 
//产品编辑信息的输出   
  public function edit($id,$bid,$sid)
    {
       //1、获取产品的基本信息
       $product= new ProductModel;
       $products=$product->where('id',$id)->find();
       //2、获取产品品牌信息
       $brand= new ProductCategoryBrandModel;
       $brandid=$brand->where('product_id',$id)->column('category_brand_id');
       if($brandid){
          $this->assign('brandid',$brandid);
       }else{
          $this->assign('brandid','');
       }
       //3、获取产品类目属性值信息
       $attributevalue= new ProductCategoryAttributeValueModel;
       $attributevalueid=$attributevalue->where('product_id',$id)->column('category_attribute_value_id');
       if($attributevalueid){
        $this->assign('attributevalueid',$attributevalueid);
       }else{
        $this->assign('attributevalueid','');
       }
       //4、获取产品销售属性值信息
       $salesattributevalue= new ProductSalesAttributeValueModel;
       $salesattributevalueid=$salesattributevalue->where('product_id',$id)->column('sales_attribute_value_id');
       if($salesattributevalueid){
        $this->assign('salesattributevalueid',$salesattributevalueid);
       }else{
        $this->assign('salesattributevalueid','');
       }
       // dump($attributevalueid);exit;
       //5、获取产品缩略图信息
       $picture= new ProductPictureModel;
       $pictures=$picture->where('product_id',$id)->select();
       if($pictures){
        $this->assign('pictures',$pictures);
       }else{
        $this->assign('pictures','');
       }
       //6、获取产品地址信息
       $address= new ProductAddressModel;
       $addresss=$address->where('product_id',$id)->find();
       if($addresss){
        $this->assign('addresss',$addresss);
       }else{
        $this->assign('addresss','');
       }
       //7、获取产品运输信息
       $extract= new ProductExtractModel;
       $extracts=$extract->where('product_id',$id)->find();
       if($extracts){
        $this->assign('extracts',$extracts);
       }else{
        $this->assign('extracts','');
       }
        //8、获取产品服务信息
       $service= new ProductServiceModel;
       $services=$service->where('product_id',$id)->column('service');
       if($services){
        $this->assign('services',$services);
       }else{
        $this->assign('services','');
       }
       $this->assign('products',$products);
       $this->assign('bid',$bid);
       $this->assign('sid',$sid);
       return $this->fetch();   
    }
    public function deletepicture($id)
    {  
        $res=ProductPictureModel::destroy($id);
        if($res){
        return 1;
       }else{
        return 0;
       }
            
    }
//编辑产品基本信息的保存
  public function productsave($id)
  {
    //获取全部数据
    $data=input('param.');
    $product= new ProductModel;
    $productdata=[
        'name'=>$data['name'],
        "price" => $data['price'],
        "description" => $data['content'],
      ];
    $rs=$product->update($productdata,['id'=>$id]);
    if($rs){
     $this->success('产品信息更新成功','Product/index');
    }else{
     $this->error('产品信息更新失败');
    }
  }
//编辑产品类目属性信息的保存
  public function categoryattributesave($id)
  {
    //获取全部数据
    $data=input('param.');
    $product= new ProductModel;
    $productcategorybrand= new ProductCategoryBrandModel;
    $productcategoryattributevalue= new ProductCategoryAttributeValueModel;
    //判断品牌是否为空，不为空$categorybrand赋值为1，否则0
    if (empty($data['categorybrand_id'])){
        $categorybrand=0;
    }else{
        $categorybrand=1;
    } 
    //判断类目属性值是否为空，不为空$categoryattributevalue赋值为1，否则0
    if(isset($data['categoryattributevalue_id'])){
      //implode将数组转化为字符串
      if (empty(implode("",$data['categoryattributevalue_id']))){
          $categoryattributevalue=0;
      }else{
          $categoryattributevalue=1;
      }      
    }else{
        $categoryattributevalue=0;
    }   
    //品牌表(product_category_brand)写入数据
    if($categorybrand==1){
      $brand=$productcategorybrand->where('product_id',$id)->delete();
      $categorybranddata=[
        "product_id" => $id,
        "category_brand_id" =>$data['categorybrand_id'],
      ];
      $brandid=$productcategorybrand->savelist($categorybranddata);
      $resproduct=$product->where('id',$id)->setField('categorybrand',1);
    }elseif($categorybrand==0){
        $brand=$productcategorybrand->where('product_id',$id)->delete();
        $resproduct=$product->where('id',$id)->setField('categorybrand',0);
    }
    //类目属性表(product_category_attribute_value)写入数据
    if($categoryattributevalue==1){
      $categoryattribute=$productcategoryattributevalue->where('product_id',$id)->delete();
      $categoryattributenum=count($data['categoryattributevalue_id']);
      for($i=0; $i<$categoryattributenum; $i++){
        if(!empty($data['categoryattributevalue_id'][$i])){
          $categoryattributedata=[
            "product_id" => $id,
            "category_attribute_id" =>$data['categoryattribute_id'][$i],
            "category_attribute_value_id" =>$data['categoryattributevalue_id'][$i],
          ]; 
          $categoryattributeid = ProductCategoryAttributeValueModel::create($categoryattributedata);
          if(!$categoryattributeid){
          return false;
          }
        } 
      } 
      $resproduct=$product->where('id',$id)->setField('categoryattribute',1);  
      $this->success('信息已更新','Product/index');
    }elseif($categoryattributevalue==0){
       $categoryattribute=$productcategoryattributevalue->where('product_id',$id)->delete();
        $resproduct=$product->where('id',$id)->setField('categoryattribute',0);
       $this->success('信息已更新','Product/index'); 
    }  
  }
  //编辑产品销售属性sku信息的保存
  public function salesattributesave($id)
  {
    //获取全部数据
    $data=input('param.');
    //判断销售属性值是否为空，不为空$salesattributevalue赋值为1，否则0
    $product= new ProductModel;
    $productsalesattribute= new ProductSalesAttributeModel;
    $productsalesattributevalue= new ProductSalesAttributeValueModel;
    $productsku= new ProductSkuModel;
    if (empty($data['salesattributevalue'])){
      $salesattributevalue=0;
    }else{
      $salesattributevalue=1;
    }  
    //二、销售属性信息   
    if($salesattributevalue==1){
      //二1、销售属性表(product_sales_attribute)循环写入数据
      $salesattributeres=$productsalesattribute->where('product_id',$id)->delete();
      $salesattributenum=count($data['salesattribute_id']);
      for($i=0; $i<$salesattributenum; $i++){
        $salesattributedata=[
        "product_id" => $id,
        "sales_attribute_id" => $data['salesattribute_id'][$i],
        ]; 
        $salesattributeid = ProductSalesAttributeModel::create($salesattributedata);
        if(!$salesattributeid){
             return false;
        } 
      }
      
     //二2、销售属性值表(product_sales_attribute_value)循环写入数据
     $salesattributevalueres=$productsalesattributevalue->where('product_id',$id)->delete();
      $salesattributevaluenum=count($data['salesattributevalue']);
          // dump($productattributevaluenum);exit;
      for($j=0; $j<$salesattributevaluenum; $j++){
       // dump($data['productattributevalue'][$j]);exit;
        $map2['name']=$data['salesattributevalue'][$j];
        $info= SalesAttributeValueModel::where($map2)->find();
        // dump($info);exit;
        $salesattributeid=$info["sales_attribute_id"];
        $salesattributevalueid=$info["id"];
        $salesattributevaluedata=[
          "product_id" => $id,
          "sales_attribute_id" => $salesattributeid,
          "sales_attribute_value_id" =>$salesattributevalueid,
        ];  
        $salesattributevalueid = ProductSalesAttributeValueModel::create($salesattributevaluedata); 
        if(!$salesattributevalueid){
        return false;
        } 
      }
      //二3、SKU表(product_sku)循环写入数据
      $skures=$productsku->where('product_id',$id)->delete();
      $skunum=count($data['nums']);
      for($i=0; $i<$skunum; $i++){
        $spec=$data['spec'][$i];
        //把字符串转化为数组
        $specs=explode(',',$spec);
        $specsid=array();
        foreach($specs as $key=>$val){
          $map3["name"]=$val;
          $info= SalesAttributeValueModel::where($map3)->find();
          array_push($specsid,$info["id"]);            
        }
    
          //把数组转化成字符串
        $path=implode(",",$specsid);
        $price=$data['prices'][$i];
        $nums=$data['nums'][$i];
        $skudata=[
          'price' => $price,
          'nums' => $nums,
          'product_id' => $id,
          'path' =>$path,
        ];
        $skuid = ProductSkuModel::create($skudata); 
        if(!$skuid){
        return false;
        } 
        unset($specsid);
        unset($path);
        unset($price);
        unset($nums);
      }  
      $resproduct=$product->where('id',$id)->update(['salesattribute' =>1,'total_count' =>$data['total']]);
      $this->success('信息已更新','Product/index'); 
    }elseif($salesattributevalue==0){
       $salesattributeres=$productsalesattribute->where('product_id',$id)->delete();
       $salesattributevalueres=$productsalesattributevalue->where('product_id',$id)->delete();
      $skures=$productsku->where('product_id',$id)->delete();
      $resproduct=$product->where('id',$id)->update(['salesattribute' =>0,'total_count' =>$data['total']]);
       $this->success('信息已更新','Product/index');
    }
  }  
   //编辑产品图片信息的保存
  public function picturesave($id)
  {
    //获取全部数据
    $data=input('param.');
    $productpicture= new ProductPictureModel;
    //产品缩略图表(product_picture)循环写入数据
    $pictureres=$productpicture->where('product_id',$id)->delete();
    $picturenum=count($data['picturefang']);
    for($i=0; $i<$picturenum; $i++){
      if($data['Fruit']==$data['picturebig'][$i]){
          $pictureindex=1;
      }else{
          $pictureindex=0;
      }
      $picturedata=[
        "product_id" => $id,
        "picturefang" => $data['picturefang'][$i],
        "picturebig" => $data['picturebig'][$i],
        "picturesmall" => $data['picturesmall'][$i],
        "pictureindex" => $pictureindex,
      ]; 
      $pictureid = ProductPictureModel::create($picturedata); 
      if(!$pictureid){
      return false;
      } 
    }
     $this->success('信息已更新','Product/index');
  }
  //编辑物流信息的保存
  public function extractsave($id)
  {
    //获取全部数据
    $data=input('param.');
    $productaddress= new ProductAddressModel;
    $productextract= new ProductExtractModel;
    $addressdata=[
        "province" =>$data['province'],
        "city" =>$data['city'],
        "country" =>$data['country'],
    ];
    $rs1=$productaddress->update($addressdata,['product_id'=>$id]);
    $extractdata=[
      "extract" =>$data['extract'],
      "transportfree" =>$data['transportfree'],
      "fare" =>$data['fare'],
    ];
     $rs2=$productextract->update($extractdata,['product_id'=>$id]);
    if($rs2){
     $this->success('产品信息更新成功','Product/index');
    }else{
     $this->error('产品信息更新失败');
    }
  }
  //编辑服务信息的保存
  public function servicesave($id)
  {
    //获取全部数据
    $data=input('param.');
    //判断产品服务是否为空，不为空$service赋值为1，否则0
    if (empty($data['service'])){
      $service=0;
    }else{
      $service=1;
    }  
    $productservice= new  ProductServiceModel;
    $product= new ProductModel;
    if($service==1){
      $serviceres=$productservice->where('product_id',$id)->delete();
      $servicenum=count($data['service']);
      for($i=0; $i<$servicenum; $i++){
           $servicedata=[
           "product_id" => $id,
           "service" => $data['service'][$i],
           ]; 
           $serviceid = ProductServiceModel::create($servicedata);
           if(!$serviceid){
             return false;
           }
      }
      $resproduct=$product->where('id',$id)->setField('server',1);
      $this->success('产品信息更新成功','Product/index');
    }else{
      $serviceres=$productservice->where('product_id',$id)->delete();
       $resproduct=$product->where('id',$id)->setField('server',0);
      $this->success('产品信息更新成功','Product/index');
    }
  }
  //下架
  public function out($id)
  {
           $product= new ProductModel;
           $res=$product->update(['status'=>-1],['id'=>$id]);
           if($res){
           $this->success('已下架','Product/index');
          }else{
           $this->error('失败');
          }

  }

}

