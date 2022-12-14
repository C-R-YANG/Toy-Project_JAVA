<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<style type="text/css">
    .withdraw_layout {
        margin: 0px auto;
        width: 800px;
    }

    .withdraw_title {
        width: 600px;
        margin: auto;
        font-size: 17px;
        text-align: center;
    }

    .withdraw_contents {
        width: 500px;
        margin: auto;
        padding: 50px 0;
    }

    .input_box {
        width: 100%;
        height: 40px;
        margin-bottom: 35px;
    }

    .input_box > input {
        width: 300px;
        border-radius: 10px;
        height: 40px;
    }

    .input_box > label {
        display: inline-block;
        width: 160px;
    }

    .button_box {
        text-align: center;
    }

    .withdraw_btn {
        width: 110px;
        height: 45px;
        font-size: 18px;
    }

</style>

<script type="text/javascript">
    function withDraw() {
        alert("탈퇴 되었습니다.")

        location.href=('/login');
    }

</script>

<div class="withdraw_layout">
    <div class="withdraw_title">
        <h3>회원탈퇴</h3>
    </div>

    <div class="withdraw_contents">
        <div class="input_box">
            <label for="pw">현재 비밀번호</label>
            <input type="password" id="pw">
        </div>
    </div>

    <div class="button_box">
        <button class="withdraw_btn btn" onclick="withDraw()">탈퇴하기</button>
    </div>
</div>