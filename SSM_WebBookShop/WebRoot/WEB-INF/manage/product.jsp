<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
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
		<h2>商品管理</h2>
		<div class="manage">
			<table class="table table-hover">
				<tr class="active">
					<th>ID</th>
					<th>商品名称</th>
					<th>操作</th>
				</tr>
				<c:forEach var="book" items="${books}">
						<tr>
							<td class="first w4 c">${book.bid }</td>
					<td class="thumb"><img height="77" width="77" src="<%=basePath %>images/product/${book.bpic}" /><a href="Book/bookDetail?bid=${book.bid}" target="_blank">${book.bname }</a></td>
					<td class="w1 c"><a href="Book/productModifyPage?bid=${book.bid}">修改</a> <a href="Book/deleteProduct?bid=${book.bid}">删除</a></td>
						</tr>
					</c:forEach>
			</table>
				<div class="pager">
					<ul class="clearfix">
						<c:choose>
							<c:when test="${pageIndex>1}">
								<li><a href="Book/showProductPage?pageIndex=1">首页</a></li>
								<li><a href="Book/showProductPage?pageIndex=${pageIndex-1 }">上一页</a></li>
							</c:when>
							<c:otherwise>
								<li><span>首页</span></li>
								<li><span>上一页</span></li>
							</c:otherwise>
						</c:choose>

						<c:forEach var="index" begin="1" end="${totalPage}">

							<li
								<c:if test="${index==pageIndex}">class="current"</c:if>><a
								href="Book/showProductPage?pageIndex=${index }">${index }</a></li>
						</c:forEach>

						<c:choose>
							<c:when test="${pageIndex<totalPage}">
								<li><a href="Book/showProductPage?pageIndex=${pageIndex+1}">下一页</a></li>
								<li><a href="Book/showProductPage?pageIndex=${totalPage }">尾页</a></li>
							</c:when>
							<c:otherwise>
								<li><span>下一页</span></li>
								<li><span>尾页</span></li>
							</c:otherwise>
						</c:choose>
					</ul>
				</div>
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
