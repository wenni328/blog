# Blog Demo项目
前端采用：freemarker+amaze+layui+editormd(一个markerdown插件)


后端采用：springboot+通用mapper+pagehelper分页插件+hikari连接池+mysql

配置文件：
application.yml
```
server:
  port: 8080
  #数据库连接
spring:
  datasource:
    url: jdbc:mysql://127.0.0.1:3306/blog?useUnicode=true&characterEncoding=UTF-8&serverTimezone=GMT%2B8&useSSL=false
    driver-class-name: com.mysql.jdbc.Driver
    type: com.zaxxer.hikari.HikariDataSource
    hikari:
      minimum-idle: 5
      maximum-pool-size: 15
      auto-commit: true
      idle-timeout: 30000
      pool-name: DatebookHikariCP
      max-lifetime: 1800000
      connection-timeout: 30000
      connection-test-query: SELECT 1
      username: root
      password: root
      #freemarker配置

  mvc:
    static-path-pattern: /static/**
  freemarker:
    cache: true
    charset: utf-8
    check-template-location: true
    content-type: text/html
    expose-request-attributes: false
    expose-session-attributes: false
    request-context-attribute: request

#下面这句不加的话http://localhost:8080/swagger-ui.html访问报错404
  resources:
    static-locations: classpath:/static/
mybatis:
  type-aliases-package: com.blog.entity
  mapper-locations: classpath*:mapper/*.xml
  configuration:
    log-impl: org.apache.ibatis.logging.stdout.StdOutImpl

mapper:
  mappers: com.blog.base.FlyMapper
  identity: MYSQL
  not-empty: false
pagehelper:
  reasonable: true
  auto-dialect: true
  offset-as-page-num: true
  row-bounds-with-count: true
  helper-dialect: mysql

```
**页面效果**
![这里写图片描述](https://img-blog.csdn.net/20180610000812784?watermark/2/text/aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L3FxXzI2MTE4NjAz/font/5a6L5L2T/fontsize/400/fill/I0JBQkFCMA==/dissolve/70)

![这里写图片描述](https://img-blog.csdn.net/20180610001121231?watermark/2/text/aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L3FxXzI2MTE4NjAz/font/5a6L5L2T/fontsize/400/fill/I0JBQkFCMA==/dissolve/70)

![这里写图片描述](https://img-blog.csdn.net/2018061000115870?watermark/2/text/aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L3FxXzI2MTE4NjAz/font/5a6L5L2T/fontsize/400/fill/I0JBQkFCMA==/dissolve/70)
