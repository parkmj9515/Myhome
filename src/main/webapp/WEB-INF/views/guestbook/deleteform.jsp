<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <title>방명록</title>
    <link type="text/css" rel="stylesheet" href="css/guestbook.css" />
  </head>
  <body>
    <div id="container">
      <jsp:include page="/WEB-INF/views/includes/header.jsp"></jsp:include>
      <jsp:include page="/WEB-INF/views/includes/navigation.jsp"></jsp:include>
      <div id="content">
        <div id="guestbook">
          <form action="<%=request.getContextPath()%>/guestbook" method="POST">
            <input type="hidden" name="no"
            value="<%=request.getParameter("no")%>">
            <input type="hidden" name="a" value="delete" />
            <table>
              <tr>
                <td>비밀번호</td>
                <td><input type="password" name="password" /></td>
                <td><input type="submit" value="확인" /></td>
                <td>
                  <a href="<%=request.getContextPath()%>/guestbook">돌아가기</a>
                </td>
              </tr>
            </table>
          </form>
        </div>
      </div>
      <jsp:include page="/WEB-INF/views/includes/footer.jsp"></jsp:include>
    </div>
  </body>
</html>