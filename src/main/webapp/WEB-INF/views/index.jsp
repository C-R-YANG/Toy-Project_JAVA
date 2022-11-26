<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<style>
  .header_content {
    width: 100%;
    height: 500px;
    background-image: url("/resource/img/puppy.jpg/");
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

  .dropdown img {
    width: 30px;
    height: 30px;
    display: block !important;
    position: relative;
    top: -36px;
    left: 65px;
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

  .search img {
    width: 15px;
    height: 15px;
    cursor: pointer;
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
    background-image: url("/resource/img/main_banner.png/");
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

<div class="content">
  <div class="header_content">
    <h2 class="header_text">
      반려동물과 <span>"같이"</span> 가고 싶은 곳을 검색해보세요.
    </h2>
    <div class="search_box">
      <div class="dropdown">
        <button>전체</button>
        <img src="${url}/resource/img/dropdown.png" alt="dropdown"/>
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
        <button>
          <img src="${url}/resource/img/search.png" alt="search"/>
        </button>
      </form>
    </div>
  </div>
  <div class="area_box">
    <div class="area_text">지역별 모아보기</div>
    <div class="area_image">
      <img src="${url}/resource/img/동구.png" alt="" />
      <img src="${url}/resource/img/서구.png" alt="" />
      <img src="${url}/resource/img/남구.png" alt="" />
      <img src="${url}/resource/img/북구.png" alt="" />
      <img src="${url}/resource/img/광산구.png" alt="" />
    </div>
  </div>
  <div class="home_banner">
  </div>
  <div class="home_content1">
    <div class="home_content1_left">
      <div class="home_monitor">
        <img src="${url}/resource/img/computer.png" alt="" />
      </div>
    </div>
    <div class="home_content1_right">
      <div class="home_content1_text">
        <p>
          <span>광주 내 반려동물 동반 가능 장소</span> </br>모두 모여있어요 :) </br> </p>
      </div>
      <ul class="home_content1_image">
        <li><img src="${url}/resource/img/cutlery.png"><span>FOOD</span></li>
        <li><img src="${url}/resource/img/cafe.png"><span>CAFE</span></li>
        <li><img src="${url}/resource/img/hospital.png"><span>HOSPITAL</span></li>
        <li><img src="${url}/resource/img/beauty.png"><span>BEAUTY
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
        <img src="${url}/resource/img/computer.png" alt="" />
      </div>
    </div>
  </div>
</div>