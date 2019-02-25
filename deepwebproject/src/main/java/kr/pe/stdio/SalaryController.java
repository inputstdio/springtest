package kr.pe.stdio;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
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

import kr.pe.stdio.entities.Dept;
import kr.pe.stdio.entities.Salary;
import kr.pe.stdio.entities.SalaryRoll;
import kr.pe.stdio.service.DeptDao;
import kr.pe.stdio.service.SalaryDao;

@Controller
public class SalaryController {
	@Autowired
	private SqlSession sqlSession;
	@Autowired
	private SalaryRoll salaryroll;

	@RequestMapping(value = "/salaryInsertForm", method = RequestMethod.GET)
	public String salaryInsertForm(Model model) {
		DeptDao dao = sqlSession.getMapper(DeptDao.class);
		ArrayList<Dept> depts = dao.selectAll();
		model.addAttribute("depts", depts);
		
		return "salary/salary_insert_form";
	}
	
	@RequestMapping(value = "/salaryInsert", method = RequestMethod.POST)
	public String salaryInsert(Model model, @ModelAttribute Salary salary) {
		salary.setInput_date(currentDate());
		int result = 0;
		try {
			SalaryDao dao = sqlSession.getMapper(SalaryDao.class);
			result = dao.insertRow(salary);
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
	
	@RequestMapping(value = "/checkEmpno", method = RequestMethod.POST)
	@ResponseBody
	public String checkEmpno(@RequestParam String empno) {
		SalaryDao dao = sqlSession.getMapper(SalaryDao.class);
		Integer exists = 0;
		try {
			exists = dao.selectCountRow(empno);
		} catch (Exception e) {
			System.out.println("dao error : " + e.getMessage());
		}
		/* System.out.println("select line : " + exists); */
		return exists.toString();
	}
	
	@RequestMapping(value = "/salaryCalculation", method = RequestMethod.GET)
	public String salaryCalculation(Model model) {
		Calendar cal = Calendar.getInstance();
	    Integer year = cal.get(Calendar.YEAR);
	    model.addAttribute("year", year);
		
		return "salary/salary_calculation";
	}
	
	@RequestMapping(value = "/salaryCreate", method = RequestMethod.POST)
	public String salaryCreate(@RequestParam String calc_year, @RequestParam String calc_month) {
		SalaryDao dao = sqlSession.getMapper(SalaryDao.class);
		calc_month = String.format("%02d", Integer.parseInt(calc_month));
		HashMap rollkey = new HashMap();
		rollkey.putIfAbsent("yyyy", calc_year);
		rollkey.putIfAbsent("mm",  calc_month);
		dao.deleteSalaryRoll(rollkey);
		ArrayList<Salary> salarys = dao.selectSalaryAll();
		for(Salary salary: salarys) {
			salaryroll.setYyyy(calc_year);
			salaryroll.setMm(calc_month);
			salaryroll.setEmpno(salary.getEmpno());
			salaryroll.setDept(salary.getDept());
			salaryroll.setName(salary.getName());
			int pay12 = (salary.getPay() + salary.getExtra())*12;
			salaryroll.setPay12(pay12);
			int incomededuction = 0;
			if (pay12 < 5000001) {
				incomededuction = (int) (pay12 * 0.7);
			} else if (pay12 < 15000001) {
				incomededuction = (int) (3500000 + ((pay12 - 5000000) * 0.4));
			} else if (pay12 < 45000001) {
				incomededuction = (int) (7500000 + ((pay12 - 15000000) * 0.15));
			} else if (pay12 < 100000001) {
				incomededuction = (int) (12000000 + ((pay12 - 45000000) * 0.05));
			} else {
				incomededuction = (int) (14750000 + ((pay12 - 100000000) * 0.02));
			}
			salaryroll.setIncomededuction(incomededuction);
			salaryroll.setIncomeamount(pay12-incomededuction);
			int deducount = 1 + salary.getPartner() + (salary.getDependent20() * 2) + salary.getDependent60() + salary.getWomanpower();
			int personaldeduction = deducount * 1500000;
			salaryroll.setPersonaldeduction(personaldeduction);
			int annuityinsurance = (int) ((salary.getPay() + salary.getExtra()) * 0.001);
			annuityinsurance = annuityinsurance * 1000;
			annuityinsurance = (int) (annuityinsurance * 0.045);
			annuityinsurance = annuityinsurance * 12;
			if (annuityinsurance < 135001) {
				annuityinsurance = 135000;
			}
			if (annuityinsurance > 2149200) {
				annuityinsurance = 2149200;
			}
			salaryroll.setAnnuityinsurance(annuityinsurance);
			int specialdeduction = 0;
			if (deducount == 1) {
				if (pay12 < 30000001) {
					specialdeduction = (int) (3100000 + (pay12 * 0.04));
				} else if (pay12 < 45000001) {
					specialdeduction = (int) (3100000 + (pay12 * 0.04) - ((pay12 - 30000000) * 0.05));
				} else if (pay12 < 70000001) { 
					specialdeduction = (int) (3100000 + (pay12 * 0.015));
				} else if (pay12 < 120000001) {
					specialdeduction = (int) (3100000 + (pay12 * 0.005));
				}
			} else if (deducount == 2) {
				if (pay12 < 30000001) {
					specialdeduction = (int) (3600000 + (pay12 * 0.04));
				} else if (pay12 < 45000001) {
					specialdeduction = (int) (3600000 + (pay12 * 0.04) - ((pay12 - 30000000) * 0.05));
				} else if (pay12 < 70000001) { 
					specialdeduction = (int) (3600000 + (pay12 * 0.02));
				} else if (pay12 < 120000001) {
					specialdeduction = (int) (3600000 + (pay12 * 0.01));
				}
			} else {
				if (pay12 < 30000001) {
					specialdeduction = (int) (5000000 + (pay12 * 0.07));
				} else if (pay12 < 45000001) {
					specialdeduction = (int) (5000000 + (pay12 * 0.07) - ((pay12 - 30000000) * 0.05));
				} else if (pay12 < 70000001) { 
					specialdeduction = (int) (5000000 + (pay12 * 0.05));
				} else if (pay12 < 120000001) {
					specialdeduction = (int) (5000000 + (pay12 * 0.03));
				}
				specialdeduction += (pay12 - 40000000) * 0.04;
			}
			salaryroll.setSpecialdeduction(specialdeduction);
			int standardamount = salaryroll.getIncomeamount() - personaldeduction - annuityinsurance - specialdeduction;
			salaryroll.setStandardamount(standardamount);
			int calculatedtax = 0;
			if (standardamount < 12000001) {
				calculatedtax = (int) (standardamount * 0.06);
			} else if (standardamount < 46000001) {
				calculatedtax = (int) (720000 + ((standardamount - 12000000) * 0.15));
			} else if (standardamount < 88000001) {
				calculatedtax = (int) (5820000 + ((standardamount - 46000000) * 0.24));
			} else if (standardamount < 150000001) {
				calculatedtax = (int) (15900000 + ((standardamount - 88000000) * 0.35));
			} else {
				calculatedtax = (int) (37600000 + ((standardamount - 150000000) * 0.38));
			}
			salaryroll.setCalculatedtax(calculatedtax);
			
			int incometaxdeduction = 0;
			if (calculatedtax < 500001) {
				incometaxdeduction = (int) (calculatedtax * 0.55);
			} else {
				incometaxdeduction = (int) (275000 + ((calculatedtax - 500000) * 0.3));
			}
			
			if (pay12 < 55000001) {
				if (incometaxdeduction > 660000) {
					incometaxdeduction = 660000;
				}
			} else if (pay12 < 70000001) {
				if (incometaxdeduction > 630000) {
					incometaxdeduction = 630000;
				}
			} else {
				if (incometaxdeduction > 500000) {
					incometaxdeduction = 500000;
				}
			}
			
			salaryroll.setIncometax(incometaxdeduction);
			
			int decidedtax = calculatedtax - incometaxdeduction;
			int simpletax = decidedtax / 12;
			simpletax = (int) (simpletax * 0.01);
			simpletax = simpletax * 100;
			
			salaryroll.setDecidedtax(decidedtax);
			salaryroll.setSimpletax(simpletax);
			
			dao.insertSalaryRollRow(salaryroll);
		}
		
		return "redirect:index";
	}
	
	@RequestMapping(value = "/salaryRoll", method = RequestMethod.GET)
	public String salaryRoll(Model model) {
		SalaryDao dao = sqlSession.getMapper(SalaryDao.class);
		
		ArrayList<SalaryRoll> salaryrolls = dao.selectSalaryRollAll();
		model.addAttribute("salaryrolls", salaryrolls);

		return "salary/salary_roll";
	}
	
	public String currentDate() {
		Date today = new Date();
		SimpleDateFormat date = new SimpleDateFormat("yyyy/MM/dd");
		SimpleDateFormat time = new SimpleDateFormat("hh:mm:ss a");
		String current_time = date.format(today) + " " + time.format(today);
		return current_time;
	}
}
