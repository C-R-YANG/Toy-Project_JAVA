<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<style type="text/css">
    .image_layout {
        text-align: center;
        padding-top: 40px;
    }

    .image_layout > img {
        width: 270px;
        height: 270px;
    }

    .content_layout {
        padding: 30px 0 70px;
        justify-content: space-around;
    }

    .content1 {
        width: 750px;
        height: 550px;
        padding: 50px 50px 20px;
        background-color: #fff;
        border: 1px solid #ddd;
        border-radius: 5px;
        box-shadow: 1px 1px 2px #ececec;;
    }

    .content1_line {
        border: 0;
        height: 1px;
        background-color: #ddd
    }

    .content1_top {
        width: 100%;
        height: 45px;
        justify-content: space-between;
    }

    .content1_title {
        float: left;
    }

    .content1_title span:first-child {
        font-size: 26px;
        font-weight: 600;
    }

    .content1_title span:last-child {
        color: #acacac;
    }

    .content1_top_icon > div {
        width: 70px;
        text-align: center;
        cursor: pointer;
    }

    .content1_top_icon > p {
        font-size: 14px;
    }

    .content1_top_icon img {
        width: 20px;
    }

    .content1_icon {
        width: 100%;
        padding-bottom: 15px;
    }

    .content1_icon > img {
        width: 20px;
        vertical-align: middle;
    }

    .content1_icon > span {
        font-size: 14px;
        padding-right: 5px;
        color: #acacac;
    }

    .content1_text {
        padding: 20px 0px;
    }

    .content1_text > .text_box {
        padding-bottom: 20px;
    }

    .content2 {
        width: 300px;
        height: 550px;
    }

    .content2_review_btn {
        width: 200px;
        height: 50px;
        text-align: center;
        margin: 20px auto;
        font-size: 18px;
        padding: 10px;
    }

    .content2_review_btn:hover {
        background-color: #66B875;
    }

    .review_layout {
        width: 100%;
        height: 350px;
        padding: 10px;
        background-color: #fff;
        border: 1px solid #ddd;
        border-radius: 5px;
        box-shadow: 1px 1px 2px #ececec;
        overflow-y: scroll
    }

    .review_title {
        text-align: center;
        font-size: 24px;
        font-weight: 600;
        padding: 50px 0px;
    }

    .review_contents {
        padding: 10px 0px;
    }

    .review_layout > div:not(:last-child) {
        border-bottom: 1px solid #ececec;
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

    .map {
        width: 100%;
        height: 300px;
        background-color: beige;
    }

</style>

<script type="text/javascript">
    let contents;

    $(document).ready(function() {
        contents = $("#contents");
    })

    function showReviewModal() {
        const url = "/contents/detail/review";

        $.post(url, {}, function (data) {
            $.smartPop.open({
                title  : "리뷰 쓰기",
                id     : "review_modal",
                width  : 680,
                height : 450,
                html   : data,
            })
        })
    }

</script>

<div class="image_layout">
    <img src="/resource/img/시바카레1.jpg" alt="">
    <img src="/resource/img/시바카레2.jpg" alt="">
    <img src="/resource/img/시바카레3.jpg" alt="">
    <img src="/resource/img/시바카레4.jpg" alt="">
</div>

<div class="content_layout flex">
    <div class="content1">
        <div class="content1_top flex">
            <div class="content1_title">
                <span>시바카레</span>
                <span>카레</span>
            </div>
            <div class="content1_top_icon flex">
                <div>
                    <img src="/resource/img/favorite.png" alt="">
                    <p>좋아요</p>
                </div>
                <div>
                    <img src="/resource/img/link.png" alt="">
                    <p>공유하기</p>
                </div>
            </div>
        </div>
        <div class="content1_icon">
            <img src="/resource/img/eye.png" alt="">
            <span>50</span>
            <img src="/resource/img/favorite.png" alt="">
            <span>10</span>
        </div>
        <hr class="content1_line"/>
        <div class="content1_text">
            <div class="text_box">
                <p>주소</p>
                <p>광주 동구 장동로 11 2층 시바카레</p>
            </div>
            <div class="text_box">
                <p>전화번호</p>
                <p>0507-1413-0824</p>
            </div>
            <div class="text_box">
                <p>영업시간</p>
                <p>11:30 - 21:00</p>
            </div>
            <div class="text_box">
                <p>휴뮤</p>
                <p>매주 수요일</p>
            </div>
            <div class="text_box">
                <p>주차</p>
                <p>불가</p>
            </div>
        </div>
    </div>

    <div class="content2">
        <div class="review_title">방문자 리뷰</div>
        <div class="review_layout">
            <div class="review_contents flex">
                <div class="review_img left">
                    <img src="/resource/img/시바카레2.jpg" alt="">
                </div>
                <div class="review_text right">
                    <div>
                        <span class="id">id</span>
                        <span class="date">2022년 12월 30일</span>
                    </div>
                    <div class="review_star">★★</div>
                    <div class="text">존맛탱존맛탱존맛탱존맛탱존맛탱존맛탱존맛탱존맛탱존맛탱존맛탱존맛탱존맛탱존맛탱존맛탱존맛탱존맛탱</div>
                </div>
            </div>
            <div class="review_contents flex">
                <div class="review_img">
                    <img src="/resource/img/시바카레2.jpg" alt="">
                </div>
                <div class="review_text right">
                    <div>
                        <span class="id">id</span>
                        <span class="date">2022년 12월 30일</span>
                    </div>
                    <div class="review_star">★★</div>
                    <div class="text">존맛탱</div>
                </div>
            </div>
            <div class="review_contents flex">
                <div class="review_img">
                    <img src="/resource/img/시바카레2.jpg" alt="">
                </div>
                <div class="review_text right">
                    <div>
                        <span class="id">id</span>
                        <span class="date">2022년 12월 30일</span>
                    </div>
                    <div class="review_star">★★</div>
                    <div class="text">존맛탱</div>
                </div>
            </div>
        </div>
        <div class="content2_review_btn btn" onclick="showReviewModal()">리뷰쓰기</div>
    </div>
</div>

<div class="map">
    지도다.
</div>
