package kr.co.ch.bori.file.dao;

import kr.co.ch.bori.common.mybatis.CommonDaos;
import kr.co.ch.bori.file.dto.FileDto;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class FileDao extends CommonDaos {
    public int getSeq() {
        return boridaengdaengCommonDao.getSeq("File.getSeq");
    }

    public void insertData(FileDto fileDto) {
        boridaengdaengCommonDao.insertData("File.insertData", fileDto);
    };

    public List<FileDto> getPlaceFileList(int placeCd) {
        return boridaengdaengCommonDao.getList("File.getPlaceFileList", placeCd);
    }
}
