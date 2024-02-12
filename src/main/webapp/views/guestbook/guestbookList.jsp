<%--
  Created by IntelliJ IDEA.
  User: sajaebin
  Date: 2/11/24
  Time: 11:45 AM
  To change this template use File | Settings | File Templates.
--%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ page import="guestbook.bean.GuestbookDTO"%>
<%@ page import="guestbook.dao.GuestbookDAO"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="java.text.SimpleDateFormat"%>

<%
    //데이터
    String Page = request.getParameter("pg") != null ? request.getParameter("pg") : "1";
    int pg = Integer.parseInt(Page);

//한 페이지당 3개씩
    int startNum = (pg*3) - 3;

//DB - select
    GuestbookDAO guestbookDAO = GuestbookDAO.getInstance();
    ArrayList<GuestbookDTO> list = guestbookDAO.guestbookList(startNum);

//페이징 처리
    int totalA = guestbookDAO.getTotal(); //총글수
    int totalP = (totalA + 2) / 3; //총 페이지 수
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Insert title here</title>

    <style>
        table {
            border-collapse:collapse
        }

        table, th, td {
            border: 1px solid black;
        }

        hr {
            border-color: red;
        }

        tbody {
            width: 100px;
        }
        #pageNums{
            display:inline-block;
            text-align: center;
            width: 850px;
            height:40px;
        }

        #currentPaging{
            display: inline-block;
            height: 16px;
            vertical-align: bottom;

        }
        #currentPaging:hover {
            text-decoration: underline;
            color: red;
            font-size: 15pt;
        }

        #paging:hover {
            text-decoration: underline;
            font-size: 15pt;
        }
    </style>

</head>
<body>
<div id="pageNums">
    <%
        for (int i = 1; i <= totalP; i++) {
    %>
    <%
        if (list!=null) {
    %>
    <a id="currentPaging" href="guestbookList.jsp?pg=<%=i%>"><%=i%></a>
    <%
    } else {
    %>
    <a id="paging" href="guestbookList.jsp?pg=<%=i%>"><%=i%></a>
    <%
        }
    %>
    <%
        } //for
    %>
</div>

<%
    for (GuestbookDTO guest : list) {
%>
<div style="margin-top: 20px; border: 1px solid black; padding: 10px;">
    <table cellpadding="5">

        <tr>
            <td>작성자</td>
            <td><input type="text" value="<%=guest.getName()%>" readonly></td>
            <td>작성일자</td>
            <td><input type="text"
                       value="<%=new SimpleDateFormat("yyyy-MM-dd").format(guest.getLogtime())%>"
                       readonly></td>
        </tr>

        <tr>
            <td>이메일</td>
            <td colspan="4"><input size=50 type="text" value="<%=guest.getEmail()%>" readonly></td>
        </tr>
        <tr>
            <td>홈페이지</td>
            <td colspan="4"><input size=50 type="text" value="<%=guest.getHomepage()%>"
                                   readonly></td>
        </tr>
        <tr>
            <td>제목</td>
            <td colspan="4"><input size=50 type="text" value="<%=guest.getSubject()%>" readonly></td>
        </tr>

    </table>
    <tr>
        <td width="50px"><textarea rows="4" cols="100" readonly><%=guest.getContent()%></textarea></td>
    </tr>

</div>
<br>
<hr>
<%
    }
%>

</body>
</html>
