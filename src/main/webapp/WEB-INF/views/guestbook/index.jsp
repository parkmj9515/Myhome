<%@page import="guestbook.VO.GuestVo"%>
<%@page import="java.util.List"%>
<%@page import="guestbook.dao.GuestbookOracle"%>
<%@page import="guestbook.dao.GuestbookDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
// DB 접속 정보를 컨텍스트 파라미터로부터 받아오기
ServletContext context = getServletContext();
String dbuser = context.getInitParameter("dbuser");
String dbpass = context.getInitParameter("dbpass");
%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>방명록</title>
</head>
<body>
	<form action="<%= request.getContextPath() %>/gb" method="POST">
	<input type='hidden' name="a" value="add">
		<table border=1 width=500>
			<tr>
				<td>이름</td>
				<td><input type="text" name="name"></td>
				<td>비밀번호</td>
				<td><input type="password" name="pass"></td>
			</tr>
			<tr>
				<td colspan=4><textarea name="content" cols=60 rows=5></textarea></td>
			</tr>
			<tr>
				<td colspan=4 align=right><input type="submit" VALUE=" 확인 "></td>
			</tr>
		</table>
	</form>
	<br />
	<%
	
	GuestbookDao dao = new GuestbookOracle(dbuser, dbpass);
	List<GuestVo> list = dao.getList();

	for (GuestVo vo : list) {
	%>

	<table width=510 border=1>

		<tr>
			<td><%=vo.getName() %></td>
			<td><%=vo.getPassword() %></td>
			
			<td><a href="<%= request.getContextPath() %>/guestbook?a=form&no=<%=vo.getNo() %>">삭제</a></td>
		</tr>
		<tr>
			<td colspan=4><%=vo.getContent() %>
			</td>
		</tr>
	</table>
	<br />
	<!-- <table width=510 border=1>
		<tr>
			<td>[1]</td>
			<td>장실산</td>
			<td>2018-01-15</td>
			<td><a href="">삭제</a></td>
		</tr>
		<tr>
			<td colspan=4>안녕하세요<br />두번째글입니다.
			</td>
		</tr>
	</table>
	<br /> -->
	<!-- 1 -->
	<%
	}
	%>

</body>
</html>