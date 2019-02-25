package kr.pe.stdio.entities;

import org.springframework.stereotype.Component;

import lombok.Data;

@Component
@Data
public class Buy {
	private int seq;
	private String vendcode;
	private String vendname;
	private String yyyy;
	private String mm;
	private String dd;
	private int no;
	private int hanf;
	private String procode;
	private String proname;
	private int price;
	private int qty;
	private int total;
	private String memo;
	
	private int stock;
}
