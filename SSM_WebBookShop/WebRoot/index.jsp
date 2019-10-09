<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My</title>
  </head>
  
  <body>
    <a href="addbook.jsp">添加书籍</a><br/>
    <a href="updatebook.jsp">修改书籍</a><br/>    
    <a href="showbook.action?pageIndex=1&pageSize=1">分页查看书籍</a><br/>  
    <a href="addcomment.jsp">增加评论 </a><br/>  
    <a href="showcomment.action">查看评论 </a><br/>  
    <a href="showhistory.action?uid=1000001">查看历史记录 </a>
      <a href="addhistory.jsp">新增历史记录 </a>  
    <br/>  
  </body>
</html>
