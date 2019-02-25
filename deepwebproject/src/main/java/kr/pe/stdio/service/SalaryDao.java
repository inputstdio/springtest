package kr.pe.stdio.service;

import java.util.ArrayList;
import java.util.HashMap;

import kr.pe.stdio.entities.Salary;
import kr.pe.stdio.entities.SalaryRoll;

public interface SalaryDao {
	ArrayList<Salary> selectSalaryAll();
	Integer selectCountRow(String empno);
	int insertRow(Salary salary);
	int insertSalaryRollRow(SalaryRoll salaryroll);
	ArrayList<SalaryRoll> selectSalaryRollAll();
	int deleteSalaryRoll(HashMap rollkey);
	ArrayList<SalaryRoll> salaryRollList(); 
}
