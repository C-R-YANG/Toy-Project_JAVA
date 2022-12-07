package kr.co.ch.bori.common.util.user.login.dto;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.util.Date;

@Getter
@Setter
@NoArgsConstructor
public class LoginDto {
    private int role = 0;

    private boolean useYn = false;

    private Date regDt = new Date();

    private String id,
                   pw,
                   email;

    private Date delDt;
}
