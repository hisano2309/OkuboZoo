package domain;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Data;

@AllArgsConstructor
@Data
public class User {
    private Integer id;
    private String loginId;
    private String loginPass;
    private Integer totalPoint;
    private Date deleted;
    private List<Item> items;  // 取得したアイテムのリスト

    public User() {
        items = new ArrayList<>();  // リストを初期化
    }
}