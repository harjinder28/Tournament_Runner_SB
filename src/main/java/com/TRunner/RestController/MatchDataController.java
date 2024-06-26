package com.TRunner.RestController;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.TRunner.Entities.Match;
import com.TRunner.Entities.MatchModal;
import com.TRunner.Entities.Tournament;
import com.TRunner.Repositories.MatchRepository;
import com.TRunner.Repositories.TournamentRepository;

@RestController
@RequestMapping("/user")
public class MatchDataController {
	@Autowired
	MatchRepository matchRepository;
	@Autowired
	TournamentRepository tournamentRepository;
	
	@GetMapping("/manageTournament/{tId}/getMatches")
	public List<MatchModal> getAllMatches(@PathVariable("tId") int tId) {
		Tournament tournament = tournamentRepository.findById(tId).get();
		Iterator<Match> itr= matchRepository.findByTournament(tournament).iterator();
		List<MatchModal> matches =new ArrayList<>();
		while (itr.hasNext()) {
			Match match=itr.next();
		
			matches.add(new MatchModal(
					match.getMatchId(),  (match.getTeam1()!=null)?match.getTeam1().getTeamName():"Add Team",  (match.getTeam1()!=null)?match.getTeam1score():0
					,  (match.getTeam2()!=null)?match.getTeam2().getTeamName():"Add Team" , (match.getTeam2()!=null)?match.getTeam2score():0, match.getMatchDate()
					, match.getMatchTime(), (match.getWinnerTeam()!=null)?match.getWinnerTeam().getTeamName():"Add Team",match.getMatchNumber(),match.getRoundNumber())); 
		} 
		return matches;
	}
}
