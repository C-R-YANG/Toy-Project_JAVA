package kr.co.ch.bori.contents.dao;

import kr.co.ch.bori.contents.dto.ParamDto;
import kr.co.ch.bori.contents.dto.PlaceDto;
import kr.co.ch.bori.common.mybatis.CommonDaos;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class ContentsDao extends CommonDaos {
    public void insertRegisterData(PlaceDto placeDto) {
        boridaengdaengCommonDao.insertData("Contents.insertRegisterData", placeDto);
    }

    public List<PlaceDto> getContentsList(ParamDto paramDto) {
        return boridaengdaengCommonDao.getList("Contents.getContentsList", paramDto);
    }
}
