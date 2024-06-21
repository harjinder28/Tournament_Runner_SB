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
