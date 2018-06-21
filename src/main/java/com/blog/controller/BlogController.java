package com.blog.controller;

import com.blog.base.Responce;
import com.blog.base.utils.images.RandomImagesUtils;
import com.blog.base.utils.layui.Layui;
import com.blog.entity.Blog;
import com.blog.mapper.BlogMapper;
import com.github.pagehelper.PageHelper;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiImplicitParam;
import io.swagger.annotations.ApiOperation;
import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.IOException;
import java.util.Date;
import java.util.List;

@Controller
@RequestMapping("/blog")
@Api(value = "API - BlogController", produces = MediaType.APPLICATION_JSON_UTF8_VALUE, description = "Blog博客控制类")
public class BlogController {
    @Autowired
    private BlogMapper blogMapper;

    @RequestMapping(value = "blog", method = RequestMethod.POST)
    @ResponseBody
    @ApiOperation(httpMethod = "POST", value = "分页查询Blog", notes = "分页查询Blog，每页默认10条，分页插件PageHelper")
    @ApiImplicitParam(name = "blog", value = "当前页数", required = true, dataType = "Blog")
    public Layui listBlog(final Blog blog) {
        int total = blogMapper.select(blog).size();
        PageHelper.startPage(blog.getPageNum(), 5);
        List<Blog> result = blogMapper.select(blog);
        return Layui.data(total, result);
    }

    @RequestMapping(value = "/save", method = RequestMethod.POST)
    @ResponseBody
    @ApiOperation(httpMethod = "POST", value = "插入博客信息", notes = "插入博客信息，默认时间为当前时间")
    @ApiImplicitParam(name = "blog", value = "插入博客信息", required = true, dataType = "Blog")
    public Responce insert(Blog blog) {
        blog.setCreateTime(new Date());
        blog.setAuthor("谢勇");
        blog.setPicture(RandomImagesUtils.getImage());
        blogMapper.insert(blog);
        return Responce.ok();
    }

    @RequestMapping(value = "/detail", method = RequestMethod.GET)
    @ApiOperation(httpMethod = "GET", value = "查询博客详细信息", notes = "根据id查询博客信息")
    @ApiImplicitParam(name = "id", value = "博客id", required = true, dataType = "Integer")
    public String detail(Integer id, Model model) {
        Blog blog = new Blog();
        blog.setId(id);
        model.addAttribute("blog", blogMapper.selectOne(blog));
        return "detail";
    }

    @RequestMapping(value = "/uploadfile", method = RequestMethod.POST)
    @ResponseBody
    @ApiOperation(httpMethod = "POST", value = "markerdown图片上传，返回格式固定", notes = "图片存放地址为当前项目下的:static\\upload")
    @ApiImplicitParam(name = "attach,", value = "文件信息", required = false, dataType = "MultipartFile", paramType = "data")
    public void hello(HttpServletRequest request, HttpServletResponse response, @RequestParam(value = "editormd-images-file", required = false) MultipartFile attach) {
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

