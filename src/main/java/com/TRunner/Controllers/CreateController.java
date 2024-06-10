package com.TRunner.Controllers;

import java.security.Principal;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.TRunner.Entities.Tournament;
import com.TRunner.Entities.User;
import com.TRunner.Repositories.TournamentRepository;
import com.TRunner.Repositories.UserRepository;



@Controller
@RequestMapping("/user")
public class CreateController {
	@Autowired
	TournamentRepository repository;
	@Autowired
	UserRepository userRepository;

	@GetMapping("/createTournament")
	public String createTournament(){
		return "createtm";
	}

	@PostMapping("/createTournament")
	public String postMethodName(@ModelAttribute Tournament tournament,Principal principal) {
		//TODO: process POST request
		System.out.println(tournament);
		User user=userRepository.findByEmail(principal.getName());
		tournament.setUser(user);
		user.getTournaments().add(tournament);
		repository.save(tournament);
		userRepository.save(user);
		
		return "managetm_details";
	}

}
