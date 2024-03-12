package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.DaoFactory;
import dao.UserDao;
import domain.User;

/**
 * Servlet implementation class LoginServlet
 */
@WebServlet("/login")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.getRequestDispatcher("/WEB-INF/view/login.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 文字化け防止
		request.setCharacterEncoding("utf-8");
		
		String loginId = request.getParameter("id");
		String loginPass = request.getParameter("pass");
		
		// バリデーション
		
		// Daoを使いID,PASSをチェック
		UserDao dao = DaoFactory.createUserDao();
		User user = dao.findByLoginAndPass(loginId, loginPass);
		if(user == null) {
			request.setAttribute("error", "ログインIDまたはパスワードが間違っています。");
			request.getRequestDispatcher("/WEB-INF/view/login.jsp").forward(request, response);
			return;
		}
		
		HttpSession session = request.getSession();
		session.setAttribute("user", user);
		
		response.sendRedirect(request.getContextPath() + "/index");
	}

}
