// div review_btn을 클릭하면
// div review_modal의 display = block으로 변경한다.

// div review_modal안에 있는 닫기 버튼을 클릭하면 
// div review_modal의 display = none으로 변경한다.



function review_modal() {
  let reviewModal = document.querySelector(".review_modal_wrap");
  
  const modalDisplay = reviewModal.style.display;

  reviewModal.style.display = modalDisplay === "block" ? "none" : "block";
}