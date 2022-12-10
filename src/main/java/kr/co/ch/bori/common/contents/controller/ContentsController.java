package kr.co.ch.bori.common.contents.controller;

import kr.co.ch.bori.common.contents.service.ContentsService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Slf4j
@Controller
@RequiredArgsConstructor
@RequestMapping("/contents")
public class ContentsController {
    private final ContentsService contentsService;

    @GetMapping("/index")
    public String index(@RequestParam(value = "opt", required = false)int opt, Model model){
        model.addAttribute("contentsDto", contentsService.getBaseDto(opt));

        return "main/contents/index";
    }

    @PostMapping("/list")
    public String list() {
        return "contents/list/index";
    }
}
