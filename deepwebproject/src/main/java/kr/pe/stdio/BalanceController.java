package kr.pe.stdio;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import kr.pe.stdio.entities.Balance;
import kr.pe.stdio.service.BalanceDao;

@Controller
public class BalanceController {
	@Autowired
	private SqlSession sqlSession;
	@Autowired
	private Balance balance;
	
	@RequestMapping(value = "/balanceList", method = RequestMethod.GET)
	public String balanceList(Model model) {
		BalanceDao dao = sqlSession.getMapper(BalanceDao.class);
		ArrayList<Balance> balances = dao.selectAll();
		
		model.addAttribute("balances", balances);
		
		return "balance/balance_list";
	}
	
	@RequestMapping(value = "/balanceDetail", method = RequestMethod.GET)
	public String balanceDetail(Model model, @RequestParam String yyyy, @RequestParam String vendcode) {
		BalanceDao dao = sqlSession.getMapper(BalanceDao.class);
		HashMap hashmap = new HashMap();
		hashmap.putIfAbsent("yyyy", yyyy);
		hashmap.putIfAbsent("vendcode", vendcode);
		balance = dao.selectRow(hashmap);
		
		model.addAttribute("balance", balance);
		
		return "balance/balance_detail";
	}
	
	@RequestMapping(value = "/balanceDetailChange", method = RequestMethod.POST)
	public String balanceDetailChange(@ModelAttribute Balance balance) {
		BalanceDao dao = sqlSession.getMapper(BalanceDao.class);
		
		dao.updateRow(balance);
		dao.updateRowTotal(balance);

		return "redirect:balanceList";
	}
	
	@RequestMapping(value = "/balanceDelete", method = RequestMethod.GET)
	public String balanceDelete(@RequestParam String yyyy, @RequestParam String vendcode) {
		BalanceDao dao = sqlSession.getMapper(BalanceDao.class);
		HashMap hashmap = new HashMap();
		hashmap.putIfAbsent("yyyy", yyyy);
		hashmap.putIfAbsent("vendcode", vendcode);
		dao.deleteRow(hashmap);

		return "redirect:balanceList";
	}
}
