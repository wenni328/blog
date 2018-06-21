package com.blog.base.es.service;

import com.blog.entity.Blog;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import java.util.List;
import java.util.Optional;

public interface BlogService {
    /**
     * 文档保存的方法
     *
     * @param Blog 文档对象
     */
    void save(Blog Blog);

    /**
     * 文档删除的方法
     *
     * @param Blog 文档对象
     */
    void delete(Blog Blog);

    /**
     * 根据id查找文档的方法
     *
     * @param id 文档id
     * @return 查找到的文档对象
     */
    Optional findOne(Integer id);

    /**
     * 查找所有的文档
     *
     * @return 文档的迭代器
     */
    Iterable<Blog> findAll();

    /**
     * 分页显示所有文档
     *
     * @param pageable 分页对象
     * @return 文档的分页数据
     */
    Page<Blog> findAll(Pageable pageable);

    /**
     * 根据标题查找文档
     *
     * @param title 文档标题
     * @return 文档集合
     */
    List<Blog> findByTitle(String title);

    /**
     * 根据标题查找文档分页数据
     *
     * @param title    文档标题
     * @param pageable 分页对象
     * @return 文档的分页数据
     */
    Page<Blog> findByTitle(String title, Pageable pageable);

    List<Blog> search(Integer pageNumber,
                      Integer pageSize,
                      String searchContent);
}
