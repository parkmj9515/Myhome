package himedia.myhome.controller;

import java.io.IOException;

import himedia.myhome.dao.UsersDao;
import himedia.myhome.dao.UsersOracleImpl;
import himedia.myhome.vo.UserVo;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/users")
public class UserServlet extends BaseServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// a=joinform -> 가입폼 페이지로 FORWARD
		// a=joinsuccess -> 가입 성공 페이지로 FORWARD
		// a=logout > 세션지우고 > Redirect
		String actionName = req.getParameter("a");

		if ("joinform".equals(actionName)) {
			// 가입 폼으로 Forward
			RequestDispatcher rd = req.getRequestDispatcher("/WEB-INF/views/users/joinform.jsp");
			rd.forward(req, resp);
		} else if ("joinsuccess".equals(actionName)) {
			RequestDispatcher rd = req.getRequestDispatcher("/WEB-INF/views/users/joinsuccess.jsp");
			rd.forward(req, resp);
		} else if ("loginform".equals(actionName)) {
			// 로그인 폼
			// 로그인 실패 상황 -> result=fail
			String result = req.getParameter("result");
			if ("fail".equals(result)) {
				// 에러 메시지를 요청 어트리뷰트에 추가
				req.setAttribute("errorMsg", "로그인에 실패했습니다.");
			}
			RequestDispatcher rd = req.getRequestDispatcher("/WEB-INF/views/users/loginform.jsp");
			rd.forward(req, resp);
		} else if ("logout".equals(actionName)) {
			// 로그아웃
			// 세션 무효화
			HttpSession session = req.getSession();
			session.removeAttribute("authUser"); // 개별 속성 삭제
			session.invalidate();

			resp.sendRedirect(req.getContextPath());
		} else {
			// 홈페이지로 리다이렉트
			resp.sendRedirect(req.getContextPath());
		}
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// a : insert -> 회원가입
		// a : login -> 로그인 수행
		String actionName = req.getParameter("a");
		if ("join".equals(actionName)) {
			// 가입 처리
			// form 데이터 수신
			String name = req.getParameter("name");
			String password = req.getParameter("password");
			String email = req.getParameter("email");
			String gender = req.getParameter("gender");

			UserVo vo = new UserVo(name, password, email, gender);

			UsersDao dao = new UsersOracleImpl(dbuser, dbpass);

			boolean success = dao.insert(vo);

			if (success) {
				resp.sendRedirect(req.getContextPath() + "/users?a=joinsuccess");
			} else { // 가입 실패
				resp.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "가입 실패");
			}
		} else if ("login".equals(actionName)) {
			String email = req.getParameter("email");
			String password = req.getParameter("password");

			// 사용자 정보 질의
			UsersDao dao = new UsersOracleImpl(dbuser, dbpass);
			UserVo vo = dao.getUserByIdAndPassword(email, password);

			if (vo != null) { // 사용자가 있음 -> 성공
				// 사용자 정보를 세션에 기록
				HttpSession session = req.getSession();
				session.setAttribute("authUser", vo);

				// 홈화면으로 리다이렉트
				resp.sendRedirect(req.getContextPath());
			} else { // 사용자가 없음 -> 실패
				// 다시 로그인 창으로 리다이렉트 (result=fail)
				resp.sendRedirect(req.getContextPath() + "/users?a=loginform&result=fail");
			}
		} else {
			resp.sendError(HttpServletResponse.SC_NOT_FOUND); // 404 Not Found
		}
	}

}