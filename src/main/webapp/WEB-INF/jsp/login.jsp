<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/9/4
  Time: 16:11
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://"
            + request.getServerName() + ":" + request.getServerPort()
            + path + "/";
%>

<html>
<head>
    <title>表单验证</title>
    <meta http-equiv="content-type" content="text/html; charset=utf-8" />
    <style type = "text/CSS">

    </style>
    <script src="http://libs.baidu.com/jquery/2.0.0/jquery.js"></script>>


</head>


<body>
<form name = "form1" action="login.php" onsubmit="return check_submit()">
    <table  border="0" cellspacing="0" cellpadding="5" bordercolor="#ccc">
        <tr>
            <td width="200" align="right">请输入用户名：</td>
            <td width="200"><div id="name"><input type="text" name="username" onblur="blur_username()" onfocus="focus_username()"></div></td>
            <td width="300"><div id="result_name"></div></td>
        </tr>
        <tr>
            <td width="200" align="right">请输入密码：</td>
            <td width="200"><input type="password" name="userpwd" onblur="blur_userpwd()" onfocus="focus_userpwd()"></td>
            <td><div id="result_pwd"></div></td>
        </tr>
        <tr>
            <td> <div id="v_container" style="width: 200px;height: 50px;">
                　　　　　　　　<canvas id="verifyCanvas" width="200" height="50" style="cursor: pointer;margin-top:-30px;margin-bottom: 10px;"></canvas>
                　　　　　　</div></td>
            <td>
                <input style="" type="text" id="code_input"  name="verfycode" value="" placeholder="请输入验证码"/ onblur="blur_verify()">
            <td width="300"><div id="result_verify"></td>
            </td>



            <script type="text/javascript">


                /*
                    表单验证
                */
                var flag = false;   // flag 如果为true（即用户名合法）就允许表单提交， 如果为false（即用户名不合法）阻止提交
                // 当鼠标聚焦于用户名
                function focus_username()
                {
                    // 找到后面的div, id = result_name
                    var nameObj = document.getElementById("result_name");
                    nameObj.innerHTML = "用户名不能包含特殊字符且为5~20位";
                    nameObj.style.color="#999";
                }
                // 当鼠标不聚焦于用户名input
                function blur_username()
                {
                    // 找到id=result_name的div
                    var nameObj = document.getElementById("result_name");
                    // 判断用户名是否合法
                    var str2 = check_user_name(document.form1.username.value);
                    nameObj.style.color="red";
                    if ("该用户名合法" ==  str2)
                    {
                        flag = true;
                        nameObj.innerHTML = str2;
                    }
                    else
                    {
                        nameObj.innerHTML = str2;
                    }

                }
                // 检查用户名是否合法        合法就返回"该用户名合法"
                function check_user_name(str)
                {
                    var str2 ;
                    if ("" == str)
                    {
                        str2 = "用户名为空";
                        return str2;
                    }
                    else if ((str.length < 5) || (str.length > 20))
                    {
                        str2 = "用户名必须为5 ~ 20位";
                        return str2;
                    }
                    else if (check_other_char(str))
                    {
                        str2 = "不能含有特殊字符";
                        return str2;
                    }
                    else
                    {
                        $.ajax({url:"1.txt",
                            async:false,
                            type:'post',
                            dataType:'json',
                            data:{'username':document.form1.username.value},
                            success:function(result){
                                console.log(result);

                                str2=result;
                                console.log(str2);},
                             error:function() {
                                 str2="未连接到后台"

                             }});

                        return str2;

                    }

                }
                // 验证用户名是否含有特殊字符
                function check_other_char(str)
                {
                    var arr = ["&", "\\", "/", "*", ">", "<", "@", "!"];
                    for (var i = 0; i < arr.length; i++)
                    {
                        for (var j = 0; j < str.length; j++)
                        {
                            if (arr[i] == str.charAt(j))
                            {
                                return true;
                            }
                        }
                    }
                    return false;
                }
                // 根据验证结果确认是否提交
                function check_submit()
                {
                    if (flag == false)
                    {
                        return false;
                    }
                    return true;
                }
            </script>




<script src="<%=basePath %>js/验证码实现.js"></script>
<script>
    var verifyCode = new GVerify("v_container");
    //函数，判断验证码是否正确
    function   blur_verify(){
        var nameObj = document.getElementById("result_verify");
        //
        var str2 = check_verify_code(document.form1.verfycode.value);
        console.log(str2);

        if ("验证正确" ==  str2)
        {
            flag = true;
            nameObj.innerHTML = str2;
            nameObj.style.color="green";
        }
        else
        {
            nameObj.innerHTML = str2;
            nameObj.style.color="red";
        }
    }



    function check_verify_code(str){
        var res = verifyCode.validate(document.getElementById("code_input").value);
        if(res){
            str2="验证正确";
            console.log(str2);
            return str2;
        }else{
            str2="验证码错误，点击图片刷新重新输入";
            console.log(str2);
            return str2;
        }
    }
</script>
</tr>
<tr>
    <td>&nbsp;</td>
    <td colspan="2" cellpadding><input type="submit" value="提交表单"></td>
</tr>


</table>
</form>

<button onclick="dataDisplay()"> 显示所有数据</button></td>
<div id="dataDisplay"></div>

<script type="text/javascript">




    function dataDisplay(){
        var str,i,x="";
        $.ajax({
            url:"/user/showAllUser.do",
            type:'post',

            success:function(obj){

                 console.log("success");

                 console.log(obj);                // var data=map.map;
                // console.log(data);
               /** var x ="";
                var i;
            var data = JSON.parse(result);
               console.log(data.users[0].name);**/
                /**for(i in data.users){
                    x += "<h1>" + data.users[i].name + "</h1>";
                    x += data.users[i].authority + "<br>";
                    console.log(x);

                }
                console.log(x);

                $("#dataDisplay").html(x);**/


            }

        })
    }
</script>
</body>
</html>