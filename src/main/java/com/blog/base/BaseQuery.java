package com.blog.base;

import lombok.Data;

import java.io.Serializable;

@Data
public class BaseQuery implements Serializable {

    /**
     * 当前页
     */
    private Integer pageNum = 1;

    /**
     * 每页条数
     */
    private Integer pageSize = 10;

}
