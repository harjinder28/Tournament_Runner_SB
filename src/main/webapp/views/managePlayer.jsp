<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page isELIgnored="false"%>
	<%@include file="/views/bootstarpTemplate.jsp" %>
 <%@ taglib prefix="c" uri="jakarta.tags.core" %>
<html>
<head>
<title>Manage Tournament - Participants</title>
<link rel="stylesheet" type="text/css" href="/css/manageTeam.css">
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
        <h2 style="font-size: 24pt;margin-bottom: 20px;color: green;">Edit Team  > Player > ${player.playerId}</h2>
        <form action="/user/manageTournament/${tid}/${teamId}/updatePlayer/${player.playerId}" method="post">
                <label>Player ID</label>
				<input type="text" class="id-field" id="teamId" name="playerId" disabled value='${player.playerId}'>
                <label>Player Name</label>
				<input type="text" placeholder="Player Name" id="playerName" value="${player.playerName}"
								class="input-field form-control" name="playerName" disabled> 
                <label>Role</label>
                <input type="text" placeholder="Role" id="role" value="${player.role}"
								class="input-field form-control" name="role" disabled> 
                <label>Date Of Birth</label>
                <input type="date" placeholder="DOB" value="${player.dateOfBirth}"
								class="input-field form-control" name="dateOfBirth" disabled>
                <label>Player Contact</label>
                <input type="text" placeholder="contact" value="${player.contact}"
								class="input-field form-control" name="contact" disabled>
                <input type="button" id="update-btn" value="Update">
				<input type="Submit" id="save-btn" value="Save" hidden>
                </form>
                <a href="/user/manageTournament/team/${tid}/${teamId}"><button>Back</button></a>
            </section>
        </div>
    </div>
</div>

<script src="/js/managePlayer.js" type="text/javascript"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>

</body>
</html>
