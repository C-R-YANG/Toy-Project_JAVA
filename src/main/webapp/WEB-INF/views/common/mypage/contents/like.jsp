<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<style type="text/css">
    .array_box {
        width: 350px;
        padding-bottom: 30px;
        justify-content: space-between;
    }

    .array_box > div {
        cursor: pointer;
    }

    .array_click {
        font-weight: 600;
    }

    .empty {
        width: 100%;
        height: 500px;
        text-align: center;
        line-height: 500px;
        color: #acacac;
    }

    .table_box {
        width: 100%;
        height: 500px;
        overflow-y: auto;
    }

    table {
        border-collapse: collapse
    }

    col:nth-child(1) {
        width: 15%;
    }

    col:nth-child(2) {
        width: 20%;
    }

    col:nth-child(3) {
        width: 45%;
    }

    col:nth-child(4) {
        width: 20%;
    }

    .main_grid img {
        width: 100%;
    }

    tr {
        border-bottom: 1px solid #acacac;
    }

    td {
        padding: 10px;
    }
</style>


<script type="text/javascript">
    function arrayClick(obj) {
        const paramObj  = $(obj),
            arrayList = paramObj.parent().parent().find("div");

        arrayList.removeClass("array_click");
        paramObj.addClass("array_click");
    }
</script>

<div class="array_box flex">
    <div class="array array_click" onclick="arrayClick(this)">전체</div>
    <div class="array" onclick="arrayClick(this)">FOOD</div>
    <div class="array" onclick="arrayClick(this)">CAFE</div>
    <div class="array" onclick="arrayClick(this)">HOSPITAL</div>
    <div class="array" onclick="arrayClick(this)">BEAUTY</div>
</div>

<div class="empty">즐겨찾기가 없습니다.</div>

<div class="table_box none">
    <table>
        <colgroup>
            <col>
            <col>
            <col>
            <col>
        </colgroup>
        <tbody id="file_grid_body">
            <tr class="main_grid">
                <td>
                    <img src="/resource/img/시바카레.jpg" alt="">
                </td>
                <td>시바카레</td>
                <td>광주 동구 장동로 11 2층 시바카레</td>
                <td>매주 수요일 휴무</td>
            </tr>
            <tr class="main_grid">
                <td>
                    <img src="/resource/img/시바카레.jpg" alt="">
                </td>
                <td>시바카레</td>
                <td>광주 동구 장동로 11 2층 시바카레</td>
                <td>매주 수요일 휴무</td>
            </tr>
            <tr class="main_grid">
                <td>
                    <img src="/resource/img/시바카레.jpg" alt="">
                </td>
                <td>시바카레</td>
                <td>광주 동구 장동로 11 2층 시바카레</td>
                <td>매주 수요일 휴무</td>
            </tr>
            <tr class="main_grid">
                <td>
                    <img src="/resource/img/시바카레.jpg" alt="">
                </td>
                <td>시바카레</td>
                <td>광주 동구 장동로 11 2층 시바카레</td>
                <td>매주 수요일 휴무</td>
            </tr>
            <tr class="main_grid">
                <td>
                    <img src="/resource/img/시바카레.jpg" alt="">
                </td>
                <td>시바카레</td>
                <td>광주 동구 장동로 11 2층 시바카레</td>
                <td>매주 수요일 휴무</td>
            </tr>
            <tr class="main_grid">
                <td>
                    <img src="/resource/img/시바카레.jpg" alt="">
                </td>
                <td>시바카레</td>
                <td>광주 동구 장동로 11 2층 시바카레</td>
                <td>매주 수요일 휴무</td>
            </tr>
        </tbody>
    </table>
</div>

