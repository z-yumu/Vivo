<?php
// +----------------------------------------------------------------------
// | ThinkPHP [ WE CAN DO IT JUST THINK ]
// +----------------------------------------------------------------------
// | Copyright (c) 2006~2018 http://thinkphp.cn All rights reserved.
// +----------------------------------------------------------------------
// | Licensed ( http://www.apache.org/licenses/LICENSE-2.0 )
// +----------------------------------------------------------------------
// | Author: liu21st <liu21st@gmail.com>
// +----------------------------------------------------------------------
Route::rule('work','index/Work/add');
Route::rule('hello/:name', 'index/Index/hello');
// Route::miss('index/Error/index');
Route::rule('order/index','index/order/index?id="+productid+"&price="+price+"&num="+num+"&path="+path');
Route::get('order','index/order/index?id="+productid+"&price="+price+"&num="+num+"&path="+path');
return [

];
