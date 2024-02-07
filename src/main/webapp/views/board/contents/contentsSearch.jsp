<%--
  Created by IntelliJ IDEA.
  User: sajaebin
  Date: 2/7/24
  Time: 3:45 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<div id="searchBox">
    <form id="search_form" action="boardContents.jsp" method="get" name="search_form">
        <select name="search_field" id="">
            <option value="all">전체</option>
            <option value="writer_name">작성자</option>
            <option value="title">제목</option>
            <option value="content">내용</option>
        </select>
        <input type="text" name="search_key" id="searchKey" value="">
        <button id="searchBtn">검색</button>
    </form>
</div>
</body>
</html>
