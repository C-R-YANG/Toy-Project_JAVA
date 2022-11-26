package kr.co.ch.bori.user.login.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/")
public class LoginController {
    @GetMapping("index")
    public String index() {
        return "main/index";
    }

    @GetMapping("login")
    public String login() {
        return "sub/common/user/login/index";
    }
}
