package com.buddi.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Random;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;

import com.buddi.svc.BuddiService;
import com.buddi.vo.BuddiMonVO;
import com.buddi.vo.BuddiUserVO;

@Controller
@SessionAttributes("uid") /* uid 라는 파라미터변수나 ModelAttribute 속성은 세션에 저장 */
@RequestMapping("/buddi")


public class BuddiController {

	@Autowired
	private BuddiService svc;

	@GetMapping("/main")
	public String form() {
		return "login/main";
	}
   
	@GetMapping("/mainc")
	public String mainc(@SessionAttribute(name = "uid", required = false) String uid, Model model) {

		if (uid == null) {
			return "redirect:/buddi/main"; // 로그인 폼으로 ...
		} else {
			BuddiUserVO user = svc.detailUser(uid);
			int dNum = svc.getTodayMon();
			BuddiMonVO mon = svc.detailMon(dNum);
			
			model.addAttribute("user", user);
			model.addAttribute("today", mon.getpNum());
			model.addAttribute("mon", mon);
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
	public String detail(@SessionAttribute(name="uid")String uid, Model model) {
		
		BuddiUserVO user = svc.detailUser(uid);
		
		model.addAttribute("user", user);
		
		return "/detail/detail_user";
	}
	
	@GetMapping("/join")
	public String join() {
		return "/login/join_form";
	}
	
	@GetMapping("/gacha")
	public String gacha(Model model) {
		
		Random rd = new Random();
		int dNum = rd.nextInt(159)+1;
		
		BuddiMonVO mon = svc.detailMon(dNum);
		
		model.addAttribute("today", mon.getpNum());
		model.addAttribute("mon", mon);
		return "/gacha/gacha_main";
	}
	
	@GetMapping("/gogacha")
	public String gogacha(@RequestParam String strCount,@SessionAttribute(name="uid")String uid, Model model) {
		List<BuddiMonVO> result = new ArrayList<>();
		int count = Integer.parseInt(strCount);
		result = svc.getGachaResult(count);
		BuddiUserVO user = svc.detailUser(uid);
		
		model.addAttribute("result", result);
		model.addAttribute("user", user);
		
		return "/gacha/gacha_result";
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
