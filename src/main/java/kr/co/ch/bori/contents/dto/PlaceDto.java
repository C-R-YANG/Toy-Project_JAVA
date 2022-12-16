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
    boolean parking = true;

    Date retDt = new Date();

    int cd,
        opt;

    String title,
           postCode,
           mainAddress,
           subAddress,
           tel,
           startTime,
           endTime,
           closeDay;

    Date uptDt,
         delDt;
}
