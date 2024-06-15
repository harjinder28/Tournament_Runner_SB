window.onload = function () {
  // Function to reload data when the page is reloaded
  function reloadData() {
    // Make an AJAX call to the servlet controller
    var xhr = new XMLHttpRequest();
    xhr.open("GET", "/Tournament_Runner/viewTournament", true);
    /*     xhr.onreadystatechange = function() {
        if (xhr.readyState === XMLHttpRequest.DONE && xhr.status === 200) {

        }
      };*/
    xhr.send();
  }

  if (
    window.performance &&
    window.performance.navigation.type ===
      window.performance.navigation.TYPE_RELOAD
  ) {
    reloadData();
  }
};
const image = document.querySelector(".profile");
const optionsContainer = document.querySelector(".profile_dropdown");
image.addEventListener("click", () => {
  optionsContainer.classList.toggle("profile_active");
});
var currentTab = 0; // Current tab is set to be the first tab (0)
showTab(currentTab); // Display the current tab
const circle = document.querySelector(".pageNo");
setCircles(circle);
function setCircles() {
  let tab = document.getElementsByClassName("tab").length;
  for (let i = 0; i < tab; i += 4) {
    const span = document.createElement("span");
    span.classList.add("step");
    circle.appendChild(span);
  }
}

function showTab(n) {
  // This function will display the specified tab of the form ...
  var x = document.getElementsByClassName("tab");
  x[n].style.display = "block";
  // ... and fix the Previous/Next buttons:
  if (n == 0) {
    document.getElementById("prevBtn").style.display = "none";
  } else {
    document.getElementById("prevBtn").style.display = "inline";
  }

  document.getElementById("nextBtn").innerHTML = "Next";

  // ... and run a function that displays the correct step indicator:
  fixStepIndicator(n);
}

function nextPrev(n) {
  // This function will figure out which tab to display
  var x = document.getElementsByClassName("tab");
  // Exit the function if any field in the current tab is invalid:
  // Hide the current tab:
  x[currentTab].style.display = "none";
  // Increase or decrease the current tab by 1:
  currentTab = currentTab + n;
  // if you have reached the end of the form... :
  if (currentTab >= x.length - 1) {
    //...the form gets submitted:
    document.getElementById("nextBtn").style.display = "none";
    // return false;
  } else {
    document.getElementById("nextBtn").style.display = "inline";
  }
  // Otherwise, display the correct tab:
  showTab(currentTab);
}

function fixStepIndicator(n) {
  // This function removes the "active" class of all steps...
  var i,
    x = document.getElementsByClassName("step");
  for (i = 0; i < x.length; i++) {
    x[i].className = x[i].className.replace(" active", "");
  }
  //... and adds the "active" class to the current step:
  x[n].className += " active";
}

function deleteConfirmation(formID) {
  this.addEventListener("click", function (e) {
    e.preventDefault();
  });
  let form = document.getElementById(formID);
  let dialog = document.getElementById("deleteDialog");
  dialog.showModal();

  var deleteConfirm = document.getElementById("deleteConfirm");
  deleteConfirm.addEventListener("click", function () {
    form.submit();
  });

  var close = document.getElementById("close");
  close.addEventListener("click", function () {
    let dialog = document.getElementById("deleteDialog");
    dialog.close();
  });
}
