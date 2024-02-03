<%--
  Created by IntelliJ IDEA.
  User: sajaebin
  Date: 2/2/24
  Time: 11:05 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="application/json; charset=UTF-8" %>
<%@ page import="member.dao.MemberDAO" %>
<%
    String id = request.getParameter("id");
    MemberDAO dao = MemberDAO.getInstance();
    boolean exist = dao.isExistId(id);
    response.getWriter().print("{\"isExist\": " + exist + "}");
%>