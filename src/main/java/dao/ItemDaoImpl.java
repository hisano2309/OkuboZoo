package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.sql.DataSource;

import domain.Item;

public class ItemDaoImpl implements ItemDao {

  private DataSource ds;

  public ItemDaoImpl(DataSource ds) {
      this.ds = ds;
  }

  @Override
  public Item findById(Integer id) {
      String sql = "SELECT * FROM items WHERE id = ?";
      try (Connection con = ds.getConnection()) {
          PreparedStatement stmt = con.prepareStatement(sql);
          stmt.setInt(1, id);
          ResultSet rs = stmt.executeQuery();
          if (rs.next()) {
              String name = rs.getString("name");
              Integer requiredPoint = rs.getInt("required_point");
              String imagePath = rs.getString("image_path");
              return new Item(id, name, requiredPoint, imagePath, null);
          }
      } catch (SQLException e) {
          e.printStackTrace();
      }
      return null;
  }
  
  @Override
  public List<Item> findAll() {
      String sql = "SELECT * FROM items";
      try (Connection con = ds.getConnection()) {
          PreparedStatement stmt = con.prepareStatement(sql);
          ResultSet rs = stmt.executeQuery();
          List<Item> items = new ArrayList<>();
          while (rs.next()) {
              Integer id = rs.getInt("id");
              String name = rs.getString("name");
              Integer requiredPoint = rs.getInt("required_point");
              String imagePath = rs.getString("image_path");
              items.add(new Item(id, name, requiredPoint, imagePath, null));
          }
          return items;
      } catch (SQLException e) {
          e.printStackTrace();
      }
      return null;
  }

}
