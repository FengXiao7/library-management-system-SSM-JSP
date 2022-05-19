<%@ page contentType="text/html;charset=UTF-8" language="java" %>


<html>
<head>
  <title>修改书籍</title>
  <style type="text/css">
    ::-webkit-scrollbar{display: none;}
  </style>
  <%--引用BootStarp--%>
  <link href="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
  <script src="${pageContext.request.contextPath}/js/jquery-3.5.1.js"></script>
  <script type="text/javascript">
    $(function (){
      $("#submit").click(function (){
        var reg=/^[+]{0,1}(\d+)$/;//正整数包含0
        if(reg.test($("#BookNumber").val())){
          if(reg.test($("#BookPage").val())){
            return true;
          }
          alert("书籍页数请输入正整数！")
          return false;
        }
        alert("书籍数量请输入正整数！")
        return false;
      })
    })
  </script>
</head>
<body background="${pageContext.request.contextPath}/img/img_3.png" style=" background-repeat:no-repeat ;
background-size:100% 100%;
background-attachment: fixed;">


<div class="container">

  <%--标题--%>
  <div class="row clearfix">
    <div class="col-md-12 column">
      <div class="page-header">
        <h1>
          <small>修改书籍</small>
        </h1>
      </div>
    </div>
  </div>
  <div class="row">
    <div class="col-md-6 column">
      <a class="btn btn-info" href="${pageContext.request.contextPath}/book/allBook">返回</a>
    </div>
  </div>

  <form action="${pageContext.request.contextPath}/book/updateBook" method="post">
    <div class="form-group">
      <label for="BookName">书籍名称</label>
      <input type="text" class="form-control" id="BookName" name="bookName" value="${QueryOneBook.bookName}" placeholder="请填写书籍名称" required="required">
    </div>
    <div class="form-group">
      <label for="BookNumber">书籍数量</label>
      <input type="text" class="form-control" id="BookNumber" name="bookCounts" value="${QueryOneBook.bookCounts}" placeholder="请填写书籍数量(只能为数字)" required="required">
      <span style="color: red;font-weight: bold" id="msg"></span>
    </div>
    <div class="form-group">
      <label for="BookDetail">书籍描述</label>
      <input type="text" class="form-control" id="BookDetail" name="detail" value="${QueryOneBook.detail}" placeholder="请填写书籍描述" required="required">
    </div>
    <div class="form-group">
      <label for="BookType">书籍类别</label>
      <input type="text" class="form-control" id="BookType" name="bookType" value="${QueryOneBook.bookType}" placeholder="请填写书籍类别" required="required">
    </div>
    <div class="form-group">
      <label for="Press">出版社</label>
      <input type="text" class="form-control" id="Press" name="Press" value="${QueryOneBook.press}" placeholder="请填写出版社" required="required">
    </div>
    <div class="form-group">
      <label for="BookAuthor">作者</label>
      <input type="text" class="form-control" id="BookAuthor" name="bookAuthor" value="${QueryOneBook.bookAuthor}" placeholder="请填写书籍作者" required="required">
    </div>
    <div class="form-group">
      <label for="BookDate">书籍出版日期</label>
      <input type="text" class="form-control" id="BookDate" name="bookDate" value="${QueryOneBook.bookDate}" placeholder="请填写书籍出版日期" required="required">
    </div>
    <div class="form-group">
      <label for="BookPage">书籍页数</label>
      <input type="text" class="form-control" id="BookPage" name="bookPage" value="${QueryOneBook.bookPage}" placeholder="请填写书籍页数" required="required">
    </div>
    <%--id放在隐藏域，ID是必须要的，否则dao层ID为零，执行不了修改操作，但不用用户修改，所以放在隐藏域--%>
    <input type="hidden" name="bookID" value="${QueryOneBook.bookID}"/>
    <input id="submit" type="submit" class="btn btn-success" value="修改">
  </form>
</div>

</body>
</html>
