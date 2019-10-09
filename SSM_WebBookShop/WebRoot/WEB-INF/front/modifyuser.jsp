<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" isELIgnored="false"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<base href="<%=basePath%>">
	<jsp:include page="../static/head.html"/>
</head>
<body>
<div id="header" class="wrap">
	<div id="logo"><img src="<%=basePath %>images/logo.gif" /></div>
	<div class="help">
	<c:if test="${sessionScope.user!=null}">
		<a href="Cart/getCartsByUid" class="shopping">查看购物车</a>
	</c:if>
		<c:if test="${sessionScope.user!=null}"><a href="Order/queryByUidPage"}">我的订单</a>&nbsp;用户:${sessionScope.user.uusername}&nbsp;&nbsp;<a href="modifyUser">更新个人信息</a><a href="Receive/queryByUid?uid=${user.uid}&pageIndex=1&pageSize=10">个人地址管理</a><a href="resetPwd">修改密码</a><a href="User/logout">注销</a></c:if>
		<c:if test="${sessionScope.user==null}">
			<button type="button" class="btn btn-default" onclick="window.location.href='login'">登陆</button>
			<button type="button" class="btn btn-default" onclick="window.location.href='reg'">注册</button>
		</c:if>
	</div>
	<div class="navbar">
		<button type="button" onclick="window.location.href='index'" class="btn btn-warning btn-lg ">首页</button>
		<div class="searchBook">
			<form method="post" action="Book/bookSearch">
				查找书籍：<input  type="text" class="text" name="key"  /> <input class="btn btn-info" type="submit" name="submit" value="搜索" />
			</form>
		</div>
	</div>
</div>
<div id="childNav">
	<div class="wrap">
		<ul class="clearfix">
			<c:forEach items="${booktypes}" var="bt">
			<li><a href="Book/bookList?btid=${bt.btid}" >${bt.btname}</a></li>
			</c:forEach>		</ul>
	</div>
</div>
<div id="register" class="wrap">
	<div class="shadow">
		<em class="corner lb"></em>
		<em class="corner rt"></em>
		<div class="main">
		<h2>修改用户</h2>
		<div class="manage">
			<form id="Form">
						<input type="hidden" class="text" name="uid" value="${user.uid }" />
				<table class="form">
					<tr>
						<td class="field">用户名：</td>
						<td><input type="text" class="form-control" name="uusername" id="uusername" value="${user.uusername }" readonly style="width:200px;"/></td>
					</tr>
					<tr>
						<td class="field">性别：</td>
						<td>
						<input type="radio" name="ugender" id="ugender" value="1" <c:if test="${user.ugender=='1'}"> checked="checked"</c:if>/>男
						<input type="radio" name="ugender" id="ugender" value="0" <c:if test="${user.ugender=='0'}"> checked="checked"</c:if>/>女
						</td>
					</tr>
					<tr>
						<td class="field">邮箱：</td>
						<td><input type="text" class="form-control" name="uemail" id="uemail" value="${user.uemail }" style="width:200px;" /></td>
					</tr>
					<tr>
						<td class="field">手机号码：</td>
						<td><input type="text" class="form-control" name="uphone" id="uphone" value="${user.uphone}" style="width:200px;" /></td>
					</tr>
					<tr>
						<td class="field">生日：</td>
						<td><input type="date" class="form-control" name="ubirthdate" id="ubirthdate" value="${birthday}" style="width:200px;" /></td>
					</tr>
					
					<tr>
						<td></td>
						<td><input class="btn btn-info" type="button" name="submit" id="submit" value="更新" /></td>
					</tr>
				</table>
			</form>
		</div>
	</div>
	</div>
	<div class="clear"></div>
</div>
<jsp:include page="../static/footer.html"/>
<script src="js/modifyuser.js"></script>
</body>
</html>

