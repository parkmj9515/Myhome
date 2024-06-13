<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>My Homepage</title>
<!-- TODO: 현재 페이지에 적절한 CSS를 임포트하십시오. -->
<link type="text/css"  rel="stylesheet" href="<%= request.getContextPath() %>/css/home.css"/>
</head>
<body>
  <div id="container">
  
    <!-- header include -->
    <jsp:include page="/WEB-INF/views/includes/header.jsp">
    	<jsp:param name="param1" value="value1" />
    	<jsp:param name="param2" value="value2" />
    </jsp:include>

	<!-- navigation include -->
	<jsp:include page="/WEB-INF/views/includes/navigation.jsp" />
    
	<div id="wrapper">
      <div id="content">
			<!-- Content 영역 -->
      </div>
	</div>
	
	<!-- footer include -->
	<%@ include file="/WEB-INF/views/includes/footer.jsp" %>
	
	
  </div>
</body>
</html>