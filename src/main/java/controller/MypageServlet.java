package controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.DaoFactory;
import dao.GachaDao;
import dao.ItemDao;
import dao.UserDao;
import domain.Item;
import domain.User;

/**
 * Servlet implementation class UserServlet
 */
@WebServlet("/mypage")
public class MypageServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// セッションからuserIdを取得
		HttpSession session = request.getSession();
		User user = new User();
		user = (User) session.getAttribute("user");
		int userId = user.getId();
		
    // userテーブルからtotalPointを取得
		UserDao dao = DaoFactory.createUserDao();
		int totalPoint = dao.setUserPoint(request, userId);
    
    // 全ての景品を取得
    ItemDao itemDao = DaoFactory.createItemDao();
    List<Item> items = itemDao.findAll();
    request.setAttribute("items", items);
    
		
		// ユーザーが選択した景品を取得
		String itemId = request.getParameter("item");
		if (itemId != null && !itemId.isEmpty()) {
			Item item = itemDao.findById(Integer.parseInt(itemId));

			// ポイントが十分であるかをチェック
			if (totalPoint >= item.getRequiredPoint()) {
				// ポイントを減算
				user.setTotalPoint(totalPoint - item.getRequiredPoint());
				// userのtotalPointをデータベースに反映
				dao.update(user);
		    
		    // userのtotalPointを更新
		    dao.saveItem(userId, item.getId(), null);
				
				// ページ更新の度に交換されないようにリダイレクト
        response.sendRedirect(request.getContextPath() + "/mypage");
        return;
			} else {
				// エラーメッセージを表示
				request.setAttribute("pointError", "ポイントが不足しています。");
			}
		}
		
    // ユーザーが交換済みアイテムを取得
    List<Item> userItems = dao.findItemsByUserId(userId);
    request.setAttribute("userItems", userItems);
    
		// 最後のガチャ時間を取得してガチャを回せるかチェック
		GachaDao gachaDao = DaoFactory.createGachaDao();
		gachaDao.findLastGachaTime(userId);
		gachaDao.checkLastGachaTime(request, userId);

		request.getRequestDispatcher("/WEB-INF/view/mypage.jsp").forward(request, response);
	}
	
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doGet(req, resp);
	}


}
