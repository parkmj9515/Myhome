<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>My Homepage</title>
<!-- TODO: 현재 페이지에 적절한 CSS를 임포트하십시오. -->
<link type="text/css" 
	rel="stylesheet" 
	href="<c:url value="/css/home.css" />"/>
</head>
<body>
  <div id="container">
  
    <!-- header include -->
    <c:import url="/WEB-INF/views/includes/header.jsp">
    	<c:param name="param1" value="value1" />
    	<c:param name="param2" value="value2" />
    </c:import>
    <%--jsp:include page="/WEB-INF/views/includes/header.jsp">
    	<jsp:param name="param1" value="value1" />
    	<jsp:param name="param2" value="value2" />
    </jsp:include --%>

	<!-- navigation include -->
	<c:import url="/WEB-INF/views/includes/navigation.jsp" />
	<%--jsp:include page="/WEB-INF/views/includes/navigation.jsp" /--%>
    
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