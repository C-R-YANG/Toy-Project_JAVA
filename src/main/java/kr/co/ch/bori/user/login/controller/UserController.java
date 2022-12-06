//package kr.co.ch.bori.user.login.controller;
//
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.http.HttpStatus;
//import org.springframework.http.ResponseEntity;
//import org.springframework.security.core.userdetails.UserDetailsService;
//import org.springframework.web.bind.annotation.RequestMapping;
//import org.springframework.web.bind.annotation.RequestMethod;
//import org.springframework.web.bind.annotation.RestController;
//
//@RestController
//@RequestMapping(value = "/api/v1/app/")
//public class UserController {
//
//    @Autowired
//    UserDetailsService userService;
//
//    @RequestMapping(value = "findAll", method = RequestMethod.POST)
//    public ResponseEntity<?> findAll() {
//        ResponseDTO responseDTO = new ResponseDTO();
//        responseDTO.setResultCode("S0001");
//        responseDTO.setRes(userService.findAll());
//        return new ResponseEntity<>(responseDTO, HttpStatus.OK);
//    }
//    public class ResponseDTO {
//        private String resultCode;
//        private Object res;
//
//        public String getResultCode() {
//            return resultCode;
//        }
//
//        public void setResultCode(String resultCode) {
//            this.resultCode = resultCode;
//        }
//
//        public Object getRes() {
//            return res;
//        }
//
//        public void setRes(Object res) {
//            this.res = res;
//        }
//    }
//}