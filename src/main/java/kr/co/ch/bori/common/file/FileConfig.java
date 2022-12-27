package kr.co.ch.bori.common.file;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.Objects;

@Configuration
public class FileConfig {
    public final static String MAIN_PROJECT_NAME    = "boridaengdaeng";                  // 프로젝트 이름 TODO 기존 경로 /kpTotal
    public final static String UPLOAD_FOLDER_NAME   = "upload";                 // 업로드 폴더 명

    /*************************************************************************
     * @Method 설명 : 업로드 경로
     * @작성일   : 2022-11-23
     * @작성자   : RSpring41
     *************************************************************************/
    @Bean
    public String uploadPath(){
        String path         = Objects.requireNonNull(FileConfig.class.getResource("/")).getPath();    // 프로젝트 ROOT 경로
        String osName       = System.getProperty("os.name");                                                // OS 명
        String projectPath; // 프로젝트 경로
        Path uploadPath;    // 업로드 경로

        if(path.contains(".metadata")){
            projectPath = path.substring(0, path.lastIndexOf(".metadata")-1)+ FileConfig.MAIN_PROJECT_NAME;
        }else{
            projectPath = path.substring(0, path.lastIndexOf(FileConfig.MAIN_PROJECT_NAME) + FileConfig.MAIN_PROJECT_NAME.length());
        }

        // 윈도우 환경에서는 리룩스 환경용 시작 문자("/") 제거
        if (osName.contains("Windows")) {
            projectPath = projectPath.substring(1);
        }

        uploadPath = Paths.get(projectPath, "src", "main", "webapp", "resource", "img", this.UPLOAD_FOLDER_NAME);

        return uploadPath.toString();
    }
}