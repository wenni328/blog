package com.blog.controller;

import com.blog.base.Responce;
import com.blog.entity.Blog;
import com.blog.entity.Types;
import com.blog.mapper.TypesMapper;
import io.swagger.annotations.ApiImplicitParam;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@RequestMapping("types")
public class TypesController {
    @Autowired
    private TypesMapper typesMapper;

    @RequestMapping(value = "/", method = RequestMethod.GET)
    @ApiOperation(httpMethod = "GET", value = "获取博客分类列表", notes = "博客分类")
    public List<Types> getTypeList() {
        return typesMapper.selectAll();
    }

    @RequestMapping(value = "/save", method = RequestMethod.POST)
    @ApiOperation(httpMethod = "POST", value = "添加类型", notes = "博客类型添加")
    @ApiImplicitParam(name = "types,", value = "博客实体", required = true, dataType = "com.blog.entity.Types", paramType = "types")
    public Responce get(final Types types){
        typesMapper.insert(types);
        return Responce.ok("添加成功");
    }
}
