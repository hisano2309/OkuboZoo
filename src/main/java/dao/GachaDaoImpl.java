package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Calendar;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.sql.DataSource;

import domain.Gacha;
import domain.User;

public class GachaDaoImpl implements GachaDao {

	private DataSource ds;

	public GachaDaoImpl(DataSource ds) {
		this.ds = ds;
	}

	@Override
	public void insert(Gacha gacha, User user) {
		String sql = "INSERT INTO result(user_id, point, created) VALUES(?, ?, NOW())";
		// データベースにポイントを保存する処理
		try (Connection con = ds.getConnection()) {
			PreparedStatement stmt = con.prepareStatement(sql);
			stmt.setInt(1, user.getId());
			stmt.setInt(2, gacha.getPoint());
			stmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	@Override
	public Date findLastGachaTime(int userId) {
	    String sql = "SELECT created FROM result WHERE user_id = ? ORDER BY created DESC LIMIT 1";
	    try (Connection con = ds.getConnection()) {
	        PreparedStatement stmt = con.prepareStatement(sql);
	        stmt.setInt(1, userId);
	        ResultSet rs = stmt.executeQuery();
	        if (rs.next()) {
	            return rs.getDate("created");
	        }
	    } catch (SQLException e) {
	        e.printStackTrace();
	    }
	    return null;
	}

	@Override
	public void checkLastGachaTime(HttpServletRequest request, int userId) {
		GachaDao gachaDao = DaoFactory.createGachaDao();
		Date lastGachaTime = gachaDao.findLastGachaTime(userId);
		if (lastGachaTime != null) {
			Calendar lastGachaCalendar = Calendar.getInstance();
			lastGachaCalendar.setTime(lastGachaTime);
			Calendar now = Calendar.getInstance();
			// 今日すでにガチャを回している場合、エラーメッセージを表示
			if (lastGachaCalendar.get(Calendar.YEAR) == now.get(Calendar.YEAR)
					&& lastGachaCalendar.get(Calendar.DAY_OF_YEAR) == now.get(Calendar.DAY_OF_YEAR)) {
				request.setAttribute("gachaError", "一日一回だけガチャを回せます。");
			}
		}
	}
}
