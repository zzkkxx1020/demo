<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>笔记列表显示</title>
    <script src="static/js/jquery-1.11.1.min.js"></script>
<script>
    function del(id){
        alert(id);

        $.post( "note/del", //调用的方法
                {"id" : id}, //传递参数，
                function(data){ if(data){ alert("删除成功") }else{ alert("删除失败") } },
                "json"
        );
    }
</script>
</head>
<body>
<table>
    <tr>
        <td></td>
    </tr>
    <tr>
        <td>标题</td>
        <td>来源</td>
        <td>时间</td>
        <td>类型</td>
    </tr>
<#list notes as note>
    <tr>
        <td>${note.noteTitle}</td>

        <td>${note.noteSource}</td>
        <td>${(note.noteTime?string("yyyy-MM-dd"))!}</td>
        <td>${note.noteType}</td>
    </tr>
    <tr>
        <td>
            <a href="/update/${note.noteId}">修改</a>
        </td>
        <td>
            <button onclick="del('${note.noteId}')">删除</button>
        </td>
    </tr>
</#list>
</table>
</body>
</html>