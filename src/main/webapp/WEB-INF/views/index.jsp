<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<style>
  /* home_content1 */
  .home_content1 {
    width: 100%;
    height: 500px;
    background-image: url("/resource/img/puppy.jpg/");
    background-size: 1100px 500px;
  }

  .content1_title {
    text-align: center;
    padding: 100px 0 30px 0;
    font-size: 35px;
    font-weight: 600;
  }

  .content1_title span {
    color: #008a5b;
  }

  .content1_search_box {
    display: flex;
    width: 550px;
    height: 45px;
    margin: 0 auto;
  }

  .content1_dropdown {
    margin-right: 10px;
  }

  .content1_dropdown button {
    width: 95px;
    height: 45px;
    border-radius: 8px;
    background-color: white;
    border: none;
    font-size: 18px;
    cursor: pointer;
    padding-left: 20px;
    text-align: left;
  }

  .content1_dropdown img {
    width: 30px;
    height: 30px;
    display: block !important;
    position: relative;
    top: -36px;
    left: 59px;
    cursor: pointer;
  }

  .content1_dropdown_list {
    background-color: white;
    font-size: 20px;
    width: 95px;
    position: relative;
    top: -36px;
    border-bottom-left-radius: 8px;
    border-bottom-right-radius: 8px;
  }

  .content1_dropdown_list > div {
    display: block;
    text-decoration: none;
    font-size: 18px;
    padding: 10px 20px;
    cursor: pointer;
  }

  .content1_dropdown_list > div:hover {
    background-color: #ececec;
  }

  .content1_search {
    width: 500px;
    height: 45px;
  }

  .content1_search input {
    width: 100%;
    height: 45px;
    border: none;
    outline: none;
    border-radius: 8px;
    padding: 20px;
    font-size: 18px;
  }

  .content1_search button {
    width: 50px;
    height: 45px;
    border: none;
    border-radius: 8px;
    background-color: white;
    position: relative;
    top: -45px;
    left: 320px;
  }

  .content1_search img {
    width: 15px;
    height: 15px;
    cursor: pointer;
  }

  /* home_content2 */
  .home_content2 {
    width: 100%;
    height: 500px;
    margin: 0 auto;
  }

  .content2_title {
    text-align: center;
    font-size: 30px;
    font-weight: 600;
    padding: 100px;
  }

  .content2_list {
    width: 100%;
    display: flex;
    justify-content: center;
  }

  .content2_list img {
    margin: 0 15px;
    cursor: pointer;
  }

  /* Home_banner */
  .home_banner {
    width: 1100px;
    height: 150px;
    background-image: url("/resource/img/main_banner.png/");
    background-repeat: no-repeat;
    cursor: pointer;
  }

  /* home_content3 */
  .home_content3 {
    width: 100%;
    display: flex;
    height: 500px;
  }

  .content3_left {
    width: 50%;
  }

  .content3_right {
    width: 50%;
  }

  .home_monitor img {
    width: 500px;
    height: 400px;
    margin: 60px 30px;
  }

  .content3_title {
    font-size: 30px;
    margin-top: 110px;
  }

  .content3_title span {
    font-weight: 600;
  }

  .content3_list li {
    display: inline-block;
    position: relative;
    top: 50px;
    margin-right: 70px;
  }

  .content3_list img {
    width: 50px;
    height: 50px;
  }

  .content3_list span {
    font-size: 15px;
    position: absolute;
    top: 70px;
    left: 50%;
    transform: translate(-50%, 0);
  }

  /* Home_content4 */
  .home_content4 {
    width: 100%;
    height: 500px;
    display: flex;
  }

  .content4_left {
    width: 50%;
  }

  .content4_right {
    width: 50%;
  }

  .content4_title {
    font-size: 30px;
    margin: 100px 0px 100px 150px;
  }

  .content4_title span {
    font-weight: 600;
  }
</style>

<script type="text/javascript">
  let contents,
      content1,
      content2;

  $("document").ready(function () {
    contents = $("#contents");
    content1 = contents.children(".home_content1");
    content2 = contents.children(".home_content2");
  });

  function showDropDown(obj) {
    const paramObj = $(obj),
          dropDown = paramObj.children(":last"),
          isHide   = dropDown.hasClass("none");

    isHide ? dropDown.removeClass("none") : dropDown.addClass("none");
  }

  // 드롭다운 리스트 안에 있는 div를 클릭하면
  // 클릭한 div의 텍스트로 드롭다운 버튼의 텍스트가 변경된다.
  function dropDownText(obj) {
    const paramObj = $(obj),
          text     = paramObj.text(),
          button   = paramObj.parent().parent().children("button");

    button.text(text);
  }

</script>

<div class="home_content1">
  <h2 class="content1_title">
    반려동물과 <span>"같이"</span> 가고 싶은 곳을 검색해보세요.
  </h2>
  <div class="content1_search_box">
    <div class="content1_dropdown" onclick="showDropDown(this);">
      <button>전체</button>
      <img src="${url}/resource/img/dropdown.png" alt="dropdown"/>
      <div class="content1_dropdown_list none">
        <div onclick="dropDownText(this)">전체</div>
        <div onclick="dropDownText(this)">동구</div>
        <div onclick="dropDownText(this)">서구</div>
        <div onclick="dropDownText(this)">남구</div>
        <div onclick="dropDownText(this)">북구</div>
        <div onclick="dropDownText(this)">광산구</div>
      </div>
    </div>
    <div class="content1_dropdown" onclick="showDropDown(this);">
      <button>전체</button>
      <img src="${url}/resource/img/dropdown.png" alt="dropdown"/>
      <div class="content1_dropdown_list none">
        <div onclick="dropDownText(this)">전체</div>
        <div onclick="dropDownText(this)">한식</div>
        <div onclick="dropDownText(this)">중식</div>
        <div onclick="dropDownText(this)">일식</div>
        <div onclick="dropDownText(this)">양식</div>
        <div onclick="dropDownText(this)">분식</div>
      </div>
    </div>
    <form action="" class="content1_search">
      <input type="text" placeholder="검색어를 입력해주세요." />
      <button>
        <img src="${url}/resource/img/search.png" alt="search"/>
      </button>
    </form>
  </div>
</div>

<div class="home_content2">
  <div class="content2_title">지역별 모아보기</div>
  <div class="content2_list">
    <img src="${url}/resource/img/동구.png"  alt="" />
    <img src="${url}/resource/img/서구.png"  alt="" />
    <img src="${url}/resource/img/남구.png"  alt="" />
    <img src="${url}/resource/img/북구.png"  alt="" />
    <img src="${url}/resource/img/광산구.png" alt="" />
  </div>
</div>

<div class="home_banner"></div>

<div class="home_content3">
  <div class="content3_left">
    <div class="home_monitor">
      <img src="${url}/resource/img/computer.png" alt="" />
    </div>
  </div>
  <div class="content3_right">
    <div class="content3_title">
      <p>
        <span>광주 내 반려동물 동반 가능 장소</span> </br>모두 모여있어요 :) </br> </p>
    </div>
    <ul class="content3_list">
      <li><img src="${url}/resource/img/cutlery.png" ><span>FOOD    </span></li>
      <li><img src="${url}/resource/img/cafe.png"    ><span>CAFE    </span></li>
      <li><img src="${url}/resource/img/hospital.png"><span>HOSPITAL</span></li>
      <li><img src="${url}/resource/img/beauty.png"  ><span>BEAUTY  </span></li>
    </ul>
  </div>
</div>

<div class="home_content4">
  <div class="content4_left">
    <div class="content4_title">
      <p><span>방문자들의 리뷰</span>도</br> 한눈에 확인할 수 있어요 :)</p>
    </div>
  </div>
  <div class="content4_right">
    <div class="home_monitor">
      <img src="${url}/resource/img/computer.png" alt="" />
    </div>
  </div>
</div>