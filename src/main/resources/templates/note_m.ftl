<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=0">
  <title>Document</title>
  <link rel="stylesheet" type="text/css" href="../static/layui/css/layui.css">
  <link rel="stylesheet" type="text/css" href="../static/css/main.css">
<!--加载meta IE兼容文件-->
<!--[if lt IE 9]>
<script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
<script src="https://oss.maxcdn.com/libs/respond.js/1.3.0/respond.min.js"></script>
<![endif]-->
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
      <a href="note_m.ftl" class="active">文章</a>
      <a href="whisper.html">微语</a>
      <a href="/add/note">留言</a>
      <a href="album.html">相册</a>
      <a href="about.html">关于</a>
    </div>
    <ul class="layui-nav header-down-nav">
      <li class="layui-nav-item"><a href="note_m.ftl" class="active">文章</a></li>
      <li class="layui-nav-item"><a href="whisper.html">微语</a></li>
      <li class="layui-nav-item"><a href="/add/note">留言</a></li>
      <li class="layui-nav-item"><a href="album.html">相册</a></li>
      <li class="layui-nav-item"><a href="about.html">关于</a></li>
    </ul>
    <p class="welcome-text">
      欢迎来到<span class="name">小明</span>的博客~
    </p>
  </div>

  <div class="banner">
    <div class="cont w1000">
      <div class="title">
        <h3>MY<br />BLOG</h3>
        <h4>well-balanced heart</h4>
      </div>
      <div class="amount">
        <p><span class="text">访问量</span><span class="access">1000</span></p>
        <p><span class="text">日志</span><span class="daily-record">1000</span></p>
      </div>
    </div>
  </div>
  <div class="tlinks">Collect from <a href="http://www.cssmoban.com/" >网页模板</a></div>
  <div class="content">
    <div class="cont w1000">
      <div class="title">
        <span class="layui-breadcrumb" lay-separator="|">
          <a href="/note/list?noteType=java">JAVA</a>
          <a href="/note/list/ ">J2EE</a>
          <a href="/note/list?noteType=Python">Python</a>
          <a href="javascript:;">HTML</a>
          <a href="javascript:;">Sql</a>
          <a href="javascript:;">Linux</a>
          <a href="/note/list?noteType=other">其他</a>
        </span>
      </div>
      <div class="list-item">

<#list notes as note>
        <div class="item">
          <div class="layui-fluid">
            <div class="layui-row">
              <div class="layui-col-xs12 layui-col-sm4 layui-col-md5">
                <div class="img"><img <#if note.noteTitleImg??> src="${note.noteTitleImg}"  <#else> src="../static/img/sy_img1.jpg"  </#if> alt=""></div>
              </div>
              <div class="layui-col-xs12 layui-col-sm8 layui-col-md7">
                <div class="item-cont">
                  <h3>${note.noteTitle}<button class="layui-btn layui-btn-danger new-icon">new</button></h3>
                  <h5>${note.noteType}</h5>
                  <p>${note.noteSource}</p>
                    <h5>${(note.noteTime?string("yyyy-MM-dd"))!}</h5>
                  <a href="/note/getById?id=${note.noteId}" class="go-icon"></a>
                </div>
            </div>
            </div>
           </div>
        </div>
</#list>
      </div>
      <div id="demo" style="text-align: center;"></div>
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
          <p>邮箱<span class="email">1234567890@qq.com</span></p>
          <p>More Templates <a href="http://www.cssmoban.com/" target="_blank" title="模板之家">模板之家</a> - Collect from <a href="http://www.cssmoban.com/" title="网页模板" target="_blank">网页模板</a></p>
        </div>
      </div>
    </div>
  </div>
  <script type="text/javascript" src="../static/layui/layui.js"></script>
  <script type="text/javascript">
    layui.config({base: '../static/js/util/'}).use(['element','laypage','jquery','menu'],function(){
      element = layui.element,laypage = layui.laypage,$ = layui.$,menu = layui.menu;
      laypage.render({
        elem: 'demo'
        ,count: 70 //数据总数，从服务端得到
      });
      menu.init();
    })
  </script>
</body>
</html>