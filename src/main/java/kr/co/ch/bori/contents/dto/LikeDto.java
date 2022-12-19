package kr.co.ch.bori.contents.dto;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
public class LikeDto {
    boolean likeYn = false;

    int cnt = 0;

    int cd,
        placeCd,
        userCd;

    String userId;
}
