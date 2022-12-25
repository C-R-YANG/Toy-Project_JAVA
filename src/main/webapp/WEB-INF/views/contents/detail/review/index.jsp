<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<style type="text/css">
    .review_box {
        border: 1px solid #ddd;
        border-radius: 5px;
        box-shadow: 1px 1px 2px #ececec;
        overflow-y: scroll;
        padding: 10px;
        height: 350px;
    }

    .review_contents {
        padding: 10px 0px;
    }

    .review_img {
        width: 80px;
        height: 80px;
    }
    .review_img > img {
        width: 100%;
        height: 100%;
    }

    .review_text {
        width: 200px;
        padding: 10px;
    }

    .review_text .id {
        font-size: 13px;
    }

    .review_text .text {
        width: 184px;
        font-size: 13px;
        white-space: normal;
        word-break: break-all;
    }

    .review_text .date {
        font-size: 10px;
        color: #acacac;
    }

    .review_star {
        padding: 5px 0px;
        color: #9bc76c;
        font-size: 12px;
        line-height: 13px;
    }

    .review_box > div:not(:last-of-type) {
        border-bottom: 1px solid #ececec;
    }
</style>

<script type="text/javascript">
</script>

<div class="review_title">방문자 리뷰</div>

<div class="review_box">
    <c:set var="cnt" value="0" />
    <c:forEach items="${reviewList}" var="list" varStatus="loop">
        <div class="review_contents flex">
            <div class="review_img">
                <c:if test="${list.newNm != null}">
                    <img src="/resource/img/upload/review/${list.newNm}" alt="">
                </c:if>
            </div>


            <div class="review_text right">
                <div>
                    <span class="id">${list.userId}</span>
                    <span class="date"><fmt:formatDate value="${list.regDt}" pattern="yyyy.MM.dd HH:mm:ss"/></span>
                </div>
                <div class="review_star">${list.score}</div>
                <div class="text">${list.contents}</div>
            </div>
        </div>

        <c:set var="cnt" value="${cnt + 1}" />
    </c:forEach>
</div>

<input id="review_cnt" type="hidden" value="${cnt}">
