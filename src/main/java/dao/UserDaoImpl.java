package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Types;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.sql.DataSource;

import org.mindrot.jbcrypt.BCrypt;

import domain.Item;
import domain.User;

public class UserDaoImpl implements UserDao {
	
	private DataSource ds;

	public UserDaoImpl(DataSource ds) {
		this.ds = ds;
	}
	
	@Override
	public void insert(User user) {
		// SQLを準備
		String sql = "INSERT INTO users(login_id, login_pass) VALUES(?, ?)";
		// パスワードのハッシュ化
		// getLoginPassはDTOのgetterメソッド
		String loginPass = user.getLoginPass();
		String hashed = BCrypt.hashpw(loginPass, BCrypt.gensalt());
		
		try(Connection con = ds.getConnection()){
			// SQLを実行
			PreparedStatement stmt = con.prepareStatement(sql);
			stmt.setString(1, user.getLoginId());
			stmt.setString(2, hashed);
			stmt.executeUpdate();
		} catch (Exception e) {
		}
	}

	@Override
	public User findByLoginAndPass(String loginId, String loginPass) {
		// SQLを準備
		String sql = "SELECT * FROM users WHERE login_id = ?";
		try(Connection con = ds.getConnection()){
			// SQLを実行
			PreparedStatement stmt = con.prepareStatement(sql);
			stmt.setString(1, loginId);
			ResultSet rs = stmt.executeQuery();
			// ログインチェック(IDがあっていたらtrue → PASSが間違っていたらnullを戻す)
			if(rs.next()) {
				if(!BCrypt.checkpw(loginPass, rs.getString("login_pass"))) {
					return null;
				}
				return new User(rs.getInt("id"), loginId, null, null, null, null);
			}
		} catch (Exception e) {
		}
		return null;
	}

	@Override
	public User findById(int id) {
		User userPoint = new User();
		try(Connection con = ds.getConnection()){
			String sql = "SELECT * FROM users WHERE id = ?";
			PreparedStatement stmt = con.prepareStatement(sql);
			stmt.setInt(1, id);
			ResultSet rs = stmt.executeQuery();
			
			// ResultSet型をUser型に変換 
			if(rs.next()) {
				int totalPoint = rs.getInt("total_point");
				userPoint.setTotalPoint(totalPoint);
			}
		} catch (Exception e) {
		}
		return userPoint;
	}
	
	@Override
	public void update(User user) {
		try (Connection con = ds.getConnection()) {
			String sql = "UPDATE users SET total_point = ? WHERE id = ?";
			PreparedStatement stmt = con.prepareStatement(sql);
			stmt.setObject(1, user.getTotalPoint(), Types.INTEGER);
			stmt.setObject(2, user.getId(), Types.INTEGER);
			stmt.executeUpdate();
		} catch (Exception e) {
		}
	}

	@Override
	public void saveItem(int userId, int itemId, Item created) {
    String sql = "INSERT INTO user_items(user_id, item_id, created) VALUES(?, ?, NOW())";
    try (Connection con = ds.getConnection()) {
        PreparedStatement stmt = con.prepareStatement(sql);
        stmt.setInt(1, userId);
        stmt.setInt(2, itemId);
        stmt.executeUpdate();
    } catch (Exception e) {
    	e.printStackTrace();
    }
	}
  
	@Override
	public List<Item> findItemsByUserId(int userId) {
	    String sql = "SELECT items.*, user_items.created FROM items JOIN user_items ON items.id = user_items.item_id WHERE user_items.user_id = ?";
	    List<Item> items = new ArrayList<>();
	    try (Connection con = ds.getConnection()) {
	        PreparedStatement stmt = con.prepareStatement(sql);
	        stmt.setInt(1, userId);
	        ResultSet rs = stmt.executeQuery();
	        while (rs.next()) {
	            Integer id = rs.getInt("id");
	            String name = rs.getString("name");
	            Integer requiredPoint = rs.getInt("required_point");
	            String imagePath = rs.getString("image_path");
	            Date created = rs.getTimestamp("created");
	            items.add(new Item(id, name, requiredPoint, imagePath, created));
	        }
	    } catch (SQLException e) {
	        e.printStackTrace();
	    }
	    return items;
	}

	@Override
	public int setUserPoint(HttpServletRequest request, int userId) {
		// userテーブルからtotalPointを取得
		User userPoint = findById(userId);
		int totalPoint = userPoint.getTotalPoint();
		request.setAttribute("totalPoint", totalPoint);
		request.setAttribute("userPoint", userPoint);
		return totalPoint;
		
	}

}
