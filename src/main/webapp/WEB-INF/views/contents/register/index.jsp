<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<style type="text/css">
    .register_layout {
        width: 700px;
        height: 100%;
        margin: 50px auto;
        padding: 30px 40px 10px;
        background-color: #fff;
        border: 1px solid #ddd;
        border-radius: 30px;
        box-shadow: 2px 2px 2px #ececec;
    }

    .register_title {
        padding-bottom: 30px;
    }

    .register_contents {
        padding-bottom: 20px;
    }

    .input_box {
        padding-bottom: 15px;
    }

    .register_contents > div:not(:last-child) > input {
        height: 35px;
        border-radius: 10px;
     }

    .input_box > label, .input_box > span, .address label {
        display: inline-block;
        width: 120px;
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
    }

    #main_address {
        width: 360px;
        height: 35px;
        border-radius: 10px;
    }

    .input_box {
        height: 50px;
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
</script>

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
            <div>
                <label for="post_code">주소</label>
                <input type="text" id="post_code" disabled>
                <img src="/resource/img/search.png" alt="search" class="addressSearch"/>
            </div>
            <div>
                <label for="main_address" style="width: 0px"></label>
                <input type="text" id="main_address" placeholder="주소를 검색해주세요." disabled>
            </div>
        </div>

        <div class="input_box">
            <label for="sub_address">상세주소</label>
            <input type="text" id="sub_address">
        </div>
        <div class="input_box">
            <label for="number">전화번호</label>
            <input type="text" id="number">
        </div>
        <div class="input_box">
            <label for="start">영업시간</label>
            <input type="text" id="start">
            <label for="end" style="width: 10px;">~</label>
            <input type="text" id="end">
        </div>
        <div class="input_box">
            <label for="last">Last Order</label>
            <input type="text" id="last">
        </div>
        <div class="input_box">
            <label for="break">브레이크타임</label>
            <input type="text" id="break">
        </div>
        <div class="input_box">
            <label for="closed">휴무일</label>
            <input type="text" id="closed">
        </div>
        <div class="input_box">
            <span>주차</span>
            <input type="radio" id="parking_y" name="parking" checked>
            <label for="parking_y">가능</label>
            <input type="radio" id="parking_n" name="parking">
            <label for="parking_n">불가능</label>
        </div>
    </div>
</div>