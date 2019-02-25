package kr.pe.stdio;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import kr.pe.stdio.entities.Product;
import kr.pe.stdio.service.ProductDao;

@Controller
public class ProductController {
	@Autowired
	private SqlSession sqlSession;
	@Autowired
	private Product product;
	
	@RequestMapping(value = "/productList", method = RequestMethod.GET)
	public String productList(Model model) {
		ProductDao dao = sqlSession.getMapper(ProductDao.class);
		ArrayList<Product> products = dao.selectAll();
		
		model.addAttribute("products", products);
		
		return "product/product_list";
	}
	
	@RequestMapping(value = "/productInsertForm", method = RequestMethod.GET)
	public String productInsertForm(Model model) {
		return "product/product_insert_form";
	}
	
	@RequestMapping(value = "/productInsert", method = RequestMethod.POST)
	public String productInsert(Model model, @ModelAttribute Product product) {
		int result = 0;
		try {
			ProductDao dao = sqlSession.getMapper(ProductDao.class);
			result = dao.insertRow(product);
		} catch (Exception e) {
			System.out.println("DB Error : " + e.getCause());
		}
		String msg = "";
		if (result != 0) {
			msg = "DB Insert Success!";
			System.out.println(msg);
		} else {
			msg = "DB Insert Failed...";
		}

		System.out.println(msg);
		
		return "redirect:index";
	}
	
	@RequestMapping(value = "/productSelectedDelete", method = RequestMethod.GET)
	public String productSelectedDelete(@RequestParam String[] code) {
		ProductDao dao = sqlSession.getMapper(ProductDao.class);
		int result[] = new int[code.length];
		
		for (int i=0; i<code.length; i++) {
			result[i] = dao.deleteRow(code[i]);
			if (result[i] == 1) {
				System.out.println("Delete Success : " + code[i]);
			} else {
				System.out.println("Delete Failed : " + code[i]);
			}
		}
		return "redirect:index";
	}
	
	public String currentDate() {
		Date today = new Date();
		SimpleDateFormat date = new SimpleDateFormat("yyyy/MM/dd");
		SimpleDateFormat time = new SimpleDateFormat("hh:mm:ss a");
		String current_time = date.format(today) + " " + time.format(today);
		return current_time;
	}
}
