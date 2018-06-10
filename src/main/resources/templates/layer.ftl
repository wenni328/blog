<form class="layui-form" action="">
    <div class="layui-form-item">
        <label class="layui-form-label" style="padding-top: 40px;">文章标签</label>
        <div class="layui-input-block" style="padding-right: 50px;padding-top: 30px;">
            <input name="number" class="layui-input" placeholder="文章标签空格隔开">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">个人分类</label>
        <div class="layui-input-block" style="height: 200px;overflow: auto">
            <button class="layui-btn layui-btn-sm layui-btn-radius" id="addType">添加分类</button>
            <input type="checkbox" class="typeName" name="like[write]" title="写作">
            <input type="checkbox" class="typeName" name="like[read]" title="阅你好读">
            <input type="checkbox" class="typeName" name="like[game]" title="游戏">
            <input type="checkbox" class="typeName" name="like[write]" title="写作">
            <input type="checkbox" class="typeName" name="like[read]" title="阅读">
            <input type="checkbox" class="typeName" name="like[game]" title="游戏">
        </div>
    </div>
</form>

<link rel="stylesheet" href="static/layui/css/layui.css">

<script src="static/layui/layui.js"></script>
<script>

    layui.use(['layer','form'], function() {
        var layer = layui.layer, form = layui.form;
  form.render();
    });
</script>