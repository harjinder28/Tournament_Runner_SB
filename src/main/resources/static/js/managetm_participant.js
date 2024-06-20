function deleteConfirmation(formID) {
  this.addEventListener("click", function (e) {
    e.preventDefault();
  });
  let form = document.getElementById(formID);
  let dialog = document.getElementById("deleteDialog");
  dialog.style.display = "block";
  dialog.showModal();

  var deleteConfirm = document.getElementById("deleteConfirm");
  deleteConfirm.addEventListener("click", function () {
    form.submit();
    dialog.style.display = "none";
  });

  var close = document.getElementById("close");
  close.addEventListener("click", function () {
    let dialog = document.getElementById("deleteDialog");
    dialog.close();
    dialog.style.display = "none";
  });
}
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
