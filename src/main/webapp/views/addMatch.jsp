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
<form action="/user/manageTournament/${tId}/addMatch" method="post">
        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <h2>Add Match</h2>
                    <hr>
                </div>
            </div>
            <div class="row">
                <div class="col-md-6">
                    <div class="form-group">
                        <label for="roundNumber">Round Number</label> <input type="number"
                            class="form-control" id="roundNumber" name="roundNumber" value="${round}" readonly >
                    </div>
                </div>
                <div class="col-md-6">
                    <div class="form-group">
                        <label for="matchNumber">Match Number</label> <input type="number"
                            class="form-control" id="matchNumber" name="matchNumber" value="${match}" readonly>
                    </div>
                </div>
            </div>
            <div class="row">   
                <div class="col-md-6">
                    <div class="form-group">
                        <label for="team1">Team 1</label> <select class="form-control"
                            id="team1" name="team1">
                            <option value="">Select Team</option>
                            <c:forEach var="team" items="${teams}">
                                <option value="${team.teamId}">${team.teamName}</option>
                            </c:forEach>
                        </select>
                    </div>
                    <label for="team1score">Team 1 Score</label> <input type="text"
                        class="form-control" id="team1score" name="team1score" >
                </div>
                <div class="col-md-6">
                    <div class="form-group">
                        <label for="team2">Team 2</label> <select class="form-control"
                            id="team2" name="team2">
                            <option value="">Select Team</option>
                            <c:forEach var="team" items="${teams}">
                                <option value="${team.teamId}">${team.teamName}</option>
                            </c:forEach>
                        </select>
                    </div>
                    <label for="team2score">Team 2 Score</label> <input type="text"
                        class="form-control" id="team2score" name="team2score">
                </div>
            </div>
            <div class="row">
                <div class="col-md-6">
                    <div class="form-group
                        <label for="date">Match Date</label> <input type="date"
                            class="form-control" id="date" name="matchDate">
                    </div>
                </div>
                <div class="col-md-6">
                    <div class="form-group
                        <label for="time">Match Time</label> <input type="time"
                            class="form-control" id="time" name="matchTime">
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-md-12">
                    <button type="submit" class="btn btn-primary">Add Match</button>
                </div>
            </div>
        </div>
    </form>

</body>
</html