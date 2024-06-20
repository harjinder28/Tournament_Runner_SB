<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page isELIgnored="false"%>
	<%@include file="/views/bootstarpTemplate.jsp" %>
 <%@ taglib prefix="c" uri="jakarta.tags.core" %>
<html>
<head>
<title>Manage Tournament - Participants</title>
<link rel="stylesheet" type="text/css" href="/css/managetm_participants.css">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">



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
				<a href="/user/manageTournament/${tid}/details"><li id="" class="menu-item" >Details</li></a>
				<a href="/user/manageTournament/${tid}/participants"><li id="" class="menu-item active item" >Participants</li></a>
				<a href="/user/manageTournament/${tid}/matches"><li id="" class="menu-item" >Matches</li></a>
				<a href="/user/manageTournament/${tid}/result"><li id="" class="menu-item" >Result</li></a>
			</ul>
			</nav>
		</div>	
		<div class="content">
		<section id="Participant">
			<div id="addTeamPlayers" class="section">
				<h2 style="color:green;text-align:center;border:1px solid;border-radius:10px;box-shadow:0 0 7px grey">Add Team</h2>
					
						<div id="team">
							<div class="teamTableDiv">
								<table id="teamTable" class="table0 table-striped">
									<thead>
										<tr>
											<th>Team ID</th>
											<th>Team Name</th>
											<th>Team Description</th>
											<th>No. of Players</th>
											<th>Actions</th>
										</tr>
									</thead>
									<tbody>
									<c:forEach items="${teams}" var="team" varStatus="counter">
                							<tr>
                							    <th scope="row" >${team.teamId}</th>
                							    <td>${team.teamName}</td>
                							    <td>${team.teamDescription}</td>
                							    <td>${team.teamSize}</td>
												<td><a href="/user/manageTournament/team/${tid}/${team.teamId}"><button name="manage" style="background-color: #4CAF50">Manage</button></a>
                        <form id="form${counter.count}" style="display:inline;" method="post" action="/user/manageTournament/deleteTeam/${team.teamId}"><input type="hidden" name="tId" value="${tid}"><button id="deleteTournamentButton" name="delete" onclick="deleteConfirmation('form${counter.count}')" value="Delete" style="background-color: red">Delete</button></form></td>
											</tr>
 									</c:forEach> 
										<%-- <%@include file="Alert_JSPs/dynamicManage.jsp"%> --%>
									</tbody>
								</table>
							</div>
							<div class="tableButton" style="margin-top:10px;display: flex;justify-content: center;">
							<button  id="addTeam" onclick="showAddTeamModal()" style="color:White;background-color:#4caf50;text-align:center;border:1px solid;border-radius:10px;box-shadow:0 0 7px grey">+ Add
								Team</button>
							</div>
						</div>
			</div>
				<!-- Popup modal for adding a team -->
			<div class="overlayTeam hiddendiv">
					<div class="popup-content">
						<h3>Add Team</h3>
						<form id="addTeamForm" action="/user/manageTournament/addTeam/${tournament.tid}"
							method="post">
							<input type="text" placeholder="Team Name" id="teamName"
								class="input-field form-control" name="teamName"> <input type="text"
								placeholder="Team Description " id="teamDescription"
								class="input-field form-control" name="teamDescription"> <input
								type="text" placeholder="Number Of Players" id="noOfPlayer"
								class="input-field form-control" name="teamSize">
							<div>
								<input type="submit" id="savebtn" value="Save" class="bn btn btn-primary"> <input
									type="button" id="closebtn" value="close" class="bn close-btn btn btn-primary"
									onclick="hideAddTeamModal()">
							</div>
						</form>
					</div>
			</div>
	
        </section>
	</div>
</div>

<dialog id="deleteDialog">
  <form method="dialog" >
    <p>Are you sure you want to delete?</p>
    <menu>
      <button id='close' value="cancel">Cancel!!</button>
      <button id='deleteConfirm' type="submit" value="submit">Yes!</button>
    </menu>
  </form>
</dialog>
	<%-- </div> --%>
	

<script src="/js/managetm_participant.js" type="text/javascript"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>

</body>
</html>
