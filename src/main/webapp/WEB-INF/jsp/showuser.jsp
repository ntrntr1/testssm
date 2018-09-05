<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/9/4
  Time: 16:44
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" import="java.util.*"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<table align='center' border='1' cellspacing='0'>
    <tr>
        <td>username</td>
        <td>psword</td>
    </tr>
    <c:forEach items="${allUser}" var="c">
        <tr>
            <td>${c.username}</td>
            <td>${c.psword}</td>
        </tr>
    </c:forEach>
</table>
</body>
</html>
