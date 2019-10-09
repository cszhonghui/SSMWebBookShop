<%@ page language="java" import="java.util.*" pageEncoding="utf-8"
	isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
	<meta charset="utf-8">
		<base href="<%=basePath%>">
		<jsp:include page="../static/back-head.html" />

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
				管理员您好，今天是
				<span id="time"></span>，欢迎回到管理后台。
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
				<h2>
					用户管理
				</h2>
				<div class="manage">
					<table class="table table-hover">
						<tr class="active">
							<th>
								ID
							</th>
							<th>
								姓名
							</th>
							<th>
								性别
							</th>
							<th>
								Email
							</th>
							<th>
								手机
							</th>
							<th>
								操作
							</th>
						</tr>
						<c:forEach var="user" items="${users}">
							<tr>
								<td class="first w4 c">
									${user.uid}
								</td>
								<td class="w1 c">
									${user.uusername}
								</td>
								<td class="w2 c">
									<c:if test="${user.ugender==1}" var="flag">
										男
									</c:if>
									<c:if test="${user.ugender==0}" var="flag">
										女
									</c:if>
									<c:if test="${not flag}">
										未知
									</c:if>
								</td>
								<td>
									${user.uemail}
								</td>
								<td class="w4 c">
									${user.uphone}
								</td>
								<td class="w1 c">
									<button onclick=window.location.href="User/modifyInfoAllPage?uid=${user.uid}" style="margin-right: 10px" class="btn btn-primary">修改</button>
									<button onclick=window.location.href="User/deleteUser/?uid=${user.uid}" class="btn btn-primary">删除</button>
								</td>
							</tr>
						</c:forEach>


					</table>
					<div class="pager">
						<button class="btn btn-primary" id="modalUser" style="float: left">
							增加用户
						</button>
						<button class="btn btn-primary" id="modalMana" style="float: left;margin-left:20px">
							增加管理员
						</button>
						<ul class="clearfix">
							<c:choose>
								<c:when test="${pageIndex>1}">
									<li>
										<a href="User/paging?pageIndex=1">首页</a>
									</li>
									<li>
										<a
											href="User/paging?pageIndex=${pageIndex-1}">上一页</a>
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
										href="User/paging?pageIndex=${index}">${index
										}</a>
								</li>
							</c:forEach>

							<c:choose>
								<c:when test="${pageIndex<totalPage}">
									<li>
										<a
											href="User/paging?pageIndex=${pageIndex+1 }">下一页</a>
									</li>
									<li>
										<a
											href="User/paging?pageIndex=${totalPage }">尾页</a>
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
				<div class="clear"></div>
			</div>


			<div id="addUser" class="modal fade" tabindex="-1" data-backdrop="static" data-keyboard="false">
				<div class="modal-dialog">
					<div class="modal-content">
						<div class="modal-body">
							<button class="close" data-dismiss="modal">
								<span>&times;</span>
							</button>
						</div>
						<div class="modal-title">
							<h1 class="text-center">
								新增用户
							</h1>
						</div>
						<div class="modal-body">
							<form class="form-group">
								<div class="form-group">
									<label for="">
										用户名
									</label>
									<input class="form-control" type="text" name="uusername"
										id="uusername">
								</div>
								<div class="form-group">
									<label for="">
										电话
									</label>
									<input class="form-control" type="text" name="uphone"
										id="uphone">
								</div>
								<div class="form-group">
									<label for="">
										邮箱
									</label>
									<input class="form-control" type="text" name="uemail"
										id="uemail">
								</div>
								<div class="form-group">
									<label for="">
										密码
									</label>
									<input class="form-control" type="password" name="upassword"
										id="upassword">
								</div>
								<div class="text-right">
									<button class="btn btn-primary" id="submitUser"
										name="submitUser">
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




			<div id="addMana" class="modal fade" tabindex="-1" data-backdrop="static" data-keyboard="false">
				<div class="modal-dialog">
					<div class="modal-content">
						<div class="modal-body">
							<button class="close" data-dismiss="modal">
								<span>&times;</span>
							</button>
						</div>
						<div class="modal-title">
							<h1 class="text-center">
								新增管理员
							</h1>
						</div>
						<div class="modal-body">
							<form class="form-group">
								<div class="form-group">
									<label for="">
										用户名
									</label>
									<input class="form-control" type="text" name="ausername"
										id="ausername">
								</div>

								<div class="form-group">
									<label for="">
										密码
									</label>
									<input class="form-control" type="password" name="apassword"
										id="apassword">
								</div>
								<div class="text-right">
									<button class="btn btn-primary" id="submitMana"
										name="submitMana">
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

			<jsp:include page="../static/footer.html" />
			<script type="text/javascript">
			$(document).ready(function(){  
			     if(${sessionScope.admin==null}){
			     	alert("您不是管理员，请先登录！")
			     	window.location.href="backlogin";
			     }
			}); 
			</script>
			<script type="text/javascript" src="js/managePaging.js"></script>
	</body>
</html>
