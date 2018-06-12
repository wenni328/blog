<!doctype html>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="description" content="">
    <meta name="keywords" content="">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
    <title>BLOG index with sidebar & slider | Amaze UI Examples</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="Cache-Control" content="no-siteapp"/>
    <link rel="icon" type="image/png" href="../static/assets/i/favicon.png">
    <meta name="mobile-web-app-capable" content="yes">
    <link rel="icon" sizes="192x192" href="../static/assets/i/app-icon72x72@2x.png">
    <meta name="apple-mobile-web-app-capable" content="yes">
    <meta name="apple-mobile-web-app-status-bar-style" content="black">
    <meta name="apple-mobile-web-app-title" content="Amaze UI"/>
    <link rel="apple-touch-icon-precomposed" href="../static/assets/i/app-icon72x72@2x.png">
    <meta name="msapplication-TileImage" content="../static/assets/i/app-icon72x72@2x.png">
    <meta name="msapplication-TileColor" content="#0e90d2">
    <link rel="stylesheet" href="../static/assets/css/amazeui.min.css">
    <link rel="stylesheet" href="../static/assets/css/app.css">
</head>

<body id="blog">
<#include "head.ftl">
<#--<#include "img.ftl">-->

<!-- content srart -->
<div class="am-g am-g-fixed blog-fixed blog-content" style="max-width: 1000px;">
    <div class="am-u-sm-12" style="border: 1px solid #dedede;">
        <article class="am-article blog-article-p">
            <div class="am-article-hd">
                <h1 class="am-article-title blog-text-center">${blog.title}</h1>
                <p class="am-article-meta blog-text-center">
                    <span><a href="detail?id=${blog.id}" class="blog-color">编辑文章</a></span>-
                    <span><a href="#">${blog.author} &nbsp;</a></span>-
                    <span><a href="#">${blog.createTime?string('yyyy-MM-dd hh:mm:ss')}<#--${blog.createTime}--></a></span>
                </p>
            </div>
            <div class="am-article-bd">
                <p class="am-article-lead">
                ${blog.html}
                </p>
            </div>
        </article>

        <div class="am-g blog-article-widget blog-article-margin">
            <div class="am-u-lg-4 am-u-md-5 am-u-sm-7 am-u-sm-centered blog-text-center">
                <span class="am-icon-tags"> &nbsp;</span><a href="#">标签</a> , <a href="#">TAG</a> , <a href="#">啦啦</a>
                <hr>
                <a href=""><span class="am-icon-qq am-icon-fw am-primary blog-icon"></span></a>
                <a href=""><span class="am-icon-wechat am-icon-fw blog-icon"></span></a>
                <a href=""><span class="am-icon-weibo am-icon-fw blog-icon"></span></a>
            </div>
        </div>

        <hr>
        <div class="am-g blog-author blog-article-margin">
            <div class="am-u-sm-3 am-u-md-3 am-u-lg-2">
                <img src="assets/i/f15.jpg" alt="" class="blog-author-img am-circle">
            </div>
            <div class="am-u-sm-9 am-u-md-9 am-u-lg-10">
                <h3><span>作者 &nbsp;: &nbsp;</span><span class="blog-color">amazeui</span></h3>
                <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.</p>
            </div>
        </div>
    </div>
</div>
<!-- content end -->


<footer class="blog-footer">
    <div class="am-g am-g-fixed blog-fixed am-u-sm-centered blog-footer-padding">
        <div class="am-u-sm-12 am-u-md-4- am-u-lg-4">
            <h3>模板简介</h3>
            <p class="am-text-sm">这是一个使用amazeUI做的简单的前端模板。<br> 博客/ 资讯类 前端模板 <br> 支持响应式，多种布局，包括主页、文章页、媒体页、分类页等<br>嗯嗯嗯，不知道说啥了。外面的世界真精彩<br><br>
                Amaze UI 使用 MIT 许可证发布，用户可以自由使用、复制、修改、合并、出版发行、散布、再授权及贩售 Amaze UI 及其副本。</p>
        </div>
        <div class="am-u-sm-12 am-u-md-4- am-u-lg-4">
            <h3>社交账号</h3>
            <p>
                <a href=""><span class="am-icon-qq am-icon-fw am-primary blog-icon blog-icon"></span></a>
                <a href=""><span class="am-icon-github am-icon-fw blog-icon blog-icon"></span></a>
                <a href=""><span class="am-icon-weibo am-icon-fw blog-icon blog-icon"></span></a>
                <a href=""><span class="am-icon-reddit am-icon-fw blog-icon blog-icon"></span></a>
                <a href=""><span class="am-icon-weixin am-icon-fw blog-icon blog-icon"></span></a>
            </p>
            <h3>Credits</h3>
            <p>我们追求卓越，然时间、经验、能力有限。Amaze UI 有很多不足的地方，希望大家包容、不吝赐教，给我们提意见、建议。感谢你们！</p>
        </div>
        <div class="am-u-sm-12 am-u-md-4- am-u-lg-4">
            <h1>我们站在巨人的肩膀上</h1>
            <h3>Heroes</h3>
            <p>
            <ul>
                <li>jQuery</li>
                <li>Zepto.js</li>
                <li>Seajs</li>
                <li>LESS</li>
                <li>...</li>
            </ul>
            </p>
        </div>
    </div>
    <div class="blog-text-center">© 2015 AllMobilize, Inc. Licensed under MIT license. Made with love By LWXYFER</div>
</footer>


<!--[if (gte IE 9)|!(IE)]><!-->
<script src="../static/assets/js/jquery.min.js"></script>
<!--<![endif]-->
<!--[if lte IE 8 ]>
<script src="http://libs.baidu.com/jquery/1.11.3/jquery.min.js"></script>
<script src="http://cdn.staticfile.org/modernizr/2.8.3/modernizr.js"></script>
<script src="../static/assets/js/amazeui.ie8polyfill.min.js"></script>
<![endif]-->
<script src="../static/assets/js/amazeui.min.js"></script>



</body>
</html>