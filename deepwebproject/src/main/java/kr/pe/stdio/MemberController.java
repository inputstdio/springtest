package kr.pe.stdio;

import java.io.BufferedOutputStream;
import java.io.FileOutputStream;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.Locale;
import java.util.Properties;

import javax.mail.Message;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeUtility;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

import kr.pe.stdio.entities.Member;
import kr.pe.stdio.service.MemberDao;

@Controller
public class MemberController {
	@Autowired
	private SqlSession sqlSession;
	@Autowired
	private BCryptPasswordEncoder passwordEncoder;

	private String path = HomeController.path;
	
	private String realpath = "resources/img/";

	@RequestMapping(value = "/memberInsertForm", method = RequestMethod.GET)
	public String memberInsertForm(Locale locale, Model model) {
		return "member/member_insert_form";
	}

	@RequestMapping(value = "/memberInsert", method = RequestMethod.POST)
	public String memberInsert(Model model, @ModelAttribute Member member, @RequestParam CommonsMultipartFile imgfile) {
		String type = imgfile.getContentType();
		System.out.println(imgfile.getContentType());
		String filename = imgfile.getOriginalFilename();
		String newfilename = "";
		boolean type_check = false;
		
		if (type.equals("image/png") | type.equals("image/jpeg") | type.equals("image/gif")) {
			type_check = true;
		}

		if (filename.equals("") | !type_check) {
			newfilename = "noImage_240.png";
		} else {
			String[] splitfile = filename.split("\\.");
			newfilename = member.getEmail() + "." + splitfile[splitfile.length - 1];

			try {
				byte[] bytes = imgfile.getBytes();
				BufferedOutputStream output = new BufferedOutputStream(new FileOutputStream(path + newfilename));
				output.write(bytes);
				output.flush();
				output.close();
			} catch (Exception e) {
				System.out.println("File Error : " + e.getMessage());
			}
		}
		String encodepass = passwordEncoder.encode(member.getPassword());
		member.setPassword(encodepass);
		member.setInput_date(currentDate());
		member.setPhoto(realpath + newfilename);
		int result = 0;

		try {
			MemberDao dao = sqlSession.getMapper(MemberDao.class);
			result = dao.insertRow(member);
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

		model.addAttribute("msg", msg);

		return "member/member_result";
	}

	public String currentDate() {
		Date today = new Date();
		SimpleDateFormat date = new SimpleDateFormat("yyyy/MM/dd");
		SimpleDateFormat time = new SimpleDateFormat("hh:mm:ss a");
		String current_time = date.format(today) + " " + time.format(today);
		return current_time;
	}

	@RequestMapping(value = "/emailAuth", method = RequestMethod.POST)
	@ResponseBody
	public String emailAuth(@RequestParam String email) {
		System.out.println("E-mail : " + email);
		String authNum = randomNum();
		sendEmail(email, authNum);
		return authNum;
	}

	private void sendEmail(String email, String authNum) {
		String host = "smtp.gmail.com";
		String subject = "이메일 인증번호 전송 테스트";
		String fromName = "emailstdio";
		String from = "emailstdio@gmail.com";
		String to1 = email;
		String content = "인증번호[" + authNum + "]";
		try {
			Properties props = new Properties();
			props.put("mail.smtp.starttls.enable", "true");
			props.put("mail.transport.protocol", "smtp");
			props.put("mail.smtp.host", host);
			props.setProperty("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
			props.put("mail.smtp.port", "587"); // or 465
			props.put("mail.smtp.user", from);
			props.put("mail.smtp.auth", "true");

			Session mailSession = Session.getInstance(props, new javax.mail.Authenticator() {
				protected PasswordAuthentication getPasswordAuthentication() {
					return new PasswordAuthentication("emailstdio", "cgoyltzcpffdxfjm"); // 위 gmail에서 생성된 비밀번호 넣는다
				}
			});
			Message msg = new MimeMessage(mailSession);
			msg.setFrom(new InternetAddress(from, MimeUtility.encodeText(fromName, "UTF-8", "B")));

			InternetAddress[] address1 = { new InternetAddress(to1) };
			msg.setRecipients(Message.RecipientType.TO, address1);
			msg.setSubject(subject);
			msg.setSentDate(new java.util.Date());
			msg.setContent(content, "text/html;charset=euc-kr");
			Transport.send(msg);
			System.out.println("----> success:");
		} catch (Exception e) {
			System.out.println("----> error:" + e.getMessage());
		}
	}

	String randomNum() {
		StringBuffer buffer = new StringBuffer();
		for (int i = 0; i <= 6; i++) {
			int n = (int) (Math.random() * 10);
			buffer.append(n);
		}
		return buffer.toString();
	}

	@RequestMapping(value = "/check", method = RequestMethod.POST)
	@ResponseBody
	public String check(@RequestParam String email) {
		MemberDao dao = sqlSession.getMapper(MemberDao.class);
		Integer exists = 0;
		try {
			exists = dao.selectCheck(email);
		} catch (Exception e) {
			System.out.println("dao error : " + e.getMessage());
		}
		/* System.out.println("select line : " + exists); */
		return exists.toString();
	}

	@RequestMapping(value = "/memberSearch", method = RequestMethod.GET)
	public String memberSearch(Model model, HttpSession session) {
		MemberDao dao = sqlSession.getMapper(MemberDao.class);
		ArrayList<Member> members = dao.selectAll();
		// System.out.println("size : " + members.size());
		model.addAttribute("members", members);
		
		int level = Integer.parseInt(session.getAttribute("session_level").toString());
		
		if (level > 4){
			return "redirect:index";
		} else {
			return "member/member_search";
		}
	}

	@RequestMapping(value = "/memberUpdateForm", method = RequestMethod.GET)
	public String memberUpdateForm(@RequestParam String email, Model model, HttpSession session) {
		int level = Integer.parseInt(session.getAttribute("session_level").toString());
		boolean permission = false;
		if (level == 1) {
			permission = true;
		} else if (session.getAttribute("session_email").equals(email)) {
			permission = true;
		}
		
		if (permission) {
			MemberDao dao = sqlSession.getMapper(MemberDao.class);
			Member member = dao.selectOne(email);

			model.addAttribute("member", member);
			return "member/member_update_form";
		} else {
			return "redirect:memberSearch";
		}
	}
	
	@RequestMapping(value = "/memberLevelUpdate", method = RequestMethod.GET)
	public String memberLevelUpdate(@RequestParam String[] array_email, @RequestParam int[] array_level, HttpSession session) {
		int level = Integer.parseInt(session.getAttribute("session_level").toString());
		if (level == 1) {
			int result = 0;
			MemberDao dao = sqlSession.getMapper(MemberDao.class);
			for (int i=0; i<array_email.length; i++) {
				HashMap data = new HashMap();
				data.put("email", array_email[i]);
				data.put("level", array_level[i]);
				
				try {
					result = dao.updateLevelAll(data);
				} catch (Exception e) {
					System.out.println(e.getMessage());
				}
			}
		}
		return "redirect:memberSearch";
	}
	
	@RequestMapping(value = "/memberUpdate", method = RequestMethod.POST)
	public String memberUpdate(Model model, @ModelAttribute Member member, @RequestParam CommonsMultipartFile imgfile) {
		String type = imgfile.getContentType();
		String filename = imgfile.getOriginalFilename();
		String newfilename = "";
		boolean type_check = false;
		if (type.equals("image/png") | type.equals("image/jpeg") | type.equals("image/gif")) {
			type_check = true;
		}
		
		if (filename.equals("") | !type_check) {
			newfilename = member.getBefore_photo();
			member.setPhoto(newfilename);
		} else {
			String[] splitfile = filename.split("\\.");
			newfilename = member.getEmail() + "." + splitfile[splitfile.length - 1];

			try {
				byte[] bytes = imgfile.getBytes();
				BufferedOutputStream output = new BufferedOutputStream(new FileOutputStream(path + newfilename));
				output.write(bytes);
				output.flush();
				output.close();
			} catch (Exception e) {
				System.out.println("File Error : " + e.getMessage());
			}
			member.setPhoto(realpath + newfilename);
		}
		
		if (!type_check) {
			System.out.println("This file is not image file.");
		}

		String password = member.getPassword();

		if (password.equals("")) {
			password = member.getBefore_password();
			member.setPassword(password);
		} else {
			String encodepass = passwordEncoder.encode(password);
			member.setPassword(encodepass);
		}
		int result = 0;

		try {
			MemberDao dao = sqlSession.getMapper(MemberDao.class);
			result = dao.updateRow(member);
		} catch (Exception e) {
			// System.out.println("DB Error : " + e.getMessage());
			System.out.println("DB Error : " + e.getCause());
		}
		String msg = "";
		if (result != 0) {
			msg = "DB Update Success!";
			System.out.println(msg);
		} else {
			msg = "DB Update Failed...";
		}

		model.addAttribute("msg", msg);

		return "member/member_result";
	}
	
	@RequestMapping(value = "/memberModify", method = RequestMethod.GET)
	public String memberModify(Model model, HttpSession session) {
		return memberUpdateForm(session.getAttribute("session_email").toString(), model, session);
	}

	@RequestMapping(value = "/memberDelete", method = RequestMethod.GET)
	public String memberDelete(@RequestParam String email) {
		MemberDao dao = sqlSession.getMapper(MemberDao.class);
		int result = dao.deleteOne(email);
		if (result == 1) {
			System.out.println("Delete Success : " + email);
		} else {
			System.out.println("Delete Failed : " + email);
		}
		return "redirect:memberSearch";
	}
	
	@RequestMapping(value = "/memberSelectedDelete", method = RequestMethod.GET)
	public String memberSelectedDelete(@RequestParam String[] email) {
		MemberDao dao = sqlSession.getMapper(MemberDao.class);
		int result[] = new int[email.length];
		
		for (int i=0; i<email.length; i++) {
			result[i] = dao.deleteOne(email[i]);
			if (result[i] == 1) {
				System.out.println("Delete Success : " + email[i]);
			} else {
				System.out.println("Delete Failed : " + email[i]);
			}
		}
		return "redirect:memberSearch";
	}
}
