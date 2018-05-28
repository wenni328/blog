package com.blog.entity;

import lombok.Data;

import javax.persistence.Column;
import java.io.Serializable;
import java.util.Date;

@Data
public class Users implements Serializable {
    private Integer id;
    private String username;
    private String password;
    @Column(name = "createTime")
    private Date createTime;

}
