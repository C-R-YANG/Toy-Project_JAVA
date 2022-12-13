<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<style type="text/css">
    .register_layout {
        width: 730px;
        height: 100%;
        margin: 50px auto 0px;
        padding: 40px 50px;
        background-color: #fff;
        border: 1px solid #ddd;
        border-radius: 30px;
        box-shadow: 2px 2px 2px #ececec;
    }

    .register_title {
        padding-bottom: 50px;
        text-align: center;
    }

    .register_contents {
        padding-bottom: 20px;
    }

    .input_box {
        width: 100%;
        height: 35px;
        margin-bottom: 20px;
    }

    .input_box > input {
        border-radius: 10px;
        height: 35px;
    }

    .input_box > label, .address label {
        display: inline-block;
        width: 120px;
    }

    .radio_box > span {
        display: inline-block;
        width: 120px;
    }

    .radio_box > label {
        display: inline-block;
        width: 60px;
    }

    .radio_box > input {
        accent-color: #9bc76c;
    }

    .register_contents > div:nth-child(3) > input {
        width: 490px;
    }

    .register_contents > div:first-child > input {
        width: 490px;
    }

    #post_code {
        width: 110px;
        height: 35px;
        border-radius: 10px;
    }

    .addressSearch {
        width: 18px;
        border: none;
        border-radius: 8px;
        position: relative;
        top: -26px;
        left: 210px;
        z-index: 999;
        cursor: pointer;
    }

    #main_address {
        width: 374px;
        height: 35px;
        border-radius: 10px;
    }

    input[type=time] {
        width: 130px;
        padding: 5px;
        border: 1px solid #acacac;
        border-radius: 10px;
        outline: none;
    }

    #number, #closed {
        width: 130px;
    }

    .btn_box {
        width: 100%;
        text-align: center;
        padding: 40px;
    }

    .btn_box > .write_btn {
        width: 100px;
        height: 45px;
        font-size: 18px;
    }

    .btn_box > .close_btn {
        width: 100px;
        height: 45px;
        font-size: 18px;
        background-color: #fff;
        color: #000;
        box-shadow: none;
        border: 1px solid #ccc;
    }
</style>

<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

<script type="text/javascript">

    function findAddr() {
        new daum.Postcode({
            oncomplete: function(data) {
                let addr = '';

                if (data.userSelectedType === 'R') {
                    addr = data.roadAddress;
                } else {
                    addr = data.jibunAddress;
                }

                $("#main_address").val(addr);
                $("#post_code").val(data.zonecode);

                $("#sub_address").focus();
            }
        }).open();
    }

    function chkNum() {
        const numVal      = $("#number").val();
        const numValCheck = /^[0-9,-]+$/


        if (numVal.length > 0) {
            if(!numVal.match(numValCheck)) {
                alert("숫자, 하이픈(-)만 입력해주세요.");
                $("#number").val("");
            }
        }
    }

    function register(obj) {
        const opt = register.children("#opt").val();

        location.href = "/contents/list?opt=" + opt;
    }
</script>

<div id="register_flag">
    <input type="hidden" id="opt" value="${opt}">
</div>

<div class="register_layout">
    <div class="register_title">
        <h2>장소 등록하기</h2>
    </div>
    <div class="register_contents">
        <div class="input_box">
            <label for="title">장소명</label>
            <input type="text" id="title">
        </div>
        <div class="input_box address flex">
            <div style="width: 236px;">
                <label for="post_code">주소</label>
                <input type="text" id="post_code" disabled onclick="findAddr()">
                <img src="/resource/img/search.png" alt="search" class="addressSearch" onclick="findAddr()"/>
            </div>
            <div>
                <label for="main_address" style="width: 0px"></label>
                <input type="text" id="main_address" placeholder="주소를 검색해주세요." readonly>
            </div>
        </div>

        <div class="input_box">
            <label for="sub_address">상세주소</label>
            <input type="text" id="sub_address">
        </div>
        <div class="input_box">
            <label for="number">전화번호</label>
            <input type="text" id="number" onkeyup="chkNum();" >
        </div>
        <div class="input_box">
            <label for="start">영업시간</label>
            <input type="time" id="start">
            <label for="end" style="width: 10px;">~</label>
            <input type="time" id="end">
        </div>
        <div class="input_box">
            <label for="closed">휴무일</label>
            <input type="text" id="closed">
        </div>
        <div class="radio_box">
            <span>주차</span>
            <input type="radio" id="parking_y" name="parking" checked>
            <label for="parking_y">가능</label>
            <input type="radio" id="parking_n" name="parking">
            <label for="parking_n">불가능</label>
        </div>
    </div>
</div>

<div class="btn_box">
    <button class="write_btn btn" onclick="register(this)">등록</button>
    <button class="close_btn btn" onclick="cancel(this)">취소</button>
</div>
