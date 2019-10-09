<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" isELIgnored="false"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>`
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<base href="<%=basePath%>">
	<jsp:include page="../static/back-head.html"/>
<script type="text/javascript">
function getFileName(o){
    var pos=o.lastIndexOf("\\");
    return o.substring(pos+1);  
}
function uploadFile(){ 
	var fileName=getFileName($('#choosefile').val());
	
            var file_obj = document.getElementById('choosefile').files[0];

            var fd = new FormData();
            fd.append('bpicfile', file_obj);

            $.ajax({
                url:'<%=basePath%>/Book/uploadPic',
                type:'POST',
                data:fd,
                processData:false,  //tell jQuery not to process the data
                contentType: false,  //tell jQuery not to set contentType
                //这儿的三个参数其实就是XMLHttpRequest里面带的信息。
                success:function (result) {
                	if(result=="success"){
                		alert("上传成功！");
						$("#picDisplay").attr("src","<%=basePath %>images/product/"+fileName);
						$("#bpicname").val(fileName);
                	}
                	else if(result=="fail"){
                  		alert("上传失败！");              	
                	}

                }

            })
	

}

</script>
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
		<h2>添加商品</h2>
		<div class="manage">
			<form action="productAddAction" method="post" enctype="multipart/form-data">
				<table class="form">
					<tr>
						<td class="field">商品名称：</td>
						<td><input type="text" class="text" name="bname" value="" /></td>
					</tr>
					<tr>
						<td class="field">商品描述：</td>
						<td><input type="text" class="text" name="bcontent" value="" /></td>
					</tr>
					<tr>
						<td class="field">商品价格：</td>
						<td><input type="text" class="text tiny" name="bprice" /> 元</td>
					</tr>
					<tr>
						<td class="field">所属分类：</td>
						<td>
							<select name="bookType.btid" class="form-control" style="width: 90px;">
								<c:forEach items="${ bts}" var="bt">
								<option value="${bt.btid }">${bt.btname}</option>
								</c:forEach>
							</select>
						</td>
					</tr>
					<tr>
						<td class="field">商品图片：</td>
						<td><input id="choosefile" type="file" class="text" name="bpicfile" 
						accept="image/jpg, image/png, image/jpeg, image/gif"/></td>
					</tr>
					
										<tr>
					<td  class="field">图片预览：</td>
						<td><img id="picDisplay" style="wdith:200px;height:200px;margin-bottom:70px"
						src="<%=basePath %>images/product/${book.bpic}"/></td>
					</tr>
					<tr>
						<td  class="field">上传按钮：</td>
						<td><input type="button" class="field"  onclick="uploadFile()" value="上传"/></td>
					</tr>	
						<td><input id="bpicname" type="hidden" name="bpic" value="bnull.jpg"/></td>

					<tr>
						<td class="field">作者：</td>
						<td><input type="text" class="text" name="bauthor" /></td>
					</tr>
					<tr>
						<td class="field">ISBN：</td>
						<td><input type="text" class="text" name="bisbn" /></td>
					</tr>
					<tr>
						<td class="field">出版社：</td>
						<td><input type="text" class="text" name="bpublisher" /></td>
					</tr>


					<tr>
						<td class="field">库存：</td>
						<td><input type="text" class="text tiny" name="bstock" /></td>
					</tr>
					<tr>
						<td></td>
						<td><input class="btn btn-info" type="submit" name="submit" value="添加" /></td>
					</tr>
				</table>
			</form>
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
</body>
</html>
