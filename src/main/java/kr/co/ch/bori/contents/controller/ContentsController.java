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
    public String index(ParamDto paramDto, Model model) {

        model.addAttribute("contentsDto", contentsService.getBaseDto(paramDto));
        model.addAttribute("maxPage", contentsService.getMaxPage(paramDto));

        return "main/contents/index";
    }

    @PostMapping("/list")
    public String getContentsList(ParamDto paramDto, Model model) {
        model.addAttribute("contentsList", contentsService.getContentsList(paramDto));
        model.addAttribute("paramDto", paramDto);
        model.addAttribute("maxPage", contentsService.getMaxPage(paramDto));

        return "contents/list/index";
    }

    @GetMapping("/detail")
    public String getContentsDataByCd(ParamDto paramDto, Model model) {
        model.addAttribute("fileList", fileService.getPlaceFileList(paramDto));
        model.addAttribute("place", contentsService.getContentsDataByCd(paramDto));

        return "main/contents/detail/index";
    }

    @GetMapping("/register/index")
    public String register(@RequestParam(value = "opt", required = false)int opt, Model model) {
        model.addAttribute("opt", opt);

        return "main/contents/register/index";
    }

    @ResponseBody
    @PostMapping("/register")
    public void insertPlaceData(PlaceDto placeDto) {
        contentsService.insertPlaceData(placeDto);
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
    public String getPlaceReviewList(int cd, Model model) {
        model.addAttribute("reviewList", contentsService.getPlaceReviewList(cd));

        return "contents/detail/review/index";
    }

    @PostMapping("/detail/review/write")
    public String review() {
        return "contents/detail/review/write";
    }

    @ResponseBody
    @PostMapping("/detail/review/insert")
    public void insertPlaceReviewData(ReviewDto reviewDto) {
        contentsService.insertPlaceReviewData(reviewDto);
    }
}
