package com.example.imageshop;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

@SpringBootApplication
@MapperScan(basePackages = "com.example.imageshop.mapper")
public class ImageshopApplication {

    public static void main(String[] args) {
        SpringApplication.run(ImageshopApplication.class, args);
    }

}
