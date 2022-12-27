package kr.co.ch.bori.contents.controller;

import com.google.gson.Gson;
import freemarker.template.utility.StringUtil;
import kr.co.ch.bori.contents.dto.LikeDto;
import kr.co.ch.bori.contents.dto.ParamDto;
import kr.co.ch.bori.contents.dto.PlaceDto;
import kr.co.ch.bori.contents.dto.ReviewDto;
import kr.co.ch.bori.contents.service.ContentsService;
import kr.co.ch.bori.file.service.FileService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.util.List;

@Slf4j
@Controller
@RequiredArgsConstructor
@RequestMapping("/contents")
public class ContentsController {
    private final ContentsService contentsService;
    private final FileService fileService;

    @GetMapping("/index")
    // 파라미터 값에 따른 카테고리별 메뉴 페이지 세팅
    public String index(ParamDto paramDto, Model model) {
        model.addAttribute("contentsDto", contentsService.getBaseDto(paramDto));
        model.addAttribute("maxPage", contentsService.getMaxPage(paramDto));

        return "main/contents/index";
    }

    @PostMapping("/list")
    // 장소 리스트 조회
    public String getContentsList(ParamDto paramDto, Model model) {
        model.addAttribute("contentsList", contentsService.getContentsList(paramDto));
        model.addAttribute("paramDto", paramDto);
        model.addAttribute("maxPage", contentsService.getMaxPage(paramDto));

        return "contents/list/index";
    }

    @GetMapping("/register/index")
    // 장소 페이지 이동 요청
    public String register(@RequestParam(value = "opt", required = false)int opt, Model model) {
        model.addAttribute("opt", opt);

        return "main/contents/register/index";
    }

    @ResponseBody
    @PostMapping("/register")
    // 장소 등록
    public void insertPlaceData(PlaceDto placeDto) {
        contentsService.insertPlaceData(placeDto);
    }

    @GetMapping("/detail")
    // 상세 페이지 이동
    public String getContentsDataByCd(ParamDto paramDto, Model model) {
        model.addAttribute("fileList", fileService.getPlaceFileList(paramDto));
        model.addAttribute("place", contentsService.getContentsDataByCd(paramDto));

        return "main/contents/detail/index";
    }
    @ResponseBody
    @PostMapping("/detail/like")
    public LikeDto getPlaceLikeData(int placeCd) {
        return contentsService.getPlaceLikeData(placeCd);
    }

    @ResponseBody
    @PostMapping("/detail/like/merge")
    public void merPlaceData(int placeCd) {
        contentsService.mergePlaceData(placeCd);
    }

    @PostMapping("/detail/review")
    // 리뷰 리스트 조회
    public String getPlaceReviewList(int cd, Model model) {
        model.addAttribute("reviewList", contentsService.getPlaceReviewList(cd));

        return "contents/detail/review/index";
    }

    @PostMapping("/detail/review/write")
    // 리뷰 모달창
    public String review() {
        return "contents/detail/review/write";
    }

    @ResponseBody
    @PostMapping("/detail/review/insert")
    // 리뷰 등록
    public void insertPlaceReviewData(ReviewDto reviewDto) {
        contentsService.insertPlaceReviewData(reviewDto);
    }
}
