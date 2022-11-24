<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8" />
  <title>Document</title>
  <link
          href="https://hangeul.pstatic.net/hangeul_static/css/nanum-barun-gothic.css"
          rel="stylesheet"
  />
  <link
          rel="stylesheet"
          href="https://fonts.googleapis.com/icon?family=Material+Icons"
  />
</head>
<body>
<style>
  .nav {
    width: 80%;
    height: 50px;
    display: flex;
    margin: 15px auto;
  }

  .logo {
    width: 120px;
    height: 100%;
    line-height: 50px;
  }

  .logo img {
    width: 120px;
    cursor: pointer;
    vertical-align: middle;
  }

  .menu_list {
    width: 700px;
    height: 100%;
    display: flex;
    justify-content: space-evenly;
    align-items: center;
    font-size: 14px;
    cursor: pointer;
  }

  .menu_list > div {
    height: 100%;
    line-height: 50px;
  }

  .menu_list > div::after {
    display: block;
    content: "";
    border-bottom: solid 3px #9bc76c;
    transform: scaleX(0);
    transition: transform 0.2s ease-in-out;
  }

  .menu_list > div:hover::after {
    transform: scaleX(1.1);
  }

  #login {
    width: 120px;
    height: 75%;
    margin-top: 5px;
    display: flex;
    justify-content: flex-end;
    transition: 0.25s;
  }

  #login:hover {
    letter-spacing: 1px;
    transform: scale(1.1);
    cursor: pointer;
  }

  #login div {
    width: 90px;
    padding: 5px;
    font-size: 14px;
    text-align: center;
    line-height: 30px;
    color: #fff;
    border-radius: 10px;
    background-color: #9bc76c;
  }
</style>
<style>
  .header_content {
    width: 100%;
    height: 500px;
    background-image: url("../../IMG/puppy.jpg");
    background-size: 1100px 500px;
  }

  .header_text {
    text-align: center;
    padding: 100px 0 30px 0;
    font-size: 35px;
    font-weight: 600;
  }

  .header_text span {
    color: #008a5b;
  }

  .search_box {
    display: flex;
    width: 600px;
    height: 45px;
    margin: 0 auto;
  }

  .dropdown {
    margin-right: 10px;
  }

  .dropdown button {
    width: 110px;
    height: 45px;
    border-radius: 8px;
    background-color: white;
    border: none;
    font-size: 20px;
    cursor: pointer;
    padding-left: 20px;
    text-align: left;
  }

  .dropdown_icon {
    display: block !important;
    position: relative;
    top: -38px;
    left: 75px;
    cursor: pointer;
  }

  .dropdown_content {
    background-color: white;
    font-size: 20px;
    width: 110px;
    position: relative;
    top: -28px;
  }

  .dropdown_content > div {
    display: block;
    text-decoration: none;
    font-size: 20px;
    padding: 10px 20px;
    cursor: pointer;
  }

  .dropdown_content > div:hover {
    background-color: #ececec;
  }

  .search {
    width: 500px;
    height: 45px;
    margin: 0 auto;
  }

  .search input {
    width: 100%;
    height: 45px;
    border: none;
    outline: none;
    border-radius: 8px;
    padding: 20px;
    font-size: 20px;
  }

  .search button {
    width: 50px;
    height: 45px;
    border: none;
    border-radius: 8px;
    background-color: white;
    position: relative;
    top: -45px;
    left: 450px;
  }

  .search_icon {
    cursor: pointer;
    line-height: 45px !important;
  }

  /* Bddy */
  /* Home_area_box */
  .area_box {
    width: 100%;
    height: 500px;
    margin: 0 auto;
  }

  .area_text {
    text-align: center;
    font-size: 30px;
    font-weight: 600;
    padding: 100px;
  }

  .area_image {
    width: 100%;
    display: flex;
    justify-content: center;
  }

  .area_image img {
    margin: 0 15px;
    cursor: pointer;
  }

  /* Home_banner */
  .home_banner {
    width: 1100px;
    height: 150px;
    background-image: url("../../IMG/main_banner.png");
    background-repeat: no-repeat;
    cursor: pointer;
  }

  /* Home_content1 */
  .home_content1 {
    width: 100%;
    display: flex;
    height: 500px;
  }

  .homee_content1_left {
    width: 50%;
  }

  .home_content1_right {
    width: 50%;
  }

  .home_monitor img {
    width: 500px;
    height: 400px;
    margin: 60px 30px;
  }

  .home_content1_text {
    font-size: 30px;
    margin-top: 110px;
  }

  .home_content1_text span {
    font-weight: 600;
  }

  .home_content1_image li {
    display: inline-block;
    position: relative;
    top: 50px;
    margin-right: 70px;
  }

  .home_content1_image img {
    width: 50px;
    height: 50px;
  }

  .home_content1_image span {
    font-size: 15px;
    position: absolute;
    top: 70px;
    left: 50%;
    transform: translate(-50%, 0);
  }

  /* Home_content2 */
  .home_content2 {
    width: 100%;
    height: 500px;
    display: flex;
  }

  .home_content2_left {
    width: 50%;
  }

  .home_content2_right {
    width: 50%;
  }

  .home_content2_text {
    font-size: 30px;
    margin: 100px 0px 100px 150px;
  }

  .home_content2_text span {
    font-weight: 600;
  }
</style>
<style>
  .footer {
    width: 100%;
    height: 50px;
    background-color: rgb(245, 245, 245);
  }

  .footer span {
    font-size: 10px;
    line-height: 50px;
    margin-left: 15px;
    cursor: pointer;
  }
</style>

<div class="header">
  <div class="nav">
    <div class="logo">
      <img id="move_home" src="../../IMG/보리댕댕.png" alt="보리댕댕" />
    </div>
    <div class="menu_list">
      <div>FOOD</div>
      <div>CAFE</div>
      <div>HOSPITAL</div>
      <div>BEAUTY</div>
      <div>MYPAGE</div>
    </div>
    <div id="login" onclick="location.href=('../login/login.html')">
      <div>LOGIN</div>
    </div>
  </div>
</div>
<div class="content">
  <div class="header_content">
    <p class="header_text">
      반려동물과 <span>"같이"</span> 가고 싶은 곳을 검색해보세요.
    </p>
    <div class="search_box">
      <div class="dropdown">
        <button>전체</button>
        <span class="material-icons dropdown_icon"> expand_more </span>
        <div class="dropdown_content none">
          <div>전체</div>
          <div>동구</div>
          <div>서구</div>
          <div>남구</div>
          <div>북구</div>
          <div>광산구</div>
        </div>
      </div>
      <form action="" class="search">
        <input type="text" placeholder="검색어를 입력해주세요." />
        <button on>
          <span class="material-icons search_icon"> search </span>
        </button>
      </form>
    </div>
  </div>
  <div class="area_box">
    <div class="area_text">지역별 모아보기</div>
    <div class="area_image">
      <img src="../../IMG/동구.png" alt="" />
      <img src="../../IMG/서구.png" alt="" />
      <img src="../../IMG/남구.png" alt="" />
      <img src="../../IMG/북구.png" alt="" />
      <img src="../../IMG/광산구.png" alt="" />
    </div>
  </div>
  <div class="home_banner">
  </div>
  <div class="home_content1">
    <div class="home_content1_left">
      <div class="home_monitor">
        <img src="../../IMG/computer.png" alt="" />
      </div>
    </div>
    <div class="home_content1_right">
      <div class="home_content1_text">
        <p>
          <span>광주 내 반려동물 동반 가능 장소</span> </br>모두 모여있어요 :) </br> </p>
      </div>
      <ul class="home_content1_image">
        <li><img src="../../IMG/cutlery.png"><span>FOOD</span></li>
        <li><img src="../../IMG/cafe.png"><span>CAFE</span></li>
        <li><img src="../../IMG/hospital.png"><span>HOSPITAL</span></li>
        <li><img src="../../IMG/beauty.png"><span>BEAUTY
        </span></li>
      </ul>
    </div>
  </div>
  <div class="home_content2">
    <div class="home_content2_left">
      <div class="home_content2_text">
        <p><span>방문자들의 리뷰</span>도</br> 한눈에 확인할 수 있어요 :)</p>
      </div>
    </div>
    <div class="home_content2_right">
      <div class="home_monitor">
        <img src="../../IMG/computer.png" alt="" />
      </div>
    </div>
  </div>
</div>
<div class="footer">
  <span>회사소개</span>
  <span>서비스 이용약관</span>
  <span>개인정보처리방침</span>
  <span>NOTICE</span>
  <span>Q&A</span>
</div>
<script>
  const menuList = document.querySelectorAll(".menu_list > div");

  menuList.forEach((menu) => {
    menu.addEventListener("click", function () {
      importContentPage(this.innerHTML);
    });
  });

  document.querySelector("#move_home").addEventListener("click", function () {
    importContentPage("home");
  });
</script>
<script>
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
</script>
</body>
</html>