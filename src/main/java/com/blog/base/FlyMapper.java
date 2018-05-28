package com.blog.base;

import org.springframework.stereotype.Repository;
import tk.mybatis.mapper.common.Mapper;
import tk.mybatis.mapper.common.MySqlMapper;

@Repository
public interface FlyMapper<T> extends Mapper<T>, MySqlMapper<T> {

}
