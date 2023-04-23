package boot.data.dto;

import java.sql.Timestamp;

import org.apache.ibatis.type.Alias;

import lombok.Data;
@Data
@Alias("IpgoDto") //타입이름이된다 
public class IpgoDto {
	private String num;
	private String sangpum;
	private int price;
	private String dimage; //대표이미지 
	private String photoname;
	private Timestamp ipgoday;

}
