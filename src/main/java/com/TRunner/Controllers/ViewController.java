package com.TRunner.Controllers;

import java.security.Principal;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.TRunner.Entities.Tournament;
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
		List<Tournament> tournaments= tRepository.findByUser(userRepository.findByEmail(principal.getName()));
		model.addAttribute("tournaments",tournaments);
		return "viewtm";
	}
	
	
}
