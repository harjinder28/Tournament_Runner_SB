<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page isELIgnored="false"%>
	<%@include file="/views/bootstarpTemplate.jsp" %>
 <%@ taglib prefix="c" uri="jakarta.tags.core" %>
<html>
<head>
<title>Manage Tournament - Result</title>
<link rel="stylesheet" type="text/css" href="/css/managetm_result.css">



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
				<a href="/user/manageTournament/${tid}/details"><li id="" class="menu-item " >Details</li></a>
				<a href="/user/manageTournament/${tid}/participants"><li id="" class="menu-item" >Participants</li></a>
				<a href="/user/manageTournament/${tid}/matches"><li id="" class="menu-item" >Matches</li></a>
				<a href="/user/manageTournament/${tid}/result"><li id="" class="menu-item active item" >Result</li></a>
			</ul>
			</nav>
		</div>
	
		
		<div class="content">


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
