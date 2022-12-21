package kr.co.ch.bori.contents.service;

import com.google.gson.Gson;
import kr.co.ch.bori.common.security.session.SecuritySession;
import kr.co.ch.bori.contents.dao.ContentsDao;
import kr.co.ch.bori.contents.dto.*;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.apache.el.util.Validation;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.List;

@Slf4j
@Service
@RequiredArgsConstructor
public class ContentsService {
    private final ContentsDao contentsDao;

    public List<PlaceDto> getContentsList(ParamDto paramDto) {
        return contentsDao.getContentsList(paramDto);
    }

    @Transactional
    public PlaceDto getContentsDataByCd(ParamDto paramDto) {
        PlaceDto placeDto = contentsDao.getContentsDataByCd(paramDto);

        if (placeDto != null) {
            // 조회수 상승
            contentsDao.updateViewsContentsByCd(paramDto.getCd());
        }

        return placeDto;
    }

    public ContentsDto getBaseDto(int opt) {
        boolean isFood     = opt == 0,
                isCafe     = opt == 1,
                isHospital = opt == 2,
                isBeauty   = opt == 3;

        String engNm = isFood ? "FOOD" : isCafe ? "CAFE" : isHospital ? "HOSPITAL" : "BEAUTY",
               korNm = isFood ? "식당"  : isCafe ? "카페"  : isHospital ? "병원"     : "미용";

        List<String> sortList = new ArrayList<>();

        if (isFood) {
            sortList.add("전체");
            sortList.add("한식");
            sortList.add("일식");
            sortList.add("중식");
            sortList.add("양식");
            sortList.add("분식");
        } else if (isHospital) {
            sortList.add("전체");
            sortList.add("평일진료");
            sortList.add("야간진료");
            sortList.add("공휴일진료");
        }

        ContentsDto contentsDto = new ContentsDto();

        contentsDto.setOpt(opt);
        contentsDto.setEngNm(engNm);
        contentsDto.setKorNm(korNm);
        contentsDto.setSortList(sortList);

        return contentsDto;
    }

    @Transactional
    public void insertRegisterData(PlaceDto placeDto) {
        placeDto.get

        // 장소 정보 저장
        contentsDao.insertRegisterData(placeDto);
    }

    public LikeDto getPlaceLikeData(int placeCd) {
        LikeDto likeDto = new LikeDto();

        likeDto.setPlaceCd(placeCd);

        if (SecuritySession.getCurrentMember() != null) {
            likeDto.setUserCd(SecuritySession.getCurrentMember().getCd());
        }

        return contentsDao.getPlaceLikeData(likeDto);
    }

    @Transactional
    public void mergePlaceData(int placeCd) {
        LikeDto likeDto = new LikeDto();

        likeDto.setPlaceCd(placeCd);

        if (SecuritySession.getCurrentMember() != null) {
            likeDto.setUserCd(SecuritySession.getCurrentMember().getCd());
        }

        if (getPlaceLikeData(placeCd).isLikeYn()) {
            contentsDao.deletePlaceLikeData(likeDto);
        } else {
            contentsDao.insertPlaceLikeData(likeDto);
        };


    }

    public List<ReviewDto> getPlaceReviewList(int cd) {
        return contentsDao.getPlaceReviewList(cd);
    }

    @Transactional
    public void insertPlaceReviewData(ReviewDto reviewDto) {
        reviewDto.setUserCd(SecuritySession.getCurrentMember().getCd());

        contentsDao.insertPlaceReviewData(reviewDto);
    }
}
