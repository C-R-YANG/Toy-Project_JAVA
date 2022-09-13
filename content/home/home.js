const dropdownList = document.querySelectorAll(".dropdown_content > div");

dropdownList.forEach(dropdown => {
  dropdown.addEventListener("click", function(){
    const thisHtml = this.innerHTML;

    document.querySelector(".dropdown > button").innerHTML = thisHtml;

    document.querySelector(".dropdown_content").classList.add("none");

    document.querySelector(".dropdown_content").classList.remove("block");
  });
});

document.querySelector(".dropdown").addEventListener("mouseover", function(){
  document.querySelector(".dropdown_content").classList.add("block");

  document.querySelector(".dropdown_content").classList.remove("none");
}, false);

document.querySelector(".dropdown").addEventListener("mouseout", function(){
  document.querySelector(".dropdown_content").classList.add("none");

  document.querySelector(".dropdown_content").classList.remove("block");
}, false);