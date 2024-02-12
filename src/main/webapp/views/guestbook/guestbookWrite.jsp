<%@ page import="guestbook.dao.GuestbookDAO" %><%--
  Created by IntelliJ IDEA.
  User: sajaebin
  Date: 2/11/24
  Time: 11:45 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>guestbookWrite</title>
</head>
<body>
    <%
        String name = request.getParameter("writerName");
        String email = request.getParameter("writerEmail");
        String homepage = request.getParameter("homepage");
        String title = request.getParameter("title");
        String content = request.getParameter("content");

        GuestbookDAO guestbookDAO = GuestbookDAO.getInstance();
        boolean success = guestbookDAO.insert(name, email, homepage, title, content);
    %>
<%
    if(success){
%>
    <script>
        alert("글이 등록되었습니다.");
        location.href = "guestbookList.jsp";
    </script>
<%
    } else {
%>
    <script>
        alert("글 등록에 실패했습니다.");
        history.back();
    </script>
<%
    }
%>
</body>
</html>
