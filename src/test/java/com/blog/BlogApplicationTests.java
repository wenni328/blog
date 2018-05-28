package com.blog;

import lombok.extern.slf4j.Slf4j;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;

@RunWith(SpringRunner.class)
@SpringBootTest
@Slf4j
public class BlogApplicationTests {


    @Test
    public void contextLoads() {
        log.trace("I am trace log.");
        log.debug("I am debug log.");
        log.warn("I am warn log.");
        log.error("I am error log.");
    }
}
