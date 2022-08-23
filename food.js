const areaDropdown = document.querySelector(".area_dropdown_content");
const sortDropdown = document.querySelector(".sort_dropdown_content");
const parkingDropdown = document.querySelector(".parking_dropdown_content");

document.querySelector(".area_btn").addEventListener(
  "click",
  function () {
    areaDropdown.classList.add("block");

    areaDropdown.classList.remove("none");
  },
  false
);

document.querySelector(".area_apply_btn").addEventListener(
  "click",
  function () {
    areaDropdown.classList.add("none");

    areaDropdown.classList.remove("block");
  },
  false
);

document.querySelector(".sort_btn").addEventListener(
  "click",
  function () {
    sortDropdown.classList.add("block");

    sortDropdown.classList.remove("none");
  },
  false
);

document.querySelector(".sort_apply_btn").addEventListener(
  "click",
  function () {
    sortDropdown.classList.add("none");

    sortDropdown.classList.remove("block");
  },
  false
);

document.querySelector(".parking_btn").addEventListener(
  "click",
  function () {
    parkingDropdown.classList.add("block");

    parkingDropdown.classList.remove("none");
  },
  false
);

document.querySelector(".parking_apply_btn").addEventListener(
  "click",
  function () {
    parkingDropdown.classList.add("none");

    parkingDropdown.classList.remove("block");
  },
  false
);
