package com.TRunner.Controllers;

import java.security.Principal;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.view.RedirectView;

import com.TRunner.Entities.Player;
import com.TRunner.Entities.Team;
import com.TRunner.Entities.Tournament;
import com.TRunner.Entities.User;
import com.TRunner.Repositories.PlayerRepository;
import com.TRunner.Repositories.TeamRepository;

import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;


@Controller
@RequestMapping("/user")
public class PlayerController {

	@Autowired
	private TeamRepository teamRepository;
	@Autowired
	private PlayerRepository playerRepository;
	
	@PostMapping("/addPlayer/{tId}/{teamId}")
	public RedirectView addTeam(@ModelAttribute Player player ,@PathVariable(value = "teamId") int teamId,@PathVariable(value = "tid") int tid ) {
		Team  team= teamRepository.findById(teamId).get();
		if(team!=null) {
			player.setTeam(team);
			playerRepository.save(player);
		}
		
		return new RedirectView("/user/manageTournament/"+tid);
	}
	
}
