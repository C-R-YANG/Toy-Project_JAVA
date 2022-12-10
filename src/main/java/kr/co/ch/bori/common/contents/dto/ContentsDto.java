package kr.co.ch.bori.common.contents.dto;

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
    private int opt;

    private String engNm,
                   korNm;

    private List<String> sortList;
}
