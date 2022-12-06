package kr.co.ch.bori.common.security.config;

import lombok.RequiredArgsConstructor;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.web.SecurityFilterChain;

@RequiredArgsConstructor
@Configuration
@EnableWebSecurity
public class SecurityConfig {
    @Bean
    public SecurityFilterChain filterChain(HttpSecurity http) throws Exception {
        http.csrf().disable()
            .authorizeRequests()
                .antMatchers("/resource/img/**", "/resource/js/**", "/resource/css/**").permitAll()
                .antMatchers("/index", "/contents/index", "/overlap", "/login/chk", "/join", "/find/id", "/find/pw").permitAll()
                .anyRequest().authenticated()
                .and()
            .formLogin()
                .loginPage("/login")
                .loginProcessingUrl("/login")
                .defaultSuccessUrl("/index", true)
                .usernameParameter("userId")
                .passwordParameter("password")
                .permitAll()
                .and()
            .logout();
//                .logoutUrl("/logout");

        return http.build();
    }
}
