package com.kelvin.joyinternetcafe;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

@SpringBootApplication
@MapperScan("com.kelvin.joyinternetcafe.mapper")
public class JoyinternetcafeApplication {

    public static void main(String[] args) {
        SpringApplication.run(JoyinternetcafeApplication.class, args);
    }

}
