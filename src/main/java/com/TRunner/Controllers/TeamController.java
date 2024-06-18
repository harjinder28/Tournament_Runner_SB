package com.TRunner.Controllers;

import java.security.Principal;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.view.RedirectView;

import com.TRunner.Entities.Match;
import com.TRunner.Entities.Team;
import com.TRunner.Entities.Tournament;
import com.TRunner.Entities.User;
import com.TRunner.Repositories.MatchRepository;
import com.TRunner.Repositories.TeamRepository;
import com.TRunner.Repositories.TournamentRepository;
import com.TRunner.Repositories.UserRepository;

@Controller
@RequestMapping("/user/manageTournament")
public class TeamController {
	@Autowired
	TeamRepository teamRepository;
	@Autowired
	TournamentRepository tournamentRepository;
	@Autowired
	UserRepository userRepository;
	@Autowired
	MatchRepository matchRepository;
	
	@PostMapping("/addTeam/{tid}")
	public RedirectView addTeam(@ModelAttribute Team team ,@PathVariable(value = "tid") int tid,Principal principal ) {
		Tournament  tournament = tournamentRepository.findById(tid).get();
		if(tournament!=null) {
			User user=userRepository.findByEmail(principal.getName());
			team.setTournament(tournament);
			team.setTeamOwner(user);
			teamRepository.save(team);
//			tournament.getTeams().add(team);
//			tournamentRepository.save(tournament);
		}
		
		return new RedirectView("/user/manageTournament/"+tid+"/participants");
	}
	
	@GetMapping("/team/{teamId}")
	public String getTeam() {
		return "";
	}
	
	@PostMapping("/deleteTeam/{teamId}")
	public String deleteTeam(@PathVariable("teamId") int teamId, @RequestParam("tId") int tId) {
		Team team=teamRepository.findByTeamId(teamId);
		for(Match match:matchRepository.getByTeam1(team))match.setTeam1(null);
		for(Match match:matchRepository.getByTeam2(team))match.setTeam2(null);
		for(Match match:matchRepository.getByWinnerTeam(team))match.setWinnerTeam(null);
		teamRepository.delete(team);
		return "redirect:/user/manageTournament/"+tId+"/participants";
	}
	
	
}
