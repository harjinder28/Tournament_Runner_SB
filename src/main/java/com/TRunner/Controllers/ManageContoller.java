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
import org.springframework.web.servlet.view.RedirectView;

import com.TRunner.Entities.Team;
import com.TRunner.Entities.Tournament;
import com.TRunner.Repositories.TeamRepository;
import com.TRunner.Repositories.TournamentRepository;
import com.TRunner.Repositories.UserRepository;

@Controller
@RequestMapping("/user")
public class ManageContoller {
	@Autowired
	TournamentRepository tRepository;
	@Autowired
	UserRepository userRepository;
	@Autowired
	TeamRepository teamRepository;

	@GetMapping("/manageTournament/{tid}/details")
	public String getManagerDetails(@PathVariable(value = "tid") int tid, Model model, Principal principal) {
		Tournament tournament = tRepository.findById(tid).get();
		if (tournament.getUser().getEmail().equals(principal.getName())) {
			model.addAttribute("tournament", tournament);
			return "managetm_details";
		}
		return "";
	}

	@GetMapping("/manageTournament/{tid}/participants")
	public String getManagerParticipants(@PathVariable(value = "tid") int tid, Model model, Principal principal) {
		Tournament tournament = tRepository.findById(tid).get();
		if (tournament.getUser().getEmail().equals(principal.getName())) {
			model.addAttribute("tournament", tournament);
			// tournament.getTeams().forEach(System.out::println);
			List<Team> teams = teamRepository.getAllTeams(tournament);
			// teams.forEach(System.out::println);
			model.addAttribute("teams", teams);
			return "managetm_participant";
		}
		return "";
	}

	@GetMapping("/manageTournament/{tid}/matches")
	public String getManagerMatches(@PathVariable(value = "tid") int tid, Model model, Principal principal) {
		Tournament tournament = tRepository.findById(tid).get();
		if (tournament.getUser().getEmail().equals(principal.getName())) {
			model.addAttribute("tournament", tournament);
			// tournament.getTeams().forEach(System.out::println);
			List<Team> teams = teamRepository.getAllTeams(tournament);
			// teams.forEach(System.out::println);
			model.addAttribute("teams", teams);
			return "managetm_matches";
		}
		return "";
	}

	@GetMapping("/manageTournament/{tid}/result")
	public String getManagerResult(@PathVariable(value = "tid") int tid, Model model, Principal principal) {
		Tournament tournament = tRepository.findById(tid).get();
		if (tournament.getUser().getEmail().equals(principal.getName())) {
			model.addAttribute("tournament", tournament);
			// tournament.getTeams().forEach(System.out::println);
			List<Team> teams = teamRepository.getAllTeams(tournament);
			// teams.forEach(System.out::println);
			model.addAttribute("teams", teams);
			return "managetm_result";
		}
		return "";
	}

	@PostMapping("/updateTournament")
	public RedirectView updateDetail(@ModelAttribute Tournament tournament, Principal principal, Model modal) {
		int tid = tournament.getTid();
		if (tournament != null) {
			tournament.setUser(userRepository.findByEmail(principal.getName()));
			tRepository.save(tournament);
		}
		// System.out.println(tournament.getGameName() + tournament.getGametype());
		modal.addAttribute("tournament", tournament);

		return new RedirectView("/user/manageTournament/" + tid+"/details");
	}

}
