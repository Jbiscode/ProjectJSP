<%--
  Created by IntelliJ IDEA.
  User: sajaebin
  Date: 2/2/24
  Time: 2:44 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ page import="member.bean.MemberDTO" %>
<%@ page import="member.dao.MemberDAO" %>
<%@ include file="../../../resources/vendors/session.jsp"%>
<%

    String name = request.getParameter("name");
    String password = request.getParameter("password");
    String gender = request.getParameter("gender");
    String email1 = request.getParameter("email1");
    String email2 = request.getParameter("email2");
    String phone1 = request.getParameter("phone1");
    String phone2 = request.getParameter("phone2");
    String phone3 = request.getParameter("phone3");
    String zipcode = request.getParameter("zipcode");
    String address1 = request.getParameter("address1");
    String address2 = request.getParameter("address2");

    MemberDTO memberDTO = new MemberDTO();
    memberDTO.setName(name);
    memberDTO.setId(session_id);
    memberDTO.setPwd(password);
    memberDTO.setGender(gender);
    memberDTO.setEmail1(email1);
    memberDTO.setEmail2(email2);
    memberDTO.setTel1(phone1);
    memberDTO.setTel2(phone2);
    memberDTO.setTel3(phone3);
    memberDTO.setZipcode(zipcode);
    memberDTO.setAddr1(address1);
    memberDTO.setAddr2(address2);

    MemberDAO memberDAO = MemberDAO.getInstance();
    boolean isUpdated = memberDAO.updateMember(memberDTO);
%>
<%
    if(isUpdated){
            session.setAttribute("name", name);
            session.setAttribute("email1", email1);
            session.setAttribute("email2", email2);
            session.setAttribute("gender",gender);
            session.setAttribute("tel1", phone1);
            session.setAttribute("tel2", phone2);
            session.setAttribute("tel3", phone3);
            session.setAttribute("zipcode", zipcode);
            session.setAttribute("address1", address1);
            session.setAttribute("address2", address2);
%>
    <script>
        alert("회원정보 수정이 완료되었습니다.");
        location.href = "../../../index.jsp";
    </script>
<%
    }else{
%>
    <script>
        alert("회원정보 수정이 실패했습니다.");
        history.back();
    </script>
<%
    }
%>

