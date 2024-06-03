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
					match.getMatchId(), match.getTeam1().getTeamName(), match.getTeam1score()
					, match.getTeam2().getTeamName() ,match.getTeam2score(), match.getMatchDate()
					, match.getMatchTime(), match.getWinnerTeam().getTeamName(),match.getMatchNumber(),match.getRoundNumber())); 
		} 
		return matches;
	}
}
