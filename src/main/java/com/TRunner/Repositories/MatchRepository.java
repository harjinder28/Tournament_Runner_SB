package com.TRunner.Repositories;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.TRunner.Entities.Match;
import com.TRunner.Entities.Tournament;


@Repository
public interface MatchRepository extends JpaRepository<Match, Integer>{
	public List<Match> findByTournament(Tournament tournament);
}
