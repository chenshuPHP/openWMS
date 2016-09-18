<?php
    namespace Admin\Controller;
    use Think\Controller;

    class IndexController extends Controller
    {
        //主页
        public function index(){
            $this -> display();
        }
        //上部
        public function top() {
            $this -> display();
        }
        //菜单
        Public function menu() {
            $this -> display();
        }
        //主体
        Public function main() {
            $this -> display();
        }
    }