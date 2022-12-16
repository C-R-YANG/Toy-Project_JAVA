<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<style type="text/css">
    .modal_title {
        width: 100%;
        text-align: center;
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

    .find_id_bottom {
        width: 100%;
        text-align: center;
        padding-top: 20px;
    }
</style>

<script type="text/javascript">
    let modal;

    $(document).ready(function () {
        modal = $("#find_id_modal");
    })

    function findId() {
        const url   = "/user/find/id",
              param = { "email" : $("#find_id_email").val() }

        $.post(url, param, function(data) {
            data ? alert("아이디는 (" + data + ") 입니다.") : alert("이메일을 다시 확인해주세요.");
            $.smartPop.close("find_id_modal");
        })
    }
</script>

<div class="modal_box">
    <div class="modal_title">
        <h2>아이디 찾기</h2>
    </div>
    <div class="modal_contents">
        <div class="modal_input_box">
            <div class="modal_input_sub_box flex">
                <input type="email" id="find_id_email" placeholder="이메일" />
            </div>
        </div>
    </div>
    <div class="find_id_bottom">
        <input type="button" class="btn find_btn" value="아이디 찾기" onclick="findId();">
    </div>
</div>