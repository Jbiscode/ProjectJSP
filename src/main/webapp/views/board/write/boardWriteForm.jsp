<%--
  Created by IntelliJ IDEA.
  User: sajaebin
  Date: 2/6/24
  Time: 12:23 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>게시글 작성</title>
    <link rel="stylesheet" href="../../../resources/css/board/boardWriteForm.css">
    <script src="../../../resources/js/board/board.js"></script>
</head>
<body>
<div id="wrapper">
    <form id="boardWriteForm" action="boardWrite.jsp" method="post">
        <table>
            <tbody>
            <tr>
                <th id="subject">
                    제목
                </th>
                <td>
                    <textarea id="subjectInput" name="subjectInput"></textarea>
                </td>
            </tr>
            <tr>
                <th>
                    내용
                </th>
                <td>
                    <label>
                        <textarea id="contentInput" name="contentInput"></textarea>
                    </label>
                </td>
            </tr>
            <tr>
                <td id="buttons" colspan="2">
                    <button type="button" onclick="boardWriteCheck()">글쓰기</button>
                    <button type="reset">다시작성</button>
                </td>
            </tr>
            </tbody>
        </table>
    </form>
</div>
</body>
</html>
