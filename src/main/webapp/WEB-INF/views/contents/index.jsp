<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

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

    .sub_search_box {
        width: 230px;
        justify-content: space-around;
        margin: 80px 0 10px auto;
    }

    .sub_search_box > div {
        cursor: pointer;
    }

    .array_click {
        color: red;
    }

</style>

<script type="text/javascript">
    let contents,
        contentsFlag,
        listLayout;

    $(document).ready(function() {
        contents = $("#contents");
        contentsFlag = contents.children("#contents_flag");
        listLayout = contents.children("#list_layout");

        setLayoutList();
    })

    function setLayoutList() {
        const url = "/contents/list"

        $.post(url, {}, function(data){
            listLayout.html(data);
        })
    }

    function showDropDown(obj) {
        const paramObj     = $(obj),
              dropdownList = paramObj.next(),
              isVisible    = !dropdownList.hasClass("none");

        isVisible ? dropdownList.addClass("none") : dropdownList.removeClass("none");
    }


    function allChk(obj) {
        const paramObj  = $(obj),
              inputList = paramObj.parent().parent().children("div:nth-child(n+2):nth-child(-n+6)").children("input"),
              isChk     = paramObj.is(":checked");

        inputList.prop("checked", isChk);
    }

    function checkBox(obj) {
        const paramObj           = $(obj),
              divList            = paramObj.parent().parent().children("div:nth-child(n+2):nth-child(-n+6)"),
              checkboxList       = divList.children("input"),
              allChk             = paramObj.parent().parent().children("div:first").children("input");

        allChk.prop("checked", checkboxList.length == divList.children("input:checked").length);
    }

    function inputText(obj) {
        const paramObj  = $(obj),
              divList   = paramObj.parent().children("div:nth-child(n+2):nth-child(-n+6)"),
              list      = divList.children("input"),
              checkList = divList.children("input:checked"),
              divText   = paramObj.parent().parent().children("div:first"),
              chkArray  = [];

        const listLen      = list.length,
              checkListLen = checkList.length;

        checkList.each(function () { chkArray.push($(this).val()); })

        const textVal = checkListLen === 1                           ? chkArray[0] :
                        checkListLen !== 0 && checkListLen < listLen ? chkArray[0] + " 외 " + (checkListLen - 1) + "건" :
                        "전체";

        divText.text(textVal);

        paramObj.parent().addClass("none");
    }
</script>

<div id="contents_flag">
    <input type="hidden" id="opt" value="${contentsDto.opt}">
</div>

<div id="title_layout">
    <h2>${contentsDto.engNm}</h2>
    <p>${contentsDto.korNm}</p>
</div>

<div id="search_layout" class="bdt2">
    <div class="search_box flex_row flex_space_between">
        <div class="flex_row">
            <label for="search_name">${contentsDto.korNm}명</label>
            <input id="search_name" type="text"/>
        </div>
        <div class="flex_row">
            <div>지역</div>
            <div class="search_dropdown">
                <div class="search_title" onclick="showDropDown(this)">전체</div>
                <div class="search_list flex_column flex_space_between none">
                    <div class="dropdown_list" >
                        <input id="area_all" type="checkbox" value="전체" onclick="allChk(this)" checked/>
                        <label for="area_all">전체</label>
                    </div>
                    <div class="dropdown_list" >
                        <input id="list_east" type="checkbox" value="동구" onclick="checkBox(this)" checked/>
                        <label for="list_east">동구</label>
                    </div>
                    <div class="dropdown_list">
                        <input id="list_west" type="checkbox" value="서구" onclick="checkBox(this)" checked/>
                        <label for="list_west">서구</label>
                    </div>
                    <div class="dropdown_list">
                        <input id="list_south" type="checkbox" value="남구" onclick="checkBox(this)" checked/>
                        <label for="list_south">남구</label>
                    </div>
                    <div class="dropdown_list">
                        <input id="list_north" type="checkbox" value="북구" onclick="checkBox(this)" checked/>
                        <label for="list_north">북구</label>
                    </div>
                    <div class="dropdown_list">
                        <input id="list_other" type="checkbox" value="광산구" onclick="checkBox(this)" checked/>
                        <label for="list_other">광산구</label>
                    </div>
                    <div class="btn" onclick="inputText(this)">적용</div>
                </div>
            </div>
        </div>
        <c:if test="${contentsDto.opt == 0 || contentsDto.opt == 2}">
            <div class="flex_row">
                <div>종류</div>
                <div class="search_dropdown">
                    <div class="search_title" onclick="showDropDown(this)">전체</div>
                    <div class="search_list flex_column flex_space_between none">
                        <c:forEach var="item" items="${contentsDto.sortList}">
                            <div class="dropdown_list" <c:if test="${contentsDto.opt == 2}">style="margin-left: 35px" </c:if>>
                                <input id="list_${item}" type="checkbox" value="${item}" onclick="allChk(this)" checked/>
                                <label for="list_${item}">${item}</label>
                            </div>
                        </c:forEach>
                        <div class="btn" onclick="inputText(this)">적용</div>
                    </div>
                </div>
            </div>
        </c:if>
        <div class="flex_row">
            <div>주차</div>
            <div class="search_dropdown">
                <div class="search_title" onclick="showDropDown(this)">전체</div>
                <div class="search_list flex_column flex_space_between none">
                    <div class="dropdown_list">
                        <input id="parking_all" type="checkbox" value="전체" onclick="allChk(this)" checked/>
                        <label for="parking_all">전체</label>
                    </div><div class="dropdown_list">
                        <input id="possible" type="checkbox" value="가능" onclick="checkBox(this)" checked/>
                        <label for="possible">가능</label>
                    </div>
                    <div class="dropdown_list">
                        <input id="impossble" type="checkbox" value="불가능" onclick="checkBox(this)" checked/>
                        <label for="impossble">불가능</label>
                    </div>
                    <div class="btn" onclick="inputText(this)">적용</div>
                </div>
            </div>
        </div>
        <div class="img_reset">
            <img src="/resource/img/reset.png">
        </div>
    </div>

    <button type="button" class="search_btn btn">SEARCH</button>

    <div class="sub_search_box flex">
        <div class="array array_click">최신순</div>
        <div class="array">조회순</div>
        <div class="array">리뷰 많은순</div>
    </div>
    <hr/>
</div>

<div id="list_layout"></div>