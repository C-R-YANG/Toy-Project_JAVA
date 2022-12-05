package kr.co.ch.bori.user.login.dao;

import org.springframework.stereotype.Repository;

@Repository
public class LoginDAO {
    public boolean chkOverlap(String id) {
        return id.equals("chfhd8872");
    }

    public boolean chkLogin(String id, String pwd) {
        return id.equals("chfhd8872") && pwd.equals("asdf1234");
    }

    public boolean testJoin(String id, String pwd, String email) {
        System.out.println(id);
        System.out.println(pwd);
        System.out.println(email);
        return true;
    }
}


