package kr.co.ch.bori.common.user.service;

import kr.co.ch.bori.common.crypto.BCryptService;
import kr.co.ch.bori.common.user.dao.UserDao;
import kr.co.ch.bori.common.user.dto.UserDto;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

@Slf4j
@Service
@RequiredArgsConstructor
public class UserService {
    private final UserDao userDAO;

    public String chklogin(UserDto userDto) {
        return userDAO/.
    }
    public UserDto getUserData(String userId) {
        return userDAO.getUserData(userId);
    }

    public boolean overlapId(String id) {
        return userDAO.overlapId(id);
    }
    public boolean overlapEmail(String email) {
        return userDAO.overlapEmail(email);
    }

    public void insUser(UserDto userDto) {
        String pw = BCryptService.encrypt(userDto.getPw());

        userDto.setPw(pw);

        userDAO.insUser(userDto);
    }

    public String selId(String email) {
        return userDAO.selId(email);
    }

    public String selPw(UserDto userDto) {
        return userDAO.selPw(userDto);
    }

    public void updatePw(UserDto userDto) {
        PasswordEncoder passwordEncoder = new BCryptPasswordEncoder();

        userDto.setPw(passwordEncoder.encode(userDto.getPw()));

        userDAO.updatePw(userDto);
    }
}
