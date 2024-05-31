<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page isELIgnored="false"%>
 <%@ taglib prefix="c" uri="jakarta.tags.core" %>
 <%@page import="com.TRunner.Entities.Tournament"%>
<!DOCTYPE html>
<html>
<head>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">

  

<meta charset="UTF-8">
<title>View Tournament</title>
<link rel="stylesheet" type="text/css" href="/css/viewtm.css">
<script src="js/viewtm.js"></script> 
</head>
<body>
    
	<nav>
        <div class="navcontainer">
            <h1>GMT</h1>
            <div class="mainnav">
            <ul>
                <li><a href="/index" class="active" >Home</a></li>
               
                <li><a href= "/user/createTournament">Create Your Own Tournament  </a></li>
                 </ul>
                </div>
                <div class="logs">
                 <ul>
            </ul></div>
        </div>
    </nav>
    <div class="container">
            <table class="table">
            <thead>
                <tr>
                    <th scope="col">Tournament Name</th>
                    <th scope="col">Game Type</th>
                    <th scope="col">Game Name</th>
                    <th scope="col">Tournament Type</th>
                    <th scope="col">Start Date</th>
                    <th scope="col">Actions</th>
                </tr>
            </thead>
            <tbody>
         

<c:forEach items="${tournaments}" var="tournament">
                <tr>
                    <th scope="row" style="color:Grey">${tournament.title}</th>
                    <td>${tournament.gametype}</td>
                    <td>${tournament.gameName}</td>
                    <td>${tournament.tournamentType}</td>
                    <td>${tournament.startDate}</td>
                    <td><a href="/user/manageTournament/${tournament.tid}/details"><button name="manage" style="background-color: #4CAF50">Manage</button></a>
                        <button name="delete" type="submit" method="post" action="/user/deleteTournament/${tournament.tid}" value="Delete" style="background-color: red">Delete</button></td>
                </tr>
 </c:forEach> 

            </tbody>
            <table>
    </div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
</body>
</html>