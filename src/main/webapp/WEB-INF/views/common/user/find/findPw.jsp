<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<style type="text/css">
    .modal_title {
        width: 100%;
        text-align: center;
    }

    .info_check, .find_pw_bottom {
        width: 100%;
        text-align: center;
        padding-top: 20px;
    }

    .change_btn, .check_btn {
        width: 180px;
        height: 50px;
        background-color: #9bc76c;
        font-size: 16px;
    }

    .change_btn:hover, .check_btn:hover {
        background-color: #66B875;
    }

    .pw_condition {
        padding: 10px;
        font-size: 12px;
        text-align: left;
    }

    .pw_chk_msg {
        padding: 10px;
    }
</style>

<script type="text/javascript">
    let modal;

    $(document).ready(function () {
        modal = $("#find_pw_modal");
    })

    function infoCheck() {
        const url   = "/user/find/pw",
              param = { "id" : $("#find_pw_id").val(), "email" : $("#find_pw_email").val()};

        $.post(url, param, function(data) {
            if(data) {
                $(".new").removeClass("none");
                $(".find_pw_bottom").removeClass("none");
                $(".info_check").addClass("none");
            } else {
                alert("아이디 또는 이메일을 다시 확인해주세요.");
            }
        })
    }

    function doubleChk() {
        const pwChkMsg = modal.find(".pw_chk_msg");

        if(modal.find("#new_pw").val() == modal.find("#new_pw_chk").val()){
            pwChkMsg.html("* 비밀번호가 일치합니다.");
            pwChkMsg.css("color","#008a5b");
            pwChkMsg.css("font-size","12px");
        } else{
            pwChkMsg.html("* 비밀번호가 일치하지 않습니다.");
            pwChkMsg.css("color","red");
            pwChkMsg.css("font-size","12px");
        }
    }

    function pwChk() {
        const pwValCheck  = /^(?=.*\d)(?=.*[a-zA-Z])[0-9a-zA-Z]{8,12}$/,
              pwCondition = modal.find(".pw_condition");

        if(!pwValCheck.test(modal.find("#new_pw").val())) {
            pwCondition.css("color","red");
        } else {
            pwCondition.css("color","#008a5b");
        }
    }

    function changeBtn() {
        const newPw       = modal.find("#new_pw"),
              newPwChk    = modal.find("#new_pw_chk"),
              pwVal       = newPw.val(),
              newPwChkVal = newPwChk.val(),
              pwValCheck  = /^(?=.*\d)(?=.*[a-zA-Z])[0-9a-zA-Z]{8,12}$/,
              nChkPw      = !pwValCheck.test(pwVal),
              diffChkPw   = pwVal !== newPwChkVal;

        const isErr    = nChkPw || diffChkPw,
              errMsg   = nChkPw    ? "비밀번호는 영문, 숫자 포함 8 ~ 12자여야 합니다." :
                         diffChkPw ? "비밀번호가 일치하지 않습니다." : "";

        if (isErr) {
            alert(errMsg);
        } else {
            changePw();
        }
    }

    function changePw() {
        const url   = "/user/find/pw/change",
              param = { "id" : $("#find_pw_id").val(), "pw" : $("#new_pw_chk").val()}

        $.post(url, param, function() {
            alert("비밀번호가 변경되었습니다.");

            $.smartPop.close("find_pw_modal")
        })
    }

    function moveEmail() {
        const keyCode = event.keyCode;

        if(keyCode === 13) {
            $("#find_pw_email").focus();
        }
    }

    function btnClick() {
        const keyCode = event.keyCode;

        if(keyCode === 13) {
            $(".check_btn").click();
        }
    }

</script>

<div class="modal_box">
    <div class="modal_title">
        <h2>비밀번호 찾기</h2>
    </div>
    <div class="modal_contents">
        <div class="modal_input_box ">
            <div class="modal_input_sub_box">
                <input type="text" id="find_pw_id"placeholder="아이디" onkeyup="moveEmail();">
            </div>
        </div>
        <div class="modal_input_box">
            <div class="modal_input_sub_box flex">
                <input type="email" id="find_pw_email"placeholder="이메일 주소" onkeyup="btnClick()"/>
            </div>
        </div>
        <div class="info_check">
            <input type="button" class="btn check_btn" value="확인" onclick="infoCheck();">
        </div>
        <div class="modal_input_box new none">
            <div class="modal_input_sub_box">
                <input type="password" id="new_pw" name="pw" placeholder="새 비밀번호" onkeyup="pwChk();">
            </div>
            <p class="pw_condition green"> * 비밀번호는 영문, 숫자 포함 8 ~ 12자여야 합니다.</p>
        </div>
        <div class="modal_input_box new none">
            <div class="modal_input_sub_box">
                <input type="password" id="new_pw_chk" placeholder="새 비밀번호 확인" onkeyup="doubleChk();">
            </div>
            <div class="pw_chk_msg"></div>
        </div>
    </div>
    <div class="find_pw_bottom none">
        <input type="button" class="btn change_btn" value="비밀번호 변경하기" onclick="changeBtn();">
    </div>
</div>