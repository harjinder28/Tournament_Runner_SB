package com.TRunner.Controllers;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.TRunner.Entities.Match;
import com.TRunner.Entities.Team;
import com.TRunner.Entities.Tournament;
import com.TRunner.Repositories.MatchRepository;
import com.TRunner.Repositories.TeamRepository;
import com.TRunner.Repositories.TournamentRepository;

import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;


@Controller
@RequestMapping("/user")
public class MatchController {
	@Autowired
	MatchRepository matchRepository;
	@Autowired
	TournamentRepository tournamentRepository;
	@Autowired
	TeamRepository teamRepository;
	@GetMapping("/manageTournament/{tId}/addMatch/{round}/{match}")
	public String addMatch(Model model,@PathVariable("tId") int tId,@PathVariable("round") int round,@PathVariable("match") int match) {
		Tournament tournament = tournamentRepository.findById(tId).get();
		if(round==1) {
		List<Team> teams=teamRepository.getAllTeams(tournament);
		model.addAttribute("teams", teams);
		}
		else {
		Match roundMatch1=matchRepository.findByTournamentAndRoundNumberAndMatchNumber(tournament,round-1, (match*2)-1);
		List<Team> team1=new ArrayList<>();
		if(roundMatch1!=null) {
		team1.add(roundMatch1.getTeam1());
		team1.add(roundMatch1.getTeam2());
		}
		model.addAttribute("teams1", team1);
		if( roundMatch1.getWinnerTeam()!=null)
		model.addAttribute("team1winner", roundMatch1.getWinnerTeam());
		Match roundMatch2=matchRepository.findByTournamentAndRoundNumberAndMatchNumber(tournament,round-1, (match*2));
		List<Team> team2=new ArrayList<>();
		if(roundMatch2!=null) {
		team2.add(roundMatch2.getTeam1());
		team2.add(roundMatch2.getTeam2());
		}
		model.addAttribute("teams2", team2);
		if( roundMatch2.getWinnerTeam()!=null)
			model.addAttribute("team2winner", roundMatch2.getWinnerTeam());
		}
		model.addAttribute("tId", tId);
		model.addAttribute("round", round);
		model.addAttribute("match", match);
		return "addMatch";
	}
	
	@PostMapping("/manageTournament/{tId}/addMatch")
	public String postMethodName(@ModelAttribute Match match,@RequestParam int team1,@RequestParam int team2,@RequestParam int team1score,@RequestParam int team2score ,@PathVariable("tId") int tid) {
		Tournament tournament = tournamentRepository.findById(tid).get();
		match.setTournament(tournament);
//		Team team1=teamRepository.findByTeamNameAndTournament(team1Name,tournament);
		Team teamOne=teamRepository.findByTeamId(team1);
//		Team team2=teamRepository.findByTeamNameAndTournament(team2Name,tournament);
		Team teamTwo=teamRepository.findByTeamId(team2);
		
		match.setTeam1(teamOne);
		match.setTeam2(teamTwo);
		Team winTeam=team1score>team2score?teamOne:teamTwo;
		if(team1score==team2score)winTeam=null;
		match.setWinnerTeam(winTeam);
		matchRepository.save(match);
		return "redirect:/user/manageTournament/"+tid+"/matches";
	}
	
}
