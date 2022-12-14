<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<style type="text/css">
    #mypage_title {
        text-align: center;
        border-bottom: 1px solid #acacac;
        padding: 40px 0;
    }

    #mypage_layout {
        width: 100%;
        height: 645px;
    }

    .hello {
        font-size: 24px;
        padding: 50px;
    }

    .hello span {
        font-weight: 600;
    }

    .mypage_menu {
        width: 220px;
        padding: 40px 50px;
        margin: 20px 0;
        border-right: 1px solid #acacac;
    }

    .mypage_menu div:first-child {
        padding-bottom: 40px;
    }

    .mypage_menu_box > h3 {
        font-size: 20px;
        font-weight: 600;
        padding-bottom: 15px;
    }

    .mypage_menu_box > p:first-of-type {
        padding-bottom: 10px;
    }

    .mypage_menu_box > p {
        cursor: pointer;
    }

    .menu_click {
        text-decoration: underline;
        text-underline-position: under;
    }

    .mypage_contents {
        width: 880px;
        margin: 62px 30px 30px 50px;
    }

</style>

<script type="text/javascript">

    $(document).ready(function() {
        setMypageLike();
    })

    function menuClick(obj) {
        const paramObj = $(obj),
              menuList = paramObj.parent().parent().find("p"),
              dataOpt  = paramObj.data("opt");

        menuList.removeClass("menu_click");
        paramObj.addClass("menu_click");

        dataOpt == "0" ? setMypageLike() :
        dataOpt == "1" ? setMypagePwChange() :
        dataOpt == "2" ? setMypageWidhdraw() : "";
    }

    function setMypageLike() {
        const url = "/mypage/like"

        $.post(url, {}, function(data){
            $(".mypage_contents").html(data);
        })
    }

    function setMypagePwChange() {
        const url = "/mypage/pwChange"

        $.post(url, {}, function(data){
            $(".mypage_contents").html(data);
        })
    }

    function setMypageWidhdraw() {
        const url = "/mypage/withdraw"

        $.post(url, {}, function(data){
            $(".mypage_contents").html(data);
        })
    }
</script>

<div id="mypage_title">
    <div>
        <h2>MY PAGE</h2>
        <p>마이페이지</p>
    </div>
    <div class="hello">
        <p><span>id</span>님 반가워요 :)</p>
    </div>
</div>

<div id="mypage_layout" class="flex">
    <div class="mypage_menu">
        <div class="mypage_menu_box">
            <h3>관심 장소</h3>
            <p class="menu menu_click" data-opt="0" onclick="menuClick(this)">좋아요</p>
        </div>
        <div class="mypage_menu_box">
            <h3>내 정보</h3>
            <p class="menu" data-opt="1" onclick="menuClick(this)">비밀번호 변경</p>
            <p class="menu" data-opt="2" onclick="menuClick(this)">회원탈퇴</p>
        </div>
    </div>
    <div class="mypage_contents">

    </div>
</div>