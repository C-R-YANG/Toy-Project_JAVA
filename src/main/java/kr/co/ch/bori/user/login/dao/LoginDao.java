package kr.co.ch.bori.user.login.dao;

import kr.co.ch.bori.common.mybatis.CommonDaos;
import kr.co.ch.bori.user.login.dto.LoginDto;
import org.springframework.stereotype.Repository;

@Repository
public class LoginDao extends CommonDaos {
//    public boolean chkOverlap(String id) {
//        return id.equals("chfhd8872");
//    }

//    public boolean chkLogin(String id, String pwd) {
//        return id.equals("chfhd8872") && pwd.equals("asdf1234");
//    }

    public void insUser(LoginDto loginDto) {
        boridaengdaengCommonDao.insertData("Login.insUser", loginDto);
    }

    public String selId(String email) {
        return boridaengdaengCommonDao.getData("Login.selId", email);
    }

    public String selPw(LoginDto loginDto) {
        return boridaengdaengCommonDao.getData("Login.selPw", loginDto);
    }
}


