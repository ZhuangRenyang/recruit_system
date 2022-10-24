package com.recruit;

import com.recruit.common.LocalUser;
import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cache.annotation.EnableCaching;
import org.springframework.scheduling.annotation.EnableAsync;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.socket.config.annotation.EnableWebSocket;

@RestController
@MapperScan(basePackages = {"com.recruit.mapper"})
@SpringBootApplication(scanBasePackages={"com.recruit.*"})
// 启动redis缓存服务
@EnableCaching
// 启动异步服务
@EnableAsync
@EnableWebSocket
public class RecruitApplication {

    public static void main(String[] args) {
        SpringApplication.run(RecruitApplication.class, args);
        LocalUser.clearLocalUser();
    }

    @RequestMapping("/")
    public String index() {
        return "<style type=\"text/css\">*{ padding: 0; margin: 0; } div{ padding: 4px 48px;} a{color:#2E5CD5;cursor:" +
                "pointer;text-decoration: none} a:hover{text-decoration:underline; } body{ background: #fff; font-family:" +
                "\"Century Gothic\",\"Microsoft yahei\"; color: #333;font-size:18px;} h1{ font-size: 100px; font-weight: normal;" +
                "margin-bottom: 12px; } p{ line-height: 1.6em; font-size: 42px }</style><div style=\"padding: 24px 48px;\"><p>" +
                "<span style=\"font-size:30px\">再小的帆也能远航！</span></p></div> ";
    }
}
