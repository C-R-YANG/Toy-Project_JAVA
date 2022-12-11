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
    }

    .content_layout::after {
        content: "";
        display: block;
        clear: both;
    }

    .content1 {
        width: 750px;
        height: 100%;
        float: left;
        padding: 30px 30px 10px;
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

    .content1_title {
        width: 100%;
        padding-bottom: 15px;
    }

    .content1_title span:first-child {
        font-size: 24px;
        font-weight: 600;
    }

    .content1_title span:last-child {
        color: #acacac;
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

    .last {
        font-size: 14px;
        font-style: italic;
        color: #acacac;
    }

    .content2 {
        width: 300px;
        height: 100%;
        float: right;
    }

    .content2_icon {
        padding: 30px 0;
        justify-content: space-around;
    }

    .content2_icon > div {
        width: 80px;
        text-align: center;
        cursor: pointer;
    }

    .content2_icon img {
        width: 25px;
    }

    .content2_review_btn {
        width: 240px;
        height: 50px;
        text-align: center;
        margin: auto;
        font-size: 18px;
        padding: 10px;
    }

    .review_layout {
        width: 750px;
        height: 100%;
        padding-bottom: 60px;
    }

    .review_title {
        font-size: 24px;
        font-weight: 600;
        padding: 30px;
    }

    .review {
        padding: 0px 30px;
        background-color: #fff;
        border: 1px solid #ddd;
        border-radius: 5px;
        box-shadow: 1px 1px 2px #ececec;;
    }

    .review > div:not(:first-of-type) {
        border-top: 1px solid rgb(221, 221, 221);
    }

    .review_list {
        padding: 20px 0;
    }

    .review_date {
        font-size: 12px;
    }

    .review_star {
        color: #9bc76c;
        padding: 10px 0;
    }
</style>

<script type="text/javascript"></script>

<div class="image_layout">
    <img src="/resource/img/시바카레1.jpg" alt="">
    <img src="/resource/img/시바카레2.jpg" alt="">
    <img src="/resource/img/시바카레3.jpg" alt="">
    <img src="/resource/img/시바카레4.jpg" alt="">
</div>

<div class="content_layout">
    <div class="content1">
        <div class="content1_title">
            <span>시바카레</span>
            <span>카레</span>
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
                <h4>주소</h4>
                <p>광주 동구 장동로 11 2층 시바카레</p>
            </div>
            <div class="text_box">
                <h4>전화번호</h4>
                <p>0507-1413-0824</p>
            </div>
            <div class="text_box">
                <h4>영업시간</h4>
                <p>11:30 - 21:00</p>
                <p class="last">Last Order : 20:15</p>
            </div>
            <div class="text_box">
                <h4>휴게시간</h4>
                <p>15:30 - 17:00</p>
            </div>
            <div class="text_box">
                <h4>휴뮤</h4>
                <p>매주 수요일</p>
            </div>
            <div>
                <h4>주차</h4>
                <p>불가</p>
            </div>
        </div>
    </div>

    <div class="content2">
        <div class="content2_icon flex">
            <div>
                <img src="/resource/img/favorite.png" alt="">
                <p>좋아요</p>
            </div>
            <div>
                <img src="/resource/img/link.png" alt="">
                <p>공유하기</p>
            </div>
        </div>
        <div class="content2_review_btn btn">리뷰쓰기</div>
    </div>
</div>

<div class="review_layout">
    <p class="review_title">방문자 리뷰</p>
    <div class="review">
        <div class="review_list">
            <div>
                <span>로로미</span>
                <span class="review_date">2022년 9월 6일</span>
            </div>
            <div class="review_star">★★★★★</div>
            <div>추천합니다.</div>
        </div>
        <div class="review_list">
            <div>
                <span>로로미</span>
                <span class="review_date">2022년 9월 6일</span>
            </div>
            <div class="review_star">★★★★★</div>
            <div>추천합니다.</div>
        </div>
        <div class="review_list">
            <div>
                <span>로로미</span>
                <span class="review_date">2022년 9월 6일</span>
            </div>
            <div class="review_star">★★★★★</div>
            <div>추천합니다.</div>
        </div>
        <div class="review_list">
            <div>
                <span>로로미</span>
                <span class="review_date">2022년 9월 6일</span>
            </div>
            <div class="review_star">★★★★★</div>
            <div>추천합니다.</div>
        </div>
    </div>
</div>
