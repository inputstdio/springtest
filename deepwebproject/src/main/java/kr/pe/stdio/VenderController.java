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

import kr.pe.stdio.entities.Vender;
import kr.pe.stdio.service.VenderDao;

@Controller
public class VenderController {
	@Autowired
	private SqlSession sqlSession;
	@Autowired
	private Vender vender;
	
	@RequestMapping(value = "/venderList", method = RequestMethod.GET)
	public String venderList(Model model) {
		VenderDao dao = sqlSession.getMapper(VenderDao.class);
		ArrayList<Vender> venders = dao.selectAll();
		
		model.addAttribute("venders", venders);
		
		return "vender/vender_list";
	}
	
	@RequestMapping(value = "/venderInsertForm", method = RequestMethod.GET)
	public String venderInsertForm(Model model) {
		return "vender/vender_insert_form";
	}
	
	@RequestMapping(value = "/venderInsert", method = RequestMethod.POST)
	public String venderInsert(Model model, @ModelAttribute Vender vender) {
		int result = 0;
		try {
			VenderDao dao = sqlSession.getMapper(VenderDao.class);
			result = dao.insertRow(vender);
		} catch (Exception e) {
			// System.out.println("DB Error : " + e.getMessage());
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
	
	@RequestMapping(value = "/venderSelectedDelete", method = RequestMethod.GET)
	public String venderSelectedDelete(@RequestParam String[] code) {
		VenderDao dao = sqlSession.getMapper(VenderDao.class);
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
