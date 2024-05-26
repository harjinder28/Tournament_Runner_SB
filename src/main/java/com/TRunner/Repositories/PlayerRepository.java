package com.TRunner.Repositories;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.TRunner.Entities.Player;

@Repository
public interface PlayerRepository extends JpaRepository<Player, Integer> {

}
