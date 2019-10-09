<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"
	isELIgnored="false"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<base href="<%=basePath%>">
		<jsp:include page="../static/head.html" />
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
					<c:forEach items="${bts}" var="bt">
						<li>
							<a href="Page.booklist">${bt}</a>
						</li>
					</c:forEach>
				</ul>
			</div>
		</div>



		<div>
			<input type="hidden" value="${sessionScope.user.uid}" name="uid">
			<table class="table table-hover">
				<tr class="active">
					<th>
						地址
					</th>
					<th>
						电话
					</th>
					<th>
						收货人姓名
					</th>
					<th>
						操作
					</th>
				</tr>
				<c:forEach items="${receives}" var="receive">
				<input type="hidden" value="${receive.rid}" name="rid" id="rid"/>
				<input type="hidden" value="${uid}" name="uid" id="uid"/>
					<tr>
						<td>
							<input type="text" value="${receive.rmailaddr}" name="rmailaddr" id="rmailaddr" class="form-control"/>
						</td>
						<td>
							<input type="text" value="${receive.rphone}" name="rphone" id="rphone" class="form-control"/>
						</td>
						<td>
							<input type="text" value="${receive.rtargetname}"
								name="rtargetname" id="rtargetname" class="form-control"/>
						</td>
						<td class="w1 c">
							<button class="btn btn-primary" onclick="modifyAddr()"
								type="button">
								修改
							</button>
							<button class="btn btn-primary" onclick=window.location.href="Receive/deleteReceive?rid=${receive.rid}&uid=${uid}">删除</button>

						</td>
					</tr>

				</c:forEach>
			</table>
			<div class="pager">
				<button class="btn btn-primary" id="modal" style="float: left">
					新增地址
				</button>
				<ul class="clearfix">
					<c:choose>
						<c:when test="${pageIndex>1}">
							<li>
								<a href="Receive/queryByUid?pageIndex=1&uid=${uid}">首页</a>
							</li>
							<li>
								<a
									href="Receive/queryByUid?pageIndex=${pageIndex-1}&uid=${uid}">上一页</a>
							</li>
						</c:when>
						<c:otherwise>
							<li>
								<span>首页</span>
							</li>
							<li>
								<span>上一页</span>
							</li>
						</c:otherwise>
					</c:choose>

					<c:forEach var="index" begin="1" end="${totalPage}">

						<li <c:if test="${index==pageIndex}">class="current"</c:if>>
							<a
								href="Receive/queryByUid?pageIndex=${index}&uid=${uid}">${index
								}</a>
						</li>
					</c:forEach>



					<c:choose>
						<c:when test="${pageIndex<totalPage}">
							<li>
								<a
									href="Receive/queryByUid?pageIndex=${pageIndex+1 }&uid=${uid}">下一页</a>
							</li>
							<li>
								<a
									href="Receive/queryByUid?pageIndex=${totalPage }&uid=${uid}">尾页</a>
							</li>
						</c:when>
						<c:otherwise>
							<li>
								<span>下一页</span>
							</li>
							<li>
								<span>尾页</span>
							</li>
						</c:otherwise>
					</c:choose>
				</ul>
			</div>
		</div>
		<div id="addAddr" class="modal fade" tabindex="-1" data-backdrop="static" data-keyboard="false">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-body">
						<button class="close" data-dismiss="modal">
							<span>&times;</span>
						</button>
					</div>
					<div class="modal-title">
						<h1 class="text-center">
							新增地址
						</h1>
					</div>
					<div class="modal-body">
						<form class="form-group">
							<div class="form-group">
								<input type="hidden" value="${sessionScope.user.uid}"
									name="user.uid" id="uid" />
								<label for="">
									收货地址
								</label>
								<input class="form-control" type="text" name="nrmailaddr"
									id="nrmailaddr">
							</div>
							<div class="form-group">
								<label for="">
									收货人电话
								</label>
								<input class="form-control" type="text" name="nrphone"
									id="nrphone">
							</div>
							<div class="form-group">
								<label for="">
									收货人真实姓名
								</label>
								<input class="form-control" type="text" name="nrtargetname"
									id="nrtargetname">
							</div>

							<div class="text-right">
								<button class="btn btn-primary" id="submitaddr"
									name="submitaddr">
									提交
								</button>
								<button class="btn btn-danger" data-dismiss="modal">
									取消
								</button>
							</div>

						</form>
					</div>
				</div>
			</div>
		</div>
		<script type="text/javascript">

function modifyAddr() {
	var str = "Receive/modifyReceive?rid=";
	str += $("#rid").val();
	str += "&rphone=";
	str += $("#rphone").val();
	str += "&rmailaddr=";
	str += $("#rmailaddr").val();
	str += "&rtargetname=";
	str += $("#rtargetname").val();
	str+="&uid=";
	str+=$("#uid").val();
	window.location.href = str;
}
</script>
		<jsp:include page="../static/footer.html" />
		<script src="js/receiveaddr.js">
</script>
	</body>
</html>

