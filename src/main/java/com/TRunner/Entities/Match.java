package com.TRunner.Entities;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.OneToMany;
import jakarta.persistence.OneToOne;

@Entity(name = "TeamMatch")
public class Match {
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	int matchId;
	@ManyToOne
	Team team1;
	
	int team1score;
	@ManyToOne
	Team team2;
	
	int team2score;
	
	int matchNumber;
	int roundNumber;
	
	String matchDate;
	
	String matchTime;
	
	@ManyToOne
	Team winnerTeam;
//	@OneToOne
	@ManyToOne
	Tournament tournament;
	public Match() {
		super();
	}

	public Match(int matchId, Team team1, int team1score, Team team2, int team2score, int matchNumber, int roundNumber,
			String matchDate, String matchTime, Team winnerTeam, Tournament tournament) {
		super();
		this.matchId = matchId;
		this.team1 = team1;
		this.team1score = team1score;
		this.team2 = team2;
		this.team2score = team2score;
		this.matchNumber = matchNumber;
		this.roundNumber = roundNumber;
		this.matchDate = matchDate;
		this.matchTime = matchTime;
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
	public int getTeam1score() {
		return team1score;
	}
	public void setTeam1score(int team1score) {
		this.team1score = team1score;
	}
	public Team getTeam2() {
		return team2;
	}
	public void setTeam2(Team team2) {
		this.team2 = team2;
	}
	public int getTeam2score() {
		return team2score;
	}
	public void setTeam2score(int team2score) {
		this.team2score = team2score;
	}
	public String getMatchDate() {
		return matchDate;
	}
	public void setMatchDate(String matchDate) {
		this.matchDate = matchDate;
	}
	public String getMatchTime() {
		return matchTime;
	}
	public void setMatchTime(String matchTime) {
		this.matchTime = matchTime;
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
	
	public int getMatchNumber() {
		return matchNumber;
	}
	public void setMatchNumber(int matchNumber) {
		this.matchNumber = matchNumber;
	}
	public int getRoundNumber() {
		return roundNumber;
	}
	public void setRoundNumber(int roundNumber) {
		this.roundNumber = roundNumber;
	}

	@Override
	public String toString() {
		return "Match [matchId=" + matchId + ", team1=" + team1 + ", team1score=" + team1score + ", team2=" + team2
				+ ", team2score=" + team2score + ", matchNumber=" + matchNumber + ", roundNumber=" + roundNumber
				+ ", matchDate=" + matchDate + ", matchTime=" + matchTime + ", winnerTeam=" + winnerTeam
				+ ", tournament=" + tournament + "]";
	}
	
	
	
}
