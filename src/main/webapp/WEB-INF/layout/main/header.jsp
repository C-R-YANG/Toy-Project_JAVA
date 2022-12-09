<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<style type="text/css">
    #header {
        width: 80%;
        height: 50px;
        display: flex;
        margin: 15px auto;
    }

    .logo {
        width: 120px;
        padding-top: 4px;
    }

    .logo img {
        width: 120px;
        cursor: pointer;
        vertical-align: middle;
    }

    .menu_list {
        width: 700px;
        height: 100%;
        display: flex;
        justify-content: space-evenly;
        align-items: center;
        font-size: 16px;
        cursor: pointer;
    }

    .menu_list > div {
        height: 100%;
        line-height: 50px;
    }

    .menu_list > div::after {
        display: block;
        content: "";
        border-bottom: solid 3px #9bc76c;
        transform: scaleX(0);
        transition: transform 0.2s ease-in-out;
    }

    .menu_list > div:hover::after {
        transform: scaleX(1.1);
    }

    #login, #logout{
        width: 120px;
        height: 75%;
        margin-top: 5px;
        display: flex;
        justify-content: flex-end;
        transition: 0.25s;
    }

    #login:hover, #logout:hover {
        letter-spacing: 1px;
        transform: scale(1.1);
        cursor: pointer;
    }

    #login div, #logout div {
        width: 90px;
        padding: 5px;
        font-size: 14px;
        text-align: center;
        line-height: 26px;
        color: #fff;
        border-radius: 10px;
        background-color: #9bc76c;
    }
</style>

<script type="text/javascript">
    let header;

    $("document").ready(function() {
        header = $("#header");
    })

    function moveMenuUrl(obj) {
        const opt = $(obj).data("opt");

        location.href = "/contents/index?opt=" + opt;
    }
</script>

<div class="logo" onclick="moveHomeUrl()">
    <img id="move_home" src="${url}/resource/img/보리댕댕.png" alt="보리댕댕" />
</div>

<div class="menu_list">
    <div data-opt="0" onclick="moveMenuUrl(this);">FOOD</div>
    <div data-opt="1" onclick="moveMenuUrl(this);">CAFE</div>
    <div data-opt="2" onclick="moveMenuUrl(this);">HOSPITAL</div>
    <div data-opt="3" onclick="moveMenuUrl(this);">BEAUTY</div>
    <div data-opt="4" onclick="moveMenuUrl(this);">MYPAGE</div>
</div>

<div id="login" onclick="location.href=('/login')">
    <div>LOGIN</div>
</div>
<div id="logout" onclick="location.href=('/logout')">
    <div>LOGOUT</div>
</div>