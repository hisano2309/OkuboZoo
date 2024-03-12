package domain;

import java.util.Date;
import java.util.Random;

import lombok.AllArgsConstructor;
import lombok.Data;

 @Data
@AllArgsConstructor
public class Gacha {
	// nullを許可しているカラムはInteger
	private Integer id;
	private int userId;
	private Integer couponId;
	private Integer point;
	private Date created;

	public Gacha() {
	}

	private static final int[] PRIZES = { 100, 200, 300, 500, 1000 };

	public static Integer GachaPoint() {
		Random rand = new Random();
		Integer point = PRIZES[rand.nextInt(PRIZES.length)];
		return point;
	}
}
