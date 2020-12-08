<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<html lang="kor">

<head>
    <title>Title</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">
    <!-- Bootstrap core CSS -->
    <link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom styles for this template -->
    <link href="css/shop-homepage.css" rel="stylesheet">

      <style>
          .zero-raduis{
              border-radius: 0px !important;
          }

          a {
              color: #92badd;
              display:inline-block;
              text-decoration: none;
              font-weight: 400;
          }

          h2 {
              text-align: center;
              font-size: 16px;
              font-weight: 500;
              text-transform: uppercase;
              display:inline-block;
              color: #56baed;
          }



          /* STRUCTURE */

          .wrapper {
              display: flex;
              align-items: center;
              flex-direction: column;
              justify-content: center;
              width: 100%;
              min-height: 100%;
              padding: 20px;
          }

          #formContent {
              -webkit-border-radius: 10px 10px 10px 10px;
              border-radius: 10px 10px 10px 10px;
              background: #fff;
              padding: 30px;
              width: 90%;
              max-width: 450px;
              position: relative;
              padding: 0px;
              -webkit-box-shadow: 0 2px 5px 0 rgba(0,0,0,0.3);
              box-shadow: 0 2px 5px 0 rgba(0,0,0,0.3);
              text-align: center;
          }

          #formFooter {
              padding: 2px ;
              text-align: right;
              width: 90%;
          }



          /* TABS */

          h2.inactive {
              color: #cccccc;
          }

          h2.active {
              color: #0d0d0d;
              border-bottom: 2px solid #5fbae9;
          }



          /* FORM TYPOGRAPHY*/

          input[type=button], input[type=submit], input[type=reset]  {
              background-color: #56baed;
              border: none;
              color: white;
              width: 85%;
              padding: 10px 25px;
              text-align: center;
              text-decoration: none;
              display: inline-block;
              text-transform: uppercase;
              font-size: 16px;
              cursor: pointer;
              -webkit-border-radius: 5px 5px 5px 5px;
              border-radius: 5px 5px 5px 5px;
              margin: 5px 20px 40px 20px;
              -webkit-transition: all 0.3s ease-in-out;
              -moz-transition: all 0.3s ease-in-out;
              -ms-transition: all 0.3s ease-in-out;
              -o-transition: all 0.3s ease-in-out;
              transition: all 0.3s ease-in-out;
          }

          input[type=button]:hover, input[type=submit]:hover, input[type=reset]:hover  {
              background-color: #39ace7;
          }

          input[type=button]:active, input[type=submit]:active, input[type=reset]:active  {
              -moz-transform: scale(0.95);
              -webkit-transform: scale(0.95);
              -o-transform: scale(0.95);
              -ms-transform: scale(0.95);
              transform: scale(0.95);
          }

          input[type=text], input[type=email] {
              background-color: #f6f6f6;
              border: none;
              color: #0d0d0d;
              padding: 10px 25px;
              text-align: center;
              text-decoration: none;
              display: inline-block;
              font-size: 16px;
              margin: 5px;
              width: 85%;
              border: 2px solid #f6f6f6;
              -webkit-transition: all 0.5s ease-in-out;
              -moz-transition: all 0.5s ease-in-out;
              -ms-transition: all 0.5s ease-in-out;
              -o-transition: all 0.5s ease-in-out;
              transition: all 0.5s ease-in-out;
              -webkit-border-radius: 5px 5px 5px 5px;
              border-radius: 5px 5px 5px 5px;
          }

          input[type=text]:focus, input[type=email]:focus{
              background-color: #fff;
              border-bottom: 2px solid #5fbae9;
          }

          input[type=text]:placeholder, input[type=email]:placeholder {
              color: #cccccc;
          }



          /* ANIMATIONS */

          /* Simple CSS3 Fade-in-down Animation */
          .fadeInDown {
              -webkit-animation-name: fadeInDown;
              animation-name: fadeInDown;
              -webkit-animation-duration: 1s;
              animation-duration: 1s;
              -webkit-animation-fill-mode: both;
              animation-fill-mode: both;
          }

          @-webkit-keyframes fadeInDown {
              0% {
                  opacity: 0;
                  -webkit-transform: translate3d(0, -100%, 0);
                  transform: translate3d(0, -100%, 0);
              }
              100% {
                  opacity: 1;
                  -webkit-transform: none;
                  transform: none;
              }
          }

          @keyframes fadeInDown {
              0% {
                  opacity: 0;
                  -webkit-transform: translate3d(0, -100%, 0);
                  transform: translate3d(0, -100%, 0);
              }
              100% {
                  opacity: 1;
                  -webkit-transform: none;
                  transform: none;
              }
          }

          /* Simple CSS3 Fade-in Animation */
          @-webkit-keyframes fadeIn { from { opacity:0; } to { opacity:1; } }
          @-moz-keyframes fadeIn { from { opacity:0; } to { opacity:1; } }
          @keyframes fadeIn { from { opacity:0; } to { opacity:1; } }

          .fadeIn {
              opacity:0;
              -webkit-animation:fadeIn ease-in 1;
              -moz-animation:fadeIn ease-in 1;
              animation:fadeIn ease-in 1;

              -webkit-animation-fill-mode:forwards;
              -moz-animation-fill-mode:forwards;
              animation-fill-mode:forwards;

              -webkit-animation-duration:1s;
              -moz-animation-duration:1s;
              animation-duration:1s;
          }

          .fadeIn.first {
              -webkit-animation-delay: 0.4s;
              -moz-animation-delay: 0.4s;
              animation-delay: 0.4s;
          }

          .fadeIn.second {
              -webkit-animation-delay: 0.6s;
              -moz-animation-delay: 0.6s;
              animation-delay: 0.6s;
          }

          .fadeIn.third {
              -webkit-animation-delay: 0.8s;
              -moz-animation-delay: 0.8s;
              animation-delay: 0.8s;
          }

          .fadeIn.fourth {
              -webkit-animation-delay: 1s;
              -moz-animation-delay: 1s;
              animation-delay: 1s;
          }

          /* Simple CSS3 Fade-in Animation */
          .underlineHover:after {
              display: block;
              width: 0;
              height: 2px;
              background-color: #56baed;
              content: "";
              transition: width 0.2s;
          }

          .underlineHover:hover {
              color: #0d0d0d;
          }

          .underlineHover:hover:after{
              width: 100%;
          }



          /* OTHERS */

          *:focus {
              outline: none;
          }

          #icon {
              width:30%;
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


  <div class="wrapper fadeInDown zero-raduis">
      <div id="formContent">
          <!-- Tabs Titles -->

          <!-- Icon -->
          <div class="fadeIn first">
              <!-- <img src="http://danielzawadzki.com/codepen/01/icon.svg" id="icon" alt="User Icon" /> -->
              <h2 class="my-5">Sign In</h2>
          </div>

          <!-- Login Form -->
          <form method="post" action="/login" id="loginForm">
              <input type="text" name="username" id="email" class="fadeIn second zero-raduis" name="email" placeholder="id">
              <input type="text" name="password" id="password" class="fadeIn third zero-raduis" name="login" placeholder="password">
              <div id="formFooter">
                  <a class="underlineHover" href="#">Forgot Password?</a>
              </div>
              <input type="submit" class="fadeIn fourth zero-raduis" value="login">
              <input type="button" class="fadeIn fourth zero-raduis pc" value="register">
              <sec:csrfInput/>
          </form>


      </div>
  </div>
  <!-- Bootstrap core JavaScript -->
  <script src="vendor/jquery/jquery.min.js"></script>
  <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
  </body>
</html>
