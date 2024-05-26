
window.addEventListener('DOMContentLoaded', function() {
	var updateButton = document.getElementById('update-btn');
	var saveButton = document.getElementById('save-btn');
	// console.log(updateButton);
	updateButton.addEventListener('click', function() {
			saveButton.removeAttribute("hidden");
			updateButton.setAttribute("hidden","hidden");
			var inputField = document.querySelectorAll(".input-field");
			inputField.forEach(field =>  field.disabled = !field.disabled)
			// console.log(inputField);

	});
	saveButton.addEventListener('click', function() {
		saveButton.setAttribute("hidden","hidden");
		updateButton.removeAttribute("hidden");
	})

})

// Function to show the Add Team popup modal
function showAddTeamModal() {
	var modal = document.querySelector(".overlayTeam");
	modal.classList.remove("hiddendiv");
}

// Function to hide the Add Team popup modal
function hideAddTeamModal() {
	var modal = document.querySelector(".overlayTeam");
	modal.classList.add("hiddendiv");
}

//------------------------------------------------------------------------------------------------


// function showSection(sectionId, opt) {
// 	// Get all sections

// 	let sections = document.getElementsByClassName("section");
// 	let options = document.getElementsByClassName("item");

// 	// Hide all sections
// 	for (var i = 0; i < sections.length; i++) {
// 		sections[i].classList.remove("active");
// 	}
// 	for (var j = 0; j < options.length; j++) {
// 		options[j].classList.remove("item");
// 	}
// 	// Show the selected section
// 	var section = document.getElementById(sectionId);
// 	section.classList.add("active");
// 	var option = document.getElementById(opt);
// 	option.classList.add("item");

// }

// function showTab(tabId) {
// 	// Get all tabs
// 	var tabs = document.getElementsByClassName("tab");

// 	// Hide all tabs
// 	for (var i = 0; i < tabs.length; i++) {
// 		tabs[i].classList.remove("tabactive");
// 	}

// 	// Show the selected tab
// 	var tab = document.getElementById(tabId);
// 	tab.classList.add("tabactive");
// }

document.getElementById('bracketForm').addEventListener('submit', function(event) {
    event.preventDefault();
    var numTeams = parseInt(document.getElementById('numOfTeams').value);
    generateBracket(numTeams);
});

// document.getElementById('saveBracket').addEventListener('click', saveBracket);
// document.getElementById('loadBracket').addEventListener('click', loadBracket);

function generateBracket(numTeams) {
    var bracketContainer = document.getElementById('bracketContainer');
    bracketContainer.innerHTML = ''; // Clear previous brackets

    // Calculate the number of rounds
    var numRounds = Math.ceil(Math.log2(numTeams))+1;

    // Generate HTML for bracket
    var html = '';

    for (var round = 1; round <= numRounds; round++) {
        html += '<div class="round">';
        // var numMatches = Math.pow(2, numRounds - round);
		var numMatches = Math.ceil(numTeams / Math.pow(2, round - 1));
        for (var match = 1; match <= numMatches; match++) {
            html += '<div class="match">';
            if (round === numRounds) {
                html += '<select class="team-select" id="final_match_team' + match + '">';
            } else {
                html += '<select class="team-select" id="round_' + round + '_match_' + match + '">';
            }
            html += '<option value="">Select Team</option>';
            var teamTable = document.getElementById('teamTable');
            for (var i = 1; i <= numTeams; i++) {
                var teamName = teamTable.rows[i].cells[0].innerText;
                html += '<option value="' + teamName + '">' + teamName + '</option>';
            }
            html += '</select>';
            html += '</div>';
        }
        html += '</div>';
    }
    bracketContainer.innerHTML = html;


	attachChangeEventListeners();
}

function attachChangeEventListeners() {
    var teamSelects = document.querySelectorAll('.team-select');
    teamSelects.forEach(select => {
        select.addEventListener('change', function() {
            var selectedTeam = this.value;
            // var selectsInSameRound = this.closest('.round').querySelectorAll('.team-select');
            var selectsInSameRound = this.closest('.round').querySelectorAll('.team-select');
            selectsInSameRound.forEach(s => {
                if (s !== this) {
                    var options = s.querySelectorAll('option');
                    options.forEach(option => {
                        if (option.value === selectedTeam) {
                            option.disabled = true;
							// select.removeChild(option);
                        } else {
							option.disabled = false;
							// select.appendChild(option);
                        }
                    });
                }
            });
        });
    });
}

// function saveBracket() {
//     var bracketData = [];
//     var rounds = document.querySelectorAll('.round');
//     rounds.forEach((round, roundIndex) => {
//         var matches = round.querySelectorAll('.match select');
//         matches.forEach((match, matchIndex) => {
//             bracketData.push({
//                 round: roundIndex + 1,
//                 match: matchIndex + 1,
//                 team: match.value
//             });
//         });
//     });
//     fetch('/save-bracket', {
//         method: 'POST',
//         headers: {
//             'Content-Type': 'application/json'
//         },
//         body: JSON.stringify(bracketData)
//     }).then(response => response.json())
//       .then(data => {
//           console.log('Bracket saved:', data);
//       });
// }

// function loadBracket() {
//     fetch('/load-bracket')
//         .then(response => response.json())
//         .then(bracketData => {
//             generateBracket(bracketData.length ? bracketData[0].numTeams : 0);
//             bracketData.forEach(match => {
//                 var select = document.getElementById(`round_${match.round}_match_${match.match}`);
//                 if (select) {
//                     select.value = match.team;
//                     var event = new Event('change');
//                     select.dispatchEvent(event);
//                 }
//             });
//         });
// }


//------------------------------------------------------------------------------------------------------
//------------------------------------------------------------------------------------------------------
//------------------------------------------------------------------------------------------------------
//------------------------------------------------------------------------------------------------------
//------------------------------------------------------------------------------------------------------
//------------------------------------------------------------------------------------------------------
//------------------------------------------------------------------------------------------------------
//------------------------------------------------------------------------------------------------------
//------------------------------------------------------------------------------------------------------
//------------------------------------------------------------------------------------------------------
//------------------------------------------------------------------------------------------------------
//------------------------------------------------------------------------------------------------------
// class BracketTree {
// 	constructor(options) {
// 		this.container = options.container;
// 		this.data = options.data;
// 	}

// 	render() {
// 		var bracketDiagram = document.createElement("div");
// 		bracketDiagram.className = "bracket-diagram";

// 		this.data.forEach((round) => {
// 			var roundElement = document.createElement("div");
// 			roundElement.className = "bracket-round";

// 			round.forEach((matchup) => {
// 				var matchupElement = document.createElement("div");
// 				matchupElement.className = "bracket-matchup";

// 				if (matchup.team1 && matchup.team2) {
// 					// Matchup has two teams
// 					var team1Element = document.createElement("div");
// 					var selectElement1 = document.createElement("select");
// 					var optionSelect1 = document.createElement("option");
// 					team1Element.appendChild(selectElement1);
// 					selectElement1.appendChild(optionSelect1);
// 					team1Element.className = "bracket-item";
// 					optionSelect1.textContent=matchup.team1.name;
// 					optionSelect1.setAttribute('value',matchup.team1.name);

// 					var vsElement = document.createElement("div");
// 					vsElement.className = "vs";
// 					vsElement.textContent = "vs";

// 					var team2Element = document.createElement("div");
// 					var selectelement2 = document.createElement("select");
// 					var optionSelect2 = document.createElement("option");
// 					team1Element.appendChild(selectelement2);
// 					selectelement2.appendChild(optionSelect2);
// 					team2Element.className = "bracket-item";
// 					optionSelect2.textContent=matchup.team2.name;
// 					optionSelect2.setAttribute('value',matchup.team2.name);

// 					matchupElement.appendChild(team1Element);
// 					matchupElement.appendChild(vsElement);
// 					matchupElement.appendChild(team2Element);
// 				} else if (matchup.team1) {
// 					// Matchup has only one team (winner of a previous round)
// 					var team1Element = document.createElement("div");
// 					var selectElement1 = document.createElement("select");
// 					var optionSelect1 = document.createElement("option");
// 					team1Element.appendChild(selectElement1);
// 					selectElement1.appendChild(optionSelect1);
// 					team1Element.className = "bracket-item";
// 					optionSelect1.textContent=matchup.team1.name;
// 					optionSelect1.setAttribute('value',matchup.team1.name);
// 					matchupElement.appendChild(team1Element);
// 				}

// 				roundElement.appendChild(matchupElement);
// 			});

// 			bracketDiagram.appendChild(roundElement);
// 		});

// 		this.container.appendChild(bracketDiagram);
// 	}
// }
// //-----------------------------------------------------------------------------------

// // Create the select elements for each matchup in the bracket
// function createSelectElements(bracketData) {
//     const selectContainer = document.getElementById("selectContainer");
//     selectContainer.innerHTML = ""; // Clear previous select elements

//     bracketData.forEach((round, roundIndex) => {
//         round.forEach((matchup, matchupIndex) => {
//             const select1 = document.createElement("select");
//             const select2 = document.createElement("select");

//             // Add options to the select elements
//             createSelectOptions(select1, bracketData[roundIndex - 1][matchupIndex * 2]);
//             createSelectOptions(select2, bracketData[roundIndex - 1][matchupIndex * 2 + 1]);

//             // Handle changes in the select elements
//             select1.addEventListener("change", function () {
//                 matchup.team1.selectedTeam = this.value;
//             });
//             select2.addEventListener("change", function () {
//                 matchup.team2.selectedTeam = this.value;
//             });

//             // Append the select elements to the container
//             selectContainer.appendChild(select1);
//             selectContainer.appendChild(select2);
//         });
//     });
// }

// // Helper function to create options in a select element
// function createSelectOptions(selectElement, teamMatchup) {
//     if (teamMatchup && teamMatchup.winner) {
//         // If the team has already advanced, show its name as the only option
//         const option = document.createElement("option");
//         option.textContent = teamMatchup.winner.name;
//         option.value = teamMatchup.winner.name;
//         selectElement.appendChild(option);
//     } else {
//         // Otherwise, show all team names as options
//         teamNames.forEach((teamName) => {
//             const option = document.createElement("option");
//             option.textContent = teamName;
//             option.value = teamName;
//             selectElement.appendChild(option);
//         });
//     }
// }

// // Event listener for form submission
// // window.addEventListener("DOMContentLoaded", function () {
// //     var form = document.querySelector("#setupBracket #form");
// //     form.addEventListener("submit", handleBracketSubmission);
// // });

// function genBracket() {
// 	    var form = document.querySelector("#setupBracket #form");
// 	    form.addEventListener("submit", handleBracketSubmission);
// 	};

// // Handle form submission to update bracket data
// function handleBracketSubmission(event) {
//     event.preventDefault();
//     // Get the bracket data with user selections
//     const updatedBracketData = getBracketDataWithUserSelections();
//     // Render the updated bracket
//     renderBracket(updatedBracketData);
// }


// // Function to get the bracket data with user selections
// function getBracketDataWithUserSelections() {
//     const bracketContainer = document.getElementById("bracketContainer");
//     const selectElements = bracketContainer.querySelectorAll("select");
//     const updatedBracketData = [];

//     // Extract user selections from select elements
//     let matchupIndex = 0;
//     let currentRound = [];
//     selectElements.forEach((select, index) => {
//         const selectedTeam = select.value;
//         const isTeam1 = index % 2 === 0;

//         if (isTeam1) {
//             currentRound[matchupIndex].team1.selectedTeam = selectedTeam;
//         } else {
//             currentRound[matchupIndex].team2.selectedTeam = selectedTeam;
//             matchupIndex++;
//         }

//         // If both teams in the matchup have selections, move to the next matchup
//         if (currentRound[matchupIndex] && currentRound[matchupIndex].team1.selectedTeam && currentRound[matchupIndex].team2.selectedTeam) {
//             matchupIndex++;
//         }

//         // If all matchups in the current round have selections, move to the next round
//         if (matchupIndex === currentRound.length) {
//             updatedBracketData.push(currentRound);
//             currentRound = [];
//             matchupIndex = 0;
//         }
//     });

//     return updatedBracketData;
// }



// //-----------------------------------------------------------------------------------
// function renderBracket(numOfTeams, tournamentType) {
// 	var bracketContainer = document.getElementById("bracketContainer");

// 	// Generate the bracket data based on the number of teams and tournament type
// 	var bracketData = generateBracketData(numOfTeams, tournamentType);

// 	// Clear the existing bracket container
// 	bracketContainer.innerHTML = "";

// 	// Render the bracket diagram
// 	var bracket = new BracketTree({
// 		container: bracketContainer,
// 		data: bracketData,
// 	});
// 	bracket.render();
// }

// function generateBracketData(numOfTeams) {
// 	var teamTable = document.getElementById("teamTable");
// 	var rows = teamTable.getElementsByTagName("tbody")[0].getElementsByTagName("tr");
	    
//     var extraTeam=numOfTeams-rows.length;
    
// 	// Initialize an empty array to store the rounds and matchups
// 	var bracketData = [];

// 	// Start with the first round (containing the initial matchups)
// 	var firstRound = [];
// 	// Iterate through each row
// 	for (var i = 0; i < rows.length; i+=2) {
//     const row1 = rows[i];
//     const row2 = rows[i+1];
//     const team1Name = row1.cells[1].textContent;
//     const team2Name = row2.cells[1].textContent;
//     const matchup = {
// 			team1: { id: i + 1, name: team1Name },
// 			team2: { id: i + 2, name: team2Name },
// 		};
//          firstRound.push(matchup);
//     }
    

	
// 	// Create matchups for the first round with placeholders for teams
// 	for (let i = numOfTeams-extraTeam; i < extraTeam; i += 2) {
// 		const matchup = {
// 			team1: { id: i + 1, name: `Team ${i + 1}` },
// 			team2: { id: i + 2, name: `Team ${i + 2}` },
// 		};
// 		firstRound.push(matchup);
// 	}

// 	// Add the first round to the bracket data
// 	bracketData.push(firstRound);

// 	// Now, simulate the advancement of winning teams to the next rounds
// 	// Repeat this process until we have only one winner
// 	while (bracketData[bracketData.length - 1].length > 1) {
// 		const currentRound = bracketData[bracketData.length - 1];
// 		const nextRound = [];
// 		for (let i = 0; i < currentRound.length; i += 2) {
// 			const team1 = currentRound[i].winner ? currentRound[i].winner : currentRound[i].team1;
// 			const team2 = currentRound[i + 1].winner ? currentRound[i + 1].winner : currentRound[i + 1].team1;
// 			const matchup = {
// 				team1: team1,
// 				team2: team2,
// 			};
// 			//   const matchup = {
// 			//   team1: currentRound[i].winner,
// 			// team2: currentRound[i + 1].winner,
// 			// };
// 			nextRound.push(matchup);
// 		}
// 		bracketData.push(nextRound);
// 	}
// 	const finalRound = bracketData[bracketData.length - 1];
// 	if (finalRound.length === 1) {
// 		finalRound[0].winner = finalRound[0].team1.id < finalRound[0].team2.id ? finalRound[0].team1 : finalRound[0].team2;
// 	}

// 	return bracketData;
// }

