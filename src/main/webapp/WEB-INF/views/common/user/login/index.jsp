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

    .db_chk {
        width: 100px;
        height: 30px;
        line-height: 27px;
        border: 1px solid #9bc76c;
        background-color: #fff;
        border-radius: 50px;
        outline: none;
        text-decoration: none;
        font-size: 14px;
        cursor: pointer;

    }

    .join_condition {
        padding: 10px;
        font-size: 12px;
        text-align: left;
    }

    .join_btn, .find_btn{
        width: 150px;
        height: 50px;
        background-color: #9bc76c;
        font-size: 16px
    }

    .join_btn:hover {
        background-color: #5FB27A;
    }

    .find_btn:hover {
        background-color: #5FB27A;
    }

    .pw_chk_msg {
        padding: 10px;
        color: #008a5b;
        font-size: 12px;
        text-align: left;
    }

    .send_num {
        width: 145px;
        height: 30px;
        border: 1px solid #9bc76c;
        background-color: #fff;
        border-radius: 50px;
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

    // move_login_page

    function joinSubmit() {
        // id
        const newId = contents.find("#new_id"),
              idVal = newId.val(),
              idValCheck = /^(?=.*\d)(?=.*[a-zA-Z])[0-9a-zA-Z]{6,12}$/;

        // pw
        const newPw       = contents.find("#new_pw"),
              newPwChk    = contents.find("#new_pw_chk"),
              pwVal       = newPw.val(),
              newPwChkVal = newPwChk.val(),
              pwValCheck  = /^(?=.*\d)(?=.*[a-zA-Z])[0-9a-zA-Z]{8,12}$/;

        //email
        const newEmail      = contents.find("#new_email"),
              emailVal      = newEmail.val(),
              emailValCheck = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i;

        const nChkId    = !idValCheck.test(idVal),
              nChkPw    = !pwValCheck.test(pwVal),
              diffChkPw = pwVal !== newPwChkVal,
              nChkEmail = !emailValCheck.test(emailVal);

        const isErr    = nChkId || nChkPw || diffChkPw || nChkEmail,
              focusTag = nChkId              ? newId  :
                         nChkPw || diffChkPw ? newPw :
                         nChkEmail           ? newEmail : null,
              errMsg   = nChkId    ? "아이디는 영문, 숫자 포함 6 ~ 12자여야 합니다."  :
                         nChkPw    ? "비밀번호는 영문, 숫자 포함 8 ~ 12자여야 합니다." :
                         diffChkPw ? "비밀번호가 일치하지 않습니다." :
                         nChkEmail ? "올바른 이메일 형식이 아닙니다" : "";

        if (isErr) {
            focusTag.focus();

            alert(errMsg);
        } else {
            insUserData();
        }
    }

    function pwChk() {
        if(contents.find("#new_pw").val() == contents.find("#new_pw_chk").val()){
            contents.find(".pw_chk_msg").html("* 비밀번호가 일치합니다.");
            contents.find(".pw_chk_msg").css("color","#008a5b");
            contents.find(".pw_chk_msg").css("font-size","12px");
        }else{
            contents.find(".pw_chk_msg").html("* 비밀번호가 일치하지 않습니다.");
            contents.find(".pw_chk_msg").css("color","red");
            contents.find(".pw_chk_msg").css("font-size","12px");
        }
    }

    function showJoinModal() {
        contents.find(".modal_bg").removeClass("none");
        contents.find(".join .modal").removeClass("none");
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

    function insUserData() {
        const url = "/join";

        const param = {
            "id"    : contents.find("#new_id").val(),
            "pw"    : contents.find("#new_pw").val(),
            "email" : contents.find("#new_email").val(),
        }

        $.post(url, param, function() {
            hideModal();

            $("#userId").focus();

            alert("회원가입이 완료되었습니다.");
        })
    }

    function overlapId() {
        const url   = "/overlapId",
              param = { "id" : $("#new_id").val() };

        $.post(url, param, function(data){
            data ? $("#hint_id").text("* 중복된 아이디가 존재합니다.") && $("#hint_id").css("color", "red") && $("#new_id").focus():
                   $("#hint_id").text("* 사용 가능한 아이디 입니다.") && $("#hint_id").css("color", "#008a5b") && $("#new_pw").focus();
        })
    }

    function overlapEmail() {
        const url   = "/overlapEmail",
              param = { "email" : $("#new_email").val() };

        $.post(url, param, function(data){
            data ? $("#hint_email").html("* 중복된 이메일이 존재합니다.") && $("#hint_email").css("color", "red") :
                   $("#hint_email").html("* 사용 가능한 이메일 입니다.") && $("#hint_email").css("color", "#008a5b");
        })
    }

    function testLogin() {
        const url   = "/login/chk",
              param = { "id" : $("#userId").val(), "pw" : $("#password").val()};

        $.post(url, param, function(data) {
            data ? alert("성공") : alert("실패");
        })

        console.log(param);
    }

    function testJoin() {
        const url   = "/join",
              param = { "id" : $("#new_id").val(), "pw" : $("#new_pw").val(), "email" : $("#new_email").val() };

        $.post(url, param, function(data) {
            data ? alert("성공") : "";
        })
    }

    function findId() {
        const url   = "/find/id",
              param = { "email" : $("#find_id_email").val() }

        $.post(url, param, function(data) {
            data ? alert("아이디는 (" + data + ") 입니다.") : alert("이메일을 다시 확인해주세요.");
        })
    }

    function findPw() {
        const url   = "/find/pw",
              param = { "id" : $("#find_pw_id").val(), "email" : $("#find_pw_email").val()}

        $.post(url, param, function(data) {
            data ? $("#key_input").removeClass("none") : alert("아이디 또는 이메일을 다시 확인해주세요.");
        })
    }

    function changePw() {
        const url   = "/find/pw/change",
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
    <form action="" class="login_form">
        <h2 class="login_title">로그인</h2>
        <div class="login_input_box">
            <input type="text" id="userId" placeholder="아이디">
        </div>
        <div class="login_input_box">
            <input type="password" id="password" placeholder="비밀번호">
        </div>

        <div class="save_login_box">
            <input type="checkbox" id="save_login">
            <label for="save_login">로그인 정보 저장</label>
        </div>
        <div class="test_login btn" onclick="testLogin()">로그인</div>
        <input type="submit" class="btn login_btn" value="로그인">
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
            <div class="modal_box">
                <h2 class="modal_title">회원가입</h2>
                <div class="modal_contents">
                    <div class="modal_input_box">
                        <div class="modal_input_sub_box flex">
                            <input type="text" id="new_id" name="id" placeholder="아이디">
                            <div class="db_chk" onclick="overlapId();">중복 확인</div>
                        </div>
                        <p id="hint_id" class="join_condition green"> * 아이디는 영문, 숫자 포함 6 ~ 12자여야 합니다.</p>
                    </div>
                    <div class="modal_input_box ">
                        <div class="modal_input_sub_box">
                            <input type="password" id="new_pw" name="pw" placeholder="비밀번호">
                        </div>
                        <p class="join_condition green"> * 비밀번호는 영문, 숫자 포함 8 ~ 12자여야 합니다.</p>
                    </div>
                    <div class="modal_input_box">
                        <div class="modal_input_sub_box">
                            <input type="password" id="new_pw_chk" onkeyup="pwChk();" placeholder="비밀번호 확인">
                        </div>
                        <div class="pw_chk_msg"></div>
                    </div>
                    <div class="modal_input_box">
                        <div class="modal_input_sub_box flex">
                            <input type="email" id="new_email" name="email" placeholder="이메일">
                            <div class="db_chk" onclick="overlapEmail()">중복 확인</div>
                        </div>
                        <div id="hint_email" class="join_condition"></div>
                    </div>
                </div>
                <input type="button" class="btn join_btn" value="회원가입" onclick="joinSubmit()">
            </div>
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
                            <button class="send_num" onclick="chkKey();">확인<button>
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