package kr.co.ch.bori.user.login.controller;

import kr.co.ch.bori.user.login.service.LoginService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.XSlf4j;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("/")
@RequiredArgsConstructor
public class LoginController {
    private final LoginService loginService;

    @GetMapping("index")
    public String index() {
        return "main/index";
    }

    @GetMapping("login")
    public String login() {
        return "sub/common/user/login/index";
    }

    @ResponseBody
    @PostMapping("overlap")
    public boolean chkOverlap(String id) {
        return loginService.chkOverlap(id);
    }

    @ResponseBody
    @PostMapping("login/chk")
    public boolean chkLogin(String id, String pwd) {
        return loginService.chkLogin(id, pwd);
    }

    @ResponseBody
    @PostMapping("login/join")
    public boolean testJoin(String id, String pwd, String email) {
        return loginService.testJoin(id, pwd, email);
    }
}
