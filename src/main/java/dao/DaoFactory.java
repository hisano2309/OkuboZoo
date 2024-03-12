package dao;

import javax.naming.InitialContext;
import javax.sql.DataSource;

public class DaoFactory {
	public static UserDao createUserDao() {
		return new UserDaoImpl(getDB());
	}

	public static GachaDao createGachaDao() {
		return new GachaDaoImpl(getDB());
	}
  public static ItemDao createItemDao() {
  	return new ItemDaoImpl(getDB());
}

	// DB接続メソッド
	private static DataSource getDB() {
		DataSource ds = null;
		try {
			InitialContext ctx = new InitialContext();
			ds = (DataSource) ctx.lookup("java:comp/env/jdbc/animal_db");
		} catch (Exception e) {

		}
		return ds;

	}
}
