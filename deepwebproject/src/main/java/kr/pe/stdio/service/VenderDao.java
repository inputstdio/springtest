package kr.pe.stdio.service;

import java.util.ArrayList;

import kr.pe.stdio.entities.Vender;

public interface VenderDao {
	int insertRow(Vender vender);
	ArrayList<Vender> selectAll();
	int deleteRow(String code);
}
