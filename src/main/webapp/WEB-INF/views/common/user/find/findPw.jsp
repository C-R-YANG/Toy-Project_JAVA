<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<style type="text/css">
    .modal_title {
        width: 100%;
        text-align: center;
    }

    .change_btn {
        width: 150px;
        height: 50px;
        background-color: #9bc76c;
        font-size: 16px
    }

    .change_btn:hover {
        background-color: #66B875;
    }

    .find_pw_bottom {
        width: 100%;
        text-align: center;
        padding-top: 20px;
    }
</style>

<script type="text/javascript">
    let timer     = null,
        isRunning = false;

    function sendKey() {
        let display   = $("#timer"),
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
            alert("비밀번호가 변경되었습니다.");
        })
    }

    function chkKey() {
        $("#change_pw_input").removeClass("none");
        $(".change_btn").removeClass("none");
    }
</script>

<div class="modal_box">
    <div class="modal_title">
        <h2>비밀번호 찾기</h2>
    </div>
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
    <div class="find_pw_bottom">
        <input type="button" class="btn change_btn none" value="비밀번호 변경하기" onclick="changePw();">
    </div>
</div>