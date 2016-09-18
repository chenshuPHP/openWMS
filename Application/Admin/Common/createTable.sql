
    <!--商品表-->

    create table shop_goods(
    goods_id mediumint unsigned auto_increment comment '商品id',
    goods_name varchar(100) not null comment '商品名称',
    goods_logo varchar(100) not null default '' comment '商品图片',
    sm_logo varchar(100) not null default '' comment '商品logo缩略图',
    goods_price decimal(10,2) not null comment '本店售价',
    market_price decimal(10,2) not null default '0' comment '市场价格',
    goods_desc text comment '商品描述',
    is_sale tinyint not null default 1 comment '是否显示上架:1上架 0不上架',
    primary key(goods_id),
    index goods_price(goods_price),
    key is_sale(is_sale)
    )engine=myisam charset=utf8 comment '商品表'
<!--品牌-->
    drop table if exists shop_brand;
    create table shop_brand(
    brand_id mediumint unsigned not null auto_increment comment '品牌id',
    brand_name varchar(60) not null comment '品牌名称',
    brand_logo varchar(200) not null default '' comment '品牌logo',
    site_url varchar(100) not null default '' comment '品牌网址',
    primary key(brand_id)
    )engine=myisam charset=utf8 comment '品牌表';
-- 商品类型表
create table shop_type(
typa_id tinyint unsigned  primary key auto_increment comment '类型id',
type_name varchar(32) not null comment '类别名称',
index(type_name)
)engine=myisam  charset=utf8;
-- 商品属性表
create table shop_attribute(
attr_id smallint unsigned not null primary key auto_increment comment '类型属性id',
attr_name varchar(32) not null comment '属性的名称',
type_id tinyint unsigned not null comment '商品类型id',
attr_type tinyint not null default 0 comment '商品属性的类型 0 表示唯一属性 ,1表示单选属性 ',
attr_input_type tinyint not null default 0 comment '属性值得录入方式 0表示手工输入 1表示列表选择',
attr_value varchar(64) not null default '' comment '可选值列表'
)engine=myisam charset=utf8;
-- 商品表更新版

create table shop_goods(
goods_id smallint unsigned primary key auto_increment comment '商品id',
goods_name varchar(32) not null comment '商品名称',
goods_sn varchar(32) not null comment '商品货号',
cat_id smallint unsigned not null comment '商品所属栏目id',
shop_price decimal(10,2) not null default 0 comment '本店售价',
market_price decimal(10,2) not null default 0 comment '市场售价',
goods_origin varchar(80) not null default '' comment '原图的路径',
goods_img varchar(80) not null default '' comment '中图路径',
goods_thumb varchar(80) not null default '' comment '小图路径',
is_new tinyint not null default 4 comment '1表示新品',
is_hot tinyint not null default 4 comment '1表示热卖，',
is_dest tinyint not null default 4 comment '1表示精品',
is_sale tinyint not null default 4 comment '1表示上架',
goods_status tinyint not null default 1 comment '商品状态1表示正常 0 表示删除',
goods_type tinyint not null default 0 comment '商品所属类别的id',
goods_desc varchar(265) not null default '' comment '商品描述',
goods_number smallint not null default 1 comment '商品库存',
add_time int not null default 0 comment '商品添加时间'
)engine myisam charset utf8;

-- 商品的属性
create table shop_attr(
id smallint unsigned primary key auto_increment comment 'id编号',
goods_id smallint unsigned not null comment '商品id',
attr_id smallint unsigned not null comment '属性id',
attr_value varchar(32) not null default '' comment '属性值'
)engine myisam charset utf8
-- 相册表
CREATE TABLE shop_album(
album_id smallint unsigned primary key auto_increment comment '相册id',
goods_id smallint unsigned not null comment '商品id',
album_ori varchar(80) not null default '' comment '相册的原图地址',
album_thumb varchar(80) not null default '' comment '相册缩略图'
)engine=myisam charset=utf8

-- 权限表
create table authority(
auth_id smallint unsigned primary key auto_increment comment '权限id',
auth_name varchar(30) not null comment '权限名称',
parent_id smallint unsigned not null default 0 comment '父级id',
module_name varchar(32) not null default '' comment '该权限对应的模块名称',
controller_name varchar(32) not null default '' comment '该权限对应的方法名'
)engine myisam charset utf8;

-- 角色表
create table shop_role(
role_id smallint primary key auto_increment comment '角色id',
role_name varchar(32) not null comment '角色名称'
)engine myisam charset utf8 comment '角色表'

-- 角色和权限的关系表
create table role_authority(
role_id smallint unsigned not null comment '角色id',
auth_id smallint unsigned not null comment '权限id'
)engine myisam charset utf8 comment '角色与权限的关系表'

-- 管理员表
create table shop_admin(
admin_id smallint unsigned primary key auto_increment comment '管理员id',
admin_name varchar(32) not null comment '管理员名称',
admin_password char(32) not null comment '管理员密码',
admin_salt varchar(6) not null comment '管理员的密钥'
)engine myisam charset utf8 comment '管理员表';

-- 管理员和角色关系表
create table shop_admin_role(
admin_id smallint unsigned not null comment '管理员id',
role_id smallint unsigned not null comment '角色的id'
)engine myisam charset utf8
