<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page isELIgnored="false"%>
	<%@include file="/views/bootstarpTemplate.jsp" %>
 <%@ taglib prefix="c" uri="jakarta.tags.core" %>
<html>
<head>
<title>Manage Tournament - Details</title>
<link rel="stylesheet" type="text/css" href="/css/managetm_details.css">



</head>
<body>
	<nav>
		<div class="navcontainer">
			<h1>GMT</h1>
			<div>
				<ul>
					<li><a href="firstpage.jsp" class="active">Home</a></li>
					<li><a href="">View Your Tournaments</a></li>
				</ul>
			</div>
		</div>
	</nav>
	<div class="containerTop">

		<div class="sidebar">
		<nav class="sideNav">
			<ul class="sidebar-menu">
				<a href="/user/manageTournament/${tid}/details"><li id="" class="menu-item active item" >Details</li></a>
				<a href="/user/manageTournament/${tid}/participants"><li id="" class="menu-item" >Participants</li></a>
				<a href="/user/manageTournament/${tid}/matches"><li id="" class="menu-item" >Matches</li></a>
				<a href="/user/manageTournament/${tid}/result"><li id="" class="menu-item" >Result</li></a>
			</ul>
			</nav>
		</div>

		<div class="content">
			<section id="Details">
			<div id="overview" class="section active">
				<h2>Overview</h2>

				<!-- Display tournament details here -->
				<form action="/user/updateTournament" method="post">
				<input type="text" class="input-field" id="TournamentTitle" name="tid" disabled value='${tournament.tid}'>
				<label>TournamentTitle</label><br> <input type="text"
					class="input-field" id="TournamentTitle" name="title"
					disabled value='${tournament.title}'><br> 
					<label>Game
					Type</label><br> 
					<select class="input-field" id="TournamentGameType" name="gametype" disabled>
					<option value='${tournament.gametype}' selected>${tournament.gametype}</option>
					<option value="Sports">Sports</option>
					<option value="Esports">Esports</option>
				</select><br> 
				<label>Game Name</label><br> <select
					class="input-field" id="tournamentgameName"
					name="gameName" disabled>
					<option value='${tournament.gameName}' selected>${tournament.gameName}</option>
					<!-- Sports Games -->
					<optgroup label="Sports Games">
						<option value="Cricket">Cricket</option>
						<option value="Football">Football</option>
						<option value="Basketball">Basketball</option>
						<option value="Tennis">Tennis</option>
						<option value="Golf">Golf</option>
					</optgroup>
					<!-- Esports Games -->
					<optgroup label="Esports Games">
						<option value="Dota 2">Dota 2</option>
						<option value="League of Legends">League of Legends</option>
						<option value="Counter-Strike: Global
							Offensive">Counter-Strike: Global
							Offensive</option>
						<option value="Overwatch">Overwatch</option>
						<option value="Valorant">Valorant</option>
					</optgroup>
				</select><br> <label>Tournament Type</label><br> <select
					class="input-field" id="TournamentType" name="tournamentType"
					disabled>
					<option value='${tournament.tournamentType}' selected>${tournament.tournamentType}</option>
					<%-- <option value="Single Elimination">Single Elimination</option> --%>
					<%-- <option value="Double Elimination">Double Elimination</option>
					<option value="Round Robin">Round Robin</option> --%>
				</select><br> <label>Start Date</label><br> <input type="date"
					value='${tournament.startDate}' class="input-field" id="StartDate"
					name="startDate" disabled><<br> <label>Start
					Time</label><br> <input type="time" value='${tournament.startTime}'
					class="input-field" id="StartTime" name="startTime" disabled><br>
				<label>End Date</label><br> <input type="date"
					value='${tournament.endDate}' class="input-field" id="EndDate"
					name="endDate" disabled><br> <label>End Time</label><br>
				<input type="time" value='${tournament.endTime}' class="input-field"
					id="endTime" name="EndTime" disabled><br> <label>Description</label><br>
				<textarea placeholder="Description" class="input-field"
					id="tournamentDiscription" name="tournamentDiscription" disabled
					cols="" rows="">${tournament.tournamentDiscription}</textarea>
				<br> <label>Venue</label><br> <br> <input type="text"
					placeholder="Venue" id="tournamentVenue" name="tournamentVenue"
					value='${tournament.tournamentVenue}' class="input-field"
					id="tournamentVenue" disabled><br> 
					
					<label>Sponser Name</label><br> <input type="text" placeholder=" "
					class="input-field" id="sponserName" name="sponserName" disabled
					value=''><br> <label>No. of Teams</label><br> <input
					type="number" placeholder="No. of Teams" id="tournamentMaxTeam"
					name="tournamentNoOfTeams" disabled
					value='${tournament.tournamentNoOfTeams}' class="input-field"
					id="noOfTeams"><br> <label>Entry Fee</label><br>
				<input type="number" placeholder="Entry Fee" id="tournamentFee"
					name="tournamentFee" value='${tournament.tournamentFee}'
					class="input-field" id="tournamentFee" disabled><br> <label>Prize
					Pool</label><br> <input type="text" placeholder="Prize Pool"
					id="tournamentPrize" name="tournamentPrize"
					value='${tournament.tournamentPrize}' class="input-field"
					id="tournamentPrize" disabled><br> <label>City</label><br>

				<input type="text" placeholder="City" id="tournamentCity"
					name="tournamentCity" value='${tournament.tournamentCity}'
					class="input-field" id="tournamentCity" disabled>

				<input type="button" id="update-btn" value="Update">
				<input type="Submit" id="save-btn" value="Save" hidden>
				</form>
			</div>
		</section>

		</div>
	</div>

	<script src="/js/managetm.js" type="text/javascript"></script>

</body>
</html>
