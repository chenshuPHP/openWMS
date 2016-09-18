<?php
    namespace Admin\Model;
    use Think\Model;

    /**
     * Class BrandModel   品牌模型
     * @package Admin\Model
     */
    class BrandModel extends Model
    {
        protected $insertFields = array('brand_name','brand_logo','site_url','brand_status','brand_desc','sort_order','last_time');
        protected $updateFields = array('id','brand_name','brand_logo','site_url','brand_status','brand_desc','sort_order','last_time');
        protected $_validate = array(
            array('brand_name','require','请输入品牌名称'),
            array('brand_name','','该品牌已存在',2,'unique'),
            array('brand_name','1,12','品牌名称太长',2,'length')
        );
    }