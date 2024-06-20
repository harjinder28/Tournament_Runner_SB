package com.TRunner.Entities;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.OneToMany;
import jakarta.persistence.OneToOne;

@Entity
public class Player {
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	int playerId;
	String playerName;
	String role;
	String dateOfBirth;
	int contact;
	@ManyToOne
	Team team;
	public Player() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Player(int playerId, String playerName,String role ,String dateOfBirth, int contact, Team team) {
		super();
		this.playerId = playerId;
		this.playerName = playerName;
		this.role=role;
		this.dateOfBirth = dateOfBirth;
		this.contact = contact;
		this.team = team;
	}
	public int getPlayerId() {
		return playerId;
	}
	public void setPlayerId(int playerId) {
		this.playerId = playerId;
	}
	public String getPlayerName() {
		return playerName;
	}
	public String getRole() {
		return role;
	}
	public void setRole(String role) {
		this.role = role;
	}
	public void setPlayerName(String playerName) {
		this.playerName = playerName;
	}
	public String getDateOfBirth() {
		return dateOfBirth;
	}
	public void setDateOfBirth(String dateOfBirth) {
		this.dateOfBirth = dateOfBirth;
	}
	public int getContact() {
		return contact;
	}
	public void setContact(int contact) {
		this.contact = contact;
	}
	public Team getTeam() {
		return team;
	}
	public void setTeam(Team team) {
		this.team = team;
	}
	@Override
	public String toString() {
		return "Player [playerId=" + playerId + ", playerName=" + playerName + ", role=" + role + ", dateOfBirth="
				+ dateOfBirth + ", contact=" + contact + ", team=" + team + "]";
	}

	
}
