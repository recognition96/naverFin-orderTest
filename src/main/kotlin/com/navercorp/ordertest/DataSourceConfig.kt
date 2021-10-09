package com.navercorp.ordertest

import com.zaxxer.hikari.HikariDataSource
import org.apache.ibatis.session.SqlSessionFactory
import org.mybatis.spring.SqlSessionFactoryBean
import org.mybatis.spring.annotation.MapperScan
import org.mybatis.spring.boot.autoconfigure.SpringBootVFS
import org.springframework.boot.context.properties.ConfigurationProperties
import org.springframework.boot.jdbc.DataSourceBuilder
import org.springframework.context.annotation.Bean
import org.springframework.context.annotation.Configuration
import org.springframework.context.annotation.Primary
import org.springframework.core.io.support.PathMatchingResourcePatternResolver
import javax.sql.DataSource


@Configuration
@MapperScan(basePackages = ["com.navercorp.ordertest.mapper"])
class DataSourceConfig {
    @Primary
    @Bean
    @ConfigurationProperties("spring.datasource.hikari")
    fun dataSource() : DataSource {
        val dataSource = DataSourceBuilder.create().type(HikariDataSource::class.java).build()

        // UTF-8이 아닌 DB에 연결 시, 한글 문자열을 온전히 처리하기 위해 사용
        dataSource.connectionInitSql = "SET NAMES utf8mb4"

        return dataSource
    }

    @Bean
    fun getSqlSessionInstance() : SqlSessionFactory {
        val sqlSessionFactoryBean = SqlSessionFactoryBean()

        sqlSessionFactoryBean.setDataSource(this.dataSource())
        sqlSessionFactoryBean.setMapperLocations(*PathMatchingResourcePatternResolver().getResources("classpath:mapper/*.xml"))
        sqlSessionFactoryBean.vfs = SpringBootVFS::class.java
        sqlSessionFactoryBean.setTypeAliasesPackage("com.navercorp.ordertest.dto")

        return sqlSessionFactoryBean.`object`!!
    }
}