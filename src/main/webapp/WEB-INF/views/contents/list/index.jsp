<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<style type="text/css">
    .array_wrap {
        width: 300px;
    }
    .list_box {
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
    .content_text > .title {

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
</style>

<script type="text/javascript">

    function moveDetailUrl(obj) {
        const opt = contentsFlag.children("#opt").val();

        location.href = "/contents/detail?opt=" + opt;
    }
</script>

<div class="list_box flex">
    <div class="list_content" onclick="moveDetailUrl(this)">
        <div class="content_img">
            <img src="/resource/img/시바카레.jpg" alt="시바카레">
        </div>
        <div class="content_text">
            <span class="title">시바카레</span>
            <span class="sort">카레</span>
            <p class="address">동구 / 장동</p>
            <p class="closed">매주 수요일 휴무</p>
        </div>
        <div class="content_bottom">
            <img src="/resource/img/eye.png" alt="">
            <span>50</span>
            <img src="/resource/img/favorite.png" alt="">
            <span>10</span>
        </div>
    </div>
    <div class="list_content"></div>
    <div class="list_content"></div>
    <div class="list_content"></div>
    <div class="list_content"></div>
    <div class="list_content"></div>
    <div class="list_content"></div>
    <div class="list_content"></div>
    <div class="list_content"></div>
</div>