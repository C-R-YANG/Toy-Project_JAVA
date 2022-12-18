package kr.co.ch.bori.common.security.session;

import kr.co.ch.bori.common.security.user.UserDetail;
import kr.co.ch.bori.common.user.dto.UserDto;
import lombok.extern.slf4j.Slf4j;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Service;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.util.WebUtils;

import javax.servlet.http.HttpServletRequest;
import java.util.ArrayList;
import java.util.List;

@Slf4j
@Service
public class SecuritySession {
    public static Authentication getAuthenCation() {
        if( SecurityContextHolder.getContext().getAuthentication() == null ) {
            return null;
        }

        return SecurityContextHolder.getContext().getAuthentication();
    }

    public static UserDto getCurrentMember() {
        if(SecurityContextHolder.getContext().getAuthentication() == null) {
            return new UserDto();
        }

        Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();

        if (principal instanceof UserDetail) {
            return ((UserDetail)principal).getUserDTO();
        }

        return (UserDto) WebUtils.getSessionAttribute(getCurrentRequest(), "MEMBER");
    }


    @SuppressWarnings("deprecation")
    public static String getRealPath() {
        ServletRequestAttributes sra = (ServletRequestAttributes)RequestContextHolder.currentRequestAttributes();

        return getCurrentRequest().getRealPath("");
    }

    public static List<MultipartFile> getRequestToFile(HttpServletRequest request, String name) {
        MultipartHttpServletRequest multiRequest = (MultipartHttpServletRequest)request;
        List<MultipartFile> files = multiRequest.getFiles(name);

        List<MultipartFile> list = new ArrayList<>();
        for( MultipartFile file : files) {
            if( file.getSize() > 0 )
                list.add(file);
        }

        return list;
    }

    public static HttpServletRequest getCurrentRequest() {
        return ((ServletRequestAttributes) RequestContextHolder.getRequestAttributes()).getRequest();
    }
}