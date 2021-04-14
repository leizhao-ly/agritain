<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>农家乐</title>
    <link rel="stylesheet" href="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="https://cdn.staticfile.org/jquery/2.1.1/jquery.min.js"></script>
    <script src="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <style>
        .fakeimg {
            height: 200px;
            background: #aaa;
        }

        #myCarousel .item img{
            margin:auto;
            width: 750px;
            height: 423px;
            display: table-cell;
            text-align: center;
        }

    </style>
    <script type="text/javascript">
        //判断注册密码中的重复密码
        function checkpassword() {
            var password = document.getElementById("pass1").value;
            var repassword = document.getElementById("pass2").value;

            if(password == repassword) {
                document.getElementById("tishi").innerHTML="<font color='green'>两次密码输入一致</font>";
                document.getElementById("submit").disabled = false;

            }else {
                document.getElementById("tishi").innerHTML="<font color='red'>两次输入密码不一致!</font>";
                document.getElementById("submit").disabled = true;
            }
        }
        //判断忘记密码中的重复密码
        function checkpassword1() {
            var password = document.getElementById("pass3").value;
            var repassword = document.getElementById("pass4").value;

            if(password == repassword) {
                document.getElementById("flag").innerHTML="<font color='green'>两次密码输入一致</font>";
                document.getElementById("submit").disabled = false;
            }else {
                document.getElementById("flag").innerHTML="<font color='red'>两次输入密码不一致!</font>";
                document.getElementById("submit").disabled = true;
            }
        }

        function findEmail() {
            var email=document.getElementById('femail').value;
            //1.创建一个AJAX对象用于发送
            var xhr=new XMLHttpRequest();
            //2.打开一个通道 模拟一个请求(请求方式，请求url，是否为异步true)
            xhr.open("post","findEmail.do?email="+email,true);
            //发送后时刻监听着服务器状态
            xhr.send();
            xhr.onreadystatechange = function () {
                if(xhr.readyState==4 && xhr.status==200){
                    //接收响应信息啦
                    var text=xhr.responseText;
                    if(text!=''){
                        alert(text);
                    }
                }
            }
        }
        function rFindEmail(email) {
            //1.创建一个AJAX对象用于发送
            var xhr=new XMLHttpRequest();
            //2.打开一个通道 模拟一个请求(请求方式，请求url，是否为异步true)
            xhr.open("post","rfindEmail.do?email="+email,true);
            //发送后时刻监听着服务器状态
            xhr.send();
            xhr.onreadystatechange = function () {
                if(xhr.readyState==4 && xhr.status==200){
                    //接收响应信息啦
                    var text=xhr.responseText;
                    if(text!=''){
                        alert(text);
                        document.getElementById('remail').value='';
                    }
                }
            }
        }
    </script>
     </body>
</head>
<body>
<div class="jumbotron text-center" style="margin-bottom:0">
    <h1>天空之城生态农家乐</h1>
    <p>给农庄一个拥抱，将你的忧郁都收获为自然香</p>
</div>

<div id="myCarousel" class="carousel slide">
    <!-- 轮播（Carousel）指标 -->
    <ol class="carousel-indicators">
        <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
        <li data-target="#myCarousel" data-slide-to="1"></li>
        <li data-target="#myCarousel" data-slide-to="2"></li>
    </ol>
    <!-- 轮播（Carousel）项目 -->
    <div class="carousel-inner text-center">
        <div class="item active">
            <img src="img/lb1.JPG" alt="First slide">
        </div>
        <div class="item">
            <img src="img/lb2.JPG" alt="Second slide">
        </div>
        <div class="item">
            <img src="img/lb3.JPG" alt="Third slide">
        </div>
    </div>
    <!-- 轮播（Carousel）导航 -->
    <a class="carousel-control left" href="#myCarousel"
       data-slide="prev"> <span _ngcontent-c3="" aria-hidden="true" ></span></a>
    <a class="carousel-control right" href="#myCarousel"
       data-slide="next" class="glyphicon glyphicon-chevron-right"></a>
</div>

<nav class="navbar navbar-inverse">
    <div class="container-fluid">
        <div class="navbar-header">
            <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand" href="#">农家乐生态农庄</a>
        </div>
        <div class="collapse navbar-collapse" id="myNavbar">
            <ul class="nav navbar-nav mr-2">
                <li class="active"><a href="#">主页</a></li>
                <li><a href="product.do">产品信息</a></li>
                <li><a href="yys.do">我的预定信息 </a></li>
                <li><a href="#" data-toggle="modal" data-target="#adminModal">联系管理员</a></li>
            </ul>
            <ul class="nav navbar-nav" style="float: right;">
                <c:if test="${sessionScope.user==null}">
                    <li><a href="#" data-toggle="modal" data-target="#loginModal">登录</a></li>
                    <li><a>/ </a></li>
                    <li><a href="#" data-toggle="modal" data-target="#registerModal">注册</a></li>
                </c:if>
                <c:if test="${sessionScope.user!=null}">
                    <li style="color: #fff">欢迎${sessionScope.user.username}<li><li><a href="clear.do">注销</a></li>
                </c:if>
            </ul>
        </div>
    </div>
</nav>

<div class="container">
    <div class="row">
        <div class="col-sm-4">
            <h2>农家乐</h2>
            <h5>我的照片:</h5>
            <div class="fakeimg"><img src="img/njl.jpg" style="width: 360px"></div>
            <p>农家乐</p>
            <h3>链接</h3>
            <nav class="nav nav-pills nav-stacked">
                <li class="active"><a href="product.do" style="text-align: center">预约</a></li>
                <div class="row">
                    <div class="col-sm-4">
                        <h2 style="width: 150px">农家乐简介</h2>
                        <p style="width:300px; border: 1px solid black;color: #ff00ff;padding: 5px; text-indent: 2em;">天空之城生态农庄是一家生产有机农产品并拥有生态有机蔬菜观光园的农庄。庄园位于重庆市大足区宝项镇，远离城市，农庄周围山青水秀，符合种植有机蔬菜和喂养有机家禽，达到资源循环利用●农庄成立的本质是带给人们安全食品，让人们能吃上无污染的食品。也提倡人们做到环保，还给子孙一片蔚蓄的天空，清激的湖水。在农庄，你不仅能吃到无污染的生态食品，还能观赏生态园，体验不一样的感觉</p>
                        <hr class="hidden-sm hidden-md hidden-lg">
                    </div>
            </nav>
            <hr class="hidden-sm hidden-md hidden-lg">


        </div>


        <div class="col-sm-8">
            <h2>农家乐露天种植</h2>
            <h5>相关展示</h5>
            <div class="fakeimg" style="height: 300px"><img src="img/ltzz1.jpg" style="width: 750px;height: 300px"></div>
            <p>相关介绍</p>
            <p>设施农业蓬勃兴起的今天，大千农庄依然奉行露地种植的理念———承天地之阳光雨露，这是上苍赐予人类的。</p>
            <br>
            <h2>农家乐住房</h2>
            <h5>相关展示</h5>
            <div class="fakeimg" style="height: 300px"><img src="img/zf.jpg" style="width: 750px;height: 300px"></div>
            <p>相关介绍</p>
            <p>博罗天空之城生态农家乐是集餐饮、旅业、住宿、会议、休闲娱乐为一体的综合型度假场地，生态园占地面积500亩，餐饮区约6800平方米，建筑面积1600平方米。周边罗浮山、平安山、那里花开、冰雪世界、怡情谷、哈斯塔特等景区。区位优越，交通便捷。</p>
        </div>
    </div>
</div>

<div class="jumbotron text-center" style="margin-bottom:0">
    <p>底部内容</p>


    <!-- 登录模态框（Modal） -->
    <div class="modal fade" id="loginModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                        &times;
                    </button>
                    <h4 class="modal-title" id="myModalLabel">
                        登录
                    </h4>
                </div>
                <form action="login.do" method="post" class="form-horizontal" role="form">
                    <div class="form-group">
                        <label for="firstname" class="col-sm-2 control-label">邮箱</label>

                        <div class="col-sm-8">
                            <input type="Email" name="email" id="firstname" value="" class="form-control" placeholder="请输入您的邮箱" required>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="lastname" class="col-sm-2 control-label">密码</label>
                        <div class="col-sm-8">
                            <input type="password" name="password"  value="" class="form-control" id="lastname" placeholder="请输入您的密码" required>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="col-sm-offset-2 col-sm-3">
                            <div class="checkbox">
                                <label>
                                </label>

                            </div>
                        </div>
                        <a href="#" data-toggle="modal" data-target="#forgetModal" data-dismiss="modal">忘记密码</a>
                    </div>

                    <div class="modal-footer">
                        <a href="#"  data-toggle="modal" data-target="#aloginModal" data-dismiss="modal" style="margin-right: 200px;">管理员登录</a>
                        <a href="#"  data-toggle="modal" data-target="#registerModal" data-dismiss="modal" >还没有账号?点我注册</a>&nbsp;&nbsp;&nbsp;
                        <button type="button" class="btn btn-default" data-dismiss="modal">关闭
                        </button>
                        <button type="submit" class="btn btn-primary">
                            登录
                        </button>
                    </div>
                </form>
            </div><!-- /.modal-content -->
        </div><!-- /.modal -->
    </div>

    <!-- 管理员登录模态框（Modal） -->
    <div class="modal fade" id="aloginModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                        &times;
                    </button>
                    <h4 class="modal-title">
                        登录
                    </h4>
                </div>
                <form action="adminLogin.do" method="post" class="form-horizontal" role="form">
                    <div class="form-group">
                        <label for="firstname" class="col-sm-2 control-label">邮箱</label>

                        <div class="col-sm-8">
                            <input type="Email" name="adminName"value="" class="form-control" placeholder="请输入您的邮箱" required>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="lastname" class="col-sm-2 control-label">密码</label>
                        <div class="col-sm-8">
                            <input type="password" name="adminPass"  value="" class="form-control" placeholder="请输入您的密码" required>
                        </div>
                    </div>

                    <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal">关闭
                        </button>
                        <button type="submit" class="btn btn-primary">
                            登录
                        </button>
                    </div>
                </form>
            </div><!-- /.modal-content -->
        </div><!-- /.modal -->
    </div>

    <!-- 注册模态框（Modal） -->
    <div class="modal fade" id="registerModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                        &times;
                    </button>
                    <h4 class="modal-title" >
                        注册
                    </h4>
                </div>

                <form action="register.do" method="post" class="form-horizontal" role="form">
                    <div class="form-group">
                        <label for="remail" class="col-sm-2 control-label">邮箱</label>
                        <div class="col-sm-8">
                            <input type="Email"  name="email" value="" class="form-control" id="remail" placeholder="请输入您的邮箱" required onblur="rFindEmail(this.value)" >
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="pass1" name="password" class="col-sm-2 control-label">密码</label>
                        <div class="col-sm-8">
                            <input type="password" name="password" size="20" value="" class="form-control" id="pass1"  placeholder="请输入您的密码" onkeyup="checkpassword()" required>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="pass2" class="col-sm-2 control-label">确认密码</label>
                        <div class="col-sm-8">
                            <input type="password" name="pass2" size="20"  value="" class="form-control" id="pass2" placeholder="请再次输入您的密码" onkeyup="checkpassword()" required>
                            <span id="tishi"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="pass2" class="col-sm-2 control-label">用户名</label>
                        <div class="col-sm-8">
                            <input type="text" name="username" size="20"  value="" class="form-control"  placeholder="请输入您的用户名" required>
                        </div>
                    </div>

                    <div class="modal-footer">
                        <a href="#"  data-toggle="modal" data-target="#loginModal" data-dismiss="modal">已有账号?点我登录</a>&nbsp;&nbsp;&nbsp;
                        <button type="button" class="btn btn-default" data-dismiss="modal">关闭
                        </button>
                        <button type="submit" class="btn btn-primary">
                            注册
                        </button>
                    </div>
                </form>
            </div><!-- /.modal-content -->
        </div><!-- /.modal -->
    </div>

    <!-- 联系管理员模态框（Modal） -->
    <div class="modal fade" id="adminModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <form action="saveMessage.do" method="post">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                        <h4 class="modal-title">联系管理员</h4>
                    </div>
                    <input type="text" class="form-control" placeholder="你相对管理员说什么？" name="text" value="">
                    <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                        <button type="submit" class="btn btn-primary">确认提交</button>
                    </div>
                </div><!-- /.modal-content -->
            </form>
        </div><!-- /.modal -->
    </div>

    <!-- 忘记密码模态框（Modal） -->
    <div class="modal fade" id="forgetModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                        &times;
                    </button>
                    <h4 class="modal-title">
                        找回密码
                    </h4>
                </div>
                <form action="updatePass.do" method="post" class="form-horizontal" role="form">
                    <div class="form-group">
                        <label for="firstname" class="col-sm-2 control-label">邮箱</label>
                        <div class="col-sm-8">
                            <input type="Email" id="femail" name="email"  value="" placeholder="请输入您的邮箱" onblur="findEmail()"  class="form-control"  required>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="lastname" class="col-sm-2 control-label">密码</label>
                        <div class="col-sm-8">
                            <input type="password" name="password"  value="" class="form-control" id="pass3"  placeholder="请输入您的密码" onkeyup="checkpassword1()" required>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="pass2" class="col-sm-2 control-label">确认密码</label>
                        <div class="col-sm-8">
                            <input type="password" name="pass2" size="20"  value="" class="form-control" id="pass4" placeholder="请再次输入您的密码" onkeyup="checkpassword1()" required>
                            <span id="flag"></span>
                        </div>
                    </div>

                    <div class="modal-footer">
                        <a href="#"  data-toggle="modal" data-target="#loginModal" data-dismiss="modal" >返回登录</a>&nbsp;&nbsp;&nbsp;
                        <button type="button" class="btn btn-default" data-dismiss="modal">关闭
                        </button>
                        <button type="submit" class="btn btn-primary">
                            确认修改
                        </button>
                    </div>
                </form>
            </div><!-- /.modal-content -->
        </div><!-- /.modal -->
    </div>
</body>
</html>