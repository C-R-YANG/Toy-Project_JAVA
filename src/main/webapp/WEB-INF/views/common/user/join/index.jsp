<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<style type="text/css">
    .join_btn {
        width: 150px;
        height: 50px;
        background-color: #9bc76c;
        font-size: 16px
    }

    .join_condition {
        padding: 10px;
        font-size: 12px;
        text-align: left;
    }

    .modal_title {
        width: 100%;
        text-align: center;
    }

    .pw_chk_msg {
        padding: 10px;
        color: #008a5b;
        font-size: 12px;
        text-align: left;
    }

    .join_btn:hover {
        background-color: #66B875;
    }

    .db_chk {
        width: 100px;
        height: 30px;
        line-height: 27px;
        border: 1px solid #9bc76c;
        background-color: #fff;
        border-radius: 10px;
        outline: none;
        text-decoration: none;
        font-size: 14px;
        cursor: pointer;
        text-align: center;
    }

    .join_bottom {
        width: 100%;
        text-align: center;
        padding-top: 20px;
    }
</style>

<script type="text/javascript">
    let modal;
    $(document).ready(function () {
        modal = $("#join_modal");
    })

    function joinSubmit() {
        // id
        const newId = modal.find("#new_id"),
              idVal = newId.val(),
              idValCheck = /^(?=.*\d)(?=.*[a-zA-Z])[0-9a-zA-Z]{6,12}$/;

        // pw
        const newPw       = modal.find("#new_pw"),
              newPwChk    = modal.find("#new_pw_chk"),
              pwVal       = newPw.val(),
              newPwChkVal = newPwChk.val(),
              pwValCheck  = /^(?=.*\d)(?=.*[a-zA-Z])[0-9a-zA-Z]{8,12}$/;

        //email
        const newEmail      = modal.find("#new_email"),
              emailVal      = newEmail.val(),
              emailValCheck = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i;

        const nChkId    = !idValCheck.test(idVal),
              nChkPw    = !pwValCheck.test(pwVal),
              diffChkPw = pwVal !== newPwChkVal,
              nChkEmail = !emailValCheck.test(emailVal);

        const isErr    = nChkId || nChkPw || diffChkPw || nChkEmail,
              focusTag = nChkId              ? newId :
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

    function overlapId() {
        const url   = "/user/overlapId",
              param = { "id" : $("#new_id").val() };

        $.post(url, param, function(data){
            data ? $("#hint_id").text("* 중복된 아이디가 존재합니다.") && $("#hint_id").css("color", "red") && $("#new_id").focus():
                   $("#hint_id").text("* 사용 가능한 아이디 입니다.") && $("#hint_id").css("color", "#008a5b") && $("#new_pw").focus();
        })
    }

    function overlapEmail() {
        const url   = "/user/overlapEmail",
              param = { "email" : $("#new_email").val() };

        $.post(url, param, function(data){
            data ? $("#hint_email").html("* 중복된 이메일이 존재합니다.") && $("#hint_email").css("color", "red") && $("#new_email").focus():
                   $("#hint_email").html("* 사용 가능한 이메일 입니다.") && $("#hint_email").css("color", "#008a5b");
        })
    }


    function pwChk() {
        if(modal.find("#new_pw").val() == modal.find("#new_pw_chk").val()){
            modal.find(".pw_chk_msg").html("* 비밀번호가 일치합니다.");
            modal.find(".pw_chk_msg").css("color","#008a5b");
            modal.find(".pw_chk_msg").css("font-size","12px");
        }else{
            modal.find(".pw_chk_msg").html("* 비밀번호가 일치하지 않습니다.");
            modal.find(".pw_chk_msg").css("color","red");
            modal.find(".pw_chk_msg").css("font-size","12px");
        }
    }

    function insUserData() {
        const url = "/user/join";

        const param = {
            "id"    : modal.find("#new_id").val(),
            "pw"    : modal.find("#new_pw").val(),
            "email" : modal.find("#new_email").val(),
        };

        $.post(url, param, function() {
            hideModal();

            $("#userId").focus();

            alert("회원가입이 완료되었습니다.");
        })
    }
</script>

<div class="modal_box">
    <div class="modal_title">
        <h2>회원가입</h2>
    </div>
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
    <div class="join_bottom">
        <input type="button" class="btn join_btn" value="회원가입" onclick="joinSubmit()">
    </div>
</div>
