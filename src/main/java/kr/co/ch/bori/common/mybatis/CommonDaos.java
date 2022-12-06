package kr.co.ch.bori.common.mybatis;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

@Repository
public class CommonDaos {
    @Autowired
    @Qualifier("boridaengdaengCommonDao")
    public CommonDao boridaengdaengCommonDao;
}
