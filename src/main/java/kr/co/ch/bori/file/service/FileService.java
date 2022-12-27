package kr.co.ch.bori.file.service;

import kr.co.ch.bori.contents.dto.ParamDto;
import kr.co.ch.bori.contents.dto.ReviewDto;
import kr.co.ch.bori.file.dao.FileDao;
import kr.co.ch.bori.file.dto.FileDto;
import kr.co.ch.bori.contents.dto.PlaceDto;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
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
    @Autowired
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
        // 파일 리스트 Length만큼 반복문(item = imgFileList[루프.인덱스])
        placeDto.getImgFileList().forEach(item -> {
            try {
                // 서버에 파일 업로드(opt = 0 : 장소, place.cd, 파일정보)
                FileDto fileDto = uploadPlaceFile(0, placeDto.getCd(), item);

                // 파일 cd값 조회
                int fileCd = this.getSeq();

                // 조회된 file.MAX(cd + 1)값 세팅
                fileDto.setCd(fileCd);

                // 파일관련 데이터 DB 저장
                this.insertData(fileDto);
            } catch (IOException e) {
                throw new RuntimeException(e);
            }
        });
    }

    public FileDto uploadPlaceFile(int opt, int cd, MultipartFile multipartFile) throws IOException {
        String path  = preparePath(opt == 0 ? "place" : "review"),  // opt에 따라 파일 경로 세팅(0 : 장소, 1 : 리뷰)
               orgNm = multipartFile.getOriginalFilename(),         // 사용자가 업로드한 실제 파일 이름 세팅
               ext   = orgNm.lastIndexOf(".") != -1 ?                           // 파일의 마지막 .이 존재할 경우(미존재시 "-1"리턴)
                       orgNm.substring(orgNm.lastIndexOf(".") + 1) :  // 실제파일이름의 .뒤의 문자열을 세팅(확장자)
                       "",                                                         // 확장자 미존재
               // 실제 서버에 등록될 파일명(랜덤으로 세팅) + .확장자
               newNm = DigestUtils.md5DigestAsHex(String.valueOf(new Random().nextInt(1000000)).getBytes(StandardCharsets.UTF_8)) + "." + ext;

        // 파일의 바이트 정보를 세팅
        byte[] fileBytes = multipartFile.getBytes();

        // 서버에 파일 생성(파일 바이트, 파일)
        FileCopyUtils.copy(fileBytes, Paths.get(uploadPath, path, newNm).toFile());

        // DB 저장을 위해 DTO 세팅
        FileDto fileDto = new FileDto();

        fileDto.setPlaceCd(opt == 0 ? cd : -1); // CD값은 장소 파일등록시 MAX+1로 조회된 place.cd 값 리뷰파일 등록시 -1 세팅
        fileDto.setOrgNm(Normalizer.normalize(orgNm, Normalizer.Form.NFC)); // 기존파일명
        fileDto.setNewNm(newNm);                                            // 신규파일명
        fileDto.setSize(fileBytes.length);                                  // 파일 사이즈
        fileDto.setPath("/" + path);                                        // 파일 경로
        fileDto.setExt(ext);                                                // 파일 확장자

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
