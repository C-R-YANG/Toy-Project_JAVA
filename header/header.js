const menuList = document.querySelectorAll(".menu_list > div");

menuList.forEach((menu) => {
  menu.addEventListener("click", function () {
    importContentPage(this.innerHTML);
  });
});

document.querySelector("#move_home").addEventListener("click", function () {
  importContentPage("home");
});
