function showDropDown(obj) {
  const dropDown = obj.parentNode.children[3];
  
  dropDown.classList.add("block");
  dropDown.classList.remove("none");
}

function hideDropDown(obj) {
  const dropDown = obj.parentNode;

  dropDown.classList.add("none");
  dropDown.classList.remove("block");
}

function array_click(obj) {
  const parent = obj.parentNode,
        childList  = parent.children;

  for (let i = 0; i < childList.length; i++) {
    childList[i].className = "array_list";
  }

  obj.classList.add("array_list_click");
}

function allCheck(obj) {
  const parent = obj.parentNode,
        isChk  = obj.children[0].checked,
        childList  = parent.querySelectorAll("input");
  
  for (let i = 0; i < childList.length; i++) {
    childList[i].checked = isChk;
  }
}

function refrestFilter() {
  const searchWrap   = document.querySelector(".search_wrap"),
        checkBoxList = searchWrap.querySelectorAll("input[type='checkbox']");
  
  for (let i = 0; i < checkBoxList.length; i++) {
    checkBoxList[i].checked = true;
  }

  searchWrap.querySelector("#possible").checked = true;
  searchWrap.querySelector("#both").checked = false;

  searchWrap.querySelector(".keyword_input").value = ""
}

function isCheck(obj) {
  const isCheck = obj.children[0].checked,
        parent  = obj.parentNode,
        allChkBox = parent.children[0].children[0];

  if (!isCheck) {
    allChkBox.checked = false;
  } else {
    const checkBox = parent.querySelectorAll("input[type='checkbox']");

    let isChk = true;
    for (let i = 1; i < checkBox.length; i++) {
      isChk = checkBox[i].checked;
      
      if (!isChk) {
        return false;
      }
    }

    if (isChk) {
      allChkBox.checked = true;
    }
  }
}