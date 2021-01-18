<%--
  Created by IntelliJ IDEA.
  User: lixin
  Date: 2021/1/14
  Time: 10:17
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <title></title>
    <link href="../css/registercss.css" rel="stylesheet"  />
    <script src="../js/My97DatePicker/WdatePicker.js"></script>
    <script>

        function checkUsername(){
            var username = document.getElementById('username').value;
            var usernameReg = /^[a-zA-Z]{5,10}$/;

            if(usernameReg.test(username)){
                document.getElementById('usernameSpan').style.color='green';
                document.getElementById('usernameSpan').innerHTML="√";
                return true;
            }else{
                document.getElementById('usernameSpan').style.color='red';
                document.getElementById('usernameSpan').style.fontSize='12px';
                document.getElementById('usernameSpan').innerHTML="用户名格式不正确";
                return false;
            }
        }


        function checkPassword(){
            var pwd = document.getElementById('pwd').value;
            var pwdReg = /^[a-zA-Z0-9]{6,12}$/;
            if(pwdReg.test(pwd)){
                document.getElementById('pwdSpan').style.color='green';
                document.getElementById('pwdSpan').innerHTML="√";
                return true;
            }else{
                document.getElementById('pwdSpan').style.color='red';
                document.getElementById('pwdSpan').style.fontSize='12px';
                document.getElementById('pwdSpan').innerHTML="密码格式不正确";
                return false;
            }
        }

        function checkRepassword(){
            var pwd = document.getElementById('pwd').value;
            var repwd= document.getElementById('repwd').value;

            if(pwd==repwd){
                document.getElementById('repwdSpan').style.color='green';
                document.getElementById('repwdSpan').innerHTML="√";
                return true;
            }else{
                document.getElementById('repwdSpan').style.color='red';
                document.getElementById('repwdSpan').style.fontSize='12px';
                document.getElementById('repwdSpan').innerHTML="两次密码不一致";
                return false;

            }
        }

        function checkEmail(){
            var email = document.getElementById('email').value;
            var emailReg = /^[a-z\d]+(\.[a-z\d]+)*@([\da-z](-[\da-z])?)+(\.{1,2}[a-z]+)+$/;

            if(email==''){
                return true;
            }else{

                if(emailReg.test(email)){
                    document.getElementById('emailSpan').style.color='green';
                    document.getElementById('emailSpan').innerHTML="√";
                    return true;
                }else{
                    document.getElementById('emailSpan').style.color='red';
                    document.getElementById('emailSpan').style.fontSize='12px';
                    document.getElementById('emailSpan').innerHTML="邮箱格式不正确";
                    return false;
                }

            }
        }

        function checkName(){

            var name = document.getElementById('name').value;
            var nameReg = /^[\u4E00-\u9FA5]{2,20}$/;

            if(name==''){
                return true;
            }else{

                if(nameReg.test(name)){
                    document.getElementById('nameSpan').style.color='green';
                    document.getElementById('nameSpan').innerHTML="√";
                    return true;
                }else{
                    document.getElementById('nameSpan').style.color='red';
                    document.getElementById('nameSpan').style.fontSize='12px';
                    document.getElementById('nameSpan').innerHTML="姓名格式不正确";
                    return false;
                }

            }
        }


        function checkForm(){
            if(checkUsername() && checkPassword()&& checkRepassword() && checkEmail()&& checkName()){
                return true;
            }else{
                return false;
            }
        }
    </script>
</head>
<body>
<!-- 整个页面是一个table表格-->
<table width="100%">
    <!-- 第一行 logo部分-->
    <tr>
        <td>
            <table width="100%">
                <tr>
                    <td>
                        <img src="../img/logo.jpg" />
                    </td>
                    <td>
                        <img src="../img/img5.jpg"  />&nbsp;&nbsp;
                        <img src="../img/img6.jpg"  />&nbsp;&nbsp;
                        <img src="../img/img7.jpg"  />&nbsp;&nbsp;
                        <img src="../img/img4.jpg"  />&nbsp;&nbsp;
                    </td>
                    <td>
                        <a href="login.html"><font color="#337AB7">登录</font></a>&nbsp;&nbsp;
                        <a href="register.html"><font color="#337AB7">注册</font></a>&nbsp;&nbsp;
                        <a href="cart.html"><font color="#337AB7">购物车</font></a>&nbsp;&nbsp;
                    </td>
                </tr>
            </table>
        </td>
    </tr>

    <!-- 第二行：注册部分-->
    <tr>
        <td>
            <div style="width:100%;background-image:url('../image/registerBack.jpg'); background-size: cover;">
                <form action="${pageContext.request.contextPath}/UserServlet?method=reg" method="post" onsubmit="return checkForm()" class="bootstrap-frm">
                    <h1>会员注册
                        <span>USER REGISTER</span>
                    </h1>

                    <label>
                        <span>用户名</span>
                        <input type="text" name="username" id="username" placeholder="请输入用户名" onblur="checkUsername()" />
                        <b id="usernameSpan"></b>
                    </label>

                    <label>
                        <span>密码</span>
                        <input type="password" name="password" id="pwd" placeholder="请输入密码" onblur="checkPassword()" />
                        <b id="pwdSpan"></b>
                    </label>

                    <label>
                        <span>确认密码</span>
                        <input type="password" name="repassword" id="repwd" placeholder="请输入确认密码" onblur="checkRepassword()" />
                        <b id="repwdSpan"></b>
                    </label>

                    <label>
                        <span>Email</span>
                        <input type="email" name="email" id="email" placeholder="请输入Email" onblur="checkEmail()" />
                        <b id="emailSpan"></b>
                    </label>

                    <label>
                        <span>姓名</span>
                        <input type="text" name="name" id="name" placeholder="请输入姓名"  onblur="checkName()" />
                        <b id="nameSpan"></b>
                    </label>

                    <label>
                        <span>性别</span>
                        <select name="sex">
                            <option>男</option>
                            <option>女</option>
                        </select>
                    </label>

                    <label>
                        <span>出生日期</span>
                        <input class="Wdate" type="text" name="birthday" placeholder="请输入生日" onclick="WdatePicker({el:this,dateFmt:'yyyy-MM-dd'})" />
                    </label>

                    <label>
                        <span>&nbsp;</span>
                        <input type="submit" value="注册"  style="background: url('../image/register.gif') no-repeat scroll 0 0 rgba(0, 0, 0, 0);
				    height:35px;width:100px;color:white;" />
                    </label>
                </form>
            </div>
        </td>
    </tr>

    <!-- 第三行： 友情链接-->
    <tr align="center">
        <td>
            <p>
                <a href=""><font color="#337AB7">关于我们</font></a>&nbsp;&nbsp;
                <a href=""><font color="#337AB7">联系我们</font></a>&nbsp;&nbsp;
                <a href=""><font color="#337AB7">联系客服</font></a>&nbsp;&nbsp;
                <a href=""><font color="#337AB7">合作招商</font></a>&nbsp;&nbsp;
                <a href=""><font color="#337AB7">商家帮助 </font></a>&nbsp;&nbsp;
                <a href=""><font color="#337AB7">营销中心</font></a>&nbsp;&nbsp;
                <a href=""><font color="#337AB7">手机帮助</font></a>&nbsp;&nbsp;
                <a href=""><font color="#337AB7">销售联盟</font></a>&nbsp;&nbsp;
            </p>
        </td>
    </tr>

    <!--第四行： 版权信息-->
    <tr align="center">
        <td>
            ©&copy; 2005-2020 东易买 版权所有，并保留所有权利
        </td>
    </tr>

</table>
</body>
</html>
