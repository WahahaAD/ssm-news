<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>用户注册</title>
    <!-- Bootstrap -->
    >
    <script type="text/javascript" src="/js/address.js"></script>
    <link href="/css/bootstrap.min.css" rel="stylesheet">
    <script type="text/javascript" src="/js/userAdd.js"></script>
    <script type="text/javascript" src="/JQuery/jquery-2.1.0.js"></script>
    <script type="text/javascript">
        $(function(){
            var sname=false;
            var spassword=false;
            var sbirthday=false;
            var sidcard=false;
            var semail= false;
            var sphoen = false;
            $("#name").blur(function(){

                alert("hahah");
                var name=$("#name").val();
                $("#d1").empty();
                $.post("/user/selectByname",{"name":name},function(date){
                    if(date=="ok"){
                        $("#name").after("<span id='d1'>用户名已存在</span>");

                    }else{
                        $("#name").after("<span id='d1'>用户名可用</span>");
                        sname=true;
                    }
                });
            });
            $("#password").blur(function(){
                $("#d2").empty();
                var checkNum =/^[a-z0-9_-]{6,18}$/;
                var s=	checkNum.test($(this).val());
                if(s==false){
                    $("#password").after("<span id='d2'>密码必须是 6到10位的数字与字母组合</span>");
                }
            });
            $("#password1").blur(function(){
                var password =$("#password").val();
                var password1=$("#password1").val();
                $("#d3").empty();
                if(password==password1){
                    spassword=true;
                }else{
                    $("#password1").after("<span id='d3'>两次输入的密码不一致</span>");
                }
            });
            $("#idcard").blur(function(){
                var idcard =/^[1-9]\d{5}[1-9]\d{3}((0\d)|(1[0-2]))(([0|1|2]\d)|3[0-1])\d{3}([0-9]|X)$/;
                var s = idcard.test($(this).val());
                $("#d4").empty();
                if(s==false){
                    $("#idcard").after("<span id='d4'>身份证号输入不正确</span>");
                }else{
                    sidcard=true;
                }
            });
            $("#birthday").blur(function(){
                $("#d5").empty();
                var s =/^((((1[6-9]|[2-9]\d)\d{2})-(0?[13578]|1[02])-(0?[1-9]|[12]\d|3[01]))|(((1[6-9]|[2-9]\d)\d{2})-(0?[13456789]|1[012])-(0?[1-9]|[12]\d|30))|(((1[6-9]|[2-9]\d)\d{2})-0?2-(0?[1-9]|1\d|2[0-8]))|(((1[6-9]|[2-9]\d)(0[48]|[2468][048]|[13579][26])|((16|[2468][048]|[3579][26])00))-0?2-29-))$/;
                var n=	s.test($(this).val());
                if(n==false){
                    $("#birthday").after("<span id='d5'>日期格式输入不正确</span>");
                }else{
                    sbirthday=true;
                }
            });
            $("#email").blur(function(){
                $("#d6").empty();
                var email=/^([a-zA-Z0-9_-])+@([a-zA-Z0-9_-])+(.[a-zA-Z0-9_-])+$/ ;
                var n = email.test($(this).val());
                if(n==false){
                    $("#email").after("<span id='d6'>邮箱输入格式不正确</span>");
                }else{
                    semail=true;
                }
            });
            $("#phone").blur(function(){
                $("#d7").empty();
                var n = /^1[34578]\d{9}$/;
                if(n.test($(this).val())==false){
                    $("#phone").after("<span id='d7'>号码输入不正确</span>");
                    return false;
                }
                else sphoen=true;
            });



        });
        /**		$("#sub").click(function(){
				var name=$("#name").val();
				var username=$("#username").val();
				var password=$("#password").val();
				if(sname=true){
				$.post("/user/add",{"name":name,"username":username,"password":password},function(date){
					if(date=="ok"){
						if(confirm('注册成功,跳转到登录页面?')==false)return false;
						window.location.href="/login.jsp";
					}else{
						alert("注册失败");
					}
				});
				}else{
				alert("用户名不可用请重新输入");
				}
			});*/



    </script>



</head>
<body>
    <div class="container">
        <div class="row">
            <div class="col-md-8 col-md-offset-4">
        <form class="form-horizontal" enctype="multipart/form-data" method="post" action="/user/add">

            <div class="form-group">
                <label for="inputUser" class="col-md-2 control-label">照片</label>
                <div class="col-md-3">
                    <input type="file" id="picture" name="photo">
                </div>
            </div>
            <div class="form-group">
                <label for="inputUser" class="col-sm-2 control-label">姓名</label>
                <div class="col-sm-3">
                    <input type="text" class="form-control" name="name" placeholder="用户名" id="name" >
                </div>
            </div>
            <div class="form-group">
                <label for="inputUser" class="col-sm-2 control-label">用户名</label>
                <div class="col-sm-3">
                    <input type="text" class="form-control" name="username" placeholder="用户名" id="username" >
                </div>
            </div>
            <div class="form-group">
                <label for="inputPassword3" class="col-sm-2 control-label">密码</label>
                <div class="col-sm-3">
                    <input type="password" class="form-control" name="password" placeholder="密码" id="password">
                </div>
            </div>
            <div class="form-group">
                <label for="inputQPassWord" class="col-sm-2 control-label">确认密码</label>
                <div class="col-sm-3">
                    <input type="password" class="form-control"  id="password1">
                </div>
            </div>
            <div class="form-group">
                <label for="inputID_Card" class="col-sm-2 control-label">身份证号</label>
                <div class="col-sm-3">
                    <input type="text" class="form-control" name="idcard" placeholder="身份证号" id="idcard" >
                </div>
            </div>
            <div class="form-group">
                <label for="inputEmail" class="col-sm-2 control-label">邮箱</label>
                <div class="col-sm-3">
                    <input type="text" class="form-control" name="email" placeholder="邮箱" id="email" >
                </div>
            </div>
            <div class="form-group">
                <label for="inputBirthday" class="col-sm-2 control-label">出生日期</label>
                <div class="col-sm-3">
                    <input type="date" class="form-control" name="birthday" placeholder="yyyy-mm-ss" id="birthday" >
                </div>
            </div>
            <div class="form-group">
                <label for="inputQPassWord" class="col-sm-2 control-label">爱好</label>
                <label class="checkbox-inline">
                    <input type="checkbox" name="hobby" id="inlineCheckbox1" value="吃饭"> 吃饭
                    <input type="checkbox" name="hobby" id="inlineCheckbox1" value="睡觉"> 睡觉
                    <input type="checkbox" name="hobby" id="inlineCheckbox1" value="打豆豆"> 打豆豆
                </label>

            </div>
            <div class="form-group">
                <label for="inputQPassWord" class="col-sm-2 control-label">性别</label>
                <label class="radio-inline">
                    <input type="radio" name="sex" id="inlineRadio1" value="男"> 男
                </label>
                <label class="radio-inline">
                    <input type="radio" name="sex" id="inlineRadio2" value="女"> 女
                </label>
            </div>
            <div class="form-group">
                <label for="inputAddress" class="col-sm-2 control-label">地址</label>
                <select id="province" runat="server" class="form-control" name="address">
                </select>
                <select id="city" runat="server" class="form-control" name="address">
                </select>
                <select id="county" runat="server" class="form-control" name="address">
                </select>
                <script type="text/javascript">
                    setup();
                </script>
            </div>
            <div class="form-group">
                <label for="inputPhone" class="col-sm-2 control-label">电话号码</label>
                <div class="col-sm-3">
                    <input type="text" class="form-control" name="phone" placeholder="电话号码" id="phone" >
                </div>
            </div>
            <div class="form-group">
                <label for="inputIndividualResume" class="col-sm-2 control-label">个人简介</label>
                <div class="col-sm-3">
                    <textarea class="form-control" rows="3" name="introduce"></textarea>
                </div>
            </div>
            <div class="form-group">
                <div class="col-sm-offset-2 col-sm-3">
                    <button type="submit" class="btn btn-default">注册</button>
                </div>
            </div>
        </form>
    </div>
        </div>
    </div>

</body>
</html>