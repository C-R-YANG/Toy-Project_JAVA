package kr.co.ch.bori.user.login.controller;

import kr.co.ch.bori.user.login.dto.LoginDto;
import kr.co.ch.bori.user.login.service.LoginService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.XSlf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCrypt;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
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
}
