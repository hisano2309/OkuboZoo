package dao;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import domain.Item;
import domain.User;

public interface UserDao {
	//	ユーザーの登録
	void insert(User user);
	
	// ログイン認証
	// 正しいID,Passの場合、Userを返す
	// 正しくなかったらnullを返す
	User findByLoginAndPass(String loginId, String loginPass);

	// ポイントの更新
	// ID検索してからtotalPointをアップデート
	User findById(int id);
	void update(User user);
	
	// ポイントを消費してアイテムを交換
	void saveItem(int userId, int itemId, Item created);
  List<Item> findItemsByUserId(int userId);
  
  //ユーザーのポイントを設定
  int setUserPoint(HttpServletRequest request, int userId);


}
