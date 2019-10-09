<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<base href="<%=basePath%>">
	<jsp:include page="../static/back-head.html"/>
</head>
<body onload="getNowFormatDate()">
<div id="header" class="wrap">
	<div id="logo"><img src="images/logo.gif" /></div>
	<div class="help"><a href="index">返回前台页面</a></div>
	<div class="navbar">
		<ul class="bar">
			<li class="current"><a href="manager">首页</a></li>
			<li><a href="User/paging">用户</a></li>
			<li><a href="Book/showProductPage">商品</a></li>
			<li><a href="Order/queryPage">订单</a></li>

		</ul>
	</div>
</div>
<div id="childNav">
	<div class="welcome wrap">
		管理员您好，今天是<span id="time"></span>，欢迎回到管理后台。

	</div>
</div>
<div id="main" class="wrap">
	<div id="menu-mng" class="lefter">
		<div class="box">
			<dl>
				<dt>用户管理</dt>
				<dd><a href="User/paging">用户管理</a></dd>
				<dt>商品管理</dt>
				<dd><em><a href="Book/productAddPage">新增</a></em><a href="Book/showProductPage">商品管理</a></dd>
				<dt>订单管理</dt>
				<dd><a href="Order/queryPage">订单管理</a></dd>
			</dl>
		</div>
	</div>
	<div class="main">
		<h2>修改用户</h2>
		<div class="manage">
			<form>
						
				<table class="form">
					<input type="hidden" class="text" name="uid" value="${user.uid }" id="uid" />					
					<tr>
						<td class="field">用户名：</td>
						<td><input type="text" class="text" name="uusername" value="${user.uusername }" id="uusername" /></td>
					</tr>
					<tr>
						<td class="field">密码：</td>
						<td><input type="text" class="text" name="upassword" value="${user.upassword }" id="upassword"/></td>
					</tr>
					<tr>
						<td class="field">性别：</td>
						<td>
						<input type="radio" name="ugender" id="ugender" value="1" <c:if test="${user.ugender=='1'}"> checked="checked"</c:if>/>男
						<input type="radio" name="ugender" id="ugender" value="0" <c:if test="${user.ugender==0 }"> checked="checked"</c:if>/>女
						</td>
					</tr>
					<tr>
						<td class="field">生日：</td>
						<td><input type="date" class="form-control" name="ubirthdate" id="ubirthdate" value="${birthday}" style="width:200px;" /></td>
					</tr>
					<tr>
						<td class="field">邮箱：</td>
						<td><input type="text" class="text" name="uemail" id="uemail" value="${user.uemail }" /></td>
					</tr>
					<tr>
						<td class="field">手机号码：</td>
						<td><input type="text" class="text" name="uphone" id="uphone" value="${user.uphone}" /></td>
					</tr>
					<tr>
						<td></td>
						<td><input class="btn btn-info" type="submit" name="submit" id="submit" value="更新" /></td>
					</tr>
				</table>
			</form>
		</div>
	</div>
	<div class="clear"></div>
</div>
<jsp:include page="../static/footer.html"/>
<script type="text/javascript">
$(document).ready(function(){  
     if(${sessionScope.admin==null}){
     	alert("您不是管理员，请先登录！")
     	window.location.href="backlogin";
     }
}); 
$("#ubirthdate").change(function(){
    $("#ubirthdate").attr("value",$(this).val()); //赋值
});
$(document).ready(function(){
    $("#submit").click(function(){
        $.ajax({
            type: "post",
            url: "User/modifyInfoAll",
            data: {
                uusername:$("#uusername").val(),
                ugender:$('input[type=radio][name=ugender]:checked').val(),
                uemail:$("#uemail").val(),
                uphone:$("#uphone").val(),
                ubirthdate:$("#ubirthdate").val(),
                upassword:$("#upassword").val(),
                uid:$("#uid").val()
               
            },
            dataType: "text",
            success: function(result){
                if(result=='success'){
                	alert("修改用户信息成功！");
                   window.location.href="User/paging";
                }
                else{
                	alert("用户名已存在");
                	window.location.href="User/paging";
                }
            },
            error: function() {
                alert("系统崩溃");
                window.location.href="User/paging";
            }
        });
    });
});
</script>
</body>
</html>
