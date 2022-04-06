package com.buddi.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
import com.buddi.vo.BuddiVO;


@Controller
@SessionAttributes("uid")  /* uid 라는 파라미터변수나 ModelAttribute 속성은 세션에 저장 */
@RequestMapping("/user")
public class BuddiController{

	@Autowired
	private BuddiService svc;

	@GetMapping("/login")
	public String form()
	{
		return "login/login_form";
	}

	
	@PostMapping("/login")
	@ResponseBody         
	public Map<String, Boolean> login(BuddiVO vo, Model model)
	{
		Map<String, Boolean> map = new HashMap<>();
		boolean ok = svc.login(vo);
		if(ok) {
			model.addAttribute("uid", user.getUid());  // 세션에 저장
		}
		map.put("ok", ok);
		return map;
	}
	
	@GetMapping("/logout")
	public String logout(SessionStatus status)
	{
		status.setComplete();
		return "redirect:/user/login";  // response.sendRedirect("/user/login");
	}
	
	@GetMapping("/list") /* 세션에 user가 저장되어 있지 않으면 오류가 발생하므로 required=false 설정함 */
	public String list(@SessionAttribute(name="uid", required=false) String uid, 
			Model model)
	{	
		if(uid==null) {
			return "redirect:/user/login";  // 로그인 폼으로 ...
		}else {
			List<User> list = svc.getList();
			model.addAttribute("list", list);
			return "user/userList";
		}
	}
	
	@GetMapping("/add")
	public String userAddForm() {
		return "user/addForm";
	}
	
	@PostMapping("/add")
	@ResponseBody
	public Map<String, Boolean> addUser(User user)
	{
		boolean added = svc.add(user);
		Map<String, Boolean> map = new HashMap<>();
		map.put("added", added);
		return map;
	}

	@GetMapping("/detail")
	public String detail(@RequestParam String userid, Model model)
	{
		User user = svc.detail(userid);
		model.addAttribute("user", user);
		return "user/detail";
	}
	
	@GetMapping("/edit")
	public String edit(@RequestParam String userid, Model model)
	{
		User user = svc.detail(userid);
		model.addAttribute("user", user);
		return "user/editUser";
	}
	
	@PostMapping("/update")
	@ResponseBody
	public Map<String,Boolean> update(User user)
	{
		boolean updated = svc.update(user);
		Map<String,Boolean> map = new HashMap<>();
		map.put("updated", updated);
		return map;
	}
	
	@PostMapping("/delete")
	@ResponseBody
	public Map<String,Boolean> delete(User user)
	{
		boolean deleted = svc.delete(user);
		Map<String,Boolean> map = new HashMap<>();
		map.put("deleted", deleted);
		return map;
	}
}

