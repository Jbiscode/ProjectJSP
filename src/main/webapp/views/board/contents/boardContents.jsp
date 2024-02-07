<%@ page import="board.bean.BoardDTO" %>
<%@ page import="board.dao.BoardDAO" %>
<%@ page import="java.util.ArrayList" %>
<%--
  Created by IntelliJ IDEA.
  User: sajaebin
  Date: 2/7/24
  Time: 11:13 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    int seq;
    String scope = request.getParameter("search_field") != null ? request.getParameter("search_field") : "all";
    String key = request.getParameter("search_key") != null ? request.getParameter("search_key") : "";
    String Page = request.getParameter("pageNum") != null ? request.getParameter("pageNum") : "1";
    int startPage = Integer.parseInt(Page) ;
    BoardDAO boardDAO = BoardDAO.getInstance();
    ArrayList<BoardDTO> boardDTOS = boardDAO.loadContents(scope, key, startPage);
%>
<html>
<head>
    <title>게시판 목록</title>
</head>
<body>
<div id=" board_listBox">
    <jsp:include page="contentsSearch.jsp" >
        <jsp:param name="" value=""/>
    </jsp:include>

    <table>
        <thead>
        <tr>
            <th>번호</th>
            <th>작성자</th>
            <th>제목</th>
            <th>내용</th>
        </tr>
        </thead>
        <tbody>
        <% for (BoardDTO boardDTO : boardDTOS) { %>
        <tr>
            <td><%=boardDTO.getSeq()  %>
            </td>
            <td><%= boardDTO.getName()%>
            </td>
            <td><%=boardDTO.getSubject()%>
            </td>
            <td><%=boardDTO.getContent()%>
            </td>
        </tr>
        <%}%>
        </tbody>
    </table>
<jsp:include page="contentsPaging.jsp">
    <jsp:param name="" value=""/>
</jsp:include>

</div>
</body>
</html>
