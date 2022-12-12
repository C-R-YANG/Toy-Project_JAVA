<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<style>
    #contents {
        width: 600px;
        height: 100%;
        margin: 120px auto;
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

    .modal_title {
        font-size: 30px;
        font-weight: bold;
    }

    .modal_box {
        width: 400px;
        margin: 50px auto 0px;
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

    .find_btn{
        width: 150px;
        height: 50px;
        background-color: #9bc76c;
        font-size: 16px
    }

    .find_btn:hover {
        background-color: #66B875;
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
                width  : 600,
                height : 650,
                html   : data,
            })
        })
    }

    function showFindIdModal() {
        contents.find(".modal_bg").removeClass("none");
        contents.find(".find_id .modal").removeClass("none");
    }

    function showFindPwModal() {
        contents.find(".modal_bg").removeClass("none");
        contents.find(".find_pw .modal").removeClass("none");
    }

    function hideModal() {
        contents.find(".modal_bg").addClass("none");
        contents.find(".modal").addClass("none");
        contents.find(".modal_input_sub_box input").val("");

    }

    function chkLogin() {
        const url = "/login";

        const param = { "id" : contents.find("#userId").val(), "pw" : contents.find("#password").val()};

        $.post(url, param, function() {
           data ? alert("아이디 또는 비밀번호를 확인해주세요.") : "";
        })
    }

    function findId() {
        const url   = "/user/find/id",
              param = { "email" : $("#find_id_email").val() }

        $.post(url, param, function(data) {
            data ? alert("아이디는 (" + data + ") 입니다.") : alert("이메일을 다시 확인해주세요.");
        })
    }

    function findPw() {
        const url   = "/user/find/pw",
              param = { "id" : $("#find_pw_id").val(), "email" : $("#find_pw_email").val()};

        $.post(url, param, function(data) {
            data ? $("#key_input").removeClass("none") : alert("아이디 또는 이메일을 다시 확인해주세요.");
        })
    }

    function changePw() {
        const url   = "/user/find/pw/change",
              param = { "pw" : $("#change_pw").val()}

        $.post(url, param, function() {
            hideModal();

            alert("비밀번호가 변경되었습니다.");
        })
    }

    // 인증번호 타이머
    let timer     = null,
        isRunning = false;

    function sendKey() {
        let display   = contents.find("#timer"),
            leftSec   = 180;

        if(isRunning) {
            clearInterval(timer);
            display.html("");
            startTimer(leftSec, display);
        } else {
            startTimer(leftSec, display);
        }

        function startTimer(count, display) {
            let minutes,
                seconds;

            timer = setInterval(function () {
                minutes = parseInt(count / 60, 10);
                seconds = parseInt(count % 60, 10);

                minutes = minutes < 10 ? "0" + minutes : minutes;
                seconds = seconds < 10 ? "0" + seconds : seconds;

                display.html(minutes + ":" + seconds);

                // 타이머 끝
                if (--count < 0) {
                    clearInterval(timer);
                    alert("입력시간이 초과되었습니다.");
                    display.html("");
                }
            }, 1000);
            isRunning = true;
        }
    }

    function chkKey() {
        $("#change_pw_input").removeClass("none");
        $(".change_btn").removeClass("none");
    }
</script>

<div class="logo">
    <img src="${url}/resource/img/보리댕댕.png" alt="보리댕댕" onclick="location.href=('/login')"/>
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

<div class="join">
    <div class="modal_bg none">
        <div class="modal z_display none">
            <img src="${url}/resource/img/close.png" class="icon_close" alt="close" onclick="hideModal();">

        </div>
    </div>
</div>

<div class="find_id">
    <div class="modal_bg none">
        <div class="modal z_display none">
            <img src="${url}/resource/img/close.png" class="icon_close" alt="close" onclick="hideModal();">
            <div class="modal_box">
                <h2 class="modal_title">아이디 찾기</h2>
                <div class="modal_contents">
                    <div class="modal_input_box">
                        <div class="modal_input_sub_box flex">
                            <input type="email" id="find_id_email" placeholder="이메일" />
                            <button class="send_num" onclick="sendKey();">인증번호 전송<button>
                        </div>
                    </div>
                </div>
                <input type="button" class="btn find_btn" value="아이디 찾기" onclick="findId();">
            </div>
        </div>
    </div>
</div>

<div class="find_pw">
    <div class="modal_bg none">
        <div class="modal z_display none">
            <img src="${url}/resource/img/close.png" class="icon_close" alt="close" onclick="hideModal();">
            <div class="modal_box">
                <h2 class="modal_title">비밀번호 찾기</h2>
                <div class="modal_contents">
                    <div class="modal_input_box ">
                        <div class="modal_input_sub_box">
                            <input type="text" id="find_pw_id"placeholder="아이디">
                        </div>
                    </div>
                    <div class="modal_input_box">
                        <div class="modal_input_sub_box flex">
                            <input type="email" id="find_pw_email"placeholder="이메일 주소" />
                            <button class="send_num" onclick="sendKey(); findPw();">인증번호 전송<button>
                        </div>
                    </div>
                    <div class="modal_input_box none" id="key_input">
                        <div class="modal_input_sub_box flex">
                            <input type="text" id="find_pw_key"placeholder="인증번호 입력" />
                            <div id="timer"></div>
                            <button class="send_num" onclick="chkKey();">확인</button>
                        </div>
                    </div>
                    <div class="modal_input_box none" id="change_pw_input">
                        <div class="modal_input_sub_box flex">
                            <input type="text" id="change_pw"placeholder="새 비밀번호" />
                        </div>
                    </div>
                </div>
                <input type="button" class="btn change_btn none" value="비밀번호 변경하기" onclick="changePw();">
            </div>
        </div>
    </div>
</div>