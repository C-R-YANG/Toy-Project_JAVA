package kr.co.ch.bori.file.dto;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import org.springframework.web.multipart.MultipartFile;

import java.util.Date;

@Getter
@Setter
@NoArgsConstructor
public class FileDto {
    private Date regDt = new Date();

    private int cd;

    private Integer placeCd;

    private long size;

    private String orgNm,
                   newNm,
                   path,
                   ext;
}
