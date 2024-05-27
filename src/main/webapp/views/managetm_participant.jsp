<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page isELIgnored="false"%>
	<%@include file="/views/bootstarpTemplate.jsp" %>
 <%@ taglib prefix="c" uri="jakarta.tags.core" %>
<html>
<head>
<title>Manage Tournament - Participants</title>
<link rel="stylesheet" type="text/css" href="/css/managetm_participants.css">



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

        </section>


	<script src="/js/managetm.js" type="text/javascript"></script>

</body>
</html>
