window.addEventListener("DOMContentLoaded", function () {
  var updateButton = document.getElementById("update-btn");
  var saveButton = document.getElementById("save-btn");
  // console.log(updateButton);
  updateButton.addEventListener("click", function () {
    saveButton.removeAttribute("hidden");
    updateButton.setAttribute("hidden", "hidden");
    var inputField = document.querySelectorAll(".input-field");
    inputField.forEach((field) => (field.disabled = !field.disabled));
    // console.log(inputField);
  });
  saveButton.addEventListener("click", function () {
    saveButton.setAttribute("hidden", "hidden");
    updateButton.removeAttribute("hidden");
  });
});

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
