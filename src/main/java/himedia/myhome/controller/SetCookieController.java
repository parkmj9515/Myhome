package himedia.myhome.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.net.URLEncoder;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/cookie/set")
public class SetCookieController extends HttpServlet {

	// GET방식으로 호출하면 SET쿠키 명령을 응답
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		resp.setCharacterEncoding("UTF-8");
		resp.setContentType("text/html; chsrset=UTF-8");

		PrintWriter out = resp.getWriter();

		out.println("<h1>Cookie 저장</h1>");
		// testCookie
		Cookie c = new Cookie("testCookie", URLEncoder.encode("Servlet에서 쿠키 저장을 명령합니다. SetCookie", "UTF-8"));

		c.setMaxAge(24 * 60 * 60); // 쿠키를 유지할 시간(초) -> 24시간
		// domain, path, expire 등 쿠키 구성요소 설정 가능
		// 음답애 쿠키를 추가해 줘야 브라우저에 저장
		resp.addCookie(c); // 쿠키 추가

		out.printf("<p>%s를 쿠키이름 %s로 저장합니다.</p>", c.getValue(), c.getName());
	}

}