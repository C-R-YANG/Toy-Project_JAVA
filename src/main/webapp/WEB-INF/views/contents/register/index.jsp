<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<style type="text/css">
    .register_layout {
        width: 730px;
        height: 100%;
        margin: 50px auto 0px;
        padding: 40px 50px;
        background-color: #fff;
        border: 1px solid #ddd;
        border-radius: 30px;
        box-shadow: 2px 2px 2px #ececec;
    }

    .register_title {
        padding-bottom: 50px;
        text-align: center;
    }

    .register_contents {
        padding-bottom: 20px;
    }

    .input_box, .radio_box, .img_box {
        width: 100%;
        height: 35px;
        margin-bottom: 20px;
        position: relative;
    }

    .input_box > input {
        border-radius: 10px;
        height: 35px;
    }

    .input_box > label, .address label, .img_box > label {
        display: inline-block;
        width: 120px;
    }

    .radio_box > span {
        display: inline-block;
        width: 120px;
        height: 35px;
        line-height: 35px;
    }

    .radio_box > label {
        display: inline-block;
        width: 60px;
    }

    .radio_box > input {
        accent-color: #9bc76c;
    }

    .img_box > input {
        height: 35px;
        line-height: 35px;
    }

    .register_contents > div:nth-child(3) > input {
        width: 490px;
    }

    .register_contents > div:first-child > input {
        width: 490px;
    }

    #post_code {
        width: 110px;
        height: 35px;
        border-radius: 10px;
    }

    .addressSearch {
        width: 18px;
        border: none;
        border-radius: 8px;
        position: relative;
        top: -26px;
        left: 210px;
        z-index: 999;
        cursor: pointer;
    }

    #main_address {
        width: 374px;
        height: 35px;
        border-radius: 10px;
    }

    input[type=time] {
        width: 130px;
        padding: 5px;
        border: 1px solid #acacac;
        border-radius: 10px;
        outline: none;
    }

    #tel, #closed {
        width: 130px;
    }

    .btn_box {
        width: 100%;
        text-align: center;
        padding: 40px;
    }

    .btn_box > .write_btn {
        width: 100px;
        height: 45px;
        font-size: 18px;
    }

    .btn_box > .close_btn {
        width: 100px;
        height: 45px;
        font-size: 18px;
        background-color: #fff;
        color: #000;
        box-shadow: none;
        border: 1px solid #ccc;
    }

    #img_list {
        font-size: 14px;
        padding: 10px 0px 0px 145px;
    }

    .sub_label {
        position: absolute;
        top: 12px;
        left: 65px;
        font-size: 10px;
    }

    .input_box > select {
        padding: 5px;
        border: 1px solid #acacac;
        border-radius: 10px;
        outline: none;
        width: 100px;
        margin-left: 5px;
    }
</style>

<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

<script type="text/javascript">
    let contents,
        registerFlag;

    $(document).ready(function() {
        contents = $("#contents");
        registerFlag = contents.children("#register_flag");
    })

    function findAddr() {
        new daum.Postcode({
            oncomplete: function(data) {
                let addr = '';

                if (data.userSelectedType === 'R') {
                    addr = data.roadAddress;
                } else {
                    addr = data.jibunAddress;
                }

                $("#main_address").val(addr);
                $("#post_code").val(data.zonecode);

                $("#sub_address").focus();
            }
        }).open();
    }

    function chkNum(obj) {
        const paramObj = $(obj),
              value    = paramObj.val();

        value.substr(0, 3) === "050" ? paramObj.attr("alt", "tel2") :
        value.substr(0, 3) === "010" ? paramObj.attr("alt", "phone-kr") :
        value.substr(0, 2) === "02"  ? paramObj.attr("alt", "tel3") :
                                       paramObj.attr("alt", "tel");

        paramObj.setMask();
    }

    function cancel(obj) {
        const opt = $("#register_flag").children("#opt").val();

        location.href = "/contents/index?opt=" + opt;
    }

    function register() {
        const url = "/contents/register";

        const param = setParam();

        postFormData(url, param, function() {
            alert("????????? ?????????????????????.");

            location.href = "/contents/index?opt=" + param["opt"];
        })
    }

    function setParam() {
        const param = {
            "opt"          : registerFlag.children("#opt").val(),
            "title"        : contents.find("#title").val(),
            "postCode"     : contents.find("#post_code").val(),
            "mainAddress"  : contents.find("#main_address").val(),
            "subAddress"   : contents.find("#sub_address").val(),
            "district"     : contents.find("#district").val(),
            "neighborhood" : contents.find("#neighborhood").val(),
            "tel"          : contents.find("#tel").val(),
            "startTime"    : contents.find("#start_time").val(),
            "endTime"      : contents.find("#end_time").val(),
            "closeDay"     : contents.find("#close_day").val(),
            "parking"      : contents.find("#parking_y").is(":checked"),
        }

        if (contents.find("#category").length > 0) {
            param["category"] = contents.find("#category").val();
        }

        const imgList = $("#img_file_list")[0].files;


        if (imgList.length > 0) {
            param["imgFileList"] = imgList;
        }

        return param;
    }

    function imgList(obj) {
        const paramObj = $(obj);

        $("#img_list").html("");

        let imgList    = paramObj[0].files,
            imgListTag = "";


        if (imgList.length > 4) {
            alert("???????????? ?????? 4????????? ????????? ???????????????.");
            paramObj.val("");

            return false;
        }

        for(let i = 0; i < imgList.length; i++) {
            const fileNm = imgList[i].name,
                  ext    = fileNm.substring(fileNm.lastIndexOf(".") + 1, fileNm.length).toLowerCase();

            if (ext !== 'png' && ext !== "jpg" && ext !== "jpeg") {
                alert("pgn, jpg, jpeg ????????? ????????? ???????????????.")
                paramObj.val("");

                return false;
            }

            imgListTag += "<li>"+imgList[i].name+"</li>";
        }

        if(imgList.length > 1){
            $("#img_list").html(imgListTag);
        }
    }


</script>

<div id="register_flag">
    <input type="hidden" id="opt" value="${opt}">
</div>

<div class="register_layout">
    <div class="register_title">
        <h2>?????? ????????????</h2>
    </div>
    <div class="register_contents">
        <div class="input_box flex">
            <label for="title" style="line-height: 35px">?????????</label>
            <c:if test="${opt == 0 || opt == 2}">
                <span class="sub_label" style="left: 50px">(????????????)</span>
            </c:if>
            <input type="text" id="title" style="width: 385px; margin-left: 5px">
            <c:if test="${opt == 0 || opt == 2}">
                <select id="category" style="margin-left: 5px">
                    <c:if test="${opt == 0}">
                        <option value="0">??????</option>
                        <option value="1">??????</option>
                        <option value="2">??????</option>
                        <option value="3">??????</option>
                        <option value="4">??????</option>
                    </c:if>
                    <c:if test="${opt == 2}">
                        <option value="0">????????????</option>
                        <option value="1">????????????</option>
                        <option value="2">???????????????</option>
                    </c:if>
                </select>
            </c:if>
        </div>
        <div class="input_box address flex">
            <div style="width: 236px;">
                <label for="post_code">??????</label>
                <input type="text" id="post_code" disabled onclick="findAddr()">
                <img src="/resource/img/search.png" alt="search" class="addressSearch" onclick="findAddr()"/>
            </div>
            <div>
                <label for="main_address" style="width: 0px"></label>
                <input type="text" id="main_address" placeholder="????????? ??????????????????." readonly>
            </div>
        </div>

        <div class="input_box flex">
            <label for="sub_address" style="line-height: 35px">????????????</label>
            <span class="sub_label">(???/???/??????)</span>
            <select id="district">
                <option value="0">??????</option>
                <option value="1">??????</option>
                <option value="2">??????</option>
                <option value="3">??????</option>
                <option value="4">?????????</option>
            </select>
            <input type="text" id="neighborhood" style="margin-left: 5px; width: 100px;"/>
            <input type="text" id="sub_address" style="width: 280px; margin-left: 5px">

        </div>
        <div class="input_box">
            <label for="tel">????????????</label>
            <input type="text" id="tel" onkeyup="chkNum(this);" >
        </div>
        <div class="input_box">
            <label for="start_time">????????????</label>
            <input type="time" id="start_time">
            <label for="end_time" style="width: 10px;">~</label>
            <input type="time" id="end_time">
        </div>
        <div class="input_box">
            <label for="close_day">?????????</label>
            <input type="text" id="close_day">
        </div>
        <div class="radio_box">
            <span>??????</span>
            <input type="radio" id="parking_y" name="parking" checked>
            <label for="parking_y">??????</label>
            <input type="radio" id="parking_n" name="parking">
            <label for="parking_n">?????????</label>
        </div>
        <div class="img_box">
            <label for="img_file_list">?????? ??????</label>
            <input type="file" id="img_file_list" multiple onchange="imgList(this)">
            <ul id="img_list"></ul>
        </div>
    </div>
</div>

<div class="btn_box">
    <button class="write_btn btn" onclick="register(this)">??????</button>
    <button class="close_btn btn" onclick="cancel(this)">??????</button>
</div>
