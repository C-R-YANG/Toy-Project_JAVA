package kr.co.ch.bori.contents.dto;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.util.List;

@Getter
@Setter
@NoArgsConstructor
public class ParamDto {
    int page = 1,           // 현재 선택한 페이지
        recordSize = 9,     // 한페이지당 출력할 개수
        pageSize = 5;       // 페이네이션 출력 개수

    Integer parking,
            district;

    int opt,
        cd,
        order;

    String title;

    List<Integer> districtList;
    List<Integer> categoryList;

    public int getOffset() {
        return (page - 1) * recordSize;
    } // 시작 인덱스
}
