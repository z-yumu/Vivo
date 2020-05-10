<?php
namespace app\index\controller;
use think\Controller;
class Error extends Controller
{
    public function index()
    {
        return '你查找的页面不存在';
    }
}
