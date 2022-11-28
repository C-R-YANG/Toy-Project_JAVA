<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<style>

    #contents {
        display: flex;
    }

    /* login_content */
    .login_content {
        width: 80%;
        height: 900px;
        margin: auto;
        text-align: center;
        position: relative
    }

    .content1 img {
        width: 300px;
        margin: 50px auto;
    }

    hr {
        width: 100%;
        background: #acacac;
        height:1px;
        border:0;
        margin: 0px auto;
    }

    .content1 {
        width: 600px;
        position: absolute;
        top: 50%;
        left: 50%;
        transform: translate(-50%, -50%);
    }

    .login_form {
        margin-top: 50px;
        position: relative;
    }

    .login_title {
        font-size: 30px;
        font-weight: bold;
        margin: 20px 0 40px;
    }

    .login_input_box {
        width: 60%;
        height: 50px;
        background-color: #f0f0f0;
        margin: 15px auto;
        border-radius: 50px;
    }

    .login_input_box input {
        background: none;
        outline: none;
        border: none;
        font-size: 16px;
        color: #333;
        height: 50px;
        width: 80%;
    }

    .save_login_box {
        margin: 20px;
        position: relative;
        right: 103px;
        color: #333;
        accent-color: #9bc76c;
    }

    .login_btn {
        margin: 30px;
        width: 200px;
        height: 50px;
        background-color: #9bc76c;
    }

    .login_btn:hover {
        background-color: #5FB27A;
    }

    .content1_btn {
        margin-top: 30px;
    }

    .content1_btn span {
        margin-right: 20px;
        cursor: pointer;

    }

    /* content2_join */
    .icon_close {
        height: 30px;
        width: 30px;
        position: relative;
        top: 20px;
        left: 209px;
        cursor: pointer;
    }

    .content2_join {
        width: 500px;
        height: 550px;
        background: #ffffff;
        position: absolute;
        top: 50%;
        left: 50%;
        transform: translate(-50%, -50%);
        border: 1px solid #acacac;
        border-radius: 10px;
    }

    .content2_join_title {
        font-size: 30px;
        font-weight: bold;
        margin: 50px;
    }

    .join_input_box {
        width: 60%;
        height: 40px;
        background-color: #f0f0f0;
        margin: 40px auto;
        border-radius: 50px;
    }

    .join_input_box input {
        background: none;
        outline: none;
        border: none;
        font-size: 16px;
        color: #333;
        height: 40px;
        width: 80%;
    }

    .join_condition {
        padding-top: 5px;
        text-align: left;
        color: #008a5b;
        font-size: 12px;
    }

    .join_btn {
        width: 150px;
        height: 50px;
        background-color: #9bc76c
    }

    .join_btn:hover {
        background-color: #5FB27A;
    }

</style>

<script>

    function showModal() {
        $(".content2_join").fadeIn();
    }

    function hideModal() {
        $(".content2_join").fadeOut();
    }
</script>

<div class="login_content">
    <div class="content1">
        <img src="${url}/resource/img/보리댕댕.png" alt="보리댕댕"/>
        <hr/>
        <form action="" class="login_form">
            <h2 class="login_title">로그인</h2>
            <div class="login_input_box">
                <input type="text" id="userId" placeholder="아이디">
            </div><div class="login_input_box">
                <input type="password" id="password" placeholder="비밀번호">
            </div>
            <div class="save_login_box">
                <input type="checkbox" id="save_login">
                <label for="save_login">로그인 정보 저장</label>
            </div>
            <input type="submit" class="btn login_btn" value="로그인">
        </form>
        <div class="content1_btn">
            <span class="content1_join" onclick="showModal()">회원가입</span>
            <span>아이디 찾기</span>
            <span>비밀번호 찾기</span>
        </div>
    </div>
    <div class="content2">
        <div class="content2_join z_display none">
            <form action="">
                <img src="${url}/resource/img/close.png" class="icon_close" alt="close" onclick="hideModal()"/>
                <h2 class="content2_join_title">회원가입</h2>
                <div class="join_input_box">
                    <input type="text" id="newId" placeholder="아이디" minlength="4" maxlength="16">
                    <p class="join_condition"> * 사용자 아이디는 4 ~ 16글자여야 합니다.</p>

                </div>
                <div class="join_input_box">
                    <input type="password" id="newPassword" placeholder="비밀번호" minlength="4" maxlength="16">
                    <p class="join_condition"> * 비밀번호는 4 ~ 16글자여야 합니다.</p>

                </div>
                <div class="join_input_box">
                    <input type="password" id="newPassword2" placeholder="비밀번호 확인">
                </div>
                <div class="join_input_box">
                    <input type="email" id="email" placeholder="이메일 주소">
                </div>
                <input type="submit" class="btn join_btn" value="회원가입">
            </form>
        </div>
        <div class="content2_find_id"></div>
        <div class="content2_find_pwd"></div>
    </div>
</div>