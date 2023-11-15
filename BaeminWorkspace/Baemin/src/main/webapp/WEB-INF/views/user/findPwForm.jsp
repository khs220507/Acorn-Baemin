<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 찾기</title>
</head>
<body>
 <h1>비밀번호 찾기</h1>
    <form action="/user/findPassword" method="post">
        아이디: <input type="text" name="id" required>
        이메일: <input type="email" name="email" required>
        <input type="submit" value="비밀번호 찾기">
    </form>
</body>
</html>