<!DOCTYPE html>
<html>
<head>
    <title>GMT - Create Tournament</title>
    <link rel="stylesheet" type="text/css" href="/css/createtm.css">
</head>
<body>

 <nav>
        <div class="navcontainer">
            <h1>GMT</h1>
            
            <div class="mainnav">
            <ul>
                <li><a href="/home" class="active" >Home</a></li>
                <li><a href="/user/viewTournament" class="active" >View Tournament</a></li>
                
                 </ul>
                </div>
                <div class="logs">
                 <ul>
           
            </ul></div>
        </div>
    </nav>
    <div class="container">
        <h1>Create Tournament</h1>
        <form action="/user/createTournament" method="post">
        <div class="tab">
            <input name="title" type="text" placeholder="Tournament Name" required="required" class="input-field">
            <select class="input-field" required="required" name="gametype">
                <option value="" disabled selected>Select Game Type</option>
                <option value="sports">Sports</option>
                <option value="esports">Esports</option>
            </select>
        
            <select class="input-field" name="gameName">
                <option value="" disabled selected>Select Game</option>
                <!-- Sports Games -->
                <optgroup label="Sports Games">
                    <option value="football">Football</option>
                    <option value="basketball">Basketball</option>
                    <option value="tennis">Tennis</option>
                    <option value="golf">Golf</option>
                </optgroup>
                <!-- Esports Games -->
                <optgroup label="Esports Games" >
                    <option value="dota2">Dota 2</option>
                    <option value="leagueoflegends">League of Legends</option>
                    <option value="counterstrike">Counter-Strike: Global Offensive</option>
                    <option value="overwatch">Overwatch</option>
                    <option value="Valorant">Valorant</option>
                </optgroup>
            </select>
            <select class="input-field" name=tournamentType>
                <option value="" disabled selected>Select Tournament Type</option>
                <option value="Single Elimination">Single Elimination</option>
                <%-- <option value="double elimination">Double Elimination</option>
                <option value="round-robin">Round Robin</option> --%>
            </select>
            <textarea placeholder="Description" class="input-field" name="tournamentDiscription"></textarea>
            </div>
            <div class="tab">
           	Tournament Start Date
            <input type="date" placeholder="Start Date" class="input-field" name="startDate" >
            Tournament Start Time
            <input type="time" placeholder="Start Time" class="input-field" name="startTime">
            Tournament End Date
            <input type="date" placeholder="End Date" class="input-field" name="endDate" >
            Tournament End Time
            <input type="time" placeholder="End Time" class="input-field" name="endTime">
            <input type="text" placeholder="Venue" class="input-field" name="tournamentVenue">
            </div>
            <div class="tab">
            <input type="text" placeholder="Sponser Name" class="input-field" name="tournamentSponserName">
 <!-- <input type="text" placeholder="Contact Email" class="input-field">
            <input type="text" placeholder="Contact Phone" class="input-field"> -->           
            <input type="number" placeholder="Number of Teams Paricipating" class="input-field" name="tournamentNoOfTeams">
            <label> Entry Fee</label>
            <input type="number" placeholder="Entry Fee" value="0" class="input-field" name="tournamentFee">
            <input type="text" placeholder="Prize Pool" class="input-field" name="tournamentPrize">
            <input type="text" placeholder="City" class="input-field" name="tournamentCity">
            
            <button type="submit" class="btn">Create Tournament</button>
            </div>
            <div style="overflow:auto;">
  <div id="btnGroup">
    <button type="button" class="btn" id="prevBtn" onclick="nextPrev(-1)">Previous</button>
    <button type="button" class="btn" id="nextBtn" onclick="nextPrev(1)">Next</button>
  </div>
</div>

<!-- Circles which indicates the steps of the form: -->
<div style="text-align:center;margin-top:40px;">
  <span class="step"></span>
  <span class="step"></span>
  <span class="step"></span>
</div>

        </form>
    </div>
    <script src="/js/createtm.js"></script>
</body>
</html>
