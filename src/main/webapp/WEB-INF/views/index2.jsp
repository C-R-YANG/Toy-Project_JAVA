<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<style>
    .btn {
        padding: 4px;
        border: 1px solid #acacac;
        border-radius: 3px;
        text-decoration: none;
        cursor: pointer;
        background: none;
        width: 150px;
        margin: 0px 10px;
        text-align: left;
    }

    /* Main */
    .main_text {
        margin: 40px auto;
        text-align: center;
    }

    .main_text > p {
        padding-top: 5px;
        font-size: 12px;
        color: #acacac;
    }

    .line1 {
        border: 0;
        height: 2px;
        background-color: #acacac;
    }

    /* Main_search */
    .searchbar {
        width: 1100px;
        height: 40px;
        margin: 30px 10px;
    }

    .search_keyword {
        width: 330px;
    }

    .keyword_input {
        width: 250px;
        margin: 0px 10px;
        padding: 4px;
        border: 1px solid #acacac;
        border-radius: 3px;
    }

    .search_area {
        width: 220px;
    }

    .search_sort {
        width: 220px;
    }

    .search_parking {
        width: 220px;
    }

    .dropdown_icon {
        display: block !important;
        position: relative;
        top: -25px;
        left: 170px;
        cursor: pointer;
        width: 25px;
    }

    .area_dropdown_content {
        border: 1px solid #acacac;
        border-radius: 3px;
        background-color: white;
        width: 150px;
        position: relative;
        top: -21px;
        left: 46px;
    }

    .area_dropdown_content > div {
        display: block;
        font-size: 13px;
        margin-top: 10px;
        text-align: center;
        text-decoration: none;
    }

    .area_dropdown_content input {
        position: relative;
        top: 2px;
        right: 13px;
        accent-color: #cac670;
    }

    input[id="gwangsangu"] {
        position: relative;
        right: 7px;
    }

    .area_apply_btn {
        display: block;
        width: 50px;
        margin: 10px auto;
        padding: 5px;
        border: none;
        border-radius: 5px;
        background-color: #90b45e;
        color: white;
        cursor: pointer;
    }

    .sort_dropdown_content {
        border: 1px solid #acacac;
        border-radius: 3px;
        background-color: white;
        width: 150px;
        position: relative;
        top: -21px;
        left: 46px;
    }

    .sort_dropdown_content > div {
        display: block;
        font-size: 13px;
        margin-top: 10px;
        text-align: center;
        text-decoration: none;
    }

    .sort_dropdown_content input {
        position: relative;
        top: 2px;
        right: 13px;
        accent-color: #cac670;
    }

    .sort_apply_btn {
        display: block;
        width: 50px;
        margin: 10px auto;
        padding: 5px;
        border: none;
        border-radius: 5px;
        background-color: #90b45e;
        color: white;
        cursor: pointer;
    }

    .parking_dropdown_content {
        border: 1px solid #acacac;
        border-radius: 3px;
        background-color: white;
        width: 150px;
        position: relative;
        top: -21px;
        left: 46px;
    }

    .parking_dropdown_content > div {
        display: block;
        font-size: 13px;
        margin-top: 10px;
        text-align: center;
        text-decoration: none;
    }

    .parking_dropdown_content input {
        position: relative;
        top: 2px;
        right: 5px;
        accent-color: #cac670;
    }

    input[id="possible"] {
        position: relative;
        right: 17px;
    }

    .parking_apply_btn {
        display: block;
        width: 50px;
        margin: 10px auto;
        padding: 5px;
        border: none;
        border-radius: 5px;
        background-color: #90b45e;
        color: white;
        cursor: pointer;
    }

    .searchbar_reset_icon {
        width: 30px;
        position: relative;
        left: 38px;
        border: 1px solid #acacac;
        border-radius: 3px;
        padding: 3px;
        cursor: pointer;
    }

    .search_btn {
        display: block;
        width: 100px;
        height: 40px;
        margin: 30px auto 100px;
        padding: 10px;
        border: none;
        border-radius: 10px;
        background-color: #9bc76c;
        color: white;
        cursor: pointer;
    }

    .array_wrap {
        width: 300px;
        line-height: 30px;
        margin-left: auto;
        display: flex;
        justify-content: space-evenly;
        cursor: pointer;
    }

    .array_list_click {
        color: red;
    }

    /* Content */
    .content_wrap {
        flex-wrap: wrap;
        align-items: center;
    }

    .content {
        width: 300px;
        height: 350px;
        margin: 30px;
        border: 1px solid #ececec;
        cursor: pointer;
    }

    .content_image_wrap {
        width: 300px;
        height: 200px;
        overflow: hidden;
    }

    .content_image_wrap > img {
        width: 100%;
        height: 100%;
        object-fit: cover;
    }

    .content_text_wrap {
        height: 120px;
        padding: 20px;
    }

    .content_title {
        font-size: 18px;
    }

    .content_sort {
        font-size: 12px;
        color: #aaa;
    }

    .content_place {
        padding-top: 5px;
        font-size: 14px;
    }

    .content_closed {
        padding-top: 5px;
        color: red;
        font-size: 12px;
    }

    .content > hr {
        border: 0;
        height: 1px;
        background-color: #acacac;
    }

    .content_bottom {
        width: 100%;
        height: 27px;
        color: #ccc;
        font-size: 10px;
        margin-left: 20px;
        align-items: center;
    }
    .content_icon {
        width: 15px;
        margin-right: 5px;
        opacity: 0.3;
    }

    .content_bottom > p {
        margin-right: 10px;
    }
</style>

<div id="food">
    <div id="main">
        <div class="main_text">
            <h2>FOOD</h2>
            <p>식당</p>
        </div>
        <hr class="line1" />
        <div class="search_wrap">
            <div class="searchbar flex">
                <div class="search_keyword">
                    <span>식당명</span>
                    <input type="text" class="keyword_input" />
                </div>
                <div class="search_area">
                    <span>지역</span>
                    <button
                            type="button"
                            class="area_btn btn"
                            onclick="showDropDown(this)"
                    >
                        전체
                    </button>
                    <img class="dropdown_icon"src="${url}/resource/img/dropdown.png" alt="dropdown"/>
              </span>
                    <div class="area_dropdown_content none">
                        <div onclick="allCheck(this)">
                            <input type="checkbox" id="area_all" checked="true" />
                            <label for="area_all">전체</label>
                        </div>
                        <div onclick="isCheck(this)">
                            <input type="checkbox" id="donggu" checked="true" />
                            <label for="donggu">동구</label>
                        </div>
                        <div onclick="isCheck(this)">
                            <input type="checkbox" id="seogu" checked="true" />
                            <label for="seogu">서구</label>
                        </div>
                        <div onclick="isCheck(this)">
                            <input type="checkbox" id="namgu" checked="true" />
                            <label for="namgu">남구</label>
                        </div>
                        <div onclick="isCheck(this)">
                            <input type="checkbox" id="bukgu" checked="true" />
                            <label for="bukgu">북구</label>
                        </div>
                        <div onclick="isCheck(this)">
                            <input type="checkbox" id="gwangsangu" checked="true" />
                            <label for="gwangsangu">광산구</label>
                        </div>
                        <button class="area_apply_btn" onclick="hideDropDown(this)">
                            적용
                        </button>
                    </div>
                </div>
                <div class="search_sort">
                    <span>종류</span>
                    <button
                            type="button"
                            class="sort_btn btn"
                            onclick="showDropDown(this)"
                    >
                        전체
                    </button>
                    <img class="dropdown_icon" src="${url}/resource/img/dropdown.png" alt="dropdown"/>
              </span>
                    <div class="sort_dropdown_content none">
                        <div onclick="allCheck(this)">
                            <input type="checkbox" id="sort_all" checked="true" />
                            <label for="sort_all">전체</label>
                        </div>
                        <div onclick="isCheck(this)">
                            <input type="checkbox" id="check2" checked="true" />
                            <label for="check2">한식</label>
                        </div>
                        <div onclick="isCheck(this)">
                            <input type="checkbox" id="check3" checked="true" />
                            <label for="check3">일식</label>
                        </div>
                        <div onclick="isCheck(this)">
                            <input type="checkbox" id="check4" checked="true" />
                            <label for="check4">중식</label>
                        </div>
                        <div onclick="isCheck(this)">
                            <input type="checkbox" id="check5" checked="true" />
                            <label for="check5">분식</label>
                        </div>
                        <div onclick="isCheck(this)">
                            <input type="checkbox" id="check6" checked="true" />
                            <label for="check6">카페</label>
                        </div>
                        <button class="sort_apply_btn" onclick="hideDropDown(this)">
                            적용
                        </button>
                    </div>
                </div>
                <div class="search_parking">
                    <span>주차</span>
                    <button
                            type="button"
                            class="parking_btn btn"
                            onclick="showDropDown(this)"
                    >
                        가능
                    </button>
                    <img class="dropdown_icon" src="${url}/resource/img/dropdown.png" alt="dropdown"/>
              </span>
                    <div class="parking_dropdown_content none">
                        <div>
                            <input
                                    type="radio"
                                    id="possible"
                                    name="parking"
                                    checked="true"
                            />
                            <label for="possible">가능</label>
                        </div>
                        <div>
                            <input type="radio" id="both" name="parking" />
                            <label for="both">상관없음</label>
                        </div>
                        <button class="parking_apply_btn" onclick="hideDropDown(this)">
                            적용
                        </button>
                    </div>
                </div>
                <div>
                    <img class="searchbar_reset_icon" src="${url}/resource/img/reset.png" alt="reset" onclick="refrestFilter()"/>
                </div>
            </div>
            <button type="button" class="search_btn">SEARCH</button>
        </div>
        <div class="array_wrap flex">
            <div class="array_list array_list_click" onclick="array_click(this)">
                최신순
            </div>
            <div class="array_list" onclick="array_click(this)">조회순</div>
            <div class="array_list" onclick="array_click(this)">리뷰 많은순</div>
        </div>
        <hr />
        <div class="content_wrap flex">
            <div class="content content1">
                <div class="content_image_wrap">
                    <img src="${url}/resource/img/시바카레.jpg" alt="시바카레" />
                </div>
                <div class="content_text_wrap">
                    <span class="content_title">시바카레</span>
                    <span class="content_sort">카레</span>
                    <p class="content_place">동구 / 장동</p>
                    <p class="content_closed">매주 수요일 휴무</p>
                </div>
                <hr />
                <div class="content_bottom flex">
                    <img class="content_icon" src="${url}/resource/img/eye.png" alt="eye" />
                    <p>500</p>
                    <img class="content_icon"src="${url}/resource/img/favorite.png" alt="favorite" />
                    <p>3</p>
                    <img class="content_icon"src="${url}/resource/img/star.png" alt="star" />
                    <p>50</p>
                </div>
            </div>
            <div class="content content2"></div>
            <div class="content content3"></div>
            <div class="content content4"></div>
            <div class="content content5"></div>
            <div class="content content6"></div>
            <div class="content content7"></div>
        </div>
    </div>
</div>