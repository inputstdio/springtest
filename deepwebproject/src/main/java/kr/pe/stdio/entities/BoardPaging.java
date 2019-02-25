package kr.pe.stdio.entities;

import org.springframework.stereotype.Component;

import lombok.Data;

@Component
@Data
public class BoardPaging {
	private String search;
	private int startrow;
	private int size;
}
