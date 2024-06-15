package com.TRunner.Repositories;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.TRunner.Entities.Tournament;
import com.TRunner.Entities.User;


@Repository
public interface TournamentRepository extends JpaRepository<Tournament, Integer> {

//	@Query("from user_tournaments T where T.user_uid =:id")
//	@Query(select tournament)
//	 public List<Tournament> findTounamentByUserId(@Param(value = "id") int id);
//	 public List<Tournament> findTounamentByUserId(int id);
	 public List<Tournament> findByUser(User user);
	 @Transactional
	 public void deleteByTid(int tid);
}
