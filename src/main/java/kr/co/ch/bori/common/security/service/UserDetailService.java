package kr.co.ch.bori.common.security.service;

import kr.co.ch.bori.common.security.user.UserDetail;
import kr.co.ch.bori.common.user.dto.UserDto;
import kr.co.ch.bori.common.user.service.UserService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

@Slf4j
@RequiredArgsConstructor
@Service
public class UserDetailService implements UserDetailsService {
    private final UserService userService;

    @Override
    public UserDetails loadUserByUsername(String userId) throws UsernameNotFoundException {
        UserDto userDto = userService.getUserData(userId);

        if (userDto == null) {
            throw new UsernameNotFoundException(userId + "사용자가 없습니다.");
        }

        return new UserDetail(userDto);
    }
}