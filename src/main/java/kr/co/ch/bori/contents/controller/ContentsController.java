package kr.co.ch.bori.contents.controller;

import kr.co.ch.bori.contents.dto.ParamDto;
import kr.co.ch.bori.contents.dto.PlaceDto;
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
    public String detail() {
        return "main/contents/detail/index";
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
    public String review() {
        return "contents/detail/review";
    }
}
