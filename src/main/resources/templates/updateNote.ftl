<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=0">
  <title>Document</title>
  <link rel="stylesheet" type="text/css" href="../static/layui/css/layui.css">
  <link rel="stylesheet" type="text/css" href="../static/css/main.css">
    <script type="text/javascript" src="../static/js/jquery-1.11.1.js"></script>
    <script type="text/javascript" src="../static/layui/layui.js"></script>
<script type="text/javascript">
    function submitFunction() {
        //这里唯一需要注意的就是这个form-add的id
        var formData = new FormData($("#form-add")[0]);
        $.ajax({
        //接口地址
        url: '/updateBody' ,
            type: 'POST',
            data: formData,
            async: false,
            cache: false,
            contentType: false,
            processData: false,
            success: function (data) {
                alert(data);
            //成功的回调
                if(data == 1){
                    alert("修改成功");
                    modals.warn("提交成功");
                }
                },
            error: function (returndata) {
            //请求异常的回调
                alert("修改失败");
                modals.warn("网络访问失败，请稍后重试!");
        }
        });
    }
</script>
</head>
<body>
  <div class="header">
    <div class="menu-btn">
      <div class="menu"></div>
    </div>
    <h1 class="logo">
      <a href="note_m.ftl">
        <span>MYBLOG</span>
        <img src="../static/img/logo.png">
      </a>
    </h1>
    <div class="nav">
      <a href="note_m.ftl">文章</a>
      <a href="whisper.html">微语</a>
      <a href="addNote.ftl" class="active">留言</a>
      <a href="album.html">相册</a>
      <a href="about.html">关于</a>
    </div>
    <ul class="layui-nav header-down-nav">
      <li class="layui-nav-item"><a href="note_m.ftl">文章</a></li>
      <li class="layui-nav-item"><a href="whisper.html">微语</a></li>
      <li class="layui-nav-item"><a href="addNote.ftl" class="active">留言</a></li>
      <li class="layui-nav-item"><a href="album.html">相册</a></li>
      <li class="layui-nav-item"><a href="about.html">关于</a></li>
    </ul>
    <p class="welcome-text">
      欢迎来到<span class="name">小明</span>的博客~
    </p>
  </div>
  <div class="content whisper-content leacots-content">
    <div class="cont w1000">
      <div class="whisper-list">
        <div class="item-box">
          <div class="review-version">
              <div class="form-box">
                <img class="banner-img" src="../static/img/liuyan.jpg">
                <div class="form"></div>
                <div class="layui-form">
                    <form class="layui-form" id="form-add" >
                        <div class="layui-form-item">
                            <input type="hidden" name="noteId" value="${notes.noteId}"/>
                            <input type="hidden" name="noteTitleImg" value="${notes.noteTitleImg}"/>
                            <label class="layui-form-label">标题:</label>
                            <div class="layui-input-block">
                                <input type="text" name="noteTitle" required  lay-verify="required" value="${notes.noteTitle}" autocomplete="off" class="layui-input">
                            </div>
                        </div>
                        <div class="layui-form-item">
                            <div class="layui-input-block">
                                标题图片:<input  type="file"  name="titleImg" class="layui-btn"/>
                                <img alt="" src="${notes.noteTitleImg}">
                            </div>
                        </div>

                        <div class="layui-form-item">
                        <div class="layui-inline">
                            <label class="layui-form-label">时间:</label>
                            <div class="layui-input-inline">
                                <input type="text" name="noteTime" class="layui-input" id="test11" value="${notes.noteTime?string('yyyy-MM-dd')}">
                            </div>

                            <script>
                                layui.use('laydate', function(){
                                    var laydate = layui.laydate;

                                    //执行一个laydate实例
                                    laydate.render({
                                        elem: '#test11' //指定元素
                                    });
                                });
                            </script>
                        </div>
                        </div>
                        <div class="layui-form-item">
                            <label class="layui-form-label">类别:</label>
                            <div class="layui-input-block">
                                <select name="noteType"  lay-verify="required">
                                    <option value="${notes.noteType}"></option>
                                    <option value=""></option>
                                    <option value="0"></option>
                                    <option value="java">JAVA</option>
                                    <option value="j2ee">J2EE</option>
                                    <option value="html">HTML</option>
                                    <option value="Python">Python</option>
                                    <option value="mysql">Sql</option>
                                    <option value="linux">Linux</option>
                                    <option value="other">其他</option>
                                </select>
                            </div>
                        </div>
                        <div class="layui-form-item">
                            <label class="layui-form-label">来源:</label>
                            <div class="layui-input-block">
                                <input type="radio" name="noteSource" value="本地" <#if notes.noteSource =='本地'>checked</#if> title="本地">
                                <input type="radio" name="noteSource" value="网络" <#if notes.noteSource =='网络'>checked</#if>  title="网络">
                            </div>
                        </div>
                        <script>
                            alert(${notes.noteBody});
                            document.getElementById("#noteBody").value=${notes.noteBody};
                        </script>
                        <div class="layui-form-item layui-form-text">
                            <label class="layui-form-label">文本域</label>
                            <div class="layui-input-block">
                                <textarea cols="140" rows="7" name="noteBody">${notes.noteBody}</textarea>
                            </div>
                        </div>
                        <div class="layui-form-item">
                            <div class="layui-input-block">
                                <button type="button"  onclick="submitFunction()" class="layui-btn" >立即提交</button>
                            </div>
                        </div>
                    </form>
                </div>
              </div>

          </div>
        </div>
      </div>
    </div>
  </div>


  <div class="footer-wrap">
    <div class="footer w1000">
      <div class="qrcode">
        <img src="../static/img/erweima.jpg">
      </div>
      <div class="practice-mode">
        <img src="../static/img/down_img.jpg">
        <div class="text">
          <h4 class="title">我的联系方式</h4>
          <p>微信<span class="WeChat">1234567890</span></p>
          <p>手机<span class="iphone">1234567890</span></p>
          <p>邮箱<span class="email">1234567890@qq.com</span></p>
        </div>
      </div>
    </div>
  </div>

  <script type="text/javascript">
   layui.config({base: '../static/js/util/'}).use(['element','laypage','form','menu'],
           function(){
      element = layui.element,laypage = layui.laypage,form = layui.form,menu = layui.menu;
      laypage.render({
        elem: 'demo'
        ,count: 70 //数据总数，从服务端得到
      });
      menu.init();
      menu.submit()
    })
  </script>
</body>
</html>