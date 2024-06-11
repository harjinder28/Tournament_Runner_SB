package com.TRunner.Controllers;

import java.security.Principal;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.TRunner.Entities.Tournament;
import com.TRunner.Entities.User;
import com.TRunner.Repositories.TournamentRepository;
import com.TRunner.Repositories.UserRepository;

@Controller
@RequestMapping("/user")
public class ViewController {
 
	@Autowired
	TournamentRepository tRepository;
	@Autowired
	UserRepository userRepository;
	
	@GetMapping("/viewTournament")
	public String viewTournament(Model model,Principal principal) {
//		List<Tournament> tournaments= userRepository.findByEmail(principal.getName()).getTournaments();
		User user=userRepository.findByEmail(principal.getName());
		List<Tournament> tournaments= tRepository.findByUser(user);
		model.addAttribute("tournaments",tournaments);
		model.addAttribute("uname", user.getUname());
		return "viewtm";
	}
	
	
}
