package kr.co.ch.bori.contents.dto;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.RequiredArgsConstructor;
import lombok.Setter;

import java.util.Date;

@Getter
@Setter
@NoArgsConstructor
public class PlaceDto {
    int views = 0;

    boolean parking = true;

    String categoryNm = "";

    Date retDt = new Date();

    int cd,
        category,
        opt;

    String title,
           postCode,
           district,
           neighborhood,
           mainAddress,
           subAddress,
           tel,
           startTime,
           endTime,
           closeDay,
           districtNm;

    Date uptDt,
         delDt;
}
