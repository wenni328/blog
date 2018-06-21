package com.blog.base.redis;

import com.blog.base.es.service.BlogService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.core.StringRedisTemplate;
import org.springframework.stereotype.Controller;

@Controller
public class Redis {
    @Autowired
    private StringRedisTemplate redis;
    @Autowired
    private BlogService blogService;

    public void test() {
        if (redis.hasKey("xxx")) {
            redis.getExpire("xxx");
        } else {
            //jdbc get
        }
    }

}
