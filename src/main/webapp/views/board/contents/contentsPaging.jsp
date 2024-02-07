<%@ page import="board.dao.BoardDAO" %><%--
  Created by IntelliJ IDEA.
  User: sajaebin
  Date: 2/7/24
  Time: 3:54 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
<%
    String search_field = request.getParameter("search_field") != null ? request.getParameter("search_field") : "all";
    String search_key = request.getParameter("search_key") != null ? request.getParameter("search_key") : "";
    BoardDAO boardDAO = BoardDAO.getInstance();
    int dataCnt = boardDAO.dataCnt(search_field, search_key);
%>
</head>
<body>
<form>
    <div id="pages">
        <%
            for (int i = 0; i <=dataCnt / 10; i++) {
            %>
        <a href="boardContents.jsp?search_field=<%=search_field%>&search_key=<%=search_key%>&pageNum=<%=i+1%>"><%=i+1%></a>
        <%}%>
    </div>
</form>
</body>
</html>
