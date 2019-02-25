package kr.pe.stdio.service;

import java.util.ArrayList;
import java.util.HashMap;

import kr.pe.stdio.entities.Balance;

public interface BalanceDao {
	int insertRow(Balance Balance);
	ArrayList<Balance> selectAll();
	int deleteRow(HashMap hashmap);
	Balance selectRow(HashMap hashmap);
	int updateRow(Balance balance);
	int updateRowTotal(Balance balance);
}
