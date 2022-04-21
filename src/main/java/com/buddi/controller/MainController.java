package com.buddi.controller;


import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class MainController {
	
	@RequestMapping("/chat2")
	public ModelAndView chat() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("/login/chat");
		return mv;
	}
}