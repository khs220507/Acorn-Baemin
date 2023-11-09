<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="path" value="<%=request.getContextPath()%>"></c:set>
<!DOCTYPE html>
<html>
<script src="https://code.jquery.com/jquery-latest.js"></script>
<meta name="viewport" content="width=device-width,initial-scale=1">
<head>
<meta charset="UTF-8">

<title>Insert title here</title>
</head>
<body>
<%
    session.invalidate();
    response.sendRedirect("redirect:/home");
    
%>
</body>
</html>