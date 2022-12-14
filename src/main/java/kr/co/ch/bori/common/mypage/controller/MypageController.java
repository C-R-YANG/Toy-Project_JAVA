package kr.co.ch.bori.common.mypage.controller;

import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/mypage/")
@RequiredArgsConstructor
public class MypageController {

    @GetMapping("index")
    public String mypage() {
        return "main/common/mypage/index";
    }

    @PostMapping("like")
    public String like() {
        return "common/mypage/contents/like";
    }

    @PostMapping("pwChange")
    public String info() {
        return "common/mypage/contents/pwChange";
    }

    @PostMapping("withdraw")
    public String withdraw() {
        return "common/mypage/contents/withdraw";
    }
}
