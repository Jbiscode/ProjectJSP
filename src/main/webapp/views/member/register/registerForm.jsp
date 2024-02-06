<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
    <head>
        <title>회원가입</title>
        <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
        <script defer src="../../../resources/js/index.js"></script>
        <link rel="stylesheet" href="../../../resources/css/index.css" />
    </head>
    <body>
        <%--<a href="hello-servlet">Hello Servlet</a>--%>
        <form id="form" name="myForm" method="post" action="register.jsp">
            <table>
                <tr>
                    <th>
                        <label for="inputName">이름*</label>
                    </th>
                    <td>
                        <input id="inputName" name="name" placeholder="이름 입력" onfocusout="checkName()" autocomplete="given-name" />
                        <div class="errorMessage" id="nameError"></div>
                    </td>
                </tr>

                <tr>
                    <th>
                        <label for="inputId">아이디*</label>
                    </th>
                    <td>
                        <input id="inputId" name="id" placeholder="아이디 입력" autocomplete="off" oninput="resetId()" />
                        <button type="button" id="btnIdCheck" onclick="checkId()">중복체크</button>
                        <div class="errorMessage" id="idError"></div>
                        <div class="okMessage" id="idOk"></div>
                    </td>
                </tr>
                <tr>
                    <th>
                        <label for="inputPassword">비밀번호*</label>
                    </th>
                    <td>
                        <input
                            type="password"
                            id="inputPassword"
                            name="password"
                            placeholder="비밀번호 입력"
                            onfocusout="checkPassword()"
                            autocomplete="new-password"
                        />
                        <div class="errorMessage" id="passwordError1"></div>
                    </td>
                </tr>
                <tr>
                    <th>
                        <label for="inputPasswordConfirm">비밀번호 확인*</label>
                    </th>
                    <td>
                        <input
                            type="password"
                            id="inputPasswordConfirm"
                            name="passwordConfirm"
                            placeholder="비밀번호 확인 입력"
                            onfocusout="checkPassword()"
                            autocomplete="new-password"
                        />
                        <div class="errorMessage" id="passwordError2"></div>
                    </td>
                </tr>
                <tr>
                    <th>성 별*</th>
                    <td>
                        <input type="radio" id="genderMale" name="gender" value="0" />
                        <label for="genderMale">남자</label>
                        <input type="radio" id="genderFemale" name="gender" value="1" />
                        <label for="genderFemale">여자</label>
                        <div class="errorMessage" id="genderError"></div>
                    </td>
                </tr>
                <tr>
                    <th>이메일*</th>
                    <td>
                        <input type="email" id="inputEmail" name="email1" /> @
                        <input type="email" id="inputEmailDomain" name="email2" oninput="resetEmail()" />
                        <select name="email3" id="email3" onchange="checkEmail()">
                            <option value="" selected>직접 입력</option>
                            <option value="naver.com">naver.com</option>
                            <option value="daum.net">daum.net</option>
                            <option value="gmail.com">gmail.com</option>
                            <option value="nate.com">nate.com</option>
                        </select>
                        <div class="errorMessage" id="emailError"></div>
                    </td>
                </tr>
                <tr>
                    <th>휴대폰 번호</th>
                    <td>
                        <select id="inputPhone1" name="phone1">
                            <option value="010">010</option>
                            <option value="011">011</option>
                            <option value="016">016</option>
                            <option value="017">017</option>
                            <option value="018">018</option>
                            <option value="019">019</option>
                        </select>
                        -
                        <input type="tel" id="inputPhone2" name="phone2" maxlength="4" />
                        -
                        <input type="tel" id="inputPhone3" name="phone3" maxlength="4" />
                    </td>
                </tr>

                <tr>
                    <th>주소</th>
                    <td>
                        <input type="text" id="zipcode" name="zipcode" maxlength="0" readonly />
                        <button type="button" id="btnZipcode" onclick="searchPost()">우편번호 검색</button>
                        <div>
                            <input type="text" id="address1" name="address1" placeholder="주소" maxlength="0" readonly />
                        </div>
                        <input type="text" id="address2" name="address2" placeholder="상세주소" />
                    </td>
                </tr>

                <tr class="buttons">
                    <td colspan="2">
                        <button type="button" id="btnSubmit" onclick="checkWrite()">회원가입</button>
                        <button type="button" id="btnReset" onclick="resetForm()">다시작성</button>
                    </td>
                </tr>
            </table>
        </form>
    </body>
</html>
