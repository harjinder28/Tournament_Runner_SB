package com.TRunner.Entities;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.ManyToOne;
@Entity
public class Team {
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	int teamId;

	String teamName;
	String teamDescription;
	@Column(name = "numberOfPlayers")
	int teamSize;
//	@ManyToMany
//	List<Tournament> tournaments;
	@ManyToOne
	Tournament  tournament;

	@ManyToOne
	User teamOwner;
	public Team() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Team(String teamName, String teamDescription, int teamSize, User teamOwner) {
		super();
		this.teamName = teamName;
		this.teamDescription = teamDescription;
		this.teamSize = teamSize;
		this.teamOwner = teamOwner;
	}
	public int getTeamId() {
		return teamId;
	}
	public void setTeamId(int teamId) {
		this.teamId = teamId;
	}
	public String getTeamName() {
		return teamName;
	}
	public void setTeamName(String teamName) {
		this.teamName = teamName;
	}
	public String getTeamDescription() {
		return teamDescription;
	}
	public void setTeamDescription(String teamDescription) {
		this.teamDescription = teamDescription;
	}
	public int getTeamSize() {
		return teamSize;
	}
	public void setTeamSize(int teamSize) {
		this.teamSize = teamSize;
	}
	public User getTeamOwner() {
		return teamOwner;
	}
	public void setTeamOwner(User teamOwner) {
		this.teamOwner = teamOwner;
	}
	public Tournament getTournaments() {
		return tournament;
	}
	public void setTournaments(Tournament tournament) {
		this.tournament = tournament;
	}
	@Override
	public String toString() {
		return "Team [teamId=" + teamId + ", teamName=" + teamName + ", teamDescription=" + teamDescription
				+ ", teamSize=" + teamSize + ", tournament=" + tournament + ", teamOwner=" + teamOwner + "]";
	}
	

}
