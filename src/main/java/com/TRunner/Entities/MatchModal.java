package com.TRunner.Entities;

import jakarta.persistence.OneToOne;

public class MatchModal {
	int matchId;
	String  team1Name;
	int team1score;
	String  team2Name;
	int team2score;
	String matchDate;
	String matchTime;
	String winnerTeamName;
	int matchNumber;
	
	int roundNumber;
	
	public MatchModal() {
		super();
	}



	public MatchModal(int matchId, String team1Name, int team1score, String team2Name, int team2score, String matchDate,
			String matchTime, String winnerTeamName, int matchNumber, int roundNumber) {
		super();
		this.matchId = matchId;
		this.team1Name = team1Name;
		this.team1score = team1score;
		this.team2Name = team2Name;
		this.team2score = team2score;
		this.matchDate = matchDate;
		this.matchTime = matchTime;
		this.winnerTeamName = winnerTeamName;
		this.matchNumber = matchNumber;
		this.roundNumber = roundNumber;
	}



	public int getMatchId() {
		return matchId;
	}

	public void setMatchId(int matchId) {
		this.matchId = matchId;
	}

	public String getTeam1Name() {
		return team1Name;
	}

	public void setTeam1Name(String team1Name) {
		this.team1Name = team1Name;
	}

	public int getTeam1score() {
		return team1score;
	}

	public void setTeam1score(int team1score) {
		this.team1score = team1score;
	}

	public String getTeam2Name() {
		return team2Name;
	}

	public void setTeam2Name(String team2Name) {
		this.team2Name = team2Name;
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

	public String getWinnerTeamName() {
		return winnerTeamName;
	}

	public void setWinnerTeamName(String winnerTeamName) {
		this.winnerTeamName = winnerTeamName;
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
		return "MatchModal [matchId=" + matchId + ", team1Name=" + team1Name + ", team1score=" + team1score
				+ ", team2Name=" + team2Name + ", team2score=" + team2score + ", matchDate=" + matchDate
				+ ", matchTime=" + matchTime + ", winnerTeamName=" + winnerTeamName + "]";
	}



}
