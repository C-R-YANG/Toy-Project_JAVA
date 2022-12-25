package kr.co.ch.bori.contents.dto;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.RequiredArgsConstructor;
import lombok.Setter;
import org.springframework.web.multipart.MultipartFile;

import java.util.Date;
import java.util.List;

@Getter
@Setter
@NoArgsConstructor
public class PlaceDto {
    private int views = 0,
                likes = 0;

    private boolean parking = true;

    private String categoryNm = "";

    private Date retDt = new Date();

    private int cd,
                category,
                opt;

    private String title,
                   postCode,
                   district,
                   neighborhood,
                   mainAddress,
                   subAddress,
                   tel,
                   startTime,
                   endTime,
                   closeDay,
                   districtNm,
                   newNm;

    private Date uptDt,
                 delDt;

    private List<MultipartFile> imgFileList;
}
