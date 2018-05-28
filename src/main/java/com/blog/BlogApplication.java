package com.blog;

import lombok.extern.slf4j.Slf4j;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cache.annotation.EnableCaching;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import springfox.documentation.swagger2.annotations.EnableSwagger2;
import tk.mybatis.spring.annotation.MapperScan;

@SpringBootApplication
@Slf4j
@MapperScan("com.blog.mapper")
@EnableSwagger2
@Controller
@EnableCaching
public class BlogApplication {

    public static void main(String[] args) {
        SpringApplication.run(BlogApplication.class, args);
    }

    @RequestMapping(value = {"index", "/"})
    public String get(/*@PathVariable String path*/) {
        //log.debug("进入页面："+path+".ftl");
        return "index";
    }

    @RequestMapping("/markerdown")
    public String markerdown(/*@PathVariable String path*/) {
        //log.debug("进入页面："+path+".ftl");
        return "markerdown";
    }
}
