const sign_in_btn = document.querySelector("#sign_in_button");
const sign_up_btn = document.querySelector("#sign_up_button");
const container = document.querySelector(".container");

sign_up_btn.addEventListener("click", () => {
  container.classList.add("sign_up_mode");
});

sign_in_btn.addEventListener("click", () => {
  container.classList.remove("sign_up_mode");
});
