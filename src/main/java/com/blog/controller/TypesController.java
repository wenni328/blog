package com.blog.controller;

import com.blog.base.Responce;
import com.blog.entity.Types;
import com.blog.mapper.TypesMapper;
import io.swagger.annotations.ApiImplicitParam;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("types")
public class TypesController {
    @Autowired
    private TypesMapper typesMapper;

    @GetMapping(value = "/")
    @ApiOperation(httpMethod = "GET", value = "获取博客分类列表", notes = "博客分类")
    public List<Types> getTypeList() {
        return typesMapper.selectAll();
    }

    @PostMapping(value = "/save")
    @ApiOperation(httpMethod = "POST", value = "添加类型", notes = "博客类型添加")
    @ApiImplicitParam(name = "types,", value = "博客实体", required = true, dataType = "com.blog.entity.Types", paramType = "types")
    public Responce get(final Types types) {
        typesMapper.insert(types);
        return Responce.ok("添加成功");
    }
}
