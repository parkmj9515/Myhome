﻿<%@page import="guestbook.VO.GuestVo"%>
<%@page import="guestbook.dao.GuestbookDao"%>
<%@page import="guestbook.dao.GuestbookOracle"%>
<%@page import="java.util.Calendar"%>

<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="java.util.List"%>
<%@ page import="guestbook.dao.GuestbookDao"%> <%@ page language="java"
contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>방명록</title>
</head>
<body>
	<form action="../add.jsp" method="post">
	<table border=1 width=500>
		<tr>
			<td>이름</td>
			<td><input type="text" name="name"></td>
			<td>비밀번호</td>
			<td><input type="password" name="password"></td>
		</tr>
		<tr>
			<td colspan=4><textarea name="content" cols=60 rows=5></textarea></td>
		</tr>
		<tr>
			<td colspan=4 align=right><input type="submit" VALUE=" 확인 "></td>
		</tr>
	</table>
	</form>
	<br/>
<%
String name = request.getParameter("name");
String pass = request.getParameter("password");
String content = request.getParameter("content");


ServletContext servletContext = getServletContext();
String dbuser = servletContext.getInitParameter("dbuser");
String dbpass = servletContext.getInitParameter("dbpass");

GuestbookDao dao = new GuestbookOracle(dbuser, dbpass);
List<GuestVo> lst = dao.getList();
SimpleDateFormat sdf = new SimpleDateFormat("yyyy-mm-dd HH:mm:ss");

for (GuestVo node: lst) {
%>
	<table width=510 border=1>
		<tr>
			<td><%= node.getNo() %></td>
			<td><%= node.getName() %></td>
			<td><%= node.getPassword() %></td>
			<td><%= node.getRegDate() %></td>
			
			<td><a href="delete.jsp<%=node.getNo() %>">삭제</a></td>
		</tr>
		<tr>
			<td colspan=4><%= node.getContent() %></td>
		</tr>
	</table>
        <br/>
<%
}
%>
</body>
</html>