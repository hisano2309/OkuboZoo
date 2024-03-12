package dao;

import java.util.Date;

import javax.servlet.http.HttpServletRequest;

import domain.Gacha;
import domain.User;

public interface GachaDao {
	// ガチャの結果をDBに保存
	void insert(Gacha gacha,User user);
	
	// 最後にガチャを回した日時を取得
	Date findLastGachaTime(int userId);
	
	// ガチャを回せるかチェック
	void checkLastGachaTime(HttpServletRequest request, int userId);
}
