<%@ page language="java" pageEncoding="UTF-8" isELIgnored="false" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
    <div id="shopping">
        <c:if test="${sessionScope.carts!=null}">
            <form action="shopping-result.html">
                <table class="table table-hover">
                    <tr>
                        <th>商品名称</th>
                        <th>单价（元）</th>
                        <th>购买数量</th>
                        <th>金额（元）</th>
                        <th>操作</th>
                    </tr>
                    <c:forEach items="${sessionScope.carts}" var="cart">
                        <tr id="product_id_${cart.cid}">
                            <td class="thumb"><img height="80" width="80" src="images/product/${cart.book.bpic}"/><a
                                    href="bookView.do?bid=${cart.book.bid}">${cart.book.bname}</a></td>
                            <td class="price">
                                <span>￥${cart.book.bprice}</span>
                                <input id="price${cart.cid}" type="hidden" value="${cart.book.bprice}"/>
                            </td>
                            <td class="number">
                                <span id="sub" onclick="sub(${cart.cid},${cart.book.bstock});"><span class="glyphicon glyphicon-minus" aria-hidden="true"></span></span>
                                <input style="height: 25px; width:25px;" type="text" id="number${cart.cid}" name="number" value="${cart.cbnum}" size="2" readonly/>
                                <span id="add" onclick="add(${cart.cid},${cart.book.bstock});"><span class="glyphicon glyphicon-plus" aria-hidden="true"></span></span>
                            </td>
                            <td class="price">
                                <span>￥</span>
                                <span id="goodSum${cart.cid}">${cart.book.bprice*cart.cbnum}</span>
                            </td>
                            <td class="delete"><a onclick="deleteCart(${cart.cid});">删除</a></td>
                        </tr>
                    </c:forEach>

                    <tr class="warning">
                        <td colspan="" rowspan="" headers="">合计金额</td>
                        <td colspan="" rowspan="" headers=""></td>
                        <td colspan="" rowspan="" headers=""></td>
                        <td colspan="" rowspan="" headers=""></td>
                        <td class="price" id="price_id_1">
                            <span>￥</span>
                            <span id="sum">${sessionScope.carttotal }</span>
                            <input id="hiddenSum" type="hidden" value="${sessionScope.carttotal}"/>
                        </td>
                    </tr>
                </table>
                <div class="button">
                    <a href="Cart/clear">清空购物车</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <c:if test="${sessionScope.user!=null}"><a id="submit" href="Order/genOrder?user.uid=${user.uid }&oamount=${sessionScope.carttotal }"><img
                            src="images/pay.png"></a></c:if>
                    <c:if test="${sessionScope.user==null}"><a onclick="unLog();" href="#"><img
                            src="images/pay.png"></a></c:if>


                </div>
            </form>
        </c:if>
        <c:if test="${sessionScope.carts==null}">
            <img src="images/empty.jpg"/>
        </c:if>

    </div>
</div>
<jsp:include page="../static/footer.html"/>
<script src="js/cart.js"></script>
</body>
</html>

