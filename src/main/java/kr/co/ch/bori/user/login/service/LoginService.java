package kr.co.ch.bori.user.login.service;

import kr.co.ch.bori.user.login.dao.LoginDAO;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

@Service
@RequiredArgsConstructor
public class LoginService {
    private final LoginDAO loginDAO;
    public boolean chkOverlap(String id) {
        return loginDAO.chkOverlap(id);
    }

    public boolean chkLogin(String id, String pwd) {
        return loginDAO.chkLogin(id, pwd);
    }

    public boolean testJoin(String id, String pwd, String email) {
        return loginDAO.testJoin(id, pwd, email);

    }
}
