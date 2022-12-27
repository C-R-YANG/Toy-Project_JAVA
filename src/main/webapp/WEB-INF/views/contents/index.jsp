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
            // view resolver가 jstl을 찾아 model 속성의 이름을 확인해 값으로 변경해줌
            listLayout.html(data);
        })
    }

    // 장소 리스트 조회 함수의 파라미터
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

        // 전체 input 체크시 2~6번 input check 박스를 checked 로 변경
        inputList.prop("checked", isChk);
    }

    function checkBox(obj) {
        const paramObj           = $(obj),
              divList            = paramObj.parent().parent().children("div:nth-child(n+2):nth-child(-n+6)"),
              checkboxList       = divList.children("input"),
              allChk             = paramObj.parent().parent().children("div:first").children("input");

        // 체크박스에서 전체를 제외한 input의 개수와 체크되어있는 input의 개수가 같으면 전체에도 체크
        allChk.prop("checked", checkboxList.length == divList.children("input:checked").length);
    }

    // 적용 버튼 클릭시 조회 관련 div 텍스트 변경
    function inputText(obj) {
        const paramObj  = $(obj),
              dataOpt   = paramObj.data("opt"),
              divBox    = paramObj.parent(),
              list      = divBox.find("input"),         // 전체 Input 태그 리스트
              checkList = divBox.find("input:checked"), // 체크된 Input 태그 리스트
              divText   = paramObj.parent().parent().children("div:first"),
              chkArray  = [],   // 체크 된 배열의 Label 텍스트 리스트
              dataList  = [],   // 체크 된 배열의 Input Value 리스트
              // dataOpt에 따라 contentsFlag에 있는 Input태그를 매칭해 변수에 세팅
              dataInput = dataOpt === 0 ? contentsFlag.children("#district_list") :
                          dataOpt === 1 ? contentsFlag.children("#category_list") :
                                          contentsFlag.children("#parking");

        const listLen      = list.length,
              checkListLen = checkList.length;

        checkList.each(function() {
            const thisObj = $(this);

            // 배열에 check된 input의 label의 텍스트 값을 넣는다.
            chkArray.push(thisObj.next().text());

            // 전체를 클릭 안했을 경우 dataList에 value 값 삽입
            if (thisObj.val() !== "-1") {
                dataList.push(thisObj.val());
            } else {
                dataInput.val("");

                return false;
            }
        })

        // dataList에 들어있는 value 값의 개수가 0보다 크면 dataInput에 dataList에 들어있는 value 값 삽입
        if (dataList.length > 0) dataInput.val(dataList);

        // 체크된 input 개수가 1개면 chkArray 배열의 0번째 인덱스 값을 대입
        // 0이 아니고, input의 개수보다 작으면 chkArray 배열의 0번째 인덱스 값 외 체크된 input 개수-1 건을 대입
        const textVal = checkListLen === 1                           ? chkArray[0] :
                        checkListLen !== 0 && checkListLen < listLen ? chkArray[0] + " 외 " + (checkListLen - 1) + "건" :
                        "전체";

        // 조회 관련 div의 text 값을 textVal 값으로 적용
        divText.text(textVal);

        paramObj.parent().addClass("none");
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

    function chkKey() {
        const keyCode = event.keyCode;

        if (keyCode === 13) {
            // 장소 리스트 조회
            setLayoutList();
        }
    }

    function refreshFilter() {
        // 페이지네이션 초기화
        contentsFlag.children("#page").val("1");

        // 검색 필터 초기화
        contentsFlag.children("#district_list").val("");
        contentsFlag.children("#category_list").val("");
        contentsFlag.children("#parking").val("");

        // [선택한 옵션 한글출력 DIV] 부모 DIV 변수에 세팅
        const searchDropdown = contents.find(".search_dropdown");

        // div text, input checkde, 검색어 기본값으로 초기화
        searchDropdown.children(".search_title").text("전체");
        searchDropdown.find("input").prop("checked", true);
        contents.find("#search_name").val("");

        // 정렬 관련 초기화
        contentsFlag.children("#order").val("0");

        // 정렬관련 DIV 박스 하위 실제 정렬 기능하는 DIV 변수에 세팅
        const orderList = contents.find(".sub_box_array").children("div");
        // 전체 정렬기능하는 DIV 선택 클래스 제거
        orderList.removeClass("array_click");
        // 전체 정렬기능하는 클래스중 첫번째 DIV[최신순]에 선택 클래스 추가
        orderList.eq(0).addClass("array_click");

        // 장소 리스트 조회
        setLayoutList();
    }

    // 장소 등록 페이지 이동
    function moveRegisterUrl() {
        const opt = contentsFlag.children("#opt").val();

        location.href = "/contents/register/index?opt=" + opt;
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
            <input id="search_name" type="text" value="${contentsDto.title}" onkeyup="chkKey();"/>
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
        <div class="img_reset" onclick="refreshFilter();">
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