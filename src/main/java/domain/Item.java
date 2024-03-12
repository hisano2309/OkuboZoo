package domain;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;

@AllArgsConstructor
@Data
public class Item {
    private Integer id;
    private String name;
    private Integer requiredPoint;
    private String imagePath;
  	private Date created;

    public Item() {
    }
}
