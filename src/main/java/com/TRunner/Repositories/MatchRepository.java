package com.TRunner.Repositories;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.TRunner.Entities.Match;
import com.TRunner.Entities.Tournament;
import com.TRunner.Entities.Team;



@Repository
public interface MatchRepository extends JpaRepository<Match, Integer>{
	public List<Match> findByTournament(Tournament tournament);
	public Match  findByTournamentAndRoundNumberAndMatchNumber(Tournament tournament,int roundNumber, int matchNumber);
	
	@Transactional
	public void deleteByTournament(Tournament tournament);
	
//	@Transactional
	public  List<Match> getByTeam1(Team team1);
	public List<Match> getByTeam2(Team team2);
	public List<Match> getByWinnerTeam(Team winner);
}