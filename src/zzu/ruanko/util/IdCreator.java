
package zzu.ruanko.util;

import java.time.LocalDate;
import java.time.LocalDateTime;

public class IdCreator {
	
	public IdCreator() {
		// TODO Auto-generated constructor stub
	}
	
	public static int getIntegerId(){
		int num = (int) (Math.random()*100);//生成随机位数
		int id = 0;
		for (int i = 0; i < num; i++) {
			id += (int)(Math.random()*50);
		}
		return id;
	}
	
	public static String getStringId(){
		int num = (int) (Math.random()*100);//生成随机位数
		String id = LocalDate.now().toString() + String.valueOf(num);
		return id;
	}
	
	public static void main(String[] args) {
		System.out.println(IdCreator.getIntegerId());
		System.out.println(getStringId());
	}
	
}
