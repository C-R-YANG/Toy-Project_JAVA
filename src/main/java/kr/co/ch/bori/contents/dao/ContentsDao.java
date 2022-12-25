package kr.co.ch.bori.contents.dao;

import kr.co.ch.bori.contents.dto.LikeDto;
import kr.co.ch.bori.contents.dto.ParamDto;
import kr.co.ch.bori.contents.dto.PlaceDto;
import kr.co.ch.bori.common.mybatis.CommonDaos;
import kr.co.ch.bori.contents.dto.ReviewDto;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Repository;

import java.util.List;

@Slf4j
@Repository
public class ContentsDao extends CommonDaos {
    public void insertPlaceData(PlaceDto placeDto) {
        boridaengdaengCommonDao.insertData("Contents.insertPlaceData", placeDto);
    }

    public int getPlaceSeq() {
        return boridaengdaengCommonDao.getSeq("Contents.getPlaceSeq");
    }

    public void insertPlaceReviewData(ReviewDto reviewDto) {
        boridaengdaengCommonDao.insertData("Contents.insertPlaceReviewData", reviewDto);
    }

    public LikeDto getPlaceLikeData(LikeDto likeDto) {
        return boridaengdaengCommonDao.getData("Contents.getPlaceLikeData", likeDto);
    }

    public void insertPlaceLikeData(LikeDto likeDto) {
        boridaengdaengCommonDao.insertData("Contents.insertPlaceLikeData", likeDto);
    }

    public void deletePlaceLikeData(LikeDto likeDto) {
        boridaengdaengCommonDao.deleteData("Contents.deletePlaceLikeData", likeDto);
    }

    public List<ReviewDto> getPlaceReviewList(int cd) {
        return boridaengdaengCommonDao.getList("Contents.getPlaceReviewList", cd);
    }

    public List<PlaceDto> getContentsList(ParamDto paramDto) {
        return boridaengdaengCommonDao.getList("Contents.getContentsList", paramDto);
    }

    public void updateViewsContentsByCd(int cd) {
        boridaengdaengCommonDao.updateData("Contents.updateViewsContentsByCd", cd);
    }

    public PlaceDto getContentsDataByCd(ParamDto paramDto) {
        return boridaengdaengCommonDao.getData("Contents.getContentsDataByCd", paramDto);
    }
}
