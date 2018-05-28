package com.blog.controller;

import com.blog.entity.Blog;
import com.blog.mapper.BlogMapper;
import com.github.pagehelper.PageHelper;
import io.swagger.annotations.*;
import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.http.MediaType;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.IOException;
import java.util.Date;

@RestController
@RequestMapping("/blog")
@Api(value = "API - BlogController", produces = MediaType.APPLICATION_JSON_UTF8_VALUE, description = "Blog博客控制类")
public class BlogController {
    @Autowired
    private BlogMapper blogMapper;

    @RequestMapping("/listPage")
    @ApiOperation(httpMethod = "POST", value = "分页查询Blog", notes = "分页查询Blog，每页默认10条，分页插件PageHelper")
    @ApiImplicitParam(name = "blog", value = "当前页数", required = true, dataType = "Blog")
    public Object listBlog(final Blog blog) {
        PageHelper.startPage(blog.getPageNum(), 10);
        return blogMapper.select(null);
    }

    @RequestMapping("/insert")
    @ApiOperation(httpMethod = "POST", value = "插入博客信息", notes = "插入博客信息，默认时间为当前时间")
    @ApiImplicitParam(name = "blog", value = "插入博客信息", required = true, dataType = "Blog")
    public int insert(Blog blog) {
        blog.setCreateTime(new Date());
        return blogMapper.insert(blog);
    }

    @RequestMapping("/detail")
    @ApiOperation(httpMethod = "POST", value = "查询博客详细信息", notes = "根据id查询博客信息")
    @ApiImplicitParam(name = "blog", value = "博客id", required = true, dataType = "Integer")
    //缓存得key，默认是传入得id
    @Cacheable(cacheNames = "blog")
    public Blog detail(Blog blog) {
        return blogMapper.selectOne(blog);
    }

    @RequestMapping(value = "/uploadfile", method = RequestMethod.POST)
    @ApiOperation(httpMethod = "POST", value = "markerdown图片上传，返回格式固定", notes = "图片存放地址为当前项目下的:static\\upload")
    @ApiImplicitParam(name = "attach,", value = "文件信息", required = false, dataType = "MultipartFile", paramType = "data")
    public void hello(HttpServletRequest request, HttpServletResponse response, @RequestParam(value = "editormd-image-file", required = false) MultipartFile attach) {
        try {
            request.setCharacterEncoding("utf-8");
            response.setHeader("Content-Type", "text/html");
            //String rootPath = request.getSession().getServletContext().getRealPath("/resources/static/");
            String rootPath = "C:\\xieyong\\github\\blog\\src\\main\\resources\\static\\upload\\";
            /**
             * 文件路径不存在则需要创建文件路径
             */
            File filePath = new File(rootPath);
            if (!filePath.exists()) {
                filePath.mkdirs();
            }
            //最终文件名
            File realFile = new File(rootPath + File.separator + attach.getOriginalFilename());
            FileUtils.copyInputStreamToFile(attach.getInputStream(), realFile);
            //下面response返回的json格式是editor.md所限制的，规范输出就OK
            response.getWriter().write("{\"success\": 1, \"message\":\"上传成功\",\"url\":\"static/upload/" + attach.getOriginalFilename() + "\"}");
        } catch (Exception e) {
            try {
                response.getWriter().write("{\"success\":0}");
            } catch (IOException e1) {
                e1.printStackTrace();
            }
        }
    }
}

