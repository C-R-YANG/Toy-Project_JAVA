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
        height: 30px;
        width: 30px;
        position: relative;
        top: 20px;
        left: 209px;
        cursor: pointer;
    }

    .modal {
        width: 500px;
        height: 600px;
        background: #ffffff;
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
        margin: 50px;
    }

    .modal_input_box {
        width: 60%;
        height: 40px;
        background-color: #f0f0f0;
        margin: 40px auto;
        border-radius: 50px;
    }

    .modal_input_box input {
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

    .pwd_chk_msg {
        padding-top: 5px;
        text-align: left;
        color: #008a5b;
        font-size: 12px;
    }
</style>

<script>
    let contents;

    $(document).ready(function() {
        contents = $("#contents");
    })

    // move_login_page


    // join_modal
    function showJoinModal() {
        contents.find(".modal_bg").fadeIn(300);
        contents.find(".join_modal").fadeIn(300);
    }

    function hideJoinModal() {
        contents.find(".modal_bg").fadeOut(300);
        contents.find(".join_modal").fadeOut(300);
    }

    function joinSubmit() {
        // id
        const newId = contents.find("#new_id"),
              idVal = newId.val(),
              idValCheck = /^(?=.*\d)(?=.*[a-zA-Z])[0-9a-zA-Z]{6,12}$/;

        // pwd
        const newPwd       = contents.find("#new_pwd"),
              newPwdChk    = contents.find("#new_pwd_chk"),
              pwdVal       = newPwd.val(),
              newPwdChkVal = newPwdChk.val(),
              pwdValCheck  = /^(?=.*\d)(?=.*[a-zA-Z])[0-9a-zA-Z]{8,12}$/;

        //email
        const newEmail      = contents.find("#new_email"),
              emailVal      = newEmail.val(),
              emailValCheck = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i;

        const nChkId    = !idValCheck.test(idVal),
              nChkPw    = !pwdValCheck.test(pwdVal),
              diffChkPw = pwdVal !== newPwdChkVal,
              nChkEmail = !emailValCheck.test(emailVal);

        const isErr    = nChkId || nChkPw || diffChkPw || nChkEmail,
              focusTag = nChkId              ? newId  :
                         nChkPw || diffChkPw ? newPwd :
                         nChkEmail           ? newEmail : null,
              errMsg   = nChkId    ? "아이디는 영문, 숫자 포함 6 ~ 12자여야 합니다."  :
                         nChkPw    ? "비밀번호는 영문, 숫자 포함 8 ~ 12자여야 합니다." :
                         diffChkPw ? "비밀번호가 일치하지 않습니다." :
                         nChkEmail ? "올바른 이메일 형식이 아닙니다" : "";

        if (isErr) {
            focusTag.focus();

            alert(errMsg);

            event.preventDefault();
        }
    }

    function pwChk() {
        if(contents.find("#new_pwd").val() == contents.find("#new_pwd_chk").val()){
            contents.find(".pwd_chk_msg").html("* 패스워드가 일치합니다.");
            contents.find(".pwd_chk_msg").css("color","#008a5b");
        }else{
            contents.find(".pwd_chk_msg").html("* 패스워드가 일치하지 않습니다.");
            contents.find(".pwd_chk_msg").css("color","red");
        }
    }

    // show_hide_modal
    // 회원가입 클릭하면      ? 회원가입 모달 :
    //                       아이디찾기 클릭하면 ? 아이디찾기 모달 :
    //                       비밀번호 찾기 클릭하면 ? 비밀번호 찾기 모달 : ""


    function showModal() {
        contents.find(".modal_bg").fadeIn(300);
        contents.find(".find_id").find("div:eq(0)");

        // contents.find(".bottom_join") ? contents.find(".join modal").fadeIn(300) :
        //                                 contents.find(".bottom_find_id") ? contents.find(".find_id modal").fadeIn(300) :
        //                                 contents.find(".bottom_find_pwd") ? contents.find(".find_pwd modal").fadeIn(300) : ""
    }

    function hideModal() {
        contents.find(".modal_bg").fadeOut(300);
        contents.find(".find_id_modal").fadeOut(300);
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

        <input type="submit" class="btn login_btn" value="로그인">
    </form>
</div>

<div class="bottom">
    <span class="bottom_join"     onclick="showModal()">회원가입</span>
    <span class="bottom_find_id"  onclick="showModal()">아이디 찾기</span>
    <span class="bottom_find_pwd" onclick="showModal()">비밀번호 찾기</span>
</div>

<div class="join">
    <div class="modal_bg none">
        <div class="modal z_display none">
            <form action="">
                <img src="${url}/resource/img/close.png" class="icon_close" alt="close" onclick="hideModal(this);">
                <h2 class="modal_title">회원가입</h2>
                <div class="modal_input_box">
                    <input type="text" id="new_id" placeholder="아이디">
                    <p class="join_condition"> * 아이디는 영문, 숫자 포함 6 ~ 12자여야 합니다.</p>
                </div>
                <div class="modal_input_box">
                    <input type="password" id="new_pwd" placeholder="비밀번호">
                    <p class="join_condition"> * 비밀번호는 영문, 숫자 포함 8 ~ 12자여야 합니다.</p>

                </div>
                <div class="modal_input_box">
                    <input type="password" id="new_pwd_chk" onkeyup="pwChk();" placeholder="비밀번호 확인">
                    <div class="pwd_chk_msg"></div>
                </div>
                <div class="modal_input_box">
                    <input type="email" id="new_email" placeholder="이메일 주소">
                </div>
                <input type="submit" class="btn join_btn" value="회원가입" onclick="joinSubmit()">
            </form>
        </div>
    </div>
</div>

<div class="find_id">
    <div class="modal_bg none">
        <div class="modal none">
            <form action="">
                <img src="${url}/resource/img/close.png" class="icon_close" alt="close" onclick="hideModal(this);">
                <h2 class="modal_title">아이디 찾기</h2>
                <div class="input_box">
                    <input type="email" id="find_id_modal_email" placeholder="이메일 주소">
                </div>
                <input type="submit" class="btn join_btn" value="회원가입" onclick="joinSubmit();">
            </form>
        </div>
    </div>
</div>

<div class="find_pwd">
    <div class="modal_bg none">
        <div class="find_pwd_modal">

        </div>
    </div>
</div>