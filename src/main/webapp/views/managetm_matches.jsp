<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page isELIgnored="false"%>
	<%@include file="/views/bootstarpTemplate.jsp" %>
 <%@ taglib prefix="c" uri="jakarta.tags.core" %>
<html>
<head>
<title>Manage Tournament - Matches</title>
<link rel="stylesheet" type="text/css" href="/css/managetm_matches.css">



</head>
<body>
<input type="hidden" id="tid" value="${tournament.tid}"></input>
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
				<a href="/user/manageTournament/${tid}/details"><li id="" class="menu-item " >Details</li></a>
				<a href="/user/manageTournament/${tid}/participants"><li id="" class="menu-item" >Participants</li></a>
				<a href="/user/manageTournament/${tid}/matches"><li id="" class="menu-item active item" >Matches</li></a>
				<a href="/user/manageTournament/${tid}/result"><li id="" class="menu-item" >Result</li></a>
			</ul>
			</nav>
		</div>

		<div class="content">
			
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
					</select>

					<%-- <button type="submit" id="setupBracket" >Setup Bracket</button> --%>
				</form>
 			    <%-- <a href="/user/manageTournament/${tid}/addMatch"><button type="button" id="" >Add Match</button>	</a> --%>
	
				<div class="bracket-container" id="bracketContainer"></div>
			</div>
		</section>
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
	<script src="/js/managetm_matches.js" type="text/javascript"></script>

</body>
</html>
