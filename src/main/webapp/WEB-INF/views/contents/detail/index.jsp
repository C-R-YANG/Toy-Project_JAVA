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
        height: 100%;
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

    .content1_top {
        width: 100%;
        height: 45px;
        justify-content: space-between;
    }

    .content1_title {
        float: left;
    }

    .content1_title span:first-child {
        font-size: 24px;
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

    .last {
        font-size: 14px;
        font-style: italic;
        color: #acacac;
    }

    .content2 {
        width: 300px;
        height: 100%;
    }

    .content2_review_btn {
        width: 200px;
        height: 50px;
        text-align: center;
        margin: 30px auto;
        font-size: 18px;
        padding: 10px;
    }

    .content2_review_btn:hover {
        background-color: #66B875;
    }

    .review_title {
        text-align: center;
        font-size: 24px;
        font-weight: 600;
        padding: 30px 0px;
    }

    .review {
        padding: 0px 30px;
        background: #fff;
        border: 1px solid #ddd;
        border-radius: 5px;
        box-shadow: 1px 1px 2px #ececec;;
    }

    .review > div:not(:first-of-type) {
        border-top: 1px solid rgb(221, 221, 221);
    }

    .review_list {
        padding: 15px 0;
    }

    .review_list_date {
        font-size: 12px;
    }

    .review_list_star {
        color: #9bc76c;
        padding: 10px 0;
    }

    .review_modal_bg {
        position: absolute;
        width: 100%;
        height: 100%;
        background: rgba(0,0,0,0.2);
        top: 0;
        left: 0;
    }

    .review_modal {
        width: 700px;
        height: 500px;
        position: absolute;
        top: 50%;
        left: 50%;
        transform: translate(-50%, -50%);
        padding: 30px 50px;
        background-color: #fff;
        border: 1px solid #acacac;
        border-radius: 10px;
    }

    .review_modal_top {
        width: 100%;
    }

    .review_modal_top > img {
        width: 21px;
        vertical-align: middle;
    }

    .review_modal_top > span {
        font-size: 18px;
        vertical-align: middle;
    }

    .review_modal_title {
        width: 100%;
        margin: 25px auto;
        text-align: center;
        font-size: 20px;
    }

    .review_modal_text > textarea {
        width: 100%;
        height: 150px;
        padding: 15px;
        outline: none;
        border: 1px solid #dcdcdc;
        border-radius: 10px;
        resize: none;
    }

    .review_modal_img {
        width: 100%;
        padding: 10px 0 20px;
    }

    .review_modal_img > span {
        font-size: 12px;
        color: #acacac;
    }

    .review_modal_btn {
        justify-content: flex-end;
    }

    .review_modal_btn > .write_btn {
        width: 70px;
        height: 40px;
        font-size: 16px;
    }

    .review_modal_btn > .close_btn {
        width: 70px;
        height: 40px;
        font-size: 16px;
        background-color: #fff;
        color: #000;
        box-shadow: none;
        border: 1px solid #ccc;
    }

    .review_star {
        text-decoration: none;
        color: #acacac;
        cursor: pointer;
    }

    .review_star.on {
        color: #9bc76c;
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
        contents.find(".review_modal_bg").removeClass("none");
        contents.find(".review_modal").removeClass("none");
        contents.find(".review_modal_text").children().focus();
    }

    function hideReviewModal() {
        contents.find(".review_modal_bg").addClass("none");
        contents.find(".review_modal").addClass("none");
        contents.find(".review_modal_text").children().val("");
    }

    function writeBtn() {

        if(contents.find(".review_modal_text").children().val() === "") {
            alert("내용을 입력해주세요.");
            contents.find(".review_modal_text").children().focus();
        } else {
            alert("리뷰가 등록되었습니다.");
            contents.find(".review_modal_bg").addClass("none");
            contents.find(".review_modal").addClass("none");
            contents.find(".review_modal_text").children().val("");
        }
    }

    function starBtn(obj) {
        $(obj).parent().children("span").removeClass("on");
        $(obj).addClass("on").prevAll("span").addClass("on");
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

        <p class="review_title">방문자 리뷰</p>
        <div class="review">
            <div class="review_list">
                <div>
                    <span>로로미</span>
                    <span class="review_list_date">2022년 9월 6일</span>
                </div>
                <div class="review_list_star">★★★★★</div>
                <div>추천합니다.</div>
            </div>
            <div class="review_list">
                <div>
                    <span>로로미</span>
                    <span class="review_list_date">2022년 9월 6일</span>
                </div>
                <div class="review_list_star">★★★★★</div>
                <div>추천합니다.</div>
            </div>
            <div class="review_list">
                <div>
                    <span>로로미</span>
                    <span class="review_list_date">2022년 9월 6일</span>
                </div>
                <div class="review_list_star">★★★★★</div>
                <div>추천합니다.</div>
            </div>
        </div>
        <div class="content2_review_btn btn" onclick="showReviewModal()">리뷰쓰기</div>
    </div>
</div>

<div class="review_modal_bg none">
    <div class="review_modal none">
        <div class="review_modal_top">
            <img src="/resource/img/edit.png" alt="">
            <span>리뷰쓰기</span>
        </div>
        <div class="review_modal_title">
            <h3>시바카레</h3>
            <div class="review_star_box">
                <span class="review_star on" onclick="starBtn(this)">★</span>
                <span class="review_star" onclick="starBtn(this)">★</span>
                <span class="review_star" onclick="starBtn(this)">★</span>
                <span class="review_star" onclick="starBtn(this)">★</span>
                <span class="review_star" onclick="starBtn(this)">★</span>
            </div>
        </div>
        <div class="review_modal_text">
            <textarea placeholder="내용을 입력해주세요."></textarea>
        </div>
        <div class="review_modal_img">
            <input type="file" accept="image/*" multiple>
        </div>
        <div class="review_modal_btn flex">
            <input type="button" class="write_btn btn" value="등록" onclick="writeBtn()">
            <input type="button" class="close_btn btn" value="닫기" onclick="hideReviewModal()">
        </div>
    </div>
</div>

<div class="map">
    지도다.
</div>
