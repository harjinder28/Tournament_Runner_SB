const image = document.querySelector(".profile");
const optionsContainer = document.querySelector(".profile_dropdown");
image.addEventListener("click", () => {
  optionsContainer.classList.toggle("profile_active");
});
