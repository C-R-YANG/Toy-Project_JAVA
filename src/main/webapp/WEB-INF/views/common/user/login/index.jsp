<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<style>
    #contents {
        width: 600px;
        height: 100%;
        margin: 150px auto;
        text-align: center;
    }

    .logo {
        padding: 30px 0;
    }

    .logo img {
        cursor: pointer;
    }

    .content1 img {
        width: 300px;
        margin: 50px auto;
    }

    #login_layout{
        margin: 0 auto;
        width: 360px;
    }

    hr {
        width: 100%;
        background: #acacac;
        height:1px;
        border:0;
        margin: 0px auto;
    }

    .login_title {
        font-size: 30px;
        font-weight: bold;
        padding: 40px 0 30px 0;
    }

    .login_input_box {
        height: 50px;
        background-color: #f0f0f0;
        padding: 15px 0;
        margin-bottom: 15px;
        border-radius: 50px;
    }

    .login_input_box input {
        background: none;
        outline: none;
        border: none;
        font-size: 16px;
        color: #333;
        width: 80%;
        height: 18px;
        padding: 0;
    }

    .save_login_box {
        color: #333;
        accent-color: #9bc76c;
        text-align: left;
        padding-left: 16px;
    }

    .login_btn {
        margin: 50px;
        width: 200px;
        height: 50px;
        background-color: #9bc76c;
        font-size: 18px;
    }

    .login_btn:hover {
        background-color: #5FB27A;
    }

    .bottom span {
        margin-right: 20px;
        cursor: pointer;

    }

    /* join */
    .modal_bg {
        position: absolute;
        width: 100%;
        height: 100%;
        background: rgba(0,0,0,0.2);
        top: 0;
        left: 0;
    }

    .icon_close {
        height: 35px;
        width: 35px;
        position: relative;
        top: 20px;
        left: 250px;
        cursor: pointer;
    }

    .modal {
        width: 600px;
        height: 650px;
        background: #fff;
        position: absolute;
        top: 50%;
        left: 50%;
        transform: translate(-50%, -50%);
        border: 1px solid #acacac;
        border-radius: 10px;
    }

    .modal_box {
        width: 400px;
        height: 100%;
        margin: 0px auto;
        padding-top: 80px;
    }


    .modal_input_box {
        position: relative;
        width: 100%;
        height: 90px;
    }

    .modal_contents {
        margin-top: 30px;
    }

    .modal_input_sub_box {
        border-bottom: 1px solid #CCC;
        align-items: center;
    }

    .modal_input_box input {
        outline: none;
        border: none;
        width: 100%;
        font-size: 16px;
        color: #333;
        height: 45px;
        padding-left: 10px;
    }



    .send_num {
        width: 145px;
        height: 30px;
        border: 1px solid #9bc76c;
        background-color: #fff;
        border-radius: 10px;
        outline: none;
        text-decoration: none;
        font-size: 14px;
        cursor: pointer
    }

    #timer {
        color: red;
        font-size: 14px;
    }

    .change_btn{
        width: 170px;
        height: 50px;
        background-color: #9bc76c;
        font-size: 16px
    }

    .change_btn:hover {
        background-color: #5FB27A;
    }

</style>

<script>
    let contents;

    $(document).ready(function() {
        contents = $("#contents");
    })

    function showJoinModal() {
        const url = "/user/join/index";

        $.post(url, {}, function (data) {
            $.smartPop.open({
                title  : "회원가입",
                id     : "join_modal",
                width  : 610,
                height : 630,
                html   : data,
            })
        })
    }

    function showFindIdModal() {
        const url = "/user/find/findId";

        $.post(url, {}, function (data) {
            $.smartPop.open({
                title  : "아이디 찾기",
                id     : "find_id_modal",
                width  : 600,
                height : 500,
                html   : data,
            })
        })
    }

    function showFindPwModal() {
        const url = "/user/find/findPw";

        $.post(url, {}, function (data) {
            $.smartPop.open({
                title  : "비밀번호 찾기",
                id     : "find_pw_modal",
                width  : 610,
                height : 630,
                html   : data,
            })
        })
    }


    function chkLogin() {
        const url = "/login";

        const param = { "id" : contents.find("#userId").val(), "pw" : contents.find("#password").val()};

        $.post(url, param, function() {})
    }
</script>

<div class="logo">
    <img src="${url}/resource/img/보리댕댕.png" alt="보리댕댕" onclick="location.href=('/index')"/>
</div>

<hr/>

<div id="login_layout">
    <form action="/login" method="post" class="login_form">
        <h2 class="login_title">로그인</h2>
        <div class="login_input_box">
            <input type="text" id="userId" name="userId" placeholder="아이디">
        </div>
        <div class="login_input_box">
            <input type="password" id="password" name="password" placeholder="비밀번호">
        </div>

        <div class="save_login_box">
            <input type="checkbox" id="save_login">
            <label for="save_login">로그인 정보 저장</label>
        </div>
        <input type="submit" class="btn login_btn" value="로그인" onclick="chkLogin();">
    </form>
</div>

<div class="bottom">
    <span class="bottom_join"     onclick="showJoinModal()">회원가입</span>
    <span class="bottom_find_id"  onclick="showFindIdModal()">아이디 찾기</span>
    <span class="bottom_find_pw" onclick="showFindPwModal()">비밀번호 찾기</span>
</div>
