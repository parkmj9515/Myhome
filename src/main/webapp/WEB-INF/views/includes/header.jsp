<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="true" %>    
	<div id="header">
      <h1>My Homepage</h1>
      <p>authUser: ${authUser }</p>
      <c:choose>
      <c:when test="${not empty authUser }">
      <ul>
      	<li><a href="<c:url value="/users?a=logout" />">로그아웃</a>
      	<li>${authUser.name }님 환영합니다</li>
      <!-- 로그인 한 사용자 -->
      <!-- 웰컴 메시지, 로그아웃 링크 -->
      </ul>
      </c:when>
      <c:otherwise>
      <ul>
      <!-- 로그인 안한 사용자 -->
      <!-- 가입링크, 로그인 폼 링크 -->
      	<li><a href="<c:url value="/users?a=loginform" />">로그인</a></li>
      	<li><a href="<c:url value="/users?a=joinform" />">회원가입</a></li>
      </ul>
      </c:otherwise>
      </c:choose>
    </div> <!-- /header -->
    <!-- h3>Params</h3>
      <ul>
      	<li>param1 : ${param.param1}</li>
      	<li>param2 : ${param.param2}</li>
      </ul -->