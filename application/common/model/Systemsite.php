<?php
namespace app\common\model;
use think\Model;
class Systemsite extends Model
{
    protected function base($query)
    {
        //只返回结果集中的第一条
        $query->where('status',1);
    }
}
