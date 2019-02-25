package kr.pe.stdio.service;

import java.util.ArrayList;

import kr.pe.stdio.entities.Product;

public interface ProductDao {
	int insertRow(Product Product);
	ArrayList<Product> selectAll();
	int deleteRow(String code);
	Product selectRow(String code);
}
