// function 함수(obj){
//   부모 = obj의부모;
//   자식들 = 부모의 하위 메뉴;

//   자식들 클래스 제거
//   obj 클래스 추가
// }

function menu_click(obj) {
  const parent = obj.parentNode;
  const child = parent.children;

  for (let i = 0; i < child.length; i++) {
    child[i].className = "menu";
  }

  obj.classList.add("menu_click");
}

function array_click(obj) {
  const parent = obj.parentNode;
  const child = parent.children;

  for (let i = 0; i < child.length; i++) {
    child[i].className = "array";
  }

  obj.classList.add("array_click");
}
