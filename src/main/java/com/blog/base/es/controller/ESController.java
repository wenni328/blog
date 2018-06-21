package com.blog.base.es.controller;

import com.blog.base.es.service.BlogService;
import com.blog.entity.Blog;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

/**
 * es搜索引擎
 */
@Controller
@RequestMapping
public class ESController {

    @Autowired
    private BlogService blogService;

    @RequestMapping(value = "search")
    public List<Blog> search(Integer pageNumber, Integer pageSize, String searchContent) {
        return blogService.search(pageNumber, pageSize, searchContent);
    }
}
