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
    <link rel="icon" type="image/png" href="static/assets/i/favicon.png">
    <meta name="mobile-web-app-capable" content="yes">
    <link rel="icon" sizes="192x192" href="static/assets/i/app-icon72x72@2x.png">
    <meta name="apple-mobile-web-app-capable" content="yes">
    <meta name="apple-mobile-web-app-status-bar-style" content="black">
    <meta name="apple-mobile-web-app-title" content="Amaze UI"/>
    <link rel="apple-touch-icon-precomposed" href="static/assets/i/app-icon72x72@2x.png">
    <meta name="msapplication-TileImage" content="static/assets/i/app-icon72x72@2x.png">
    <meta name="msapplication-TileColor" content="#0e90d2">
    <link rel="stylesheet" href="static/assets/css/amazeui.min.css">
    <link rel="stylesheet" href="static/assets/css/app.css">
    <link rel="stylesheet" href="static/md/css/editormd.css">

    <link rel="stylesheet" href="static/md/css/style.css">
    <link rel="stylesheet" href="static/layui/css/layui.css">
</head>
<style>
    #title {
        display: block;
        width: 100%;
        height: 40px;
        box-sizing: border-box;
        padding: 0 16px;
        border: none;
        background-color: #f4f4f4;
        font-size: 16px;
        color: #4f4f4f;
    }

    .btn-fabu {
        width: 88px;
        margin-left: 24px;
        background: #c92027;
        padding: 8px 0;
        font-size: 14px;
        color: #fff;
        border: none;
        border-radius: 4px;
    }

    .d-flex {
        display: -ms-flexbox !important;
        display: flex !important;
        padding: 0 0px;
        margin-bottom: 24px;
    }
</style>
<body id="blog">
<hr>
<!-- nav start -->
<nav class="am-g am-g-fixed blog-fixed blog-nav">
    <button class="am-topbar-btn am-topbar-toggle am-btn am-btn-sm am-btn-success am-show-sm-only blog-button"
            data-am-collapse="{target: '#blog-collapse'}"><span class="am-sr-only">导航切换</span> <span
            class="am-icon-bars"></span></button>

    <div class="am-collapse am-topbar-collapse" id="blog-collapse">
        <ul class="am-nav am-nav-pills am-topbar-nav">
            <li class="am-active"><a href="/">首页</a></li>
            <li><a href="markerdown">目录</a></li>
            <li><a href="lw-img.html">图片库</a></li>
            <li><a href="lw-article-fullwidth.html">全宽页面</a></li>
            <li><a href="lw-timeline.html">存档</a></li>
        </ul>
        <form class="am-topbar-form am-topbar-right am-form-inline" role="search">
            <div class="am-form-group">
                <input type="text" class="am-form-field am-input-sm" placeholder="搜索">
            </div>
        </form>
    </div>
</nav>
<hr>


<!-- content srart -->
<div class="am-g am-g-fixed blog-fixed">
    <div id="layout">
        <div class="title-box clearfix d-flex">
            <input type="text" id="title" class="input-file-title" maxlength="100" placeholder="输入文章标题">
            <button class="bg-red btn-fabu">发布博客</button>
        </div>
        <div id="test-editormd">
            <textarea class="editormd-markdown-textarea" name="test-editormd-markdown-doc"></textarea>
            <!-- 第二个隐藏文本域，用来构造生成的HTML代码，方便表单POST提交，这里的name可以任意取，后台接受时以这个name键为准 -->
            <textarea class="editormd-html-textarea" name="text"></textarea>
        </div>
    </div>

</div>
<!-- content end -->


<!--[if (gte IE 9)|!(IE)]><!-->
<script src="static/assets/js/jquery.min.js"></script>
<script src="static/md/js/editormd.js"></script>
<script src="static/layui/layui.js"></script>
<script>

    $(function () {
        testEditor = editormd("test-editormd", {
            width: "100%",
            height: 640,
            syncScrolling: "single",
            path: "static/md/js/lib/",
            saveHTMLToTextarea: true, //开启保存HTML文件
            htmlDecode: "iframe,pre",
            codeFold: true,
            imageUpload: true,
            imageFormats: ["jpg", "jpeg", "gif", "png", "bmp", "webp"],
            imageUploadURL: "blog/uploadfile",
            onload: function () {
                console.log('onload', this);
            },
            toolbarIcons: function () {
                return [
                    "undo", "redo", "|",
                    "bold", "del", "italic", "quote", "|",
                    "h1", "h2", "h3", "|",
                    "list-ul", "list-ol", "hr", "|",
                    "link", "reference-link", "image", "code", "preformatted-text", "code-block", "table", "datetime", "html-entities", "|",
                    "watch", "preview", "fullscreen", "|", "testIcon2"
                ];
            },
            toolbarIconsClass: {
                testIcon: "发布"  // 指定一个FontAawsome的图标类
            },
            toolbarIconTexts: {
                testIcon2: "发布"  // 如果没有图标，则可以这样直接插入内容，可以是字符串或HTML标签
            },
            toolbarHandlers: {
                testIcon2: function (cm, icon, cursor, selection) {
                    console.log($(".editormd-html-textarea").val());
                    console.log($(".editormd-markdown-textarea").val());
                }
            }
        });
    });
    var la='';
    $.getJSON("types/",{},function(msg){
        var layerHtml = '';
        /*弹框*/
        layerHtml+='<form class="layui-form" action="">\n' +
                '    <div clasvars="layui-form-item">\n' +
                '        <label class="layui-form-label" style="padding-top: 40px;width: 100px;">文章标签</label>\n' +
                '        <div class="layui-input-block" style="padding-right: 50px;padding-top: 30px;">\n' +
                '            <input name="number" id="mark" class="layui-input" placeholder="文章标签空格隔开">\n' +
                '        </div>\n' +
                '    </div>\n' +
                '    <div class="layui-form-item">\n' +
                '        <label class="layui-form-label" style="padding-top: 40px;width: 100px;">个人分类</label>\n' +
                '        <div class="layui-input-block" style="height: 200px;padding-top: 30px;overflow: auto;float: left;margin-left: 10px;">\n';


                 //<button class="layui-btn layui-btn-sm layui-btn-radius" onclick="addType()">添加分类</button>
        $.each(msg, function (index, value) {
            layerHtml+='<input type="checkbox" class="typeName" name="types" value="'+value.id+'" title="'+value.name+'">';
        });
        la=layerHtml;
        la+='</div>\n' +
                '    </div>\n' +
                '</form>';
    });
    layui.use(['layer','form'], function(){
        var layer = layui.layer,form = layui.form,
        $=layui.$;
        $(".btn-fabu").click(function () {
            if ($("#title").val() == null) {
                return "标题不能为空";
            }
            layer.open({
                type: 1 //Page层类型
                , area: ['800px', '500px']
                , title: '发布博客'
                , shade: 0.6 //遮罩透明度
                , maxmin: true //允许全屏最小化
                ,shadeClose: true //点击遮罩关闭
                , anim: 1 //0-6的动画形式，-1不开启
                , content: la
                , btn: ['确定发布','取消']
                ,btnAlign: 'c'
                , yes: function(index, layero){
                    var data={};
                    data['title']=$("#title").val();
                    data['content']=$(".editormd-markdown-textarea").val();
                    data['mark']=$("#mark").val();
                    var types='';
                    $("input:checkbox[name='types']:checked").each(function() { // 遍历name=standard的多选框
                        types += ',' + $(this).val();
                        //types += ',' + $(this).attr('title');
                    });
                   data['sorts']=types;
                    $.post("blog/save",data,function(msg){
                      if (msg.code==200){
                          layer.msg("发布成功");
                      }
                    });
                    layer.close(index); //如果设定了yes回调，需进行手工关闭
                }
            });
            form.render();
        });
    });

</script>

</body>
</html>