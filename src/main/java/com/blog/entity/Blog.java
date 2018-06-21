package com.blog.entity;

import com.fasterxml.jackson.annotation.JsonFormat;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;
import org.springframework.data.elasticsearch.annotations.Document;
import org.springframework.format.annotation.DateTimeFormat;

import javax.persistence.Column;
import javax.persistence.Transient;
import java.io.Serializable;
import java.util.Date;

@Data
@ApiModel
@Document(indexName = "blog", type = "blog")
public class Blog implements Serializable {


    private Integer id;

    private String title;

    private String author;
    @Column(name = "authorId")
    private Integer authorId;

    private String content;

    private String html;

    @Column(name = "createTime")
    @ApiModelProperty(value = "创建时间")
    @DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss", timezone = "GMT+8")
    private Date createTime;

    private String mark;
    @Column(name = "sorts")
    private String sorts;

    private String picture;
    @Transient
    private Integer pageNum;

}
