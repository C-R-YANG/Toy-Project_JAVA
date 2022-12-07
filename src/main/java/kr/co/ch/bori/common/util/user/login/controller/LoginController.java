package kr.co.ch.bori.common.util.user.login.controller;

import kr.co.ch.bori.common.util.user.login.dto.LoginDto;
import kr.co.ch.bori.common.util.user.login.service.LoginService;
import lombok.RequiredArgsConstructor;
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
    @PostMapping("overlapId")
    public boolean overlapId(String id) {
        return loginService.overlapId(id);
    }

    @ResponseBody
    @PostMapping("overlapEmail")
    public boolean overlapEmail(String email) {
        return loginService.overlapEmail(email);
    }

    @ResponseBody
    @PostMapping("login/chk")
    public boolean chkLogin(String id, String pwd) {
        return loginService.chkLogin(id, pwd);
    }

    @ResponseBody
    @PostMapping("join")
    public void insUser(LoginDto loginDto) {
        loginService.insUser(loginDto);
    }

    @ResponseBody
    @PostMapping("find/id")
    public String selId(String email) {
        return loginService.selId(email);
    }

    @ResponseBody
    @PostMapping("find/pw")
    public String selPw(LoginDto loginDto) {
        return loginService.selPw(loginDto);
    }

    @ResponseBody
    @PostMapping("find/pw/change")
    public void updatePw(LoginDto loginDto) {
        loginService.updatePw(loginDto);
    }
}
