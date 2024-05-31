package com.TRunner.Entities;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.OneToOne;

@Entity(name = "TeamMatch")
public class Match {
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	int matchId;
	@OneToOne
	Team team1;
	
	int team1Ponts;
	@OneToOne
	Team team2;
	
	int team2Ponts;
	@OneToOne
	Team winnerTeam;
	@OneToOne
	Tournament tournament;
	public Match() {
		super();
	}
	
	public Match(int matchId, Team team1, int team1Ponts, Team team2, int team2Ponts, Team winnerTeam,
			Tournament tournament) {
		super();
		this.matchId = matchId;
		this.team1 = team1;
		this.team1Ponts = team1Ponts;
		this.team2 = team2;
		this.team2Ponts = team2Ponts;
		this.winnerTeam = winnerTeam;
		this.tournament = tournament;
	}



	public int getMatchId() {
		return matchId;
	}
	public void setMatchId(int matchId) {
		this.matchId = matchId;
	}
	public Team getTeam1() {
		return team1;
	}
	public void setTeam1(Team team1) {
		this.team1 = team1;
	}
	public int getTeam1Ponts() {
		return team1Ponts;
	}
	public void setTeam1Ponts(int team1Ponts) {
		this.team1Ponts = team1Ponts;
	}
	public Team getTeam2() {
		return team2;
	}
	public void setTeam2(Team team2) {
		this.team2 = team2;
	}
	public int getTeam2Ponts() {
		return team2Ponts;
	}
	public void setTeam2Ponts(int team2Ponts) {
		this.team2Ponts = team2Ponts;
	}
	public Team getWinnerTeam() {
		return winnerTeam;
	}
	public void setWinnerTeam(Team winnerTeam) {
		this.winnerTeam = winnerTeam;
	}

	public Tournament getTournament() {
		return tournament;
	}

	public void setTournament(Tournament tournament) {
		this.tournament = tournament;
	}

	@Override
	public String toString() {
		return "Match [matchId=" + matchId + ", team1=" + team1 + ", team1Ponts=" + team1Ponts + ", team2=" + team2
				+ ", team2Ponts=" + team2Ponts + ", winnerTeam=" + winnerTeam + ", tournament=" + tournament + "]";
	}

	
	
}
