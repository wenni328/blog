package com.blog.base.utils.query;

import com.blog.base.utils.xss.SQLFilter;
import lombok.Data;

import java.util.LinkedHashMap;
import java.util.Map;


@Data
public class Query extends LinkedHashMap<String, Object> {
    private static final long serialVersionUID = 1L;
    //当前页码
    private int page;
    //每页条数
    private int limit;

    public Query(Map<String, Object> params) {
        this.putAll(params);

        //分页参数
        this.page = Integer.parseInt(params.get("page").toString());
        this.limit = Integer.parseInt(params.get("limit").toString());
        this.put("offset", (page - 1) * limit);
        this.put("page", page);
        this.put("limit", limit);

        //防止SQL注入（因为sidx、order是通过拼接SQL实现排序的，会有SQL注入风险）
        if (params.containsKey("sidx")) {
            String sidx = params.get("sidx").toString();
            this.put("sidx", SQLFilter.sqlInject(sidx));
        }
        if (params.containsKey("order")) {
            String order = params.get("order").toString();
            this.put("order", SQLFilter.sqlInject(order));
        }
    }


}
