<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<style type="text/css">
    .pwchange_layout {
        margin: 0px auto;
        width: 800px;
    }

    .pwchange_title {
        width: 600px;
        margin: auto;
        font-size: 17px;
        text-align: center;
    }

    .pwchange_contents {
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

    .button_box1, .button_box2 {
        text-align: center;
    }

    .change_btn, .save_btn {
        width: 110px;
        height: 45px;
        font-size: 18px;
    }

    .cancel_btn{
        width: 110px;
        height: 45px;
        font-size: 18px;
        background-color: #fff;
        color: #000;
        border: 1px solid #ccc;
        margin-left: 10px;
    }

    .pw_condition {
        color: #008a5b;
        font-size: 12px;
        padding: 5px 0px 5px 166px;
    }

    .pw_chk_msg {
        padding: 5px 0px 5px 166px;
    }
</style>

<script type="text/javascript">
    let contents;

    $("document").ready(function () {
        contents = $("#contents");
    });

    function pwChk() {
        // const url   = "/pwCheck",
        //       param = { "pw" : $("#pw").val() }
        //
        // $.post(url, param, function(data) {
        //     data ? pwChange() : alert("비밀번호를 다시 확인해주세요.");
        // })
        pwChange();
    }

    function pwChange() {
        contents.find(".new").addClass("none");
        contents.find(".new").removeClass("none");
        contents.find(".old").addClass("none");
        contents.find(".button_box1").addClass("none");
        contents.find(".button_box2").removeClass("none");

        contents.find(".new").children("input").attr("readonly", false);
        contents.find("#pw").val("");
        contents.find(".pw_condition").html(" * 비밀번호는 영문, 숫자 포함 8 ~ 12자여야 합니다.")
    }

    function pwSave() {
        const newPw       = contents.find("#new_pw"),
              newPwChk    = contents.find("#new_pw_chk"),
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
            setMypagePwChange();
            // pwData();
        }
    }

    function dbChk() {
        if(contents.find("#new_pw").val() == contents.find("#new_pw_chk").val()){
            contents.find(".pw_chk_msg").html("* 비밀번호가 일치합니다.");
            contents.find(".pw_chk_msg").css("color","#008a5b");
            contents.find(".pw_chk_msg").css("font-size","12px");
        } else{
            contents.find(".pw_chk_msg").html("* 비밀번호가 일치하지 않습니다.");
            contents.find(".pw_chk_msg").css("color","red");
            contents.find(".pw_chk_msg").css("font-size","12px");
        }
    }

    function setMypagePwChange() {
        const url = "/mypage/pwChange"

        $.post(url, {}, function(data){
            $(".mypage_contents").html(data);
        })
    }

    function pwCancel() {
        setMypagePwChange();
    }
</script>

<div class="pwchange_layout">
    <div class="pwchange_title">
        <h3>비밀번호 변경</h3>
    </div>

    <div class="pwchange_contents">
        <div class="input_box old">
            <label for="pw">현재 비밀번호</label>
            <input type="password" id="pw">
        </div>
        <div class="input_box new none">
            <label for="new_pw">새 비밀번호</label>
            <input type="password" id="new_pw">
            <div class="pw_condition"></div>
        </div>
        <div class="input_box new none">
            <label for="new_pw_chk">새 비밀번호 확인</label>
            <input type="password" id="new_pw_chk" onkeyup="dbChk();">
            <div class="pw_chk_msg"></div>
        </div>
    </div>

    <div class="button_box1">
        <button class="change_btn btn" onclick="pwChk()">변경하기</button>
    </div>

    <div class="button_box2 none">
        <button class="save_btn btn" onclick="pwSave()">저장하기</button>
        <button class="cancel_btn btn" onclick="pwCancel()">취소하기</button>
    </div>
</div>