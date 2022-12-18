package kr.co.ch.bori.contents.controller;

import com.google.gson.Gson;
import freemarker.template.utility.StringUtil;
import kr.co.ch.bori.contents.dto.ParamDto;
import kr.co.ch.bori.contents.dto.PlaceDto;
import kr.co.ch.bori.contents.dto.ReviewDto;
import kr.co.ch.bori.contents.service.ContentsService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

@Slf4j
@Controller
@RequiredArgsConstructor
@RequestMapping("/contents")
public class ContentsController {
    private final ContentsService contentsService;

    @GetMapping("/index")
    public String index(@RequestParam(value = "opt", required = false)int opt, Model model) {
        model.addAttribute("contentsDto", contentsService.getBaseDto(opt));

        return "main/contents/index";
    }

    @PostMapping("/list")
    public String getContentsList(ParamDto paramDto, Model model) {
        model.addAttribute("contentsList", contentsService.getContentsList(paramDto));

        return "contents/list/index";
    }

    @GetMapping("/detail")
    public String getContentsDataByCd(ParamDto paramDto, Model model) {
        PlaceDto placeDto = contentsService.getContentsDataByCd(paramDto);

        String url = "";
        if (placeDto == null) {
            url = "main/contents/index";

            model.addAttribute("contentsDto", contentsService.getBaseDto(paramDto.getOpt()));
        } else {
            url = "main/contents/detail/index";

            model.addAttribute("place", contentsService.getContentsDataByCd(paramDto));
        }

        return url;
    }

    @GetMapping("/register/index")
    public String register(@RequestParam(value = "opt", required = false)int opt, Model model) {
        model.addAttribute("opt", opt);

        return "main/contents/register/index";
    }

    @ResponseBody
    @PostMapping("/register")
    public void insertRegisterData(PlaceDto placeDto) {
        contentsService.insertRegisterData(placeDto);
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
