<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8" %>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<html lang="kor">
  <head>
      <meta charset="utf-8">
      <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
      <meta name="description" content="">
      <meta name="author" content="">
      <base href="/">
      <title>dd</title>

      <!-- Bootstrap core CSS -->
      <link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

      <!-- Custom styles for this template -->
      <link href="css/shop-homepage.css" rel="stylesheet">


      <style>
          td {
              border: 1px solid #A4A4A4;
              padding: 7px;
          }
          input, textarea {
              width: 600px;
              border: none;
          }

          textarea {
              height: 440px;
          }
      </style>

  </head>

  <body>

  <!-- Navigation -->
  <nav class="navbar navbar-expand-lg navbar-dark bg-info fixed-top">
      <div class="container">
          <a class="navbar-brand" href="/">Image Shop</a>
          <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
              <span class="navbar-toggler-icon"></span>
          </button>
          <div class="collapse navbar-collapse" id="navbarResponsive">
              <ul class="navbar-nav ml-auto">
                  <li class="nav-item active">
                      <a class="nav-link" href="#">홈
                          <span class="sr-only">(current)</span>
                      </a>
                  </li>
                  <li class="nav-item">
                      <a class="nav-link" href="#">공지사항</a>
                  </li>
                  <li class="nav-item">
                      <a class="nav-link" href="#">서비스</a>
                  </li>
                  <sec:authorize access="hasRole('ROLE_ADMIN')">
                      <li class="nav-item">
                          <a class="nav-link" href="#">이미지 등록</a>
                      </li>
                  </sec:authorize>
                  <sec:authorize access="!isAuthenticated()"> <!--로그인 하지 않은 경우-->
                      <li class="nav-item">
                          <a class="nav-link" href="login">회원가입/로그인</a>
                      </li>
                  </sec:authorize>

                  <sec:authorize access="hasAnyRole('ROLE_ADMIN','ROLE_MEMBER')"> <!--인증된 경우-->
                      <li class="nav-item">
                          <nav class="nav-link"> <sec:authentication property="principal.username"/> 님 <a href="/logout">로그아웃</a> </nav>
                      </li>
                  </sec:authorize>
              </ul>
          </div>
      </div>
  </nav>

  <br><br><br><br>

<form:form modelAttribute="notice" action="register">
    <table>
        <tr>
            <td width="70" align="center">제목</td>
            <td width="550" align="center">
                <form:input path="title" id="title"/>
            </td>
        </tr>
        <tr>
            <td width="70" align="center">작성자</td>
            <td width="550" align="center">
                <form:input path="writer" id="writer"/>
            </td>
        </tr>
        <tr>
            <td width="70" align="center">내용</td>
            <td width="550" align="center">
                <form:textarea path="content" name="content" id="editor"  class="ck-editor__editable"/>
            </td>
        </tr>
    </table>
</form:form>

  <button type="submit" id="btnRegister">등록</button>


  <!-- Bootstrap core JavaScript -->
  <script src="vendor/jquery/jquery.min.js"></script>
  <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
  </body>


  <script src="https://cdn.ckeditor.com/ckeditor5/23.1.0/classic/ckeditor.js"></script>
  <script>

      ClassicEditor
          .create(document.querySelector('#editor'), {})

          .catch(error => {
              console.error(error);

          });


  </script>

  <script src="http://code.jquery.com/jquery-3.1.1.js"></script>
<script>
    var formObj = $("#notice");

    $("#btnRegister").on("click",function(){
        formObj.submit();
    })
</script>
</html>
