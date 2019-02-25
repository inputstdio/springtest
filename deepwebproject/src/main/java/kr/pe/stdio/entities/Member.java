package kr.pe.stdio.entities;

import lombok.Data;

@Data
public class Member {
	private String email;
	private String password;
	private String before_password;
	private String name;
	private String phone;
	private String zipcode;
	private String address1;
	private String address2;
	private String photo;
	private String before_photo;
	private String input_date;
	private int level;
}
