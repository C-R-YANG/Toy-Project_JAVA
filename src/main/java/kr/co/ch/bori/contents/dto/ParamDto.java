package kr.co.ch.bori.contents.dto;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.util.List;

@Getter
@Setter
@NoArgsConstructor
public class ParamDto {
    int recordSize = 9,
        pageSize = 5;

    Integer parking,
            district;

    int opt,
        cd,
        page = 1,
        searchOpt;

    String title;

    List<Integer> districtList;
    List<Integer> categoryList;

    public int getOffset() {
        return (page - 1) * recordSize;
    }
}
