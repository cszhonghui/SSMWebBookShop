
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<html>
<head>
    <meta charset="utf-8">
    <base href="<%=basePath%>">
    <title>BOOK HOUSE后台管理系统登录登陆界面</title>
    <meta name="viewport" content="width=device-width">
    <link href="css/base.css" rel="stylesheet" type="text/css">
    <link href="css/login.css" rel="stylesheet" type="text/css">
</head>
<body>

<div class="login">
    <form action="Administrator/login">
        <div class="logo"></div>
        <div class="login_form">
            <div class="user">
                <input class="text_value"  name="ausername" id="ausername" type="text" style="width:245px;height:50px;" />
                <input class="text_value"  name="apassword" id="apassword" type="password" style="width:245px;height:50px;"/>
            </div>
            <button class="button" id="submit" type="submit" >登录</button>
        </div>

        <div id="tip"></div>

    </form>
</div>
<script>var basedir='ui/';</script>
<script type="text/javascript" src="js/jquery.min.js"></script>
<script src="ui/do.js"></script>
<script src="ui/config.js"></script>
<script src="js/manageLogin.js"></script>

</body>
</html>
