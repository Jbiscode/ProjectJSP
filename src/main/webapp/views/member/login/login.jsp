<%--
  Created by IntelliJ IDEA.
  User: sajaebin
  Date: 2/2/24
  Time: 4:35 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="application/json" language="java" %>
<%@ page import="member.bean.MemberDTO" %>
<%@ page import="member.dao.MemberDAO" %>
<%@ page import="java.io.BufferedReader" %>
<%@ page import="java.io.InputStreamReader" %>
<%@ page import="org.json.JSONObject" %>
<%
    BufferedReader br = new BufferedReader(new InputStreamReader(request.getInputStream()));
    String json = "";
    if(br != null){
        json = br.readLine();
    }

    JSONObject data = new JSONObject(json);
    String inputId = data.getString("id");
    String inputPwd = data.getString("pwd");

%>
<%

    MemberDAO memberDAO = MemberDAO.getInstance();
    boolean check = memberDAO.isExistId(inputId);
    if (check) {
    MemberDTO memberDTO = memberDAO.login(inputId, inputPwd);
        if (memberDTO != null) {
            session.setAttribute("id", memberDTO.getId());
            session.setAttribute("name", memberDTO.getName());
            session.setAttribute("gender", memberDTO.getGender());
            session.setAttribute("email1", memberDTO.getEmail1());
            session.setAttribute("email2", memberDTO.getEmail2());
            session.setAttribute("tel1", memberDTO.getTel1());
            session.setAttribute("tel2", memberDTO.getTel2());
            session.setAttribute("tel3", memberDTO.getTel3());
            session.setAttribute("zipcode", memberDTO.getZipcode());
            session.setAttribute("address1", memberDTO.getAddr1());
            session.setAttribute("address2", memberDTO.getAddr2());

            response.getWriter().print("{\"result\": \"Success\"}");
        } else {
            response.getWriter().print("{\"result\": \"WrongPassword\"}");
        }
    }else {
        response.getWriter().print("{\"result\": \"WrongId\"}");
    }
%>

