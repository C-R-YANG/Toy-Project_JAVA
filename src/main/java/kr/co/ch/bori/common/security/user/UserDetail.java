package kr.co.ch.bori.common.security.user;

import kr.co.ch.bori.common.user.dto.UserDto;
import lombok.extern.slf4j.Slf4j;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;

import java.io.Serial;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

@Slf4j
public class UserDetail implements UserDetails {
    @Serial
    private static final long serialVersionUID = -8493085876825511929L;

    // 세션 유저 권한 리스트
    private List<GrantedAuthority> authorities;

    private final UserDto userDTO;

    public UserDetail(UserDto userDTO) {
        this.userDTO = userDTO;

        authorities = new ArrayList<>();

        String role = userDTO.getRole() == 9 ? "ROLE_ADMIN" : "ROLE_USER";

        authorities.add(new SimpleGrantedAuthority(role));
    }


    public Collection<GrantedAuthority> getAuthorities() {
        return authorities;
    }

    public UserDto getUserDTO() {
        return userDTO;
    }

    public String getPassword() {
        return userDTO.getPw();
    }

    public String getUsername() {
        return userDTO.getId();
    }

    @Override
    public boolean isAccountNonExpired() {
        return true;
    }

    @Override
    public boolean isAccountNonLocked() {
        return true;
    }

    @Override
    public boolean isCredentialsNonExpired() {
        return true;
    }

    @Override
    public boolean isEnabled() {
        return true;
    }
}