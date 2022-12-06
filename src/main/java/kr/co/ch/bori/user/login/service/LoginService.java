package kr.co.ch.bori.user.login.service;

import kr.co.ch.bori.user.login.dao.LoginDao;
import kr.co.ch.bori.user.login.dto.LoginDto;
import lombok.RequiredArgsConstructor;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

@Service
@RequiredArgsConstructor
public class LoginService {
    private final LoginDao loginDAO;
    public boolean chkOverlap(String id) {
        return true;
    }

    public boolean chkLogin(String id, String pwd) {
        return true;
    }

    public void insUser(LoginDto loginDto) {
        PasswordEncoder passwordEncoder = new BCryptPasswordEncoder();

        loginDto.setPw(passwordEncoder.encode(loginDto.getPw()));

        loginDAO.insUser(loginDto);
    }

    public String selId(String email) {
        return loginDAO.selId(email);
    }

    public String selPw(LoginDto loginDto) {
        return loginDAO.selPw(loginDto);
    }
}
