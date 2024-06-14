<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page session="true"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h3>Session 읽기</h3>
	<%
	// Object 객체가 반환되므로 다운캐스팅 필수
	String sess1 = (String) session.getAttribute("sess1");
	Integer sess2 = (Integer) session.getAttribute("sess2");
	%>
	<ul>
		<li>문자열 세션: <%=sess1%>
		</li>
		<li>정수 세션: <%=sess2%></li>
	</ul>

	<p>
		<a href="session_delete.jsp">세션 삭제</a>
	</p>
	<p>
		<a href="session_write.jsp">세션 기록</a>
	</p>

</body>
</html>