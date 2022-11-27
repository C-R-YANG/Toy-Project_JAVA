package kr.co.ch.bori.contents.controller;

import org.slf4j.ILoggerFactory;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@RequestMapping("/contents")
public class ContentsController {
    private final Logger looger = LoggerFactory.getLogger(ContentsController.class);

    @GetMapping("/index")
    public String index(@RequestParam(value = "opt", required = false)int opt,
                        Model model){

        model.addAttribute("optNm", opt == 0 ? "FOOD" :
                                                opt == 1 ? "CAFE" : "...");

        return "main/contents/index";
    }
}
