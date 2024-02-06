<%--
  Created by IntelliJ IDEA.
  User: sajaebin
  Date: 2/2/24
  Time: 2:28 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<head>
    <title>로그인</title>
    <link rel="stylesheet" href="../../../resources/css/loginForm.css"/>
</head>
<body>
<%
    String sessionId = (String) session.getAttribute("id");
    if (sessionId == null) {
%>

<div class="login-card">
    <h2>로그인</h2>
    <h3>로그인 정보를 입력하세요</h3>
    <form class="login-form" id="loginForm" action="login.jsp" method="post" onsubmit="">
        <input id="id" name="user_id" type="text" placeholder="아이디를 입력하세요"/>
        <span id="idError" class="error_msg"></span>
        <input id="pwd" name="user_pw" type="password" placeholder="비밀번호를 입력하세요" value=""/>
        <span id="pwdError" class="error_msg"></span>
        <a href="../register/registerForm.jsp">아이디가 없으신가요?</a>
        <button type="button" onclick="login()">로그인</button>
    </form>
</div>

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
            fetch('login.jsp', {
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
