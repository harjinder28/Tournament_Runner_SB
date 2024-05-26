<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page isELIgnored="false"%>
	<%@include file="/views/bootstarpTemplate.jsp" %>
 <%@ taglib prefix="c" uri="jakarta.tags.core" %>
<html>
<head>
<title>GMT - Manage Tournament</title>
<link rel="stylesheet" type="text/css" href="/css/managetm.css">



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
		<nav>
			<ul class="sidebar-menu">
				<li id="o1" class="menu-item active item"
					onclick="showSection('overview','o1')">Overview</li>
				<li id="o2" class="menu-item"
					onclick="showSection('addTeamPlayers','o2')">Team and Players</li>
				<li id="o3" class="menu-item"
					onclick="showSection('setupBracket','o3')">Bracket</li>
				<li id="o4" class="menu-item"
					onclick="showSection('tournamentResults','o4')">Results</li>
				<!-- Add more menu items as needed -->
			</ul>
			</nav>
		</div>
		<%-- <div class="sidebar">
			<ul class="sidebar-menu">
				<li id="o1" class="menu-item active item"
					onclick="showSection('overview','o1')">Overview</li>
				<li id="o2" class="menu-item"
					onclick="showSection('addTeamPlayers','o2')">Team and Players</li>
				<li id="o3" class="menu-item"
					onclick="showSection('setupBracket','o3')">Bracket</li>
				<li id="o4" class="menu-item"
					onclick="showSection('tournamentResults','o4')">Results</li>
				<!-- Add more menu items as needed -->
			</ul>
		</div> --%>
		
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
					<option value="Single Elimination">Single Elimination</option>
					<option value="Double Elimination">Double Elimination</option>
					<option value="Round Robin">Round Robin</option>
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


		<section id="Participant">
			<div id="addTeamPlayers" class="section">
				<h2 style="text-align:center">Add Team</h2>
					
						<div id="team">
							<div class="teamTableDiv">
								<table id="teamTable" class="table table-striped">
									<thead>
										<tr>
											<th>Team ID</th>
											<th>Team Name</th>
											<th>Team Description</th>
											<th>No. of Players</th>
										</tr>
									</thead>
									<tbody>
									<c:forEach items="${teams}" var="team">
                							<tr>
                							    <th scope="row" >${team.teamId}</th>
                							    <td>${team.teamName}</td>
                							    <td>${team.teamDescription}</td>
                							    <td>${team.teamSize}</td>
											</tr>
 									</c:forEach> 
										<%-- <%@include file="Alert_JSPs/dynamicManage.jsp"%> --%>
									</tbody>
								</table>
							</div>
							<div class="tableButton" style="display: flex;justify-content: center;">
							<button  id="addTeam" onclick="showAddTeamModal()">+ Add
								Team</button>
							</div>
						</div>
			</div>
				<!-- Popup modal for adding a team -->
			<div class="overlayTeam hiddendiv">
					<div class="popup-content">
						<h2>Add Team</h2>
						<form id="addTeamForm" action="/user/manageTournament/addTeam/${tournament.tid}"
							method="post">
							<input type="text" placeholder="Team Name" id="teamName"
								class="input-field" name="teamName"> <input type="text"
								placeholder="Team Description" id="teamDescription"
								class="input-field" name="teamDescription"> <input
								type="text" placeholder="Number Of Players" id="noOfPlayer"
								class="input-field" name="teamSize">
							<div>
								<input type="submit" id="savebtn" value="Save"> <input
									type="button" id="closebtn" value="close" class="close-btn"
									onclick="hideAddTeamModal()">
							</div>
						</form>
					</div>
			</div>

			<div id="setupBracket" class="section">
				<h2>Setup Tournament Bracket</h2>
				<form method="POST" id="bracketForm" action="">
					<label for="numOfTeams">Number of Teams:</label> <input
						type="number" id="numOfTeams" id="numOfTeams" class="input-field"
						disabled value='${tournament.tournamentNoOfTeams}' required>
					<label for="tournamentType">Tournament Type:</label> <select
						id="tournamentType" id="tournamentType" required
						class="input-field">
						<option value="Single Elimination">Single Elimination</option>
						<option value="Double Elimination">Double Elimination</option>
						<option value="Round Robin">Round Robin</option>
					</select>

					<button type="submit" id="setupBracket" >Setup Bracket</button>
				</form>

				<div class="bracket-container" id="bracketContainer"></div>
			</div>
		</section>


		<section id="Result">
			<div id="tournamentResults" class="section">
				<h2>Results</h2>
				<div class="resultTableDiv">
					<table>
						<thead>
							<tr>
								<th>Team ID</th>
								<th>Team Name</th>
								<th>Description</th>
								<th>Number of Players</th>
							</tr>
						</thead>
						<tbody>

						</tbody>
					</table>
				</div>
			</div>
		</section>
		</div>
	</div>
	<script src="/js/managetm.js" type="text/javascript"></script>

</body>
</html>
