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
    Kakao.init('334aaab5b9f31f09bf262d728d52c76a'); // 사용하려는 앱의 JavaScript 키 입력
</script>

<script type="text/javascript">
    let contents,
        placeFlag;

    $(document).ready(function() {
        contents  = $("#contents");
        placeFlag = contents.children("#place_flag");

        // 좋아요관련 데이터 조회
        getLikeData().then(
            // 리뷰리스트 조회
            () => getPlaceReviewList().then(
                () => {
                    // 지도 위치 세팅
                    setPlaceMap();

                    // 공유하기 세팅
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
                description: "${place.categoryNm != '' ? '#' += place.categoryNm += ' ' : ''}#${place.neighborhood} #${opt == 0 ? '식당' : opt == 1 ? '카페' : opt == 2 ? '병원' : '미용'}",
                imageUrl:
                    "http://127.0.0.1:8080/resource/img/시바카레2.jpg",
                link: {
                    // [내 애플리케이션] > [플랫폼] 에서 등록한 사이트 도메인과 일치해야 함
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
                    title: '웹으로 보기',
                    link: {
                        mobileWebUrl: url,
                        webUrl: url,
                    },
                },
                {
                    title: '앱으로 보기',
                    link: {
                        mobileWebUrl: url,
                        webUrl: url,
                    },
                },
            ],
        });
    }


    function setPlaceMap() {
        const mapContainer = contents.children('#place_map')[0], // 지도를 표시할 div
              mapOption = {
                  center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
                  level: 3 // 지도의 확대 레벨
              };

        // 지도를 생성합니다
        const map = new kakao.maps.Map(mapContainer, mapOption);

        // 주소-좌표 변환 객체를 생성합니다
        const geocoder = new kakao.maps.services.Geocoder();

        // 주소로 좌표를 검색합니다
        geocoder.addressSearch("${place.mainAddress}", function(result, status) {

            // 정상적으로 검색이 완료됐으면
            if (status === kakao.maps.services.Status.OK) {
                const coords = new kakao.maps.LatLng(result[0].y, result[0].x);

                // 결과값으로 받은 위치를 마커로 표시합니다
                const marker = new kakao.maps.Marker({
                    map: map,
                    position: coords
                });

                // 인포윈도우로 장소에 대한 설명을 표시합니다
                const infowindow = new kakao.maps.InfoWindow({
                    content: '<div style="width:150px;text-align:center;padding:6px 0;">${place.title}</div>',
                });

                infowindow.open(map, marker);

                // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
                map.setCenter(coords);
            }
        });
    }

    // 리뷰 리스트 조회
    async function getPlaceReviewList() {
        const url = "/contents/detail/review";

        const param = {
            "cd" : placeFlag.children("#cd").val(),
        }

        await $.post(url, param, function(html) {
            contents.find("#review_layout").html(html);
        })
    }

    // 리뷰 쓰기 모달창
    function showReviewModal() {
        const url = "/contents/detail/review/write";

        $.post(url, {}, function (html) {
            $.smartPop.open({
                title    : "리뷰 쓰기",
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

    // 좋아요
    function mergeLikeData() {
        const url = '/contents/detail/like/merge';

        const param = {
            "placeCd" : placeFlag.children("#cd").val(),
        }

        $.post(url, param, function() {
            // 좋아요 조회
            getLikeData();
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

            likeTag.eq(0).text(isLike ? "💗" : "🖤");

            isLike ? likeTag.addClass("pink") : likeTag.removeClass("pink");

            contents.find("#tot_like").text(data["cnt"]);
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
                        <div class="like">🖤</div>
                        <p class="like">
                            좋아요
                        </p>
                    </div>
                </sec:authorize>
                <div>
                    <a id="kakaotalk-sharing-btn" href="javascript:;">
                        <img src="https://developers.kakao.com/assets/img/about/logos/kakaotalksharing/kakaotalk_sharing_btn_medium.png"
                             alt="카카오톡 공유 보내기 버튼" />
                    </a>
                    <p>공유하기</p>
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
                <p>주소</p>
                <p>${place.mainAddress} ${place.subAddress}</p>
            </div>
            <div class="text_box">
                <p>전화번호</p>
                <p>${place.tel}</p>
            </div>
            <div class="text_box">
                <p>영업시간</p>
                <p>${place.startTime} - ${place.endTime}</p>
            </div>
            <div class="text_box">
                <p>휴뮤</p>
                <p>${place.closeDay == "" ? "없음" : place.closeDay}</p>
            </div>
            <div class="text_box">
                <p>주차</p>
                <p>${place.parking ? "가능" : "불가"}</p>
            </div>
        </div>
    </div>

    <div class="content2">
        <div id="review_layout" class="review_layout"></div>
        <sec:authorize access="isAuthenticated()">
            <div class="content2_review_btn btn" onclick="showReviewModal()">리뷰쓰기</div>
        </sec:authorize>
        <sec:authorize access="!isAuthenticated()">
            <div class="content2_review_btn btn" onclick="moveLoginUrl()">로그인</div>
        </sec:authorize>
    </div>
</div>

<div id="place_map" style="width: 100%; height: 400px"></div>
