<%--
  Created by IntelliJ IDEA.
  User: sajaebin
  Date: 2/2/24
  Time: 4:35 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="member.bean.MemberDTO" %>
<%@ page import="member.dao.MemberDAO" %>
<%
    String id = request.getParameter("id");
    String pwd = request.getParameter("pwd");

    MemberDAO memberDAO = MemberDAO.getInstance();
    boolean check = memberDAO.isExistId(id);
    if (check) {
    MemberDTO memberDTO = memberDAO.login(id, pwd);
        if (memberDTO != null) {
            session.setAttribute("id", id);
            session.setAttribute("name", memberDTO.getName());
            response.getWriter().print("{\"result\": \"Success\"}");
        } else {
            response.getWriter().print("{\"result\": \"WrongPassword\"}");
        }
    }else {
        response.getWriter().print("{\"result\": \"WrongId\"}");
    }
%>

