<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="member.bean.MemberDTO" %>
<%@ page import="member.dao.MemberDAO" %>
<%

    String name = request.getParameter("name");
    String id = request.getParameter("id");
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
    memberDTO.setId(id);
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


    //DB연결
    MemberDAO memberDAO = MemberDAO.getInstance();
    boolean isRegistered = memberDAO.insertMember(memberDTO);
    //회원가입

%>
<!<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=Chrome">
    <title>가입</title>
</head>
<body>
<%
    if (isRegistered) {
%>
<script>
    alert("회원가입 성공")
    location.href = "../login/loginForm.jsp";
</script>
<%
} else {
%>
<script>
    alert("회원가입 실패");
    location.href = "registerForm.jsp";
</script>
<%
    }
%>
</body>
</html>