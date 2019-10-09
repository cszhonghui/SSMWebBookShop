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
<script type="text/javascript">
function addNum() {
    var num = parseInt(document.getElementById("number").value);
    var max=parseInt("${book.bstock}");    
    if (num < max) {
        document.getElementById("number").value = ++num;
    }
}
function subNum() {
    var num = parseInt(document.getElementById("number").value);
    if (num > 1) {
        document.getElementById("number").value = --num;
    }
}







</script>

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
			<c:forEach items="${histories}" var="history" end="4">
			<dl class="clearfix">
				<dt><img height="50" width="50" src="<%=basePath %>images/product/${history.book.bpic}" /></dt>
				<dd><a href="Book/bookDetail?bid=${history.book.bid}">${history.book.bname}</a></dd>
			</dl>
			</c:forEach>
		</div>
	</div>
	<div id="product" class="main">
		<h1>${book.bname}</h1>
		<h3> </h3>
		<div class="infos">
			<div class="thumb"><img height="300" width="300" src="<%=basePath %>images/product/${book.bpic}" /></div>
			<div class="buy">
				<p>价格：￥<span id="odprice" class="price">${book.bprice}</span></p>
				<p>作 者：${book.bauthor}</p>
				<p>出版社：${book.bpublisher}</p>
			<!--<p>出版日期：${bo}</p>  -->	
				<p>库　存：${book.bstock}</p>
				<p>购买数量：<span id="sub" onclick="subNum();"><span class="glyphicon glyphicon-minus" aria-hidden="true"></span></span>&nbsp;
					<input style="height: 25px; width:25px;"  id="number" name="number"  value="1" size="2" readonly/>&nbsp;
					<span id="add" onclick="addNum();"><span class="glyphicon glyphicon-plus" aria-hidden="true"></span></span></p>
				<div class="button">
				<c:if test="${book.bstock>0}">
					<%--<input id="buy" type="button" name="button"  />--%>
					<!-- 立刻购买 -->
					<a id="buy"><img class="buyBtn" src="images/buy.jpg"></a>&nbsp;&nbsp;&nbsp;
				<input type="hidden" id="bid" value="${book.bid}"  />&nbsp;&nbsp;&nbsp;
				<!-- 购物车 -->
				<a id="submit" ><img src="images/cart.png"></a>
				</c:if>
				<c:if test="${book.bstock==0}">
					<img src="images/null.png">
				</c:if>
				</div>
			</div>
			<div class="clear"></div>
		</div>
		<div class="introduce">
			<h2><strong>商品详情</strong></h2>
			<div class="text">
				${book.bcontent}
			</div>
		</div>
		
		<div class="guestbook">
			<h2>商品评价</h2>
			<ul>
				<c:forEach items="${comments}" var="comment">
				<li>
					<dl>
						<dt>网友：${comment.user.uusername} </dt>
						<dd>${comment.ccontent}</dd>
						<dd> <span class="timer">${comment.cdate}</span></dd>
					</dl>
				</li>
				</c:forEach>
			</ul>
			<div class="clear"></div>
			<c:if test="${comments.size()!=0}">
			<div class="pager">
					<ul class="clearfix">
						<c:choose>
							<c:when test="${pageIndex>1}">
								<li><a href="Book/bookDetail?pageIndex=1&bid=${book.bid}">首页</a></li>
								<li><a href="Book/bookDetail?pageIndex=${pageIndex-1}&bid=${book.bid}">上一页</a></li>
							</c:when>
							<c:otherwise>
								<li><span>首页</span></li>
								<li><span>上一页</span></li>
							</c:otherwise>
						</c:choose>
						
						<c:forEach var="index" begin="1" end="${totalPage}">

							<li
								<c:if test="${index==pageIndex}">class="current"</c:if>><a
								href="Book/bookDetail?pageIndex=${pageIndex}&bid=${book.bid}">${index }</a></li>
						</c:forEach>
						


						<c:choose>
							<c:when test="${pageIndex<totalPage}">
								<li><a href="Book/bookDetail?pageIndex=${pageIndex+1 }&bid=${book.bid}">下一页</a></li>
								<li><a href="Book/bookDetail?pageIndex=${totalPage }&bid=${book.bid}">尾页</a></li>
							</c:when>
							<c:otherwise>
								<li><span>下一页</span></li>
								<li><span>尾页</span></li>
							</c:otherwise>
						</c:choose>
					</ul>
				</div>
			</c:if>
				<c:if test="${comments.size()==0}">
					<div class="introduce">
						<div class="text">该商品还没有人写评价呢~</div>
					</div>
				</c:if>
			</div>
	</div>
	<div class="clear"></div>
</div>
<jsp:include page="../static/footer.html"/>
<script src="js/product.js"></script>
</body>
</html>

