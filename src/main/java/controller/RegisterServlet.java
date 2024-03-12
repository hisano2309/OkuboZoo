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
 * Servlet implementation class RegisterServlet
 */
@WebServlet("/register")
public class RegisterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.getRequestDispatcher("/WEB-INF/view/register.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 文字化け防止
		request.setCharacterEncoding("utf-8");
		
		// 入力値の取得
		String loginId = request.getParameter("id");
		String loginPass = request.getParameter("pass");
		
		// バリデーション(今回は省略)
		
		// DAOを使いDBを登録
		UserDao dao = DaoFactory.createUserDao();
		dao.insert(new User(null, loginId, loginPass, null, null, null));
		
		// Daoを使いID,PASSをチェック
		HttpSession session = request.getSession();
		User user = dao.findByLoginAndPass(loginId, loginPass);
		session.setAttribute("user", user);
		
		response.sendRedirect(request.getContextPath() + "/index");
		return;
	}

}
