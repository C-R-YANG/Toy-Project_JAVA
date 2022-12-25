package kr.co.ch.bori.contents.service;

import com.google.gson.Gson;
import kr.co.ch.bori.common.security.session.SecuritySession;
import kr.co.ch.bori.contents.dao.ContentsDao;
import kr.co.ch.bori.contents.dto.*;
import kr.co.ch.bori.file.service.FileService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.print.DocFlavor;
import java.util.ArrayList;
import java.util.List;

@Slf4j
@Service
@RequiredArgsConstructor
public class ContentsService {
    private final ContentsDao contentsDao;

    private final FileService fileService;

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

    public int getMaxPage(ParamDto paramDto) {
        return contentsDao.getMaxPage(paramDto);
    }

    public ContentsDto getBaseDto(ParamDto paramDto) {
        int opt = paramDto.getOpt();

        Integer district = paramDto.getDistrict();

        boolean isFood     = opt == 0,
                isCafe     = opt == 1,
                isHospital = opt == 2;

        String districtNm;

        if (district != null) {
            districtNm = district == 0 ? "동구" :
                         district == 1 ? "서구" :
                         district == 2 ? "남구" :
                         district == 3 ? "북구" : "광산구";
        } else {
            districtNm = "전체";
        }

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
        contentsDto.setDistrictNm(districtNm);
        contentsDto.setTitle(paramDto.getTitle());
        contentsDto.setDistrict(paramDto.getDistrict());

        return contentsDto;
    }

    @Transactional
    public void insertPlaceData(PlaceDto placeDto) {
        int placeCd = contentsDao.getPlaceSeq();

        placeDto.setCd(placeCd);

        // 장소 정보 저장
        contentsDao.insertPlaceData(placeDto);

        // 파일 관련 처리
        fileService.insertPlaceFile(placeDto);
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
        if (reviewDto.getImgFile() != null) {
            // 파일 관련 처리
            int fileCd = fileService.insertReviewFile(reviewDto);

            reviewDto.setFileCd(fileCd);
        }

        // 리뷰 데이터 저장
        reviewDto.setUserCd(SecuritySession.getCurrentMember().getCd());

        contentsDao.insertPlaceReviewData(reviewDto);
    }
}
