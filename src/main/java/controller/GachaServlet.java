package controller;

import java.io.IOException;
import java.util.Calendar;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.DaoFactory;
import dao.GachaDao;
import dao.UserDao;
import domain.Gacha;
import domain.User;

/**
 * Servlet implementation class GachaServlet
 */
@WebServlet("/gacha")
public class GachaServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    HttpSession session = request.getSession();
    User user = new User();
    user = (User)session.getAttribute("user");
    int userId = user.getId();


    // 最後のガチャ時間を取得
    GachaDao dao = DaoFactory.createGachaDao();
    Date lastGachaTime = dao.findLastGachaTime(userId);
    
    // 最後のガチャ時間をチェック
    if (lastGachaTime != null) {
        Calendar lastGachaCalendar = Calendar.getInstance();
        lastGachaCalendar.setTime(lastGachaTime);
        Calendar now = Calendar.getInstance();
        if (lastGachaCalendar.get(Calendar.YEAR) == now.get(Calendar.YEAR)
                && lastGachaCalendar.get(Calendar.DAY_OF_YEAR) == now.get(Calendar.DAY_OF_YEAR)) {
            // 今日すでにガチャを回している場合、エラーメッセージを表示
            request.setAttribute("gachaError", "一日一回だけガチャを回せます。");
            request.getRequestDispatcher("/WEB-INF/view/gacha.jsp").forward(request, response);
            return;
        }
    }
		    
    // ガチャの結果をresultに登録
    Integer point = Gacha.GachaPoint();
		dao.insert(new Gacha(null, userId, null, point, null), user);
		
		// リクエストスコープへ格納
		request.setAttribute("point", point);

		// userテーブルからtotalPointを取得
		UserDao dao2 = DaoFactory.createUserDao();
		User user2 = dao2.findById(userId);
		int totalPoint = user2.getTotalPoint();
		
		// totalPointにpointを加算
		totalPoint += point;
		
		// userのtotalPointを更新
		dao2.update(new User(userId, null, null, totalPoint, null, null));
		
		request.getRequestDispatcher("/WEB-INF/view/gacha.jsp").forward(request, response);
	}

}
