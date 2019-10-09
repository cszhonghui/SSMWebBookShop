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

		<!--图标样式-->
		<link
			href="https://cdn.bootcss.com/font-awesome/5.7.2/css/all.min.css"
			rel="stylesheet">

		<!--主要样式-->
		<link href="disk/slidercaptcha.css" rel="stylesheet" />

		<style>
.slidercaptcha {
	margin: 0 auto;
	width: 314px;
	height: 286px;
	border-radius: 4px;
	box-shadow: 0 0 10px rgba(0, 0, 0, 0.125);
	margin-top: 40px;
}

.slidercaptcha .card-body {
	padding: 1rem;
}

.slidercaptcha canvas:first-child {
	border-radius: 4px;
	border: 1px solid #e6e8eb;
}

.slidercaptcha.card .card-header {
	background-image: none;
	background-color: rgba(0, 0, 0, 0.03);
}

.refreshIcon {
	top: -39px;
}

.modal-backdrop {
	opacity: 0 !important;
	filter: alpha(opacity =   0) !important;
}
</style>

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
		<div id="register" class="wrap">
			<div class="shadow">
				<em class="corner lb"></em>
				<em class="corner rt"></em>
				<div class="box">
					<h1>
						欢迎登陆BOOK HOUSE
					</h1>
					<form id="loginForm">
						<table>
							<tr>

								<td class="field">
									用户名：
								</td>
								<td>
									<input class="text form-control" type="text" name="uusername"
										id="uusername" />
								</td>
							</tr>
							<tr>
								<td class="field">
									登录密码：
								</td>
								<td>
									<input class="text form-control" type="password"
										name="upassword" id="upassword" />
								</td>
							</tr>
							<tr>
								<td></td>
								<td>
									<input class="btn btn-info" type="button" id="submit"
										value="登录" />
								</td>
							</tr>
						</table>
					</form>
				</div>
			</div>
			<div class="clear"></div>
		</div>

		<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
			aria-labelledby="myModalLabel" aria-hidden="true"
			data-backdrop="static" data-keyboard="false">
			<div class="container-fluid" style="text-align: center">

				<div class="slidercaptcha card" style="opacity: 1 ! import">
					<div class="card-header" style="text-align: center">
						<h4>
							请完成安全验证
						</h4>
					</div>
					<div class="card-body">
						<div id="captcha"></div>
					</div>
				</div>

				<div class="btn btn-info"
					style="margin-top: -40px; margin-right: -220px"
					data-dismiss="modal">
					取消
				</div>
			</div>

		</div>
		<jsp:include page="../static/footer.html" />
		<script src="js/login.js">
</script>

		<script src="disk/longbow.slidercaptcha.js">
</script>
		<script type="text/javascript">
$('#captcha').sliderCaptcha(
		{
			repeatIcon : 'fa fa-redo',
			setSrc : function() {
				return 'http://images.sdgxgz.com/Pic' + Math.round(Math
						.random() * 136) + '.jpg';
			},
			onSuccess : function() {

				$.ajax( {
					type : "post",
					url : "User/login",
					data : {
						uusername : $("#uusername").val(),
						upassword : $("#upassword").val()

					},
					dataType : "text",
					success : function(result) {
						$('#myModal').modal('hide');
						if (result == 'success') {

							window.location.href = "index";
						}
						if (result == 'false') {

							alert("账号或密码不正确");
							window.location.href = "login";
						}
						if (result == 'nameEmpty') {

							alert("账号不能为空");
							window.location.href = "login";
						}
						if (result == 'pwdEmpty') {

							alert("密码不能为空");
							window.location.href = "login";
						}
					},
					error : function() {

						alert("登陆失败");
						window.location.href = "login";
					}
				});
			}
		});
</script>
	</body>
</html>

