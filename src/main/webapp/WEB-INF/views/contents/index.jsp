<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<style type="text/css">
    #title_layout {
        padding: 40px 0;
        text-align: center;
    }

    .search_box {
        width: 1100px;
        padding: 40px 10px 60px;
        align-items: center;
    }

    #search_name {
        width: 250px;
        margin-left: 5px;
    }

    .search_dropdown {
        position: relative;
        display: flex;
        flex-direction: column;
        align-items: center;
        border: 1px solid #acacac;
        border-radius: 3px;
        margin-left: 5px;
        cursor: pointer;
        background: url(/resource/img/dropdown.png) 100% 0px no-repeat;
        background-size: 30px;
    }

    .search_dropdown > .search_title {
        width: 170px;
        height: 30px;
        padding: 0 3px;
        line-height: 30px;
    }

    .search_dropdown > .search_list {
        width: 172px;
        position: absolute;
        border: 1px solid #acacac;
        border-radius: 3px;
        top: 30px;
        padding: 5px;
        background-color: #fff;
    }


    .img_reset {
        border: 1px solid #acacac;
        border-radius: 3px;
        cursor: pointer;
    }

    .img_reset > img {
        width: 26px;
        height: 26px;
        margin: 1px;
    }

    .dropdown_list {
        height: 30px;
        margin-left: 50px;
        line-height: 40px;
        accent-color: #9bc76c;
    }

    .search_list > div:last-child {
        text-align: center;
        line-height: 30px;
        width: 60px;
        height: 30px;
        margin: 20px auto 10px;
    }

    .search_btn {
        width: 100px;
        height: 40px;
        margin: auto;
        display: block;
    }

    .search_btn:hover {
        background-color: #008a5b;
    }
</style>

<script type="text/javascript">
    let contents;

    $(document).ready(function() {
        contents = $("#contents");
    })

    function showDropDown(obj) {
        const paramObj     = $(obj),
              dropdownList = paramObj.next(),
              isVisible    = !dropdownList.hasClass("none");

        isVisible ? dropdownList.addClass("none") : dropdownList.removeClass("none");
    }




</script>

<div id="title_layout">
    <h2>FOOD</h2>
    <p>식당</p>
</div>

<div id="search_layout" class="bdt2">
    <div class="search_box flex_row flex_space_between">
        <div class="flex_row">
            <label for="search_name">식당명</label>
            <input id="search_name" type="text"/>
        </div>
        <div class="flex_row">
            <div>지역</div>
            <div class="search_dropdown">
                <div class="search_title" onclick="showDropDown(this)">전체</div>
                <div class="search_list flex_column flex_space_between none">
                    <div class="dropdown_list" >
                        <input id="area_all" type="checkbox" onclick="allChk(this)"/>
                        <label for="area_all">전체</label>
                    </div>
                    <div class="dropdown_list">
                        <input id="list_east" type="checkbox" />
                        <label for="list_east">동구</label>
                    </div>
                    <div class="dropdown_list">
                        <input id="list_west" type="checkbox" />
                        <label for="list_west">서구</label>
                    </div>
                    <div class="dropdown_list">
                        <input id="list_south" type="checkbox" />
                        <label for="list_south">남구</label>
                    </div>
                    <div class="dropdown_list">
                        <input id="list_north" type="checkbox" />
                        <label for="list_north">북구</label>
                    </div>
                    <div class="dropdown_list">
                        <input id="list_other" type="checkbox" />
                        <label for="list_other">광산구</label>
                    </div>
                    <div class="btn">적용</div>
                </div>
            </div>
        </div>
        <div class="flex_row">
            <div>종류</div>
            <div class="search_dropdown">
                <div class="search_title" onclick="showDropDown(this)">전체</div>
                <div class="search_list flex_column flex_space_between none">
                    <div class="dropdown_list">
                        <input id="list_all" type="checkbox" checked/>
                        <label for="list_all">전체</label>
                    </div>
                    <div class="dropdown_list">
                        <input id="list_korean" type="checkbox" />
                        <label for="list_korean">한식</label>
                    </div>
                    <div class="dropdown_list">
                        <input id="list_chinese" type="checkbox" />
                        <label for="list_chinese">중식</label>
                    </div>
                    <div class="dropdown_list">
                        <input id="list_japanese" type="checkbox" />
                        <label for="list_japanese">일식</label>
                    </div>
                    <div class="dropdown_list">
                        <input id="list_western" type="checkbox" />
                        <label for="list_western">양식</label>
                    </div>
                    <div class="dropdown_list">
                        <input id="list_snack" type="checkbox" />
                        <label for="list_snack">분식</label>
                    </div>
                    <div class="btn">적용</div>
                </div>
            </div>
        </div>
        <div class="flex_row">
            <div>주차</div>
            <div class="search_dropdown">
                <div class="search_title" onclick="showDropDown(this)">전체</div>
                <div class="search_list flex_column flex_space_between none">
                    <div class="dropdown_list">
                        <input id="parking_all" type="checkbox" checked/>
                        <label for="parking_all">전체</label>
                    </div><div class="dropdown_list">
                        <input id="possible" type="checkbox" />
                        <label for="possible">가능</label>
                    </div>
                    <div class="dropdown_list">
                        <input id="impossble" type="checkbox" />
                        <label for="impossble">불가능</label>
                    </div>
                    <div class="btn">적용</div>
                </div>
            </div>
        </div>
        <div class="img_reset">
            <img src="/resource/img/reset.png">
        </div>
    </div>

    <button type="button" class="search_btn btn">SEARCH</button>
</div>

<div id="list_layout"></div>