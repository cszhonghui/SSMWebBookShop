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
<div id="main" class="wrap">
	<div class="mainOrder">
		<h2>我的订单</h2>
		<div class="manage">
			<div class="spacer"></div>
			<table class="table table-hover">
					<c:forEach items="${orders}" var="order">
						<tr class="active">
							<td class="first w4 c">订单号:${order.onumber}</td>
							<td class="w1 c">${order.oopdate}</td>
							<td class="w1 c">收货人:${order.receive.rtargetname}</td>
							<td>收货地址：${order.receive.rmailaddr}</td>
							<td class="w1 c">订单状态</td>
							<td class="w1 c">评价状态</td>
						</tr>
						<c:forEach items="${order.odlist }" var="od">
							<tr>
								<td class="first w4 c"><a href="/Page/bookDetail?bid=${od.book.bid }">${od.book.bname }<a/></td>
								<td class="w1 c"><img height="80" width="80" src="images/product/${od.book.bpic}"></td>
								<td class="w1 c">数量：${od.bnum }</td>
								<td>￥${od.odprice }</td>
								<td>
									<c:choose>
										<c:when test="${order.ostatus==2}">
											<span>未发货</span>
										</c:when>
										<c:when test="${order.ostatus==3}">
											<span>已发货</span>
										</c:when>
										<c:otherwise>
											<span>已签收</span>
										</c:otherwise>
									</c:choose>
								</td>
								<td class="w1 c">
									<c:if test="${order.ostatus==4}">
									<c:choose>
										<c:when test="${od.odcomStatus=='1' }">
											<a href="Book/addCommentPage?bid=${od.book.bid }&uid=${user.uid }&onumber=${order.onumber}">待评价</a>
										</c:when>
										<c:otherwise>
											<span >已评价</span>
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
							<c:when test="${pageIndex>1}">
								<li><a href="Order/queryByUidPage?pageIndex=1">首页</a></li>
								<li><a href="Order/queryByUidPage?pageIndex=${pageIndex-1 }">上一页</a></li>
							</c:when>
							<c:otherwise>
								<li><span>首页</span></li>
								<li><span>上一页</span></li>
							</c:otherwise>
						</c:choose>

						<c:forEach var="index" begin="1" end="${totalPage }">

							<li
								<c:if test="${index==pageIndex}">class="current"</c:if>><a
								href="Order/queryByUidPage?pageIndex=${index }">${index }</a></li>
						</c:forEach>

						<c:choose>
							<c:when test="${pageIndex<totalPage}">
								<li><a href="Order/queryByUidPage?pageIndex=${pageIndex +1}">下一页</a></li>
								<li><a href="Order/queryByUidPage?pageIndex=${totalPage }">尾页</a></li>
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
</body>
</html>
