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
	<div class="lefter">
		<div class="box">
			<h2>图书分类</h2>
			<c:forEach items="${booktypes}" var="bt">
			<dl>
				<dd><a href="Book/bookList?btid=${bt.btid}" >${bt.btname}</a></dd>
			</dl>
			</c:forEach>
		</div>
		<div class="spacer"></div>
		<div class="last-view">
			<h2>最近浏览</h2>
			<c:forEach items="${histories}" var="history">
			<dl class="clearfix">
				<dt><img height="50" width="50" src="<%=basePath %>images/product/${history.book.bpic}" /></dt>
				<dd><a href="Book/bookDetail?bid=${history.book.bid}">${history.book.bname}</a></dd>
			</dl>
			</c:forEach>
		</div>
	</div>
	<div class="main">
		<div class="product-list">
			<h2>全部商品</h2>
			<div class="clear"></div>
			<ul class="product clearfix">
				<c:forEach items="${books}" var="book">
				<li>
					<dl>
						<dt><a href="Book/bookDetail?bid=${book.bid}" target="_blank"><img src="<%=basePath %>images/product/${book.bpic}" /></a></dt>
						<dd class="title"><a href="Book/bookDetailbid=${book.bid}" target="_blank">${book.bname}</a></dd>
						<dd class="price">￥${book.bprice}</dd>
					</dl>
				</li>
				</c:forEach>
			</ul>
			<div class="clear"></div>
			<div class="pager">
					<ul class="clearfix">
						<c:choose>
							<c:when test="${pageIndex>1}">
							
								<c:if test="${sel_btid!=null}">
								<li><a href="Book/bookList?btid=${sel_btid}&pageIndex=1">首页</a></li>
								<li><a href="Book/bookList?btid=${sel_btid}&pageIndex=${pageIndex-1}">上一页</a></li>
								</c:if>
								<c:if test="${keyword!=null}">
								<li><a href="Book/bookSearch?key=${keyword}&pageIndex=1">首页</a></li>
								<li><a href="Book/bookSearch?key=${keyword}&pageIndex=${pageIndex-1}">上一页</a></li>
								</c:if>								
								
							</c:when>
							<c:otherwise>
								<li><span>首页</span></li>
								<li><span>上一页</span></li>
							</c:otherwise>
						</c:choose>
						<c:forEach var="index" begin="1" end="${totalPage}">

							<li
								<c:if test="${index==pageIndex}">class="current"</c:if>>
								
								<c:if test="${sel_btid!=null}">
								<a href="Book/bookList?btid=${sel_btid}&pageIndex=${index }">${index }</a>
								</c:if>
								<c:if test="${keyword!=null}">
								<a href="Book/bookSearch?key=${keyword}&pageIndex=${index }">${index }</a>
								</c:if>	
								
								</li>
						</c:forEach>
						

						<c:choose>
							<c:when test="${pageIndex<totalPage}">
							
								<c:if test="${sel_btid!=null}">
								<li><a href="Book/bookList?btid=${sel_btid}&pageIndex=${pageIndex+1 }">下一页</a></li>
								<li><a href="Book/bookList?btid=${sel_btid}&pageIndex=${totalPage }">尾页</a></li>
								</c:if>
								<c:if test="${keyword!=null}">
								<li><a href="Book/bookSearch?key=${keyword}&pageIndex=${pageIndex+1 }">下一页</a></li>
								<li><a href="Book/bookSearch?key=${keyword}&pageIndex=${totalPage}">尾页</a></li>
								</c:if>	
							
							

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
