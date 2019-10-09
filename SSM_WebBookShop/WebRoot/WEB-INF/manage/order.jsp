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
	<meta charset="utf-8">
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
		<h2>订单管理</h2>
		<div class="manage">
			<div class="search">
				<form id="searchInput" method="post" action="Order/search" class="form-inline">
					<div class="form-group">
						<label for="onumber">订单号：</label>
						<input class="form-control" type="text" id="onumber" name="onumber"/>
					</div>
					<div class="form-group">
						<label for="oname">收货人：</label>
						<input class="form-control" type="text" class="text" id="oname" name="oname"/>
					</div>
					<%--订单号：<input class="form-control" type="text" class="text" id="oid" name="oid" /> 收货人：<input class="form-control" type="text" class="text" id="oname" name="oname" /> --%>
					<input type="submit" class="btn btn-info" value="搜索">
				</form>
			</div>
			<div class="spacer"></div>
			<table class="table table-hover">
					<c:forEach items="${orders}" var="order">
						<tr class="active ">
							<td class="first w4 c">订单号:<br/>${order.oid}</td>
							<td class="w1 c">${order.oopdate}</td>
							<td class="w1 c">收货人:<br/>${order.receive.rtargetname}</td>
							<td>收货地址：<br/>${order.receive.rmailaddr}</td>
							<td class="w1 c"><a href="Order/modifyPage?onumber=${order.onumber}">修改</a></td>
							<td class="w1 c"><a href="Order/cancelOrder?oid=${order.oid}">删除</a></td>
						</tr>
							<c:forEach items="${order.odlist}" var="od">
								<tr>
								<td class="first w4 c">${od.book.bname }</td>
								<td class="w1 c"><img height="80" width="80" src="images/product/${od.book.bpic}"></td>
								<td class="w1 c">数量：${od.bnum }</td>
								<td>￥${od.odprice*od.bnum }</td>
								<td class="w1 c">
									<c:choose>
										<c:when test="${order.ostatus==1}">
											<span>未确认订单</span>
										</c:when>
										<c:when test="${order.ostatus==2}">
											<span>未发货</span>
										</c:when>
										<c:when test="${order.ostatus==3}">
											<span>已发货</span>
										</c:when>
										<c:when test="${order.ostatus==4}">
											<span>已签收</span>
										</c:when>
										<c:otherwise>
											<span>已评价</span>
										</c:otherwise>									
									</c:choose>
								</td>
								<td class="w1 c">
									<c:if test="${order.ostatus==4}">
										<c:choose>
											<c:when test="${od.odcomStatus==1}">
												<span>未评价</span>
											</c:when>
											<c:otherwise>
												<span>已评价</span>
											</c:otherwise>									
										</c:choose>
									</c:if>
								</td>
								</tr>
							</c:forEach>
					</c:forEach>
				</table>
			<div class="pager">
				<ul class="clearfix">
					<c:choose>
						<c:when test="${search==null}">
							<c:choose>
								<c:when test="${pageIndex>1}">
									<li><a href="Order/queryPage?pageIndex=1">首页</a></li>
									<li><a href="Order/queryPage?pageIndex=${pageIndex-1 }">上一页</a></li>
								</c:when>
								<c:otherwise>
									<li><span>首页</span></li>
									<li><span>上一页</span></li>
								</c:otherwise>
							</c:choose>
							<c:forEach var="index" begin="1" end="${totalPage }">
								<li
									<c:if test="${index==pageIndex}">class="current"</c:if>><a
									href="Order/queryPage?pageIndex=${index }">${index }</a>
								</li>
							</c:forEach>
							<c:choose>
								<c:when test="${pageIndex<totalPage}">
									<li><a href="Order/queryPage?pageIndex=${pageIndex +1}">下一页</a></li>
									<li><a href="Order/queryPage?pageIndex=${totalPage }">尾页</a></li>
								</c:when>
								<c:otherwise>
									<li><span>下一页</span></li>
									<li><span>尾页</span></li>
								</c:otherwise>
							</c:choose>
						</c:when>
						<c:otherwise>
							<c:choose>
								<c:when test="${pageIndex>1}">
									<li><a href="Order/search?onumber=${onumber }&oname=${oname }&pageIndex=1">首页</a></li>
									<li><a href="Order/search?onumber=${onumber }&oname=${oname }&pageIndex=${pageIndex-1 }">上一页</a></li>
								</c:when>
								<c:otherwise>
									<li><span>首页</span></li>
									<li><span>上一页</span></li>
								</c:otherwise>
							</c:choose>
							<c:forEach var="index" begin="1" end="${totalPage }">
								<li
									<c:if test="${index==pageIndex}">class="current"</c:if>><a
									href="Order/search?onumber=${onumber }&oname=${oname }&pageIndex=${index }">${index }</a>
								</li>
							</c:forEach>
							<c:choose>
								<c:when test="${pageIndex<totalPage}">
									<li><a href="Order/search?onumber=${onumber }&oname=${oname }&${pageIndex +1}">下一页</a></li>
									<li><a href="Order/search?onumber=${onumber }&oname=${oname }&${totalPage }">尾页</a></li>
								</c:when>
								<c:otherwise>
									<li><span>下一页</span></li>
									<li><span>尾页</span></li>
								</c:otherwise>
							</c:choose>
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
<script src="js/order.js"></script>
</body>
</html>
