<%--
  Created by IntelliJ IDEA.
  User: sajaebin
  Date: 2/11/24
  Time: 11:44 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="../../resources/css/guestbook/guestbookWriteForm.jsp.css">
</head>
<body>
<form action="guestbookWrite.jsp" method="post">
    <table>
        <tr>
            <th>작성자</th>
            <td><input name="writerName"></td>
        </tr>
        <tr>
            <th>이메일</th>
            <td><input name="writerEmail"></td>
        </tr>
        <tr>
            <th>홈페이지</th>
            <td><input name="homepage" value="http://"></td>
        </tr>
        <tr>
            <th>제목</th>
            <td><input name="title"></td>
        </tr>
        <tr>
            <th>내용</th>
            <td><textarea name="content" rows="10" cols="50"></textarea></td>
        </tr>
        <tr>
            <td id="buttons" colspan="2">
                <input type="button" value="작성">
                <input type="reset" value="취소">
                <input type="button" value="목록" onclick="location.href='guestbookList.jsp'">
            </td>
        </tr>
    </table>
</form>
<script>
    document.querySelector("#buttons input[type=button]").addEventListener("click", function (e) {
        let form = e.target.form;
        if (form.writerName.value.trim() === "") {
            alert("작성자를 입력하세요.");
            form.writerName.focus();
            return;
        }
        if (form.writerEmail.value.trim() === "") {
            alert("이메일을 입력하세요.");
            form.writerEmail.focus();
            return;
        }
        if (form.title.value.trim() === "") {
            alert("제목을 입력하세요.");
            form.title.focus();
            return;
        }
        if (form.content.value.trim() === "") {
            alert("내용을 입력하세요.");
            form.content.focus();
            return;
        }
        form.submit();
    });
</script>
</body>
</html>
