package com.blog.base.es.dao;

import com.blog.entity.Blog;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.elasticsearch.repository.ElasticsearchRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface BlogRepository extends ElasticsearchRepository<Blog, Integer> {

    /**
     * 根据标题查看文档
     *
     * @param title
     * @return
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
}
