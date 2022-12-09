package kr.co.ch.bori.common.user.dto;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.util.Date;

@Getter
@Setter
@NoArgsConstructor
public class UserDto {
    private int role = 0;

    private boolean useYn = false;

    private Date regDt = new Date();

    private String id,
                   pw,
                   email;

    private Date delDt;
}
