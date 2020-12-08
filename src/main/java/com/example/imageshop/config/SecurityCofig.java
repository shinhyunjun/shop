package com.example.imageshop.config;


import com.example.imageshop.common.security.CustomAccessDeniedHandler;
import com.example.imageshop.common.security.CustomLoginSuccessHandler;
import com.example.imageshop.common.security.CustomUserDetailsService;
import lombok.extern.java.Log;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.method.configuration.EnableGlobalMethodSecurity;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.web.access.AccessDeniedHandler;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;
import org.springframework.security.web.authentication.rememberme.JdbcTokenRepositoryImpl;
import org.springframework.security.web.authentication.rememberme.PersistentTokenRepository;

import javax.sql.DataSource;

@Log
@EnableWebSecurity
@EnableGlobalMethodSecurity(prePostEnabled = true, securedEnabled = true) //시큐리티 애너테이션  활성화
public class SecurityCofig extends WebSecurityConfigurerAdapter {

    @Autowired
    DataSource dataSource;


    @Override
    protected void configure(HttpSecurity http) throws Exception {


        //  http.authorizeRequests().antMatchers("/notice/list").permitAll();
        // http.authorizeRequests().antMatchers("/notice/register").hasRole("ADMIN");

        http.formLogin()
                .loginPage("/login")
                .loginProcessingUrl("/login")
                //CustomLoginSuccessHandler를 로그인 성공 처리자로 지정한다.
                .successHandler(createAuthenticationSuccessHandler());

        http.logout()
                .logoutUrl("/logout")
                .invalidateHttpSession(true)
                //로그아웃을 하면 자동 로그인에 사용하는 쿠키도 삭제해 주도록 한다.
                .deleteCookies("remember-me", "JSESSION_ID");


        http.exceptionHandling()
                //CustomAccessDeniedHandler를 접근 거부 처리자로 지정한다.
                .accessDeniedHandler(createAccessDeniedHandler());

        //데이터 소스를 지정하고 테이블을 이용해서 기존 로그인 정보 기록
        http.rememberMe()
                .key("hdcd")
                .tokenRepository(createJDBCRepository())
                .tokenValiditySeconds(60 * 60 * 24); //쿠키의 유효 시간 지정
    }



    @Override
    protected void configure(AuthenticationManagerBuilder auth) throws Exception {
        auth.userDetailsService(createUserDetailsService())
                .passwordEncoder(createPasswordEncoder());
    }


    @Bean
    public PasswordEncoder createPasswordEncoder() {

        return new BCryptPasswordEncoder();
    }


    // CustomLoginSuccessHandler를 빈으로 등록한다.
    @Bean
    public AuthenticationSuccessHandler createAuthenticationSuccessHandler() {
        return new CustomLoginSuccessHandler();
    }

    @Bean
    public UserDetailsService createUserDetailsService() {
        return new CustomUserDetailsService();
    }

    @Bean
    public AccessDeniedHandler createAccessDeniedHandler() {
        return new CustomAccessDeniedHandler();
    }


    private PersistentTokenRepository createJDBCRepository() {
        JdbcTokenRepositoryImpl repo = new JdbcTokenRepositoryImpl();
        repo.setDataSource(dataSource);

        return repo;
    }

}
