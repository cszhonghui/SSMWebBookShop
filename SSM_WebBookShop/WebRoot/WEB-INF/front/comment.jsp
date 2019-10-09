<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" isELIgnored="false" %>
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
		<c:if test="${sessionScope.user!=null}">
			<a href="Order/queryByUidPage"}">我的订单</a>&nbsp;
			用户:${sessionScope.user.uusername}&nbsp;&nbsp;
			<a href="modifyUser">更新个人信息</a>
			<a href="Receive/queryByUid?uid=${user.uid}&pageIndex=1&pageSize=10">个人地址管理</a>
			<a href="resetPwd">修改密码</a>
			<a href="User/logout">注销</a>
		</c:if>
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

        <div id="product" class="main">
            <h1>${book.bname }</h1>
            <div class="infos">
                <div class="thumb"><img height="100" width="100" src="images/product/10.jpg"/>
                    <p>价格：<span class="price">￥${book.bprice }</span></p>
                </div>
                <div class="buy">

                    <div id="reply-box">
                        <form action="Book/addCommentAction">
                            <table>
                                <input type="hidden" name="user.uid" value="${uid}"/>
                                <input type="hidden" name="odid" value="${odid}"/>
                                <input type="hidden" name="book.bid" value="${book.bid }"/>
                                <input type="hidden" name="uname" value="${sessionScope.user.uusername }"/>
                                <input type="hidden" name="onumber" value="${onumber}"/>
                                <tr>
                                    <td class="field">评价内容：</td>
                                    <td><textarea name="ccontent"></textarea></td>
                                </tr>
                                <tr>
                                    <td></td>
                                    <td><label class="ui-blue"><input type="submit" value="提交评价"/></label>
                                    </td>
                                </tr>
                            </table>
                        </form>
                    </div>

                </div>
                <div class="clear"></div>
            </div>

        </div>

    </div>
    <div class="clear"></div>
</div>
<jsp:include page="../static/footer.html"/>
</body>
</html>
