package kr.co.ch.bori.common.database;

import com.zaxxer.hikari.HikariDataSource;
import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.boot.jdbc.DataSourceBuilder;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.transaction.annotation.EnableTransactionManagement;

import javax.sql.DataSource;

@Configuration
@EnableTransactionManagement
public class DataSourceConfig {
    @Bean
    @ConfigurationProperties("spring.datasource.hikari.boridaengdaeng")
    public DataSource boridaengdaengDataSource() {
        return DataSourceBuilder.create().type(HikariDataSource.class).build();
    }
}
