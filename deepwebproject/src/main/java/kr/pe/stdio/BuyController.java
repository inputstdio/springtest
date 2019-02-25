package kr.pe.stdio;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.pe.stdio.entities.Buy;
import kr.pe.stdio.entities.Product;
import kr.pe.stdio.entities.Vender;
import kr.pe.stdio.service.BuyDao;
import kr.pe.stdio.service.ProductDao;
import kr.pe.stdio.service.VenderDao;

@Controller
public class BuyController {
	@Autowired
	private SqlSession sqlSession;
	@Autowired
	private Buy buy;
	@Autowired
	private Product product;
	
	@RequestMapping(value = "/buy", method = RequestMethod.GET)
	public String buy(Model model, @ModelAttribute ArrayList<Buy> buys, @ModelAttribute Buy buy, @ModelAttribute("redirectchk") String redirectchk) {
		VenderDao vender_dao = sqlSession.getMapper(VenderDao.class);
		ProductDao product_dao = sqlSession.getMapper(ProductDao.class);
		BuyDao buy_dao = sqlSession.getMapper(BuyDao.class);
		ArrayList<Vender> venders = vender_dao.selectAll();
		ArrayList<Product> products = product_dao.selectAll();
		
		if(redirectchk.equals("insert")) {
			try {
				buys = buy_dao.selectBuySearchRollup(buy);
			} catch (Exception e) {
				System.out.println(e.getMessage());
			}
		} else if (redirectchk.equals("search")) {
			if (buy.getDd().equals("00")) {
				buys = buy_dao.selectBuySearchRollupMM(buy);
			} else {
				buys = buy_dao.selectBuySearchRollup(buy);
			}
		}
		
		model.addAttribute("venders", venders);
		model.addAttribute("products", products);
		model.addAttribute("buys", buys);

		return "buy/buy";
	}
	
	@RequestMapping(value = "/buyInsert", method = RequestMethod.POST)
	public String buyInsert(@ModelAttribute Buy buy, final RedirectAttributes redirectattr) {
		BuyDao buy_dao = sqlSession.getMapper(BuyDao.class);
		try {
			buy_dao.insertRow(buy);
			redirectattr.addFlashAttribute("buy", buy);
			redirectattr.addFlashAttribute("redirectchk", "insert");
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		return "redirect:buy";
	}
	
	@RequestMapping(value = "/buyUpdate", method = RequestMethod.POST)
	public String buyUpdate(@ModelAttribute Buy buy, final RedirectAttributes redirectattr) {
		BuyDao buy_dao = sqlSession.getMapper(BuyDao.class);
		try {
			buy_dao.updateRow(buy);
			redirectattr.addFlashAttribute("buy", buy);
			redirectattr.addFlashAttribute("redirectchk", "insert");
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		return "redirect:buy";
	}
	
	@RequestMapping(value = "/buyDelete", method = RequestMethod.GET)
	public String buyDelete(@RequestParam int seq) {
		BuyDao buy_dao = sqlSession.getMapper(BuyDao.class);
		try {
			buy_dao.deleteRow(seq);
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		return "redirect:buy";
	}
	
	@RequestMapping(value = "buyNew", method = RequestMethod.POST)
	@ResponseBody
	public Buy buyNew(@RequestParam String vendcode) {
		BuyDao buy_dao = sqlSession.getMapper(BuyDao.class);
		String date = currentDate();
		buy.setYyyy(date.substring(0,4));
		buy.setMm(date.substring(5,7));
		buy.setDd(date.substring(8,10));
		buy.setVendcode(vendcode);
		int no = 0;
		try {
			no = buy_dao.selectNo(buy);
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		if (no == 0) {
			buy.setNo(buy_dao.selectSequenceNo(buy));
		} else {
			buy.setNo(no);
		}
		buy.setHanf(buy_dao.selectSequenceHanf(buy));

		return buy;
	}
	
	@RequestMapping(value = "buyNew2", method = RequestMethod.POST)
	@ResponseBody
	public Product buyNew2(@RequestParam String procode) {
		ProductDao product_dao = sqlSession.getMapper(ProductDao.class);
		product = product_dao.selectRow(procode);
		return product;
	}
	
	@RequestMapping(value = "buySearch", method = RequestMethod.GET)
	public String buySearch(@ModelAttribute Buy buy, final RedirectAttributes redirectattr) {
		
		buy.setMm(String.format("%02d", Integer.parseInt(buy.getMm())));
		buy.setDd(String.format("%02d", Integer.parseInt(buy.getDd())));
		
		redirectattr.addFlashAttribute("buy", buy);
		redirectattr.addFlashAttribute("redirectchk", "search");
		return "redirect:buy";
	}
	
	@RequestMapping(value = "buyDetail", method = RequestMethod.POST)
	@ResponseBody
	public Buy buyDetail(@RequestParam int seq) {
		BuyDao buy_dao = sqlSession.getMapper(BuyDao.class);
		buy = buy_dao.selectRow(seq);
		return buy;
	}

	public String currentDate() {
		Date today = new Date();
		SimpleDateFormat date = new SimpleDateFormat("yyyy-MM-dd");
		String current_time = date.format(today);
		return current_time;
	}
}
