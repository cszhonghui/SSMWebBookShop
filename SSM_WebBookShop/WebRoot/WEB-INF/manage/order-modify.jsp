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
		<h2>修改订单</h2>
		<div class="manage">
			<form action="Order/modifyOrder">
				<table class="form">
					<tr>
						<td class="field">订单ID：</td>
						<td><input type="text" class="text"  id="oid" name="oid" value="${order.oid }" readonly /></td>
					</tr>
					<tr>
						<td class="field">订单流水号：</td>
						<td><input type="text" class="text"  id="onumber" value="${order.onumber }" readonly /></td>
					</tr>
					<tr>
						<td class="field">收件人姓名：</td>
						<td><input type="text" class="text"  id="targetname" value="${order.receive.rtargetname }" readonly/></td>
					</tr>
					<tr>
						<td class="field">邮寄地址：</td>
						<td><input type="text" class="text"  id="address" value="${order.receive.rmailaddr }" readonly/></td>
					</tr>
					<tr>
						<td class="field">状态：</td>
							<td><select id="status" name="ostatus" class="form-control" style="width: 90px;">
									<option value="1" <c:if test="${order.ostatus==1 }">selected="selected"</c:if>>未确认</option>
									<option value="2" <c:if test="${order.ostatus==2 }">selected="selected"</c:if>>未发货</option>
									<option value="3" <c:if test="${order.ostatus==3 }">selected="selected"</c:if>>已发货</option>
									<option value="4" <c:if test="${order.ostatus==4 }">selected="selected"</c:if>>已签收</option>
								</select>
							</td>
						</tr>
					<tr>
						<td></td>
						<td><input class="btn btn-info" type="submit" name="submit" value="更新" /></td>
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
</script>
</body>
</html>
