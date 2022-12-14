<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<style type="text/css">
    .image_layout {
        text-align: center;
        padding-top: 40px;
    }

    .image_layout > img {
        width: 270px;
        height: 270px;
    }

    .content_layout {
        padding: 30px 0 70px;
        justify-content: space-around;
    }

    .content1 {
        width: 750px;
        height: 550px;
        padding: 50px 50px 20px;
        background-color: #fff;
        border: 1px solid #ddd;
        border-radius: 5px;
        box-shadow: 1px 1px 2px #ececec;;
    }

    .content1_line {
        border: 0;
        height: 1px;
        background-color: #ddd
    }

    .content1_top {
        width: 100%;
        height: 45px;
        justify-content: space-between;
    }

    .content1_title {
        float: left;
    }

    .content1_title span:first-child {
        font-size: 26px;
        font-weight: 600;
    }

    .content1_title span:last-child {
        color: #acacac;
    }

    .content1_top_icon > div {
        width: 70px;
        text-align: center;
        cursor: pointer;
    }

    .content1_top_icon > p {
        font-size: 14px;
    }

    .content1_top_icon img {
        width: 20px;
    }

    .content1_icon {
        width: 100%;
        padding-bottom: 15px;
    }

    .content1_icon > img {
        width: 20px;
        vertical-align: middle;
    }

    .content1_icon > span {
        font-size: 14px;
        padding-right: 5px;
        color: #acacac;
    }

    .content1_text {
        padding: 20px 0px;
    }

    .content1_text > .text_box {
        padding-bottom: 20px;
    }

    .content2 {
        width: 300px;
        height: 550px;
    }

    .content2_review_btn {
        width: 200px;
        height: 50px;
        text-align: center;
        margin: 20px auto;
        font-size: 18px;
        padding: 10px;
    }

    .content2_review_btn:hover {
        background-color: #66B875;
    }

    .review_layout {
        width: 100%;
        background-color: #fff;
    }

    .review_title {
        text-align: center;
        font-size: 24px;
        font-weight: 600;
        padding: 50px 0px;
    }

    .content1_top_icon .like:first-child {
        height: 19px;
        line-height: 17px;
    }
</style>

<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=334aaab5b9f31f09bf262d728d52c76a&libraries=services"></script>

<script src="https://t1.kakaocdn.net/kakao_js_sdk/2.1.0/kakao.min.js"
        integrity="sha384-dpu02ieKC6NUeKFoGMOKz6102CLEWi9+5RQjWSV0ikYSFFd8M3Wp2reIcquJOemx" crossorigin="anonymous"></script>
<script>
    Kakao.init('334aaab5b9f31f09bf262d728d52c76a'); // ??????????????? ?????? JavaScript ??? ??????
</script>

<script type="text/javascript">
    let contents,
        placeFlag;

    $(document).ready(function() {
        contents  = $("#contents");
        placeFlag = contents.children("#place_flag");

        // ??????????????? ????????? ??????
        getLikeData().then(
            // ??????????????? ??????
            () => getPlaceReviewList().then(
                () => {
                    // ?????? ?????? ??????
                    setPlaceMap();

                    // ???????????? ??????
                    setShareBtn();
                }
            )
        );
    })

    function setShareBtn() {
        const opt = placeFlag.find("#opt").val(),
              cd  = placeFlag.find("#cd").val(),
              url = 'http://127.0.0.1:8080/contents/detail?opt=' + opt + '&cd=' + cd;

        Kakao.Share.createDefaultButton({
            container: "#kakaotalk-sharing-btn",
            objectType: "feed",
            content: {
                title: "${place.title}",
                description: "${place.categoryNm != '' ? '#' += place.categoryNm += ' ' : ''}#${place.neighborhood} #${opt == 0 ? '??????' : opt == 1 ? '??????' : opt == 2 ? '??????' : '??????'}",
                imageUrl:
                    "http://127.0.0.1:8080/resource/img/????????????2.jpg",
                link: {
                    // [??? ??????????????????] > [?????????] ?????? ????????? ????????? ???????????? ???????????? ???
                    mobileWebUrl: url,
                    webUrl: url,
                },
            },
            social: {
                likeCount: Number(contents.find("#tot_like").text()),
                commentCount: Number(contents.find("#review_cnt").val()),
            },
            buttons: [
                {
                    title: '????????? ??????',
                    link: {
                        mobileWebUrl: url,
                        webUrl: url,
                    },
                },
                {
                    title: '????????? ??????',
                    link: {
                        mobileWebUrl: url,
                        webUrl: url,
                    },
                },
            ],
        });
    }


    function setPlaceMap() {
        const mapContainer = contents.children('#place_map')[0], // ????????? ????????? div
              mapOption = {
                  center: new kakao.maps.LatLng(33.450701, 126.570667), // ????????? ????????????
                  level: 3 // ????????? ?????? ??????
              };

        // ????????? ???????????????
        const map = new kakao.maps.Map(mapContainer, mapOption);

        // ??????-?????? ?????? ????????? ???????????????
        const geocoder = new kakao.maps.services.Geocoder();

        // ????????? ????????? ???????????????
        geocoder.addressSearch("${place.mainAddress}", function(result, status) {

            // ??????????????? ????????? ???????????????
            if (status === kakao.maps.services.Status.OK) {
                const coords = new kakao.maps.LatLng(result[0].y, result[0].x);

                // ??????????????? ?????? ????????? ????????? ???????????????
                const marker = new kakao.maps.Marker({
                    map: map,
                    position: coords
                });

                // ?????????????????? ????????? ?????? ????????? ???????????????
                const infowindow = new kakao.maps.InfoWindow({
                    content: '<div style="width:150px;text-align:center;padding:6px 0;">${place.title}</div>',
                });

                infowindow.open(map, marker);

                // ????????? ????????? ??????????????? ?????? ????????? ??????????????????
                map.setCenter(coords);
            }
        });
    }

    async function getPlaceReviewList() {
        const url = "/contents/detail/review";

        const param = {
            "cd" : placeFlag.children("#cd").val(),
        }

        await $.post(url, param, function(html) {
            contents.find("#review_layout").html(html);
        })
    }

    function showReviewModal() {
        const url = "/contents/detail/review/write";

        $.post(url, {}, function (html) {
            $.smartPop.open({
                title    : "?????? ??????",
                id       : "review_modal",
                width    : 680,
                height   : 450,
                html     : html,
                callback : function() {
                    getPlaceReviewList();
                }
            })
        })
    }

    async function getLikeData() {
        const url = '/contents/detail/like';

        const param = {
            "placeCd" : placeFlag.children("#cd").val(),
        }

        await $.post(url, param, function(data) {
            const isLike  = data["likeYn"],
                  likeTag = contents.find(".like");

            likeTag.eq(0).text(isLike ? "????" : "????");

            isLike ? likeTag.addClass("pink") : likeTag.removeClass("pink");

            contents.find("#tot_like").text(data["cnt"]);
        })
    }

    function mergeLikeData() {
        const url = '/contents/detail/like/merge';

        const param = {
            "placeCd" : placeFlag.children("#cd").val(),
        }

        $.post(url, param, function() {
            // ????????? ??????
            getLikeData();
        })
    }
</script>

<div id="place_flag">
    <input type="hidden" id="opt" value="${place.opt}" />
    <input type="hidden" id="cd" value="${place.cd}" />
</div>

<div class="image_layout">
    <c:forEach items="${fileList}" var="list" varStatus="loop">
        <img src="/resource/img/upload/place/${list.newNm}" alt="">
    </c:forEach>
</div>

<div class="content_layout flex">
    <div class="content1">
        <div class="content1_top flex">
            <div class="content1_title">
                <span>${place.title}</span>
                <span>${place.categoryNm}</span>
            </div>
            <div class="content1_top_icon flex">
                <sec:authorize access="isAuthenticated()">
                    <div onclick="mergeLikeData();" >
                        <div class="like">????</div>
                        <p class="like">
                            ?????????
                        </p>
                    </div>
                </sec:authorize>
                <div>
                    <a id="kakaotalk-sharing-btn" href="javascript:;">
                        <img src="https://developers.kakao.com/assets/img/about/logos/kakaotalksharing/kakaotalk_sharing_btn_medium.png"
                             alt="???????????? ?????? ????????? ??????" />
                    </a>
                    <p>????????????</p>
                </div>
            </div>
        </div>
        <div class="content1_icon">
            <img src="/resource/img/eye.png" alt="">
            <span>${place.views}</span>
            <img src="/resource/img/favorite.png" alt="">
            <span id="tot_like">0</span>
        </div>
        <hr class="content1_line"/>
        <div class="content1_text">
            <div class="text_box">
                <p>??????</p>
                <p>${place.mainAddress} ${place.subAddress}</p>
            </div>
            <div class="text_box">
                <p>????????????</p>
                <p>${place.tel}</p>
            </div>
            <div class="text_box">
                <p>????????????</p>
                <p>${place.startTime} - ${place.endTime}</p>
            </div>
            <div class="text_box">
                <p>??????</p>
                <p>${place.closeDay == "" ? "??????" : place.closeDay}</p>
            </div>
            <div class="text_box">
                <p>??????</p>
                <p>${place.parking ? "??????" : "??????"}</p>
            </div>
        </div>
    </div>

    <div class="content2">
        <div id="review_layout" class="review_layout"></div>
        <sec:authorize access="isAuthenticated()">
            <div class="content2_review_btn btn" onclick="showReviewModal()">????????????</div>
        </sec:authorize>
        <sec:authorize access="!isAuthenticated()">
            <div class="content2_review_btn btn" onclick="moveLoginUrl()">?????????</div>
        </sec:authorize>
    </div>
</div>

<div id="place_map" style="width: 100%; height: 400px"></div>
