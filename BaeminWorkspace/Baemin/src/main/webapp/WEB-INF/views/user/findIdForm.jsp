<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>아이디 찾기</title>
</head>
<body>
    <h1>아이디 찾기</h1>
    <form action="/baemin/findId" method="post">
        이메일: <input type="email" name="email" required>
        <input type="submit" value="아이디 찾기">
    </form>
</body>
</html>