<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="/WEB-INF/layout/commonTags.jspf"%>

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
        padding: 10px 5px;
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
        line-height: 30px;
        accent-color: #9bc76c;
    }

    .search_list > div:last-child {
        text-align: center;
        line-height: 30px;
        width: 60px;
        height: 30px;
        margin: 10px auto;
    }

    .search_btn {
        width: 100px;
        height: 40px;
        margin: auto;
        display: block;
        font-size: 14px;
    }

    .search_btn:hover {
        letter-spacing: 1px;
        transform: scale(1.1);
    }

    .sub_box {
        width: 100%;
        justify-content: space-between;
        padding: 50px 10px 10px;
    }

    .sub_box_btn {
        width: 85px;
        height: 35px;
        background: #E8995B;
        font-size: 14px;
    }

    .sub_box_btn:hover {
        letter-spacing: 1px;
        transform: scale(1.1);
    }

    .sub_box_array {
        width: 250px;
        height: 35px;
        justify-content: space-around;
    }

    .sub_box_array > div {
        cursor: pointer;
        line-height: 34px;
    }

    .array_click {
        font-weight: 600;
    }

</style>

<script type="text/javascript">
    let contents,
        contentsFlag,
        searchLayout,
        listLayout;

    $(document).ready(function() {
        contents     = $("#contents");
        contentsFlag = contents.children("#contents_flag");
        searchLayout = contents.children("#search_layout");
        listLayout   = contents.children("#list_layout");

        // 장소 리스트 조회
        setLayoutList();
    })

    function setLayoutList() {
        const url = "/contents/list";

        $.post(url, setParam(), function(data){
            listLayout.html(data);
        })
    }

    function setParam() {
        const param = {
            "opt"   : contentsFlag.children("#opt").val(),
            "page"  : contentsFlag.children("#page").val(),
            "order" : contentsFlag.children("#order").val(),
        }

        const title        = searchLayout.find("#search_name").val().trim(),
              districtList = contentsFlag.children("#district_list").val(),
              categoryList = contentsFlag.children("#category_list").val(),
              parking      = contentsFlag.children("#parking").val();

        if (title)        param["title"] = title.trim();
        if (districtList) param["districtList"] = districtList.trim();
        if (categoryList) param["categoryList"] = categoryList.trim();
        if (parking)      param["parking"] = parking.trim();

        return param;
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
              dataOpt   = paramObj.data("opt"),
              divBox    = paramObj.parent(),
              list      = divBox.find("input"),
              checkList = divBox.find("input:checked"),
              divText   = paramObj.parent().parent().children("div:first"),
              chkArray  = [],
              dataList  = [],
              dataInput = dataOpt === 0 ? contentsFlag.children("#district_list") :
                          dataOpt === 1 ? contentsFlag.children("#category_list") :
                                          contentsFlag.children("#parking");

        const listLen      = list.length,
              checkListLen = checkList.length;

        checkList.each(function() {
            const thisObj = $(this);

            chkArray.push(thisObj.next().text());

            if (thisObj.val() !== "-1") {
                dataList.push(thisObj.val());
            } else {
                return false;
            }
        })

        if (dataList.length > 0) dataInput.val(dataList);

        const textVal = checkListLen === 1                           ? chkArray[0] :
                        checkListLen !== 0 && checkListLen < listLen ? chkArray[0] + " 외 " + (checkListLen - 1) + "건" :
                        "전체";

        divText.text(textVal);

        paramObj.parent().addClass("none");
    }

    function moveRegisterUrl() {
        const opt = contentsFlag.children("#opt").val();

        location.href = "/contents/register/index?opt=" + opt;
    }

    function arrayClick(obj) {
        const paramObj  = $(obj),
              dataOpt   = paramObj.data("opt"),
              arrayList = paramObj.parent().parent().find("div");

        arrayList.removeClass("array_click");
        paramObj.addClass("array_click");

        contentsFlag.children("#order").val(dataOpt);

        // 장소 리스트 조회
        setLayoutList();
    }
</script>

<div id="contents_flag">
    <input type="hidden" id="opt"           value="${contentsDto.opt}">
    <input type="hidden" id="district_list" value="${contentsDto.district}">
    <input type="hidden" id="category_list" value="">
    <input type="hidden" id="parking"       value="">
    <input type="hidden" id="page"          value="1">
    <input type="hidden" id="max_page"      value="${maxPage}">
    <input type="hidden" id="order"         value="0">
</div>

<div id="title_layout">
    <h2>${contentsDto.engNm}</h2>
    <p>${contentsDto.korNm}</p>
</div>

<div id="search_layout" class="bdt2">
    <div class="search_box flex_row flex_space_between">
        <div class="flex_row">
            <label for="search_name">${contentsDto.korNm}명</label>
            <input id="search_name" type="text" value="${contentsDto.title}"/>
        </div>
        <div class="flex_row">
            <div>지역</div>
            <div class="search_dropdown">
                <div class="search_title" onclick="showDropDown(this)">${contentsDto.districtNm}</div>
                <div class="search_list flex_column flex_space_between none">
                    <div class="dropdown_list" >
                        <input id="area_all" type="checkbox" value="-1" onclick="allChk(this)" checked/>
                        <label for="area_all">전체</label>
                    </div>
                    <div class="dropdown_list" >
                        <input id="list_east" type="checkbox" value="0" onclick="checkBox(this)" checked/>
                        <label for="list_east">동구</label>
                    </div>
                    <div class="dropdown_list">
                        <input id="list_west" type="checkbox" value="1" onclick="checkBox(this)" checked/>
                        <label for="list_west">서구</label>
                    </div>
                    <div class="dropdown_list">
                        <input id="list_south" type="checkbox" value="2" onclick="checkBox(this)" checked/>
                        <label for="list_south">남구</label>
                    </div>
                    <div class="dropdown_list">
                        <input id="list_north" type="checkbox" value="3" onclick="checkBox(this)" checked/>
                        <label for="list_north">북구</label>
                    </div>
                    <div class="dropdown_list">
                        <input id="list_other" type="checkbox" value="4" onclick="checkBox(this)" checked/>
                        <label for="list_other">광산구</label>
                    </div>
                    <div class="btn" data-opt="0" onclick="inputText(this)">적용</div>
                </div>
            </div>
        </div>
        <c:if test="${contentsDto.opt == 0 || contentsDto.opt == 2}">
            <div class="flex_row">
                <div>종류</div>
                <div class="search_dropdown">
                    <div class="search_title" onclick="showDropDown(this)">전체</div>
                    <div class="search_list flex_column flex_space_between none">
                        <c:forEach var="item" items="${contentsDto.sortList}" varStatus="loop">
                            <div class="dropdown_list" <c:if test="${contentsDto.opt == 2}">style="margin-left: 35px" </c:if>>
                                <input id="list_${item}" type="checkbox" value="${loop.index - 1}" onclick=${loop.index == 0 ? "allChk(this)" : "checkBox(this)"} checked/>
                                <label for="list_${item}">${item}</label>
                            </div>
                        </c:forEach>
                        <div class="btn" data-opt="1" onclick="inputText(this)">적용</div>
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
                        <input id="parking_all" type="checkbox" value="-1" onclick="allChk(this)" checked/>
                        <label for="parking_all">전체</label>
                    </div><div class="dropdown_list">
                        <input id="possible" type="checkbox" value="1" onclick="checkBox(this)" checked/>
                        <label for="possible">가능</label>
                    </div>
                    <div class="dropdown_list">
                        <input id="impossble" type="checkbox" value="0" onclick="checkBox(this)" checked/>
                        <label for="impossble">불가능</label>
                    </div>
                    <div class="btn" data-opt="2" onclick="inputText(this)">적용</div>
                </div>
            </div>
        </div>
        <div class="img_reset">
            <img src="/resource/img/reset.png">
        </div>
    </div>

    <button type="button" class="search_btn btn" onclick="setLayoutList();">SEARCH</button>

    <div class="sub_box flex">
        <sec:authorize access="hasRole('ROLE_ADMIN')">
            <input type="button" class="sub_box_btn btn" value="등록하기" onclick="moveRegisterUrl()">
        </sec:authorize>
        <div class="sub_box_array flex">
            <div class="array array_click" data-opt="0" onclick="arrayClick(this)">최신순</div>
            <div class="array" data-opt="1" onclick="arrayClick(this)">조회순</div>
            <div class="array" data-opt="2" onclick="arrayClick(this)">좋아요 순</div>
        </div>
    </div>
    <hr/>
</div>

<div id="list_layout"></div>