package com.TRunner.Controllers;

import java.security.Principal;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class HomeController {

	@GetMapping("/home")
	public String home(Principal principal,Model model) {
		if(principal!=null)
			model.addAttribute("isLogged", true);
		else 
			model.addAttribute("isLogged", false);
		return "index";
	}

}
