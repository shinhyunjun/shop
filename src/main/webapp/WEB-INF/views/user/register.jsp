<%@ page session="false" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ page contentType="text/html; charset=utf-8"
         pageEncoding="utf-8" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <script src="http://code.jquery.com/jquery-3.1.1.js"></script>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <title>Title</title>

    <style>
        body {
            background: #C5E1A5;
        }
        form {
            width: 60%;
            margin: 60px auto;
            background: #efefef;
            padding: 60px 120px 80px 120px;
            text-align: center;
            -webkit-box-shadow: 2px 2px 3px rgba(0,0,0,0.1);
            box-shadow: 2px 2px 3px rgba(0,0,0,0.1);
        }
        label {
            display: block;
            position: relative;
            margin: 40px 0px;
        }
        .label-txt {
            position: absolute;
            top: -1.6em;
            padding: 10px;
            font-family: sans-serif;
            font-size: .8em;
            letter-spacing: 1px;
            color: rgb(120,120,120);
            transition: ease .3s;
        }
        .input {
            width: 100%;
            padding: 10px;
            background: transparent;
            border: none;
            outline: none;
        }
        .line-box {
            position: relative;
            width: 100%;
            height: 2px;
            background: #BCBCBC;
        }
        .line {
            position: absolute;
            width: 0%;
            height: 2px;
            top: 0px;
            left: 50%;
            transform: translateX(-50%);
            background: #8BC34A;
            transition: ease .6s;
        }
        .input:focus + .line-box .line {
            width: 100%;
        }
        .label-active {
            top: -3em;
        }
        button {
            display: inline-block;
            padding: 12px 24px;
            background: rgb(220,220,220);
            font-weight: bold;
            color: rgb(120,120,120);
            border: none;
            outline: none;
            border-radius: 3px;
            cursor: pointer;
            transition: ease .3s;
        }
        button:hover {
            background: #8BC34A;
            color: #ffffff;
        }
    </style>



</head>


<body>

<form:form modelAttribute="member" action="register" enctype="multipart/form-data" autocomplete="off">
    <label>
        <p class="label-txt">아이디</p>
        <form:input path="user_id" type="text" name="user_id" class="input" id="user_id"/>
        <div class="line-box">
            <div class="line"></div>
        </div>
    </label>
    <label>
        <p class="label-txt">비밀번호</p>
        <form:input path="user_password" type="password" name="user_password" class="input" id="user_password"/>
        <div class="line-box">
            <div class="line"></div>
        </div>
    </label>
    <label>
        <p class="label-txt">비밀번호 확인</p>
        <input type="password" id="user_password2" class="input">
        <div class="line-box">
            <div class="line"></div>
        </div>
    </label>
    <label>
        <p class="label-txt">이름</p>
        <form:input path="user_name" type="text" name="user_name" class="input" id="user_name"/>

        <div class="line-box">
            <div class="line"></div>
        </div>
    </label>
    <label>
        <p class="label-txt">이메일</p>
        <form:input path="user_email" type="text" name="user_email" class="input" id="user_email"/>

        <div class="line-box">
            <div class="line"></div>
        </div>
    </label>
    <button type="button" id="btnRegister" >가입하기</button>
</form:form>


<script>

    var formObj = $("#member");

    $("#btnRegister").on("click", function () {

        var user_id = $('#user_id').val();
        var user_password = $('#user_password').val();
        var user_password2 = $('#user_password2').val();

        var user_name = $('#user_name').val();
        var user_email = $('#user_email').val();
        var text = "@";

        if (user_id == '') {
            alert('아이디를 입력하세요.');
            return false;
        } else if (user_password == '') {
            alert('비밀번호를 입력하세요.');
            return false;
        } else if (user_name == '') {
            alert('성함을 입력하세요.');
            return false;
        } else if (user_password != user_password2) {
            alert('비밀번호를 다시 입력해주세요.');
            return false;
        }  else if (user_email.indexOf(text) == -1) {
            alert("이메일을 다시 입력해주세요.");
            return false;
        } else {
            formObj.submit();
        }

    });
</script>

<script>
    $(document).ready(function(){
        $('.input').focus(function(){
            $(this).parent().find(".label-txt").addClass('label-active');
        });

        $(".input").focusout(function(){
            if ($(this).val() == '') {
                $(this).parent().find(".label-txt").removeClass('label-active');
            };
        });
    });
</script>
</body>
</html>
