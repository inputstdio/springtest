package kr.pe.stdio;

import java.util.Locale;
import java.util.Properties;
import java.util.Random;

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
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.pe.stdio.entities.Member;
import kr.pe.stdio.service.MemberDao;

@Controller
public class LoginController {
	@Autowired
	private SqlSession sqlSession;
	@Autowired
	private BCryptPasswordEncoder passwordEncoder;
	
	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String login(Locale locale, Model model) {
		return "login/login";
	}

	@RequestMapping(value = "/memberLogin", method = RequestMethod.POST)
	public String memberLogin(@RequestParam String email, @RequestParam String password, Model model, HttpSession session) {
		MemberDao dao = sqlSession.getMapper(MemberDao.class);
		Member member = dao.selectOne(email);
		
		String msg = "";
		boolean login = false;
		
		if (member != null) {
			boolean matched = passwordEncoder.matches(password, member.getPassword());
			if (matched) {
				msg = "Login Success!";
				session.setAttribute("session_email", member.getEmail());
				session.setAttribute("session_password", member.getPassword());
				session.setAttribute("session_name", member.getName());
				session.setAttribute("session_photo", member.getPhoto());
				session.setAttribute("session_level", member.getLevel());
				login = true;
				System.out.println("Login Success!");
			} else {
				msg = "※ Incorrect password.";
			}
		} else {
			msg = "※ This email has not been registered.";
		}
		
		if (login) {
			return "redirect:index";
		} else {
			model.addAttribute("msg", msg);
			return "login/login";
		}
	}
	
	@RequestMapping(value = "/logout", method = RequestMethod.GET)
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:index";
	}
	
	@RequestMapping(value = "/emailLossFind", method = RequestMethod.POST)
	@ResponseBody
	public String emailLossFind(String email) {
		MemberDao dao = sqlSession.getMapper(MemberDao.class);
		Member member = dao.selectOne(email);
		String exists = "0";

		if (member != null) {
			exists = "1";
			Random random = new Random();
			String temp_password = String.valueOf((char) ((int) (random.nextInt(26)) + 97)) + random.nextInt(99999) + random.nextInt(99999);
			member.setPassword(passwordEncoder.encode(temp_password));
			String send_msg = "Temporary Password [" + temp_password + "]";
			sendEmail(email, send_msg);
			dao.updateRow(member);
		}
		return exists;
	}

	private void sendEmail(String email, String send_msg) {
		String host = "smtp.gmail.com";
		String subject = "Temporary Password Test";
		String fromName = "emailstdio";
		String from = "emailstdio@gmail.com";
		String to1 = email;
		String content = send_msg;
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
}