package kr.co.ch.bori.common.database;

import kr.co.ch.bori.common.mybatis.CommonDao;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.mybatis.spring.SqlSessionFactoryBean;
import org.mybatis.spring.SqlSessionTemplate;
import org.mybatis.spring.annotation.MapperScan;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.Primary;
import org.springframework.core.io.Resource;
import org.springframework.core.io.support.PathMatchingResourcePatternResolver;

import javax.sql.DataSource;

@Configuration
// 패키지명
@MapperScan(value = "com.example.server_01", sqlSessionFactoryRef = "SqlSessionFactory")
public class BoridaengdaengConfig {
    @Autowired
    @Qualifier(value = "boridaengdaengDataSource")
    private DataSource boridaengdaengDataSource;

    @Value("${mybatis.mapper-locations}")
    private String mapperLocations;

    @Bean
    @Primary
    public SqlSessionFactory boridaengdaengSqlSessionFactoryBean() throws Exception {
        SqlSessionFactoryBean sqlSessionFactoryBean = new SqlSessionFactoryBean();
        sqlSessionFactoryBean.setDataSource(boridaengdaengDataSource);
        /* 맵퍼 xml 파일 경로 설정 */
        Resource[] resources = new PathMatchingResourcePatternResolver().getResources(mapperLocations);
        sqlSessionFactoryBean.setMapperLocations(resources);
        sqlSessionFactoryBean.setConfigLocation(new PathMatchingResourcePatternResolver().getResource("classpath:mybatis-config.xml"));

        return sqlSessionFactoryBean.getObject();
    }

    @Bean
    @Primary
    public SqlSession boridaengdaengSqlSession() throws Exception {
        return new SqlSessionTemplate(boridaengdaengSqlSessionFactoryBean());
    }

    @Bean
    public CommonDao boridaengdaengCommonDao() throws Exception{
        return new CommonDao(boridaengdaengSqlSession());
    }
}