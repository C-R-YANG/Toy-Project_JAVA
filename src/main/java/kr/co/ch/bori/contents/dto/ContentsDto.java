package kr.co.ch.bori.contents.dto;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import org.springframework.stereotype.Repository;

import java.util.ArrayList;
import java.util.List;

@Getter
@Setter
@NoArgsConstructor
public class ContentsDto {
    private int opt,
                maxPage = 1;

    private Integer district;

    private String engNm,
                   korNm,
                   title,
                   districtNm;

    private List<String> sortList;
}
