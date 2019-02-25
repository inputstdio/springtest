package kr.pe.stdio.service;

import java.util.ArrayList;

import kr.pe.stdio.entities.Dept;


public interface DeptDao {
	ArrayList<Dept> selectAll();
}
