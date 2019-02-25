package kr.pe.stdio;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.commons.CommonsMultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.pe.stdio.entities.Board;
import kr.pe.stdio.entities.BoardPaging;
import kr.pe.stdio.service.BoardDao;

@Controller
public class BoardController {
	@Autowired
	private SqlSession sqlSession;
	
	@Autowired
	private BoardPaging boardPaging;
	
	static String search;

	private String path = HomeController.path;

	@RequestMapping(value = "/boardInsert", method = RequestMethod.POST)
	public String boardInsert(HttpServletRequest request, @ModelAttribute Board board, @RequestParam CommonsMultipartFile attach_file, HttpSession session, final RedirectAttributes redirectAttributes) {
		BoardDao dao = sqlSession.getMapper(BoardDao.class);

		/* IP Address */
		String ip = request.getHeader("X-FORWARDED-FOR");

		if (ip == null) {
			ip = request.getHeader("Proxy-Client-IP");
		}
		if (ip == null) {
			ip = request.getHeader("WL-Proxy-Client-IP");
		}
		if (ip == null) {
			ip = request.getHeader("HTTP_CLIENT_IP");
		}
		if (ip == null) {
			ip = request.getHeader("HTTP_X_FORWARDED_FOR");
		}
		if (ip == null) {
			ip = request.getRemoteAddr();
		}

		/* File Save */
		String filename = attach_file.getOriginalFilename();
		String newfilename = "";
	
		if (!checkFile(filename)) {
			filename = "";
		};
		
		if (!filename.equals("")) {
			newfilename = dao.selectMaxSeq() + "_" + session.getAttribute("session_email").toString() + "_" + filename;
			/* new filename is number_email_original filename */

			try {
				byte[] bytes = attach_file.getBytes();
				BufferedOutputStream output = new BufferedOutputStream(new FileOutputStream(path + newfilename));
				output.write(bytes);
				output.flush();
				output.close();
			} catch (Exception e) {
				System.out.println("File Error : " + e.getMessage());
			}
		}

		board.setB_attach(newfilename);
		board.setB_date(currentDate());
		board.setB_ip(ip);
		board.setB_password(session.getAttribute("session_password").toString());
		board.setB_level(Integer.parseInt(session.getAttribute("session_level").toString()));

		try {
			dao.insertRow(board);
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		
		redirectAttributes.addAttribute("search", search);

		return "redirect:boardList";
	}

	@RequestMapping(value = "/boardInsertForm", method = RequestMethod.GET)
	public String boardInsertForm() {
		return "board/board_insert_form";
	}
	
	@RequestMapping(value = "/boardDatatable", method = RequestMethod.GET)
	public String boardDatatable(Model model, @RequestParam("search") String search) {
		BoardDao dao = sqlSession.getMapper(BoardDao.class);
		
		BoardController.search = search;
		
		ArrayList<Board> boards = dao.selectAll(search);
		model.addAttribute("boards", boards);
		
		return "board/board_datatable";
	}
	@RequestMapping(value = "/boardList", method = RequestMethod.GET)
	public String boardList(Model model, @RequestParam("search") String search) {
		BoardDao dao = sqlSession.getMapper(BoardDao.class);
		
		BoardController.search = search;

		int rowcount = dao.selectRowCount(search);
		int pagesize = 5;
		int absPage = 1;
		if (rowcount % pagesize == 0)
			absPage = 0;
		int pageCount = rowcount / pagesize + absPage;
		int[] pages = new int[pageCount];
		for (int i = 0; i < pageCount; i++) {
			pages[i] = i + 1;
		}
		
		boardPaging.setSearch(search);
		boardPaging.setStartrow(0);
		boardPaging.setSize(pagesize);
		
		ArrayList<Board> boards = dao.selectPage(boardPaging);
		model.addAttribute("selected_page", 1);
		model.addAttribute("pages", pages);
		model.addAttribute("boards", boards);
		return "board/board_list";
	}

	@RequestMapping(value = "/boardPageListSelected", method = RequestMethod.GET)
	public String boardPageListSelected(Model model, @RequestParam int page) {
		BoardDao dao = sqlSession.getMapper(BoardDao.class);
		
		int rowcount = dao.selectRowCount(search);
		int pagesize = 5;
		int absPage = 1;
		if (rowcount % pagesize == 0)
			absPage = 0;
		int pageCount = rowcount / pagesize + absPage;
		int[] pages = new int[pageCount];
		for (int i = 0; i < pageCount; i++) {
			pages[i] = i + 1;
		}
		
		int startrow = (page -1) * pagesize;
		boardPaging.setSearch(search);
		boardPaging.setStartrow(startrow);
		boardPaging.setSize(pagesize);
		
		ArrayList<Board> boards = dao.selectPage(boardPaging);
		
		model.addAttribute("selected_page", page);
		model.addAttribute("pages", pages);
		model.addAttribute("boards", boards);
		return "board/board_list";
	}

	@RequestMapping(value = "/boardDownload", method = RequestMethod.GET)
	public ModelAndView boardDownload(@RequestParam String b_attach) {
		File file = new File(path+b_attach);
		return new ModelAndView("download", "downloadFile", file);
	}
	
	@RequestMapping(value = "/boardDetail", method = RequestMethod.GET)
	public String boardDetail(Model model, @RequestParam int b_seq, HttpSession session) {
		BoardDao dao = sqlSession.getMapper(BoardDao.class);
		Board board = dao.selectBoard(b_seq);
		
		String attach = board.getB_attach();
		if (attach.equals("")) {
			attach = "no attached files";
		} else {
			attach = attach.substring(attach.lastIndexOf('_') + 1);
		}
		
		String session_email = (String) session.getAttribute("session_email");
		Boolean permission = false;
		
		if (session_email != null) {
			if (session_email.equals(board.getB_email())) {
				permission = true;
			}
		}
		
		if (!permission) {
			dao.updateHit(b_seq);
		}
		
		Boolean admin = false;
		
		String level = session.getAttribute("session_level").toString();
		if (Integer.parseInt(level) == 1) {
			admin = true;
		}
		
		model.addAttribute("admin", admin);
		model.addAttribute("permission", permission);
		model.addAttribute("board", board);
		model.addAttribute("attach", attach);
		return "board/board_detail";
	}
	
	@RequestMapping(value = "/boardDelete", method = RequestMethod.GET)
	public String boardDelete(@RequestParam int b_seq, final RedirectAttributes redirectAttributes) {
		BoardDao dao = sqlSession.getMapper(BoardDao.class);
		int result = dao.deleteRow(b_seq);
		if (result == 1) {
			System.out.println("Delete Success : " + b_seq);
		} else {
			System.out.println("Delete Failed : " + b_seq);
		}
		redirectAttributes.addAttribute("search", search);
		
		return "redirect:boardList";
	}
	
	@RequestMapping(value = "/boardModify", method = RequestMethod.POST)
	public String boardModify(@RequestParam CommonsMultipartFile attach_file, @ModelAttribute Board board, final RedirectAttributes redirectAttributes) {
		BoardDao dao = sqlSession.getMapper(BoardDao.class);
		
		board.setB_date(currentDate());
		
		/* File Save */
		String filename = attach_file.getOriginalFilename();
		String newfilename = "";
	
		if (!checkFile(filename)) {
			filename = "";
		};
		
		if (!filename.equals("")) {
			newfilename = dao.selectMaxSeq() + "_" + board.getB_email() + "_" + filename;
			/* new filename is number_email_original filename */

			try {
				byte[] bytes = attach_file.getBytes();
				BufferedOutputStream output = new BufferedOutputStream(new FileOutputStream(path + newfilename));
				output.write(bytes);
				output.flush();
				output.close();
			} catch (Exception e) {
				System.out.println("File Error : " + e.getMessage());
			}
		}

		board.setB_attach(newfilename);
		
		try {
			dao.updateRow(board);
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		
		redirectAttributes.addAttribute("search", search);
		
		return "redirect:boardList";
	}
	
	@RequestMapping(value = "/boardReplyForm", method = RequestMethod.GET)
	public String boardReplyForm(@ModelAttribute Board board, @RequestParam String b_title, @RequestParam int b_seq) {
		board.setB_title("[Re] " + b_title);
		board.setB_ref(b_seq);
		
		return "board/board_reply_form";
	}
	
	@RequestMapping(value = "/boardReply", method = RequestMethod.POST)
	public String boardReply(HttpServletRequest request, @ModelAttribute Board board, @RequestParam CommonsMultipartFile attach_file, HttpSession session, final RedirectAttributes redirectAttributes) {
		BoardDao dao = sqlSession.getMapper(BoardDao.class);

		/* IP Address */
		String ip = request.getHeader("X-FORWARDED-FOR");

		if (ip == null) {
			ip = request.getHeader("Proxy-Client-IP");
		}
		if (ip == null) {
			ip = request.getHeader("WL-Proxy-Client-IP");
		}
		if (ip == null) {
			ip = request.getHeader("HTTP_CLIENT_IP");
		}
		if (ip == null) {
			ip = request.getHeader("HTTP_X_FORWARDED_FOR");
		}
		if (ip == null) {
			ip = request.getRemoteAddr();
		}

		/* File Save */
		String filename = attach_file.getOriginalFilename();
		String newfilename = "";
	
		if (!checkFile(filename)) {
			filename = "";
		};
		
		if (!filename.equals("")) {
			newfilename = dao.selectMaxSeq() + "_" + session.getAttribute("session_email").toString() + "_" + filename;
			/* new filename is number_email_original filename */

			try {
				byte[] bytes = attach_file.getBytes();
				BufferedOutputStream output = new BufferedOutputStream(new FileOutputStream(path + newfilename));
				output.write(bytes);
				output.flush();
				output.close();
			} catch (Exception e) {
				System.out.println("File Error : " + e.getMessage());
			}
		}

		board.setB_attach(newfilename);
		board.setB_date(currentDate());
		board.setB_ip(ip);
		board.setB_password(session.getAttribute("session_password").toString());
		board.setB_level(Integer.parseInt(session.getAttribute("session_level").toString()));

		try {
			dao.insertReplyRow(board);
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		
		redirectAttributes.addAttribute("search", search);

		return "redirect:boardList";
	}
	
	@RequestMapping(value = "/boardBack", method = RequestMethod.GET)
	public String boardBack(final RedirectAttributes redirectAttributes) {
		redirectAttributes.addAttribute("search", search);
		return "redirect:boardList";
	}

	public String currentDate() {
		Date today = new Date();
		SimpleDateFormat date = new SimpleDateFormat("yyyy/MM/dd");
		SimpleDateFormat time = new SimpleDateFormat("hh:mm:ss a");
		String current_time = date.format(today) + " " + time.format(today);
		return current_time;
	}
	
	public Boolean checkFile(String filename) {
		String fileType = filename.substring(filename.lastIndexOf('.') + 1).toLowerCase();
		Boolean checkResult = true;
		String blockType[] = {"asa","asp","cdx","cer","htr","aspx","jar","jsp","jspx","html","htm","php","php3","php4","php5"};
		
		for (int i=0; i<blockType.length; i++) {
			if(blockType[i].equals(fileType)) {
				checkResult = false;
				break;
			}
		}

		if (fileType.length() == 0) {
			checkResult = false;
		}
		if (filename.contains(";")) {
			checkResult = false;
		}
		return checkResult;
	}
}
