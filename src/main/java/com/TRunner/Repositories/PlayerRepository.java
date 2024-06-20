package com.TRunner.Repositories;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.TRunner.Entities.Player;
import java.util.List;
import com.TRunner.Entities.Team;


@Repository
public interface PlayerRepository extends JpaRepository<Player, Integer> {
	public List<Player> findByTeam(Team team);
	
	@Transactional
	public void deleteByPlayerId(int playerId);
}
