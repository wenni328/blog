package com.blog.base.utils.xss;

import org.springframework.util.StringUtils;

/** 
* @ClassName: SQLFilter 
* @Description: xss为非法字符串跨脚本攻击
* @author lx
* @date 2018年2月7日 下午2:29:48 
*  
*/

public class SQLFilter {


	 /**
     * SQL注入过滤
     * @param str  待验证的字符串
     */
    public static String sqlInject(String str){
        if(StringUtils.isEmpty(str)){
            return null;
        }
        //去掉'|"|;|\字符
        str = StringUtils.replace(str, "'", "");
        str = StringUtils.replace(str, "\"", "");
        str = StringUtils.replace(str, ";", "");
        str = StringUtils.replace(str, "\\", "");

        //转换成小写
        str = str.toLowerCase();

        //非法字符
        String[] keywords = {"master", "truncate", "insert", "select", "delete", "update", "declare", "alert", "create", "drop"};

        //判断是否包含非法字符
        for(String keyword : keywords){
            if(str.contains(keyword)){
               System.out.println("包含非法字符");
            }
        }

        return str;
    }
}
