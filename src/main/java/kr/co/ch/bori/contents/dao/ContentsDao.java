package kr.co.ch.bori.contents.dao;

import kr.co.ch.bori.contents.dto.PlaceDto;
import kr.co.ch.bori.common.mybatis.CommonDaos;
import org.springframework.stereotype.Repository;

@Repository
public class ContentsDao extends CommonDaos {
    public void insertRegisterData(PlaceDto placeDto) {
        boridaengdaengCommonDao.insertData("Contents.insertRegisterData", placeDto);
    }
}
