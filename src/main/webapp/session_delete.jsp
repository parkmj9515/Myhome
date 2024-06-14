<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page session="true"%>
<%
// 세션 객체 삭제
session.removeAttribute("sess1");
session.removeAttribute("sess2");
// 세션 전체  무효화
session.invalidate();

response.sendRedirect("session_read.jsp");
%>