// document.getElementById('bracketForm').addEventListener('submit', function(event) {
//     event.preventDefault();
//     generateTournamentBracket(numTeams,"Single Elimination");
// });
var numTeams = parseInt(document.getElementById("numOfTeams").value);

var numRounds = Math.ceil(Math.log2(numTeams)) + 1;

const bracket = document.getElementById("bracketContainer");

// bracket.innerHTML+="<table><th>";
let html = "";
html += `<div class='roundsName' style="display:flex">`;
for (let x = 1; x <= numRounds; x++) {
  html += `<div class="roundName" style="margin:AUTO;margin-top:0px;font-weight: bold;text-decoration:underline;margin-left:40px">Round ${x}</div>`;
}
html += "</div>";

html += `<div class='bracket' style="display:flex;width:100%">`;

for (let col = 1; col <= numRounds; col++) {
  // html+=`<h6 class="roundName" style="margin:AUTO;margin-top:0px;font-weight: bold;text-decoration:underline;colspan:1">Round ${col}</h6>`;
  var numMatches = Math.ceil(numTeams / Math.pow(2, col));
  html += `<div class="round" id="round${col}" style="display:grid;align-items:center;width:inherit;margin-left:10px;">`;
  for (let row = 1; row <= numMatches; row++) {
    // html+=`<a href="/user/manageTournament/tid/match/${col}/${row}">`;
    html += `<div class="match" id="match${col}-${row}" style="colspan:${
      col * 2
    };border-left:1px solid black;border-bottom:1px solid black;border-top:1px solid black;">`;
    html += `<div class="team" id="team1-${col}-${row}" >`;
    html += `<ul style="margin:10px 5px;">`;
    html += `<li style="display:inline-flex"><div class="teamName">Null</div><div class="teamScore">NUll</div></li><br>`;
    html += `   VS   <br>`;
    html += `<li style="display:inline-flex"><div class="teamName">Null</div><div class="teamScore">NUll</div></li>`;
    html += `</ul>`;
    html += `</div>`;
    html += `</div>`;
    // html+=`</a>`;
  }
  html += `</div>`;
}
html += `</div>`;

bracket.innerHTML = html;
// function showAddTeamModal() {
//   var modal = document.querySelector(".overlayMatch");
//   modal.classList.remove("hiddendiv");
// }

// // Function to hide the Add Team popup modal
// function hideAddTeamModal() {
//   var modal = document.querySelector(".overlayMatch");
//   modal.classList.add("hiddendiv");
// }
// for (let col = 1; col <=  numRounds; col++){// html+=`<h6 class="roundName" style="margin:AUTO;margin-top:0px;font-weight: bold;text-decoration:underline;colspan:1">Round ${col}</h6>`;
//     var numMatches = Math.ceil(numTeams / Math.pow(2, col)); html+=`<div class="round" id="round${col}" style="display:grid;align-items:center;width:inherit;margin-left:10px;">`;
//     for (let row = 1; row <= numMatches; row++) {
//         let match=document.getElementById(`match${col}-${row}`);
//         match.addEventListener('click',function(){
//             alert(`Match ${col}-${row} clicked`);
//         });
//     }
// }
