package com.buddi.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.Resource;
import org.springframework.core.io.ResourceLoader;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.multipart.MultipartFile;

import com.buddi.dao.BuddiDAO;
import com.buddi.svc.BuddiService;
import com.buddi.vo.BuddiBoardVO;
import com.buddi.vo.BuddiMonVO;
import com.buddi.vo.BuddiPagingVO;
import com.buddi.vo.BuddiUserVO;

@Controller
@SessionAttributes({ "uid", "mon" }) /* uid 라는 파라미터변수나 ModelAttribute 속성은 세션에 저장 */
@RequestMapping("/buddi")
public class BuddiController {

	@Autowired
	private BuddiService svc;
	ResourceLoader resourceLoader;

	
	@GetMapping("/main")
	public String form(@SessionAttribute(name = "mon", required = false)BuddiMonVO mon, Model model) {
		if (mon==null) {
		model.addAttribute("mon", svc.getTodayMon());
		}
		model.addAttribute("list", svc.boardList());
		model.addAttribute("ran", svc.getRanking());
		model.addAttribute("random", svc.getRanking2());
		return "login/main";
	}
 
	@GetMapping("/mainc")
	public String mainc(@SessionAttribute(name = "uid", required = false) String uid, @SessionAttribute(name = "mon", required = false)BuddiMonVO mon, Model model) {

		if (uid == null) {
			return "redirect:/buddi/main"; // 로그인 폼으로 ...
		} else {
			BuddiUserVO user = svc.detailUser(uid);
			
			if (mon==null) {
				model.addAttribute("mon", svc.getTodayMon());
				}
			model.addAttribute("ran", svc.getRanking());
			model.addAttribute("random", svc.getRanking2());
			model.addAttribute("user", user);
			model.addAttribute("list", svc.boardList());
			BuddiPagingVO pu = svc.getOwnMon(uid, 1); 
			model.addAttribute("pu", pu);
			return "login/mainComplete";
		}

	}

	@GetMapping("/login")
	public String login() {
		return "login/login_form";
	}

	@PostMapping("/login")
	@ResponseBody
	public Map<String, Boolean> login(BuddiUserVO vo, Model model) {

		Map<String, Boolean> map = new HashMap<>();
		boolean ok = svc.login(vo);
		if (ok) {
			model.addAttribute("uid", vo.getUid());
		}
		map.put("ok", ok);
		return map;

	}

	@GetMapping("/logout")
	public String logout(SessionStatus status) {
		status.setComplete();
		return "redirect:/buddi/main";
	}

	@GetMapping("/add")
	public String userAddForm() {
		return "login/add_form";
	}

	@PostMapping("/add")

	@ResponseBody
	public Map<String, Boolean> addUser(BuddiUserVO vo) {
		boolean added = svc.add(vo);
		Map<String, Boolean> map = new HashMap<>();
		map.put("added", added);
		return map;
	}

	@GetMapping("/detail")
	public String detail(@SessionAttribute(name = "uid") String uid,@RequestParam String page, Model model) {

		BuddiUserVO user = svc.detailUser(uid);
		int pageNum = Integer.parseInt(page);
		BuddiPagingVO pu = svc.getOwnMon(uid, pageNum); 
		model.addAttribute("user", user);
		model.addAttribute("pu", pu);
		model.addAttribute("ea", svc.getEa(uid));

		return "/detail/detail_user";
	}

	@GetMapping("/join")
	public String join() {
		return "/login/join";
	}

	@GetMapping("/gacha")
	public String gacha(Model model) {

		return "/gacha/gacha_main";
	}

	@GetMapping("/gogacha")
	public String gogacha(@RequestParam String strCount, @SessionAttribute(name = "uid") String uid, Model model) {
		List<BuddiMonVO> result = new ArrayList<>();
		int count = Integer.parseInt(strCount);
		if(uid == null) {
			return "redirect:/buddi/main";
		}
		result = svc.getGachaResult(count, uid);
		BuddiUserVO user = svc.detailUser(uid);

		model.addAttribute("result", result);
		model.addAttribute("user", user);

		return "/gacha/gacha_result";
	}

	@GetMapping("/bbs/add")
	public String addForm() {
		return "board/addForm";
	}

	@PostMapping("/bbs/add")
	@ResponseBody
	public Map<String, Boolean> save(@RequestParam("files") MultipartFile[] mfiles, HttpServletRequest request,
			BuddiBoardVO board) {

		if (mfiles == null) {
			boolean saved = svc.addBoard(board);
			Map<String, Boolean> map = new HashMap<>();
			map.put("saved", saved);
			return map;
		} else {

			Map<String, Boolean> map = new HashMap<>();
			boolean saved = svc.addBoard(request, board, mfiles);
			map.put("saved", saved);
			return map;
		}
	}

	@GetMapping("/bbs/list")
	public String boardList(Model model) {
		model.addAttribute("list", svc.boardList());
		return "board/list";
	}

	@GetMapping("/bbs/download/{filename}")
	public ResponseEntity<Resource> download( // http://localhost/file/download/sample.zip
			HttpServletRequest request, @PathVariable String filename) {
		Resource resource = (Resource) resourceLoader.getResource("WEB-INF/upload/" + filename);
		System.out.println("파일명:" + resource.getFilename());
		String contentType = null;
		try {
			contentType = request.getServletContext().getMimeType(resource.getFile().getAbsolutePath());
		} catch (IOException e) {
			e.printStackTrace();
		}

		if (contentType == null) {
			contentType = "application/octet-stream";
		}

		return ResponseEntity.ok().contentType(MediaType.parseMediaType(contentType))
				.header(HttpHeaders.CONTENT_DISPOSITION, "attachment; filename=\"" + resource.getFilename() + "\"")
				.body(resource);
	}

	@GetMapping("/bbs/file/download/{num}")
	public ResponseEntity<Resource> fileDownload(@PathVariable int num, HttpServletRequest request) {
		// attach 테이블에서 att_num 번호를 이용하여 파일명을 구하여 위의 방법을 사용
		String filename = svc.getFilename(num);
		Resource resource = (Resource) resourceLoader.getResource("WEB-INF/upload/" + filename);
		// System.out.println("파일명:"+resource.getFilename());
		String contentType = null;
		try {
			contentType = request.getServletContext().getMimeType(resource.getFile().getAbsolutePath());
		} catch (IOException e) {
			e.printStackTrace();
		}

		if (contentType == null) {
			contentType = "application/octet-stream";
		}

		return ResponseEntity.ok().contentType(MediaType.parseMediaType(contentType))
				.header(HttpHeaders.CONTENT_DISPOSITION, "attachment; filename=\"" + resource.getFilename() + "\"")
				.body(resource);
	}

	@GetMapping("/bbs/detail")
	public String detail(@RequestParam int num, Model model) {
		BuddiBoardVO board = svc.detail(num);
		model.addAttribute("board", board);
		return "board/detail";
	}

	@PostMapping("/bbs/file/delete")
	@ResponseBody
	public Map<String, Boolean> deleteFileInfo(@RequestParam int num) {
		boolean deleted = svc.deleteFileInfo(num, resourceLoader); // resuourceLoader: 파일의 절대 경로 받을 때 필요한 코드.
		Map<String, Boolean> map = new HashMap<>();
		map.put("deleted", deleted);
		return map;
	}

	@PostMapping("/bbs/idcheck/{filename}")
	@ResponseBody
	public Map<String, Boolean> idcheck(@RequestParam String num) {
		boolean idcheck = svc.idcheck(num);
		Map<String, Boolean> map = new HashMap<>();
		map.put("idcheck", idcheck);
		return map;
	}

	@GetMapping("/bbs/staticpath")
	@ResponseBody
	public String getStaticPath() {
		Resource resource = (Resource) resourceLoader.getResource("upload");
		String absolutePath = null;
		try {
			absolutePath = resource.getFile().getAbsolutePath();
		} catch (IOException e) {
			e.printStackTrace();
		}

		return absolutePath;
	}
	@GetMapping("/test")
	public String test() {
		return "login/NewFile";
	}

	/*
	 * @GetMapping("/edit") public String edit(@RequestParam String userid, Model
	 * model) { User user = svc.detail(userid); model.addAttribute("user", user);
	 * return "user/editUser"; }
	 * 
	 * @PostMapping("/update")
	 * 
	 * @ResponseBody public Map<String, Boolean> update(User user) { boolean updated
	 * = svc.update(user); Map<String, Boolean> map = new HashMap<>();
	 * map.put("updated", updated); return map; }
	 * 
	 * @PostMapping("/delete")
	 * 
	 * @ResponseBody public Map<String, Boolean> delete(User user) { boolean deleted
	 * = svc.delete(user); Map<String, Boolean> map = new HashMap<>();
	 * map.put("deleted", deleted); return map; }
	 */

}




