
package com.buddi.ws;


import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class ChatController {
	@GetMapping("/chat")
	public String chat(HttpSession session) {
		session.setAttribute("uid", "Smith");
		return "ws/chat";
	}
}
 