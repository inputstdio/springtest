package kr.pe.stdio.entities;

import org.springframework.stereotype.Component;

import lombok.Data;

@Component
@Data
public class Salary {
	private String empno;	// pk
	private String dept;	// select box
	private String name;
	private int partner;
	private int dependent20;
	private int dependent60;
	private int disabled;
	private int womanpower;
	private int pay;
	private int extra;
	private String birth_date;	// date picker
	private String input_date;
	private String yn;
}
