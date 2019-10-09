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
<div class="wrap">
<div class="main">
		<h2>确认收货地址</h2>
		<hr/>
		<div class="manage">
			<select id="rid" class="form-control" style="width:50%;">
				<c:forEach items="${receives}" var="rs">
					<option value="${rs.rid }">电话:${rs.rphone};收货人：${rs.rtargetname};邮寄地址：${rs.rmailaddr}</option>
				</c:forEach>
				</select>
		</div>

	</div>
	<h2>确认订单信息</h2>
	<div id="shopping">
		<c:choose>
		<c:when test="${order!=null}">
			<form action="#">
				<input type='hidden' id="orderid" value="${order.oid}"/>
				<input type='hidden' id="onumber" value="${order.onumber}"/>
				<table>
					<tr>
						<th>商品名称</th>
						<th>单价（元）</th>
						<th>购买数量</th>
						<th>金额（元）</th>
						
					</tr>
	 					<c:forEach items="${odlist}" var="od">   
						<tr id="product_id_1">
						<td class="thumb"><img height="80" width="80" src="images/product/${od.book.bpic}" /><a href="Page/bookDetail?bid=${od.book.bid}">${od.book.bname}</a></td>
						<td class="price" >
							<span>￥${od.odprice}</span>
							<input id="price${od.odid}" type="hidden" value="${od.odprice}" />
						</td>
						<td class="number">
							<a id="number${od.odid}" name="number">${od.bnum}</a>
						</td>
						<td class="price">
							<span >￥</span>
							<span id="goodSum${od.odid}">${od.odprice*od.bnum}</span>
						</td>
						
					</tr>
						</c:forEach>
					
					<tr>
						<td colspan="" rowspan="" headers="">合计金额</td>
							<td colspan="" rowspan="" headers=""></td>
							<td colspan="" rowspan="" headers=""></td>
							
							<td class="price" id="price_id_1">
							<span>￥</span>
							<span id="sum">${order.oamount}</span>
							<input id="hiddenSum" type="hidden" value="${order.oamount}" />
							</td>
					</tr>
				</table>
				<div class="button">
					<a href="Cart/getCartsByUid">返回购物车</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<a id="submit">
						<img onclick="confirmOrder();" src="images/orderSub.png">
					</a>
				</div>
			</form>
		</c:when>
		<c:otherwise>
			<img src="images/empty.jpg" />
		</c:otherwise>
		</c:choose>
	</div>
</div>
<jsp:include page="../static/footer.html"/>
<script src="js/order.js"></script>
</body>
</html>

