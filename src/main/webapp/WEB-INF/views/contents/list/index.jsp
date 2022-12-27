<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<style type="text/css">
    .list_box {
        justify-content: space-around;
        flex-wrap: wrap;
        align-items: center;
    }

    .list_content {
        width: 300px;
        height: 320px;
        margin: 30px;
        border: 1px solid #ccc;
        cursor: pointer;
    }

    .content_img {
        width: 100%;
        height: 185px;
        overflow: hidden;
    }

    .content_img > img {
        width: 100%;
        height: 100%;
        object-fit: cover;
    }

    .content_text {
        width: 100%;
        height: 100px;
        padding: 15px 20px 0px;
    }

    .content_text > .sort {
        font-size: 12px;
        color: #acacac;
    }

    .content_text > .address {
        font-size: 14px;
        padding-top: 5px;
    }

    .content_text > .closed {
        padding-top: 5px;
        color: red;
        font-size: 14px;
    }

    .content_bottom {
        width: 100%;
        height: 33px;
        padding: 5px 0px 5px 20px;
        border-top: 1px solid #CCC;
    }

    .content_bottom > img {
        width: 15px;
        height: 15px;
        vertical-align: middle;
    }

    .content_bottom > span {
        font-size: 14px;
        padding-right: 5px;
    }

    .page_nation {
        display: flex;
        justify-content: center;
    }

    .page_nation > div:not(#page_idx) {
        width: 30px;
        text-align: center;
        cursor: pointer;
    }

    #page_idx > div {
        width: 23px;
        text-align: center;
        cursor: pointer;
    }

    .page_on {
        background-color: #9bc76c;
        color: white;
        border-radius: 15px;
    }
</style>

<script type="text/javascript">
    let listLayout,
        pageIdx;

    $(document).ready(function() {
        listLayout = contents.find("#list_layout");
        pageIdx    = listLayout.find("#page_idx");

        // 최대 페이지 개수 세팅
        setMaxPage();
    })

    function setMaxPage() {
        const maxPageInput = contentsFlag.children("#max_page");

        maxPageInput.val(${maxPage});
    }

    // 장소 상세페이지 이동
    function moveDetailUrl(obj) {
        const opt = contentsFlag.children("#opt").val(),
              cd  = $(obj).find(".cd").text();

        location.href = "/contents/detail?opt=" + opt + "&cd=" + cd;
    }

    // 페이지 네이션 - 현재 페이지
    function moveThisPage(page) {
        contentsFlag.children("#page").val(page);

        // 장소 리스트 조회
        setLayoutList();
    }

    // 페이지 네이션 - 이전페이지, 다음 페이지
    function movePage(idx) {
        const pageInput = contentsFlag.children("#page"),
              thisPage  = Number(pageInput.val()),
              maxPage   = Number(contentsFlag.children("#max_page").val());

        const page = thisPage + idx < 1       ? 1 :
                     thisPage + idx > maxPage ? maxPage :
                     thisPage + idx;

        pageInput.val(page);

        // 장소 리스트 조회
        setLayoutList();
    }

    // 페이지 네이션 - 처음 페이지
    function moveFirstPage() {
        contentsFlag.children("#page").val(1);

        // 장소 리스트 조회
        setLayoutList();
    }

    // 페이지 네이션 - 다음 페이지
    function moveLastPage() {
        const maxPage   = Number(contentsFlag.children("#max_page").val());

        contentsFlag.children("#page").val(maxPage);

        // 장소 리스트 조회
        setLayoutList();
    }
</script>

<div class="list_box flex">
<%--    왜 변수를 선언하고 나서 초기값을 세팅해주는건지 ??--%>
    <c:set var="cnt" value="0" />
    <c:forEach items="${contentsList}" var="list" varStatus="loop">
        <div class="list_content" onclick="moveDetailUrl(this)">
            <div class="cd none">${list.cd}</div>
            <div class="content_img">
                <img src="/resource/img/upload/place/${list.newNm}">
            </div>
            <div class="content_text">
                <span class="title">${list.title}</span>
                <span class="sort">${list.categoryNm}</span>
                <p class="address">${list.districtNm} / ${list.neighborhood}</p>
                <p class="closed">${list.closeDay == "" ? "휴무 없음" : list.closeDay += " 휴무"}</p>
            </div>
            <div class="content_bottom">
                <img src="/resource/img/eye.png" alt="">
                <span>${list.views}</span>
                <img src="/resource/img/favorite.png" alt="">
                <span>${list.likes}</span>
            </div>
        </div>
        <c:set var="cnt" value="${cnt + 1}" />
    </c:forEach>
<%-- 시작이 1이고 끝이 9-cnt 동안 ??--%>
    <c:forEach var="i" begin="1" end="${paramDto.recordSize - cnt}">
        <div class="list_content"></div>
    </c:forEach>
</div>

<div class="page_nation">
    <div onclick="moveFirstPage()"><<</div>
    <div onclick="movePage(-1);"><</div>
    <div id="page_idx" class="flex">
        <c:set var="start" value="${paramDto.page - 2 < 1       ? 1       : paramDto.page - 2}"></c:set>
        <c:set var="end"   value="${paramDto.page + 2 > maxPage ? maxPage : paramDto.page + 2}"></c:set>

        <c:set var="startCnt" value="${5 - (end - paramDto.page)   - 1}"></c:set>
        <c:set var="endCnt"   value="${5 - (paramDto.page - start) - 1}"></c:set>

        <c:set var="start" value="${paramDto.page - startCnt < 1       ? 1       : paramDto.page - startCnt}"></c:set> 1
        <c:set var="end"   value="${paramDto.page + endCnt   > maxPage ? maxPage : paramDto.page + endCnt  }"></c:set> 5
        <c:forEach var="i" begin="${start}" end="${end}">
            <div onclick="moveThisPage(Number($(this).text()));"
            <c:if test="${i == paramDto.page}">
                class="page_on"
            </c:if>>${i}</div>
        </c:forEach>
    </div>
    <div onclick="movePage(1);">></div>
    <div onclick="moveLastPage()">>></div>
</div>