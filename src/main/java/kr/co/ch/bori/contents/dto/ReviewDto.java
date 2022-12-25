package kr.co.ch.bori.contents.dto;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import org.springframework.web.multipart.MultipartFile;

import java.math.BigDecimal;
import java.util.Date;

@Getter
@Setter
@NoArgsConstructor
public class ReviewDto {
    BigDecimal score = new BigDecimal(0);

    Date regDt = new Date();

    int cd,
        placeCd,
        userCd;

    Integer fileCd;

    String userId,
           contents,
           newNm;

    Date uptDt,
         delDt;

    MultipartFile imgFile;
}
