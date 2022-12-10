package kr.co.ch.bori.common.user.controller;

import kr.co.ch.bori.common.user.dto.UserDto;
import kr.co.ch.bori.common.user.service.UserService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("/")
@RequiredArgsConstructor
public class UserController {
    private final UserService loginService;

    @GetMapping("index")
    public String index() {
        return "main/index";
    }

    @GetMapping("login")
    public String login() {
        return "sub/common/user/login/index";
    }

    @ResponseBody
    @PostMapping("user/overlapId")
    public boolean overlapId(String id) {
        return loginService.overlapId(id);
    }

    @ResponseBody
    @PostMapping("user/overlapEmail")
    public boolean overlapEmail(String email) {
        return loginService.overlapEmail(email);
    }

    @ResponseBody
    @PostMapping("user/join")
    public void insUser(UserDto userDto) {
        loginService.insUser(userDto);
    }

    @ResponseBody
    @PostMapping("user/find/id")
    public String selId(String email) {
        return loginService.selId(email);
    }

    @ResponseBody
    @PostMapping("user/find/pw")
    public String selPw(UserDto userDto) {
        return loginService.selPw(userDto);
    }

    @ResponseBody
    @PostMapping("user/find/pw/change")
    public void updatePw(UserDto userDto) {
        loginService.updatePw(userDto);
    }
}
