<%@ page import="board.dao.BoardDAO" %>
<%@ page import="board.bean.BoardDTO" %>
<%--
  Created by IntelliJ IDEA.
  User: sajaebin
  Date: 2/6/24
  Time: 7:03 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    BoardDAO boardDAO = BoardDAO.getInstance();

    String id = (String) session.getAttribute("id");
    String name = (String) session.getAttribute("name");
    String email = (String) session.getAttribute("email1");
    String subject = request.getParameter("subjectInput");
    String content = request.getParameter("contentInput");

    BoardDTO boardDTO = new BoardDTO();
    boardDTO.setId(id);
    boardDTO.setName(name);
    boardDTO.setEmail(email);
    boardDTO.setSubject(subject);
    boardDTO.setContent(content);

    boolean success = boardDAO.writeContent(boardDTO);
%>
<%
    if (success) {
%>
<script>
    alert("등록되었습니다.")
    location.href = "../../../index.jsp"
</script>
<%} else {%>
<script>
    alert("다시시도하세요");
    location.href="boardWriteForm.jsp"
</script>
<% } %>