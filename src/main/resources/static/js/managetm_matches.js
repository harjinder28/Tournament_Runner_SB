// This file contains the javascript code for the manage tournament matches page
// This file is responsible for displaying the tournament bracket and handling the add match functionality
var numTeams = parseInt(document.getElementById("numOfTeams").value);

var numRounds = Math.ceil(Math.log2(numTeams)) + 1;

const bracket = document.getElementById("bracketContainer");
const tid = document.getElementById("tid").value;

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

function generateTournamentBracket(numTeams, type, matches) {
  let html = "";
  html += `<div class='roundsName' style="display:flex">`;
  for (let x = 1; x <= numRounds; x++) {
    html += `<div class="roundName" style="margin:AUTO;margin-top:0px;font-weight: bold;text-decoration:underline;margin-left:40px">Round ${x}</div>`;
  }
  html += "</div>";

  html += `<div class='bracket' style="display:flex;width:100%">`;

  for (let col = 1; col <= numRounds; col++) {
    if (col === numRounds) {
      html += `<div class="round" id="round${col}" style="display:grid;align-items:center;width:inherit;margin-left:10px;">`;
      html += `<div class="match" id="winnerTeam" style="colspan:${col * 2};">`;
      html += `<h6 class="winner" style="margin:0px;font-weight: bold;text-decoration:underline;">Winner Team</h6>`;
      html += `<b></b>`;
      if (matches[col - 1] && matches[col - 1][1]) {
        const team1points = matches[col - 1][1].team1score;
        const team2points = matches[col - 1][1].team2score;
        if (team1points > team2points) {
          html += `<ul style="margin:10px 5px;padding-left:10px;border:1px solid black;box-shadow:2px 5px lightgreen;">`;
          html += `<li style="display:inline-flex;"><div class="teamName"style="font-weight: bold;">${
            matches[col - 1][1].team1Name
          }</div>
          <div class="teamScore" style="margin-left:10px;">Score-${
            matches[col - 1][1].team1score
          }</div></li><br>`;
          html += `</ul>`;
        } else {
          html += `<ul style="margin:10px 5px;padding-left:10px;border:1px solid black;box-shadow:2px 5px lightgreen;">`;
          html += `<li style="display:inline-flex;"><div class="teamName" style="font-weight: bold;">${
            matches[col - 1][1].team2Name
          }</div>
          <div class="teamScore" style="margin-left:10px;">Score-${
            matches[col - 1][1].team2score
          }</div></li><br>`;
          html += `</ul>`;
        }
      }
      html += `</div>`;
      html += `</div>`;
      break;
    }

    var numMatches = Math.ceil(numTeams / Math.pow(2, col));
    html += `<div class="round" id="round${col}" style="display:grid;align-items:center;width:inherit;margin-left:10px;">`;
    for (let row = 1; row <= numMatches; row++) {
      // html+=`<a href="/user/manageTournament/tid/match/${col}/${row}">`;
      html += `<div class="match" id="match${col}-${row}" 
      style="colspan:${col * 2};">`;
      html += `<h6 class="matchName" style="margin:0px;font-weight: bold;text-decoration:underline;">Match ${col}-${row}</h6>`;
      if (matches && matches[col] && matches[col][row]) {
        const match = matches[col][row];
        html += `<ul style="margin:10px 5px;padding-left:10px;border:1px solid black;box-shadow:2px 5px lightgreen;">`;
        html += `<li style="display:inline-flex;"><div class="teamName" style="font-weight: bold;">${match.team1Name}</div><div class="teamScore" style="margin-left:10px;">Score-${match.team1score}</div></li><br>`;
        html += `   VS   <br>`;
        html += `<li style="display:inline-flex;"><div class="teamName" style="font-weight: bold;">${match.team2Name}</div><div class="teamScore" style="margin-left:10px;">Score-${match.team2score}</div></li>`;
        html += `</ul>`;
      } // else if (
      //   matches &&
      //   matches[col - 1] &&
      //   // matches[col - 1][Math.ceil(row / 2)] &&
      //   // matches[col - 1][Math.ceil(row / 2) + 1]
      //   matches[col - 1][row * 2] &&
      //   matches[col - 1][row * 2 - 1]
      // ) {
      //   html += `<ul style="margin:10px 5px;padding-left:10px;border:1px solid black;box-shadow:2px 5px lightgreen;">`;
      //   if (
      //     matches[col - 1][row * 2 - 1].team1score >
      //     matches[col - 1][row * 2 - 1].team2score
      //   ) {
      //     html += `<li style="display:inline-flex;"><div class="teamName" style="font-weight: bold;">${
      //       matches[col - 1][row * 2 - 1].team1Name
      //     }</div><div class="teamScore" style="margin-left:10px;">Score-${0}</div></li><br>`;
      //   } else {
      //     html += `<li style="display:inline-flex;"><div class="teamName" style="font-weight: bold;">${
      //       matches[col - 1][row * 2 - 1].team2Name
      //     }</div><div class="teamScore" style="margin-left:10px;">Score-${0}</div></li><br>`;
      //   }

      //   html += `   VS   <br>`;

      //   if (
      //     matches[col - 1][row * 2].team1score >
      //     matches[col - 1][row * 2].team2score
      //   ) {
      //     html += `<li style="display:inline-flex;"><div class="teamName" style="font-weight: bold;">${
      //       matches[col - 1][row * 2].team1Name
      //     }</div><div class="teamScore" style="margin-left:10px;">Score-${0}</div></li>`;
      //   } else {
      //     html += `<li style="display:inline-flex;"><div class="teamName" style="font-weight: bold;">${
      //       matches[col - 1][row * 2].team2Name
      //     }</div><div class="teamScore" style="margin-left:10px;">Score-${0}</div></li>`;
      //   }
      //   html += `</ul>`;
      else {
        html += `<ul style="margin:10px 5px;">`;
        html += `<li style="display:inline-flex"><div class="addMatch"><a href="/user/manageTournament/${tid}/addMatch/${col}/${row}"><button type="button" id="addMatch" >Add Match</button>	</a></div></li>`;
        html += `</ul>`;
      }
      html += `</div>`;
      // html+=`</a>`;
    }
    html += `</div>`;
  }
  html += `</div>`;

  bracket.innerHTML = html;
}

// generateTournamentBracket(numTeams, "Single Elimination");
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
