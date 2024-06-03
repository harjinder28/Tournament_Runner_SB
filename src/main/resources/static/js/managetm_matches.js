// document.getElementById('bracketForm').addEventListener('submit', function(event) {
//     event.preventDefault();
//     generateTournamentBracket(numTeams,"Single Elimination");
// });
/*[
  {
    "matchId": 2,
    "team1Name": "Rozan",
    "team1score": 5,
    "team2Name": "loyals",
    "team2score": 4,
    "matchDate": "2024-05-31",
    "matchTime": "12:32",
    "winnerTeamName": "Rozan"
  }
]*/
var numTeams = parseInt(document.getElementById("numOfTeams").value);

var numRounds = Math.ceil(Math.log2(numTeams)) + 1;

const bracket = document.getElementById("bracketContainer");
const tid = document.getElementById("tid").value;

// getMatches();
// console.log(matches);

// team1.innerHTML = `<ul style="margin:10px 5px;">
// <li style="display:inline-flex"><div class="teamName">${team1Name}</div><div class="teamScore">${team1score}</div></li><br>
// VS   <br>
// <li style="display:inline-flex"><div class="teamName">${team2Name}</div><div class="teamScore">${team2score}</div></li>
// </ul>`;

fetch("/user/manageTournament/" + tid + "/getMatches")
  .then((response) => response.json())
  .then((data) => {
    const matchData = data;
    const matches = {};

    matchData.forEach((match) => {
      const roundNumber = match.roundNumber;
      const matchNumber = match.matchNumber;

      if (!matches[roundNumber]) {
        matches[roundNumber] = {};
      }

      matches[roundNumber][matchNumber] = match;
    });

    console.log(matches);
    generateTournamentBracket(numTeams, "Single Elimination", matches);
  });

// bracket.innerHTML+="<table><th>";
function generateTournamentBracket(numTeams, type, matches) {
  // console.log(matches);

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
      if (matches && matches[col] && matches[col][row]) {
        const match = matches[col][row];
        html += `<ul style="margin:10px 5px;padding-left:10px;border:1px solid black;box-shadow:2px 5px lightgreen;">`;
        html += `<li style="display:inline-flex;font-weight: bold;"><div class="teamName">${match.team1Name}</div><div class="teamScore" style="margin-left:10px;">Score-${match.team1score}</div></li><br>`;
        html += `   VS   <br>`;
        html += `<li style="display:inline-flex;font-weight: bold;"><div class="teamName">${match.team2Name}</div><div class="teamScore" style="margin-left:10px;">Score-${match.team2score}</div></li>`;
        html += `</ul>`;
      } else {
        html += `<ul style="margin:10px 5px;">`;
        html += `<li style="display:inline-flex"><div class="teamName">Null</div><div class="teamScore">NUll</div></li><br>`;
        html += `   VS   <br>`;
        html += `<li style="display:inline-flex"><div class="teamName">Null</div><div class="teamScore">NUll</div></li><br>`;
        html += `<li style="display:inline-flex"><div class="addMatch"><a href="/user/manageTournament/${tid}/addMatch/${col}/${row}"><button type="button" id="addMatch" >Add Match</button>	</a></div></li>`;
        html += `</ul>`;
      }
      html += `</div>`;
      html += `</div>`;
      // html+=`</a>`;
    }
    html += `</div>`;
  }
  html += `</div>`;

  // for (let col = 1; col <= numRounds; col++) {
  //   var numMatches = Math.ceil(numTeams / Math.pow(2, col));
  //   for (let row = 1; row <= numMatches; row++) {
  //     let team = document.getElementById(`team1-${col}-${row}`);
  //     team.innerHTML = `<ul style="margin:10px 5px;">`;

  //   }
  // }
  bracket.innerHTML = html;
}

generateTournamentBracket(numTeams, "Single Elimination");
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
