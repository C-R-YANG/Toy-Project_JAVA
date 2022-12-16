package kr.co.ch.bori.contents.service;

import kr.co.ch.bori.contents.dao.ContentsDao;
import kr.co.ch.bori.contents.dto.ContentsDto;
import kr.co.ch.bori.contents.dto.PlaceDto;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

@Slf4j
@Service
@RequiredArgsConstructor
public class ContentsService {
    private final ContentsDao contentsDao;

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

    public void insertRegisterData(PlaceDto placeDto) {
        contentsDao.insertRegisterData(placeDto);
    }
}
