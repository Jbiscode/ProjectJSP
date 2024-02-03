<%--
  Created by IntelliJ IDEA.
  User: sajaebin
  Date: 2/2/24
  Time: 2:28 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>로그인</title>
</head>
<body>
<%
    String sessionId = (String) session.getAttribute("id");
    if (sessionId == null) {
%>
<form id="loginForm" action="login.jsp" method="post">
    <table>
        <tr>
            <td>ID:</td>
            <td><label for="id"></label><input type="text" id="id" name="id"></td>
            <div id="idError" style="color: red"></div>
        </tr>
        <tr>
            <td>Password:</td>
            <td><label for="pwd"></label><input type="password" id="pwd" name="pwd"></td>
            <div id="pwdError" style="color: red"></div>
        </tr>
        <tr>
            <td><input type="button" value="로그인" onclick="login()"></td>
        </tr>
    </table>
</form>

<%

} else {
%>
<h1><%=sessionId%>님 환영합니다.</h1>
<a href="logout.jsp">로그아웃</a>

<%

    }
%>


<script>
    function login() {
        const id = document.getElementById('id').value;
        const pwd = document.getElementById('pwd').value;

        const idError = document.getElementById('idError');
        let pwdError = document.getElementById('pwdError');
        idError.innerHTML = "";
        pwdError.innerHTML = "";

        if (!id || !pwd) {
            alert('아이디 또는 비밀번호를 입력하세요');
        } else {
            fetch('login.jsp',{
                method: 'POST',
                headers: {
                    'Content-Type': 'application/json'
                },
                body: JSON.stringify({id: id, pwd: pwd})
            })
                .then(response => response.json())
                .then(data => {
                    if (data.result != null) {
                        console.log(data.result)
                        switch (data.result) {
                            case 'WrongId':
                                idError.innerHTML = "존재하지 않는 아이디입니다.";
                                console.log("idError");
                                break;
                            case 'WrongPassword':
                                pwdError.innerHTML = "비밀번호가 일치하지 않습니다.";
                                console.log("pwdError");
                                break;
                            case 'Success':
                                document.getElementById('loginForm').submit();
                                location.href = '../../../index.jsp';
                                break;
                        }
                    }
                });
        }
    }

</script>
</body>
</html>
