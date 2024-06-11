package com.TRunner.Controllers;

import java.security.Principal;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.TRunner.Entities.User;
import com.TRunner.Repositories.UserRepository;

@Controller
public class HomeController {
	@Autowired
	UserRepository userRepository;
	@GetMapping("/home")
	public String home(Principal principal,Model model) {
		if(principal!=null) {
			model.addAttribute("isLogged", true);
			User user=userRepository.findByEmail(principal.getName());
			model.addAttribute("uname", user.getUname());
		}
		else 
			model.addAttribute("isLogged", false);
		return "index";
	}

}
