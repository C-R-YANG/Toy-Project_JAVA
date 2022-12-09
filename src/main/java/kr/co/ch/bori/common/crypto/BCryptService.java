package kr.co.ch.bori.common.crypto;

import lombok.RequiredArgsConstructor;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;

public class BCryptService {
    private static final BCryptPasswordEncoder bCryptPasswordEncoder = new BCryptPasswordEncoder();
    public static String encrypt(String password) {
        return bCryptPasswordEncoder.encode(password);
    }

    public static boolean matches(String password, String encodePassword) {
        return bCryptPasswordEncoder.matches(password, encodePassword);
    }
}
