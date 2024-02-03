<%--
  Created by IntelliJ IDEA.
  User: sajaebin
  Date: 2/4/24
  Time: 12:41 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" %>
<%
    boolean isLogin = false;
    String session_id = "";
    String session_name = "";
    String session_gender = "";
    String session_email1= "";
    String session_email2= "";
    String session_tel1 = "";
    String session_tel2 = "";
    String session_tel3 = "";
    String session_zipcode = "";
    String session_addr1 = "";
    String session_addr2 = "";

    if (session.getAttribute("id") != null) {
        session_id = (String) session.getAttribute("id");
        session_name = (String) session.getAttribute("name");
        session_gender = (String) session.getAttribute("gender");
        session_email1 = (String) session.getAttribute("email1");
        session_email2 = (String) session.getAttribute("email2");
        session_tel1 = (String) session.getAttribute("tel1");
        session_tel2 = (String) session.getAttribute("tel2");
        session_tel3 = (String) session.getAttribute("tel3");
        session_zipcode = (String) session.getAttribute("zipcode");
        session_addr1 = (String) session.getAttribute("address1");
        session_addr2 = (String) session.getAttribute("address2");

        isLogin = true;
    }
%>
