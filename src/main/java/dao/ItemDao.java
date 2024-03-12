package dao;

import java.util.List;

import domain.Item;

public interface ItemDao {
  Item findById(Integer id);
  List<Item> findAll();
}
