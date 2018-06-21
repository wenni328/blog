package com.blog.base.es.service.impl;


import com.blog.base.es.dao.BlogRepository;
import com.blog.base.es.service.BlogService;
import com.blog.entity.Blog;
import lombok.extern.slf4j.Slf4j;
import org.elasticsearch.index.query.QueryBuilder;
import org.elasticsearch.index.query.QueryBuilders;
import org.elasticsearch.index.query.functionscore.FunctionScoreQueryBuilder;
import org.elasticsearch.index.query.functionscore.ScoreFunctionBuilders;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.elasticsearch.core.query.NativeSearchQueryBuilder;
import org.springframework.data.elasticsearch.core.query.SearchQuery;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
@Slf4j
public class BlogServiceImpl implements BlogService {

    @Autowired
    private BlogRepository blogRepository;

    @Override
    public void save(Blog Blog) {
        // TODO Auto-generated method stub
        blogRepository.save(Blog);
    }

    @Override
    public void delete(Blog Blog) {
        // TODO Auto-generated method stub
        blogRepository.delete(Blog);
    }

    @Override
    public Optional findOne(Integer id) {
        // TODO Auto-generated method stub
        return blogRepository.findById(id);
    }

    @Override
    public Iterable<Blog> findAll() {
        // TODO Auto-generated method stub
        return blogRepository.findAll();
    }

    @Override
    public Page<Blog> findAll(Pageable pageable) {
        // TODO Auto-generated method stub
        return blogRepository.findAll(pageable);
    }

    @Override
    public List<Blog> findByTitle(String title) {
        // TODO Auto-generated method stub
        return blogRepository.findByTitle(title);
    }

    @Override
    public Page<Blog> findByTitle(String title, Pageable pageable) {
        // TODO Auto-generated method stub
        return blogRepository.findByTitle(title, pageable);
    }

    /**
     * elasticsearch 查询
     *
     * @param pageNumber
     * @param pageSize
     * @param searchContent
     * @return
     */
    @Override
    public List<Blog> search(Integer pageNumber, Integer pageSize, String searchContent) {
        // 分页参数
        Pageable pageable = new PageRequest(pageNumber, pageSize);

        // Function Score Query-----权重查询
        FunctionScoreQueryBuilder functionScoreQueryBuilder = QueryBuilders.functionScoreQuery(QueryBuilders.boolQuery().should(QueryBuilders.matchQuery("title", searchContent)),
                ScoreFunctionBuilders.weightFactorFunction(1000));

        QueryBuilder functionScoreQueryBuilder2 = QueryBuilders.
                multiMatchQuery(searchContent, "title", "author", "content", "html");//"title","author","content","html"匹配到searchContent

        //.add(QueryBuilders.boolQuery().should(QueryBuilders.matchQuery("author", searchContent)),
        //		ScoreFunctionBuilders.weightFactorFunction(100));

        // 创建搜索 DSL 查询
        SearchQuery searchQuery = new NativeSearchQueryBuilder()
                .withPageable(pageable)
                .withQuery(functionScoreQueryBuilder2).build();

        log.info("\n searchCity(): searchContent [" + searchContent + "] \n DSL  = \n " + searchQuery.getQuery().toString());

        Page<Blog> searchPageResults = blogRepository.search(searchQuery);
        return searchPageResults.getContent();
    }

}
