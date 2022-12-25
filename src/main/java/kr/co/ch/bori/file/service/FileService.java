package kr.co.ch.bori.file.service;

import kr.co.ch.bori.contents.dto.ParamDto;
import kr.co.ch.bori.contents.dto.ReviewDto;
import kr.co.ch.bori.file.dao.FileDao;
import kr.co.ch.bori.file.dto.FileDto;
import kr.co.ch.bori.contents.dto.PlaceDto;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;
import org.springframework.util.DigestUtils;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.IOException;
import java.nio.charset.StandardCharsets;
import java.nio.file.Paths;
import java.text.Normalizer;
import java.util.List;
import java.util.Random;

@Slf4j
@Service
@RequiredArgsConstructor
public class FileService {
    private final String uploadPath;

    private final FileDao fileDao;

    public List<FileDto> getPlaceFileList(ParamDto paramDto) {
        int placeCd = paramDto.getCd();

        return fileDao.getPlaceFileList(placeCd);
    }

    public int insertReviewFile(ReviewDto reviewDto) {
        try {
            // 서버에 파일 업로드
            FileDto fileDto = uploadPlaceFile(1, reviewDto.getPlaceCd(), reviewDto.getImgFile());

            // 파일 cd값 조회
            int fileCd = this.getSeq();

            fileDto.setCd(fileCd);

            // 파일관련 데이터 DB 저장
            this.insertData(fileDto);

            return fileCd;
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }
    public void insertPlaceFile(PlaceDto placeDto) {
        placeDto.getImgFileList().forEach(item -> {
            try {
                // 서버에 파일 업로드
                FileDto fileDto = uploadPlaceFile(0, placeDto.getCd(), item);

                // 파일 cd값 조회
                int fileCd = this.getSeq();

                fileDto.setCd(fileCd);

                // 파일관련 데이터 DB 저장
                this.insertData(fileDto);
            } catch (IOException e) {
                throw new RuntimeException(e);
            }
        });
    }

    public FileDto uploadPlaceFile(int opt, int cd, MultipartFile multipartFile) throws IOException {
        String path  = preparePath(opt == 0 ? "place" : "review"),
               orgNm = multipartFile.getOriginalFilename(),
               ext   = orgNm.lastIndexOf(".") != -1 ? orgNm.substring(orgNm.lastIndexOf(".") + 1) : "",
               newNm = DigestUtils.md5DigestAsHex(String.valueOf(new Random().nextInt(1000000)).getBytes(StandardCharsets.UTF_8)) + "." + ext;

        byte[] fileBytes = multipartFile.getBytes();

        // 서버에 파일 생성
        FileCopyUtils.copy(fileBytes, Paths.get(uploadPath, path, newNm).toFile());

        FileDto fileDto = new FileDto();

        fileDto.setPlaceCd(opt == 0 ? cd : -1);
        fileDto.setOrgNm(Normalizer.normalize(orgNm, Normalizer.Form.NFC));
        fileDto.setNewNm(newNm);
        fileDto.setSize(fileBytes.length);
        fileDto.setPath("/" + path);
        fileDto.setExt(ext);

        return fileDto;
    }

    public String preparePath(String path) {
        File savePath = new File(Paths.get(uploadPath, path).toString());

        if (!savePath.exists()) {
            savePath.mkdirs();
        }

        return path;
    }

    public int getSeq() {
        return fileDao.getSeq();
    }
    public void insertData(FileDto fileDto) {
        fileDao.insertData(fileDto);
    }
}
