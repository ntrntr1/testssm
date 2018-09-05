<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/9/4
  Time: 16:11
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<form action = "<%=request.getContextPath()%>/user/showAllUser.do" method="post">
    <table>
        <tr>
            <td>用户名:</td>
            <td><input type = "text",name = "username"/></td>
        </tr>
        <tr>
            <td>密码:</td>
            <td><input type = "password",name = "psword"/></td>
        </tr>
        <tr>
            <td colspan="2"><input type = "submit" value="提交"> </td>
        </tr>
    </table>
</form>
</body>
</html>
