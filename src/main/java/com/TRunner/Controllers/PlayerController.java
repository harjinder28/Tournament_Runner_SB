package com.TRunner.Controllers;

import java.security.Principal;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.view.RedirectView;

import com.TRunner.Entities.Player;
import com.TRunner.Entities.Team;
import com.TRunner.Entities.Tournament;
import com.TRunner.Entities.User;
import com.TRunner.Repositories.PlayerRepository;
import com.TRunner.Repositories.TeamRepository;

import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;


@Controller
@RequestMapping("/user/manageTournament")
public class PlayerController {

	@Autowired
	private TeamRepository teamRepository;
	@Autowired
	private PlayerRepository playerRepository;
	
	@GetMapping("{tid}/{teamId}/managePlayer/{playerId}")
	public String getPlayer(@PathVariable("playerId") int playerId,@PathVariable("tid") int tid,@PathVariable("teamId") int teamId,Model model) {
		Player player = playerRepository.findById(playerId).get();
		model.addAttribute("player", player);
		model.addAttribute("teamId", teamId);
		model.addAttribute("tid", tid);
		return "managePlayer";
	}
	
	
	@PostMapping("/addPlayer/{tid}/{teamId}")
	public RedirectView addTeam(@ModelAttribute Player player ,@PathVariable(value = "teamId") int teamId,@PathVariable(value = "tid") int tid ) {
		Team  team= teamRepository.findById(teamId).get();
		if(team!=null) {
			player.setTeam(team);
			playerRepository.save(player);
		}
		
		return new RedirectView("/user/manageTournament/team/"+tid+"/"+teamId);
	}
//	@tr
	@PostMapping("/deletePlayer/{tid}/{playerId}")
	public String deletePlayer(@PathVariable("playerId") int playerId,@RequestParam("teamId") int teamId,@PathVariable(value = "tid") int tid) {
		playerRepository.deleteByPlayerId(playerId);
		return "redirect:/user/manageTournament/team/"+tid+"/"+teamId;
	}
	
	@PostMapping("/{tid}/{teamId}/updatePlayer/{playerId}")
	public String updatePlayer(@ModelAttribute Player playerNew,@PathVariable("playerId") int playerId,@PathVariable("tid") int tid,@PathVariable("teamId") int teamId) {
		Player player=playerRepository.findById(playerId).get();
		player.setPlayerName(playerNew.getPlayerName());
		player.setRole(playerNew.getRole());
		player.setDateOfBirth(playerNew.getDateOfBirth());
		player.setContact(playerNew.getContact());
		playerRepository.save(player);
		return "redirect:/user/manageTournament/team/" +tid+"/"+teamId;
	}
}
