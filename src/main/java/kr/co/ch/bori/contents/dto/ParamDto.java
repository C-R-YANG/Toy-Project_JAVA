package kr.co.ch.bori.contents.dto;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.util.List;

@Getter
@Setter
@NoArgsConstructor
public class ParamDto {
    int parking = 0;

    int opt;

    String title;

    List<Integer> districtList;
    List<Integer> categoryList;
}
