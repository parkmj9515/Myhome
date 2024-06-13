<%@ page language="java"
	contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>My Home: Join Success</title>
<link type="text/css"
	rel="stylesheet"
	href="<%= request.getContextPath() %>/css/users.css" />
</head>
<body>
	<div id="container">
		<jsp:include page="/WEB-INF/views/includes/header.jsp" />
		<jsp:include page="/WEB-INF/views/includes/navigation.jsp" />
		
		<div id="wrapper">
			<div id="content">
	<h1>Join Success</h1>
	<p>가입해 주셔서 감사합니다.</p>
			</div>
		</div>
		<%@ include file="/WEB-INF/views/includes/footer.jsp" %>
		
	</div>
</body>
</html>