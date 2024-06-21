<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page isELIgnored="false"%>
	<%@include file="/views/bootstarpTemplate.jsp" %>
 <%@ taglib prefix="c" uri="jakarta.tags.core" %>
<html>
<head>
<title>Manage Tournament - Details</title>
<link rel="stylesheet" type="text/css" href="/css/addMatch.css">

</head>
<body>
 <%@include file="/views/Navbar.jsp" %> 
<form action="/user/manageTournament/${tId}/updateMatch/${match.matchId}" method="post">
        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <h2 style="font-size: 20pt;margin-bottom: 20px;color: green;">Add Match</h2>
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
                            class="form-control" id="matchNumber" name="matchNumber" value="${matchn}" readonly>
                    </div>
                </div>
            </div>
             <c:if test= "${round==1}">
            <div class="row">   
                <div class="col-md-6">
                    <div class="form-group">
                        <label for="team1">Team 1</label> <select class="form-control"
                            id="team1" name="team1">
                            <option value="${match.team1.teamId}" selected readonly>${team1Name}</option>
                            <c:forEach var="team" items="${teams}">
                                <option value="${team.teamId}">${team.teamName}</option>
                            </c:forEach>
                        </select>
                    </div>
                    <label for="team1score">Team 1 Score</label> <input type="text"
                        class="form-control" id="team1score" name="team1score" value="${match.team1score}">
                </div>
                <div class="col-md-6">
                    <div class="form-group">
                        <label for="team2">Team 2</label> <select class="form-control"
                            id="team2" name="team2">
                            <option value="${match.team2.teamId}" selected readonly>${team2Name}</option>
                            <c:forEach var="team" items="${teams}">
                                <option value="${team.teamId}">${team.teamName}</option>
                            </c:forEach>
                        </select>
                    </div>
                    <label for="team2score">Team 2 Score</label> <input type="text"
                        class="form-control" id="team2score" name="team2score" value="${match.team2score}">
                </div>
            </div>
             </c:if>
             <c:if test="${round>1}">
             <div class="row">
                <div class="col-md-6">
                    <div class="form-group
                        <label for="team1">Previous Winners</label> 
                        <input type="checkbox" id="prevWinners" name="prevWinners">
                    </div>
                </div>
            </div>
            <div class="prevWinnerUnselect">
                <div class="row">   
                <div class="col-md-6">
                    <div class="form-group">
                        <label for="team1">Team 1</label> <select class="form-control"
                            id="winnerteam1" name="team1">
                            <option value="${match.team1.teamId}" selected readonly>${team1Name}</option>
                            <c:forEach var="team" items="${teams1}">
                                <option value="${team.teamId}">${team.teamName}</option>
                            </c:forEach>
                        </select>
                    </div>
                    
                </div>
                <div class="col-md-6">
                    <div class="form-group">
                        <label for="team2">Team 2</label> <select class="form-control"
                            id="winnerteam2" name="team2">
                            <option value="${match.team2.teamId}" selected readonly>${team2Name}</option>
                            <c:forEach var="team" items="${teams2}">
                                <option value="${team.teamId}">${team.teamName}</option>
                            </c:forEach>
                        </select>
                    </div>
                
                </div>
                </div>
                <div class="row">
                <div class="col-md-6">
                    <div class="form-group">
                        <label for="team1score">Team 1 Score</label> <input type="number"
                            class="form-control" id="team1score" name="team1score" value="${match.team1score}">
                    </div>
                </div>
                <div class="col-md-6">
                    <div class="form-group">
                        <label for="team2score">Team 2 Score</label> <input type="number"
                            class="form-control" id="team2score" name="team2score" value="${match.team2score}">
                    </div>
                </div>
            </div>
            </div>
            <div class="prevWinnerSelect">
                <div class="row">   
                <div class="col-md-6">
                    <div class="form-group">
                        <label for="team1">Team 1</label> <select class="form-control"
                            id="team1" name="team1" >
                            <option value="${team1winner.teamId}" selected>${team1winner.teamName}</option>   
                        </select>    
                    </div>
                    
                </div>
                <div class="col-md-6">
                    <div class="form-group">
                        <label for="team2">Team 2</label> <select class="form-control"
                            id="team2" name="team2" >
                            <option value="${team2winner.teamId}" selected>${team2winner.teamName}</option>   
                        </select> 
                    </div>
                    
                </div>
            </div>
            <div class="row">
            <div class="col-md-6">
                <div class="form-group">
                    <label for="team1score">Team 1 Score</label> <input type="number"
                        class="form-control" id="team1score" name="team1score" value="${match.team1score}">
                </div>
            </div>
            <div class="col-md-6">
                <div class="form-group">
                    <label for="team2score">Team 2 Score</label> <input type="number"
                        class="form-control" id="team2score" name="team2score"value="${match.team2score}">
                </div>
            </div>
             </c:if>
            </div>
            </div>
            <div class="row">
                <div class="col-md-6">
                    <div class="form-group
                        <label for="date">Match Date</label> <input type="date"
                            class="form-control lastRow" id="date" name="matchDate" value="${match.matchDate}">
                    </div>
                </div>
                <div class="col-md-6">
                    <div class="form-group
                        <label for="time">Match Time</label> <input type="time"
                            class="form-control lastRow" id="time" name="matchTime" value="${match.matchTime}">
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-md-12" style="text-align:center">
                    <button type="submit" class="btn btn-primary" >Update Match</button>
                </div>
                    
            </div>
        </div>
    </form>
</body>
<script>

    $(document).ready(function() {
        $(".prevWinnerSelect").hide();
        $("#prevWinners").click(function() {
            if ($(this).is(":checked")) {
                document.getElementById("team1").setAttribute("name", "team1");
                document.getElementById("team2").setAttribute("name", "team2");
                document.getElementById("winnerteam1").setAttribute("name", "");
                document.getElementById("winnerteam2").setAttribute("name", "");
                $(".prevWinnerSelect").show();
                $(".prevWinnerUnselect").hide();
            } else {
                document.getElementById("team1").setAttribute("name", "");
                document.getElementById("team2").setAttribute("name", "");
                document.getElementById("winnerteam1").setAttribute("name", "team1");
                document.getElementById("winnerteam2").setAttribute("name", "team2");
                $(".prevWinnerSelect").hide();
                $(".prevWinnerUnselect").show();
            }
        });
    });
</script>
</html>