package com.TRunner.Repositories;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.TRunner.Entities.Team;
import com.TRunner.Entities.Tournament;

@Repository
public interface TeamRepository extends JpaRepository<Team, Integer> {
	public Team  findByTeamNameAndTournament(String teamName, Tournament tournament);
	public Team  findByTeamId(int teamId);
	
	@Query("select t From Team t WHERE t.tournament =:tid")
	public List<Team> getAllTeams(@Param("tid") Tournament tournament);
	@Transactional
	public void deleteByTeamId(int teamId);
	@Transactional
	public void deleteByTournament(Tournament tournament);
}
