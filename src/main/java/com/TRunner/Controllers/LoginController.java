package com.TRunner.Controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import com.TRunner.Repositories.UserRepository;



@Controller
public class LoginController {
	@Autowired
	UserRepository userRepository;

	@GetMapping("/login")
	public String login() {
		return "login";
	}

//	@PostMapping("/login")
//	public String setUser(@ModelAttribute User user) {
//		//TODO: process POST request
//		User usr = userRepository.findByEmail(user.getEmail());
//
//		return "home";
//	}


}
