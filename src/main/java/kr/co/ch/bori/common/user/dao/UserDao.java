package kr.co.ch.bori.common.user.dao;

import kr.co.ch.bori.common.mybatis.CommonDaos;
import kr.co.ch.bori.common.user.dto.UserDto;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Repository;

@Repository
@Slf4j
public class UserDao extends CommonDaos {

    public String login(UserDto userDto) {
        return boridaengdaengCommonDao.getData("User.login", userDto);
    }

    public UserDto getUserData(String id) {
        return boridaengdaengCommonDao.getData("User.getUserData", id);
    }

    public boolean overlapId(String id) {
        return boridaengdaengCommonDao.getCount("User.overlapId", id) == 1;
    }

    public boolean overlapEmail(String email) {
        return boridaengdaengCommonDao.getCount("User.overlapEmail", email) == 1;
    }


    public void insUser(UserDto userDto) {
        boridaengdaengCommonDao.insertData("User.insUser", userDto);
    }

    public String selId(String email) {
        return boridaengdaengCommonDao.getData("User.selId", email);
    }

    public String selPw(UserDto userDto) {
        return boridaengdaengCommonDao.getData("User.selPw", userDto);
    }

    public void updatePw(UserDto userDto) {
        log.info("aaa");
        boridaengdaengCommonDao.updateData("User.updatePw", userDto);
    }
}


