package kr.co.ch.bori.common.util.user.login.dao;

import kr.co.ch.bori.common.mybatis.CommonDaos;
import kr.co.ch.bori.common.util.user.login.dto.LoginDto;
import org.springframework.stereotype.Repository;

@Repository
public class LoginDao extends CommonDaos {
    public boolean overlapId(String id) {
        return boridaengdaengCommonDao.getCount("Login.overlapId", id) == 1;
    }

    public boolean overlapEmail(String email) {
        return boridaengdaengCommonDao.getCount("Login.overlapEmail", email) == 1;
    }


    public void insUser(LoginDto loginDto) {
        boridaengdaengCommonDao.insertData("Login.insUser", loginDto);
    }

    public String selId(String email) {
        return boridaengdaengCommonDao.getData("Login.selId", email);
    }

    public String selPw(LoginDto loginDto) {

        return boridaengdaengCommonDao.getData("Login.selPw", loginDto);
    }

    public void updatePw(LoginDto loginDto) {

        boridaengdaengCommonDao.updateData("Login.updatePw", loginDto);
    }
}


