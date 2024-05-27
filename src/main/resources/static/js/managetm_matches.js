document.getElementById('bracketForm').addEventListener('submit', function(event) {
    event.preventDefault();
    var numTeams = parseInt(document.getElementById('numOfTeams').value);
    generateTournamentBracket(numTeams,"Single Elimination");
});
// function generateTournamentBracket(numTeams, tournamentType) {
//     // Calculate the number of rounds based on the number of teams
//     var numRounds = Math.ceil(Math.log2(numTeams))+1;

//     const bracket = document.getElementById("bracketContainer");
    
//     bracket.innerHTML+="<table><th>";
//     for (let x = 1; x <= numRounds; x++) {
//         if(x===numRounds){bracket.innerHTML+=`<tr><td>Winner</td></tr>`; break;}
//         bracket.innerHTML+=`<tr><td>Round ${x}</td></tr>`;
//     }
//     bracket.innerHTML+="</th>";
//     // Generate the matches for each round
//     var numMatches = Math.ceil(numTeams / Math.pow(2, numRounds));
//     for (let row = 1; row < ; row++){
//         const element = array[row];
       
//     }
//     // for (let r = 1; r <= numRounds; r++) {
//     //     let round=document.createElement("div");
//     //     round.className=`rounds`;
//     //     let html="";
//     //     // Generate the matches for the current round
    
//             }
//             round.innerHTML=html;
//         }


//         bracket.appendChild(round);
//     }

// }
// function generateTournamentBracket(numTeams, tournamentType) {
//     // Calculate the number of rounds based on the number of teams
//     var numRounds = Math.ceil(Math.log2(numTeams))+1;

//     const bracket = document.getElementById("bracketContainer");
    

//     // Generate the matches for each round
//     for (let r = 1; r <= numRounds; r++) {
//         var numMatches = Math.ceil(numTeams / Math.pow(2, r));
//         let round=document.createElement("div");
//         round.className=`round${round}`;
//         let html="";
//         // Generate the matches for the current round
//         for (let match = 1; match <= numMatches; match++) {
//             if(round===numRounds){//final round only 1 div for showing winner
//                 html+=`<div class="match" id="match${round}-${match}">`;
//                 html+=`<div class="team" id="team1-${round}-${match}">`;
//                 html+=`<ul>`;
//                 html+=`<li><div class="teamName>Null</div><div class="teamScore">NUll</div></li>`;
//                 html+=`</ul>`;
//                 html+=`</div>`;
//                 round.innerHTML=html;
                
//             }
//             else{
//             // Create a div element for the match
//             html+=`<div class="match" id="match${round}-${match}" style="grid-row=${(match%2)+1}">`;

//             // Create two div elements for the team names
//             html+=`<div class="team" id="team1-${round}-${match}">`;
//             html+=`<ul>`;
//             html+=`<li><div class="teamName>Null</div><div class="teamScore">NUll</div></li>`;
//             html+=`<li><div class="teamName>Null</div><div class="teamScore">NUll</div></li>`;
//             html+=`</ul>`;
//             html+=`</div>`;
            
//             html+=`<div class="team" id="team2-${round}-${match}">`;
//             html+=`<ul>`;
//             html+=`<li><div class="teamName>Null</div><div class="teamScore">NUll</div></li>`;
//             html+=`<li><div class="teamName>Null</div><div class="teamScore">NUll</div></li>`;
//             html+=`</ul>`;
//             html+=`</div>`;
//             }
//             round.innerHTML=html;
//         }


//         bracket.appendChild(round);
//     }

// }

// // Example usage
// const numTeams = 8;
// const tournamentType = 'single elimination';
// const bracket = generateTournamentBracket(numTeams, tournamentType);
// console.log(bracket);