<%@page import="himedia.myhome.vo.UserVo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page session="true"%>
<%
UserVo authUser = (UserVo) session.getAttribute("authUser");
%>
<div id="header">
	<h1>My Homepage</h1>
	<p> authUser: ${authUser } </p>
	<%
	if (authUser != null) { // 로그인 함
	%>
	<ul>
		<li><a href="<%=request.getContextPath()%>/users?a=logout">로그아웃</a>
		<li><!-- %=authUser.getName()%-->${sessionScope.authUser.name }님 환영합니다</li>
			<!-- 로그인한 사용자 --> <!-- 웰컴 메시지, 로그아웃 링크 -->
	</ul>
	<%
	} else {
	%>
	<!-- 로그인 안한 사용자 -->
	<!-- 가입링크, 로그인 폼 링크 -->
	<li><a href="<%=request.getContextPath()%>/users?a=joinform">회원가입</a></li>
	<li><a href="<%=request.getContextPath()%>/users?a=loginform">로그인</a></li>
	<%
	}
	%>
</div>
<!-- /header -->
<!-- h3>Params</h3>
      <ul>
      	<li>param1 :request.getParameter("param1")1") %></li>
      	<li>param2 :request.getParameter("param2")2") %></li>
      </ul -->