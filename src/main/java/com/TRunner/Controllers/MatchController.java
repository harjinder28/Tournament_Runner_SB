package com.TRunner.Controllers;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;


@Controller
@RequestMapping("/user")
public class MatchController {

	@GetMapping("/manageTournament/addMatch")
	public String addMatch() {
		return "addMatch";
	}
	
	@PostMapping("/manageTournament/{tId}/addMatch")
	public String postMethodName(@RequestParam int team1,@RequestParam int team2,@RequestParam int team1score,@RequestParam int team2score,@PathVariable("tId") int tid) {
		
		return "redirect:/user/manageTournament/"+tid+"/details";
	}
	
}
