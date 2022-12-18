<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<style type="text/css">
    .review_modal {
        padding: 30px 50px;
    }

    .review_modal_top {
        width: 100%;
    }

    .review_modal_top > img {
        width: 24px;
        vertical-align: middle;
    }

    .review_modal_top > span {
        font-size: 20px;
        vertical-align: middle;
    }

    .review_modal_title {
        width: 100%;
        margin: 25px auto;
        text-align: center;
        font-size: 20px;
    }

    .review_modal_text > textarea {
        width: 100%;
        height: 150px;
        padding: 15px;
        outline: none;
        border: 1px solid #dcdcdc;
        border-radius: 10px;
        resize: none;
    }

    .review_modal_img {
        width: 100%;
        padding: 10px 0 20px;
    }

    .review_modal_img > span {
        font-size: 12px;
        color: #acacac;
    }

    .review_modal_btn {
        text-align: center;
    }


    .review_modal_btn > .write_btn {
        width: 90px;
        height: 40px;
        font-size: 16px;
    }

    .review_modal_star {
        text-decoration: none;
        color: #acacac;
        cursor: pointer;
    }

    .review_modal_star.on {
        color: #9bc76c;
    }
</style>

<script type="text/javascript">
    let modal;

    $(document).ready(function () {
        modal = $("#review_modal");
    })

    function writeBtn() {
        if (!modal.find("textarea").val()) {
            alert("내용을 입력해주세요.");

            return false;
        }

        const url = "/contents/detail/review/insert";

        $.post(url, setParam(), function() {
            alert("리뷰가 등록되었습니다.");

            $.smartPop.close("review_modal");
        })
    }

    function setParam() {
        let param = {
            "placeCd"  : contents.find("#cd").val(),
            "contents" : modal.find("#review_contents").val(),
        }

        let score = 0;
        modal.find(".review_modal_star").each(function() {
            $(this).hasClass("on") ? score++ : score;
        })

        param["score"] = score;

        return param;
    }

    function starBtn(obj) {
        $(obj).parent().children("span").removeClass("on");
        $(obj).addClass("on").prevAll("span").addClass("on");
    }
</script>

<div class="review_modal">
    <div class="review_modal_top">
        <img src="/resource/img/edit.png" alt="">
        <span>리뷰쓰기</span>
    </div>
    <div class="review_modal_title">
        <h3>시바카레</h3>
        <div class="review_modal_star_box">
            <span class="review_modal_star on" onclick="starBtn(this)">★</span>
            <span class="review_modal_star" onclick="starBtn(this)">★</span>
            <span class="review_modal_star" onclick="starBtn(this)">★</span>
            <span class="review_modal_star" onclick="starBtn(this)">★</span>
            <span class="review_modal_star" onclick="starBtn(this)">★</span>
        </div>
    </div>
    <div class="review_modal_text">
        <textarea id="review_contents" placeholder="내용을 입력해주세요."></textarea>
    </div>
    <div class="review_modal_img">
        <input type="file" accept="image/*" multiple>
    </div>
    <div class="review_modal_btn">
        <input type="button" class="write_btn btn" value="등록" onclick="writeBtn()">
    </div>
</div>