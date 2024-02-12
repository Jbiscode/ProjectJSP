<%--
  Created by IntelliJ IDEA.
  User: sajaebin
  Date: 2/3/24
  Time: 12:01 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="resources/vendors/session.jsp" %> <!-- 세션 -->
<html>
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="Start your development with Meyawo landing page.">
    <meta name="author" content="Devcrud">
    <title>| JB World | Main</title>
    <!-- font icons -->
    <link rel="stylesheet" href="resources/vendors/themify-icons/css/themify-icons.css">
    <!-- Bootstrap + Meyawo main styles -->
    <link rel="stylesheet" href="resources/css/meyawo.css">
</head>
<body data-spy="scroll" data-target=".navbar" data-offset="40" id="home">

<!-- Page Navbar -->
<nav class="custom-navbar" data-spy="affix" data-offset-top="20">
    <div class="container">
        <a class="logo" href="#">Jbiscode</a>
        <ul class="nav">
            <li class="item">
                <a class="link" href="#home">홈</a>
            </li>
            <li class="item">
                <a class="link" href="#service">서비스</a>
            </li>
            <li class="item">
                <a class="link"
                   href="./views/member/login/<%= !isLogin ? "loginForm.jsp":"logout.jsp"%>"><%= !isLogin ? "로그인":"로그아웃"%></a>
            </li>
        </ul>
        <a href="javascript:void(0)" id="nav-toggle" class="hamburger hamburger--elastic">
                <div class="hamburger-box">
                    <div class="hamburger-inner"></div>
                </div>
                </a>
    </div>
</nav><!-- End of Page Navbar -->

<!-- page header -->
<header id="home" class="header">
    <div class="overlay"></div>
    <div class="header-content container">
        <h1 class="header-title">
            <% if(!isLogin){ %>
            <span class="up">HI!</span>
            <span class="down">I am JaeBin Sa</span>
            <% }else{ %>
            <span class="up">Welcome! (<%=  session_id %>)</span>
            <span class="down"><%=  session_name %>님!</span>
            <span class="down">반갑습니다.</span>
            <% } %>
        </h1>
        <p class="header-subtitle">JSP Practice</p>
        <% if( !isLogin ){ %>
        <a class="btn btn-primary" href="views/member/login/loginForm.jsp">로그인</a>
        <a class="btn btn-primary" href="views/member/register/registerForm.jsp">처음방문이신가요?</a>
        <% }else{ %>
        <a class="btn btn-point" href="views/member/update/updateForm.jsp">회원정보 수정</a>
        <a class="btn btn-point" href="views/board/write/boardWriteForm.jsp">게시판</a>
        <a class="btn btn-point" href="views/guestbook/guestbookWriteForm.jsp">방명록</a>
        <a class="btn btn-primary" href="views/member/login/logout.jsp">로그아웃</a>
        <% } %>
    </div>
</header><!-- end of page header -->

<!-- service section -->
<section class="section" id="service">
    <div class="container text-center">
        <p class="section-subtitle">What I Do ?</p>
        <h6 class="section-title mb-6">Service</h6>
        <!-- row -->
        <div class="row">
            <div class="col-md-6 col-lg-3">
                <div class="service-card">
                    <div class="body">
                        <img src="resources/imgs/pencil-case.svg"
                             alt=""
                             class="icon">
                        <h6 class="title">음악</h6>
                        <p class="subtitle">쥬크박스에 다양한 새로운 음악을 만나보세요!</p>
                    </div>
                </div>
            </div>
            <div class="col-md-6 col-lg-3">
                <div class="service-card">
                    <div class="body">
                        <img src="resources/imgs/responsive.svg"
                             alt=""
                             class="icon">
                        <h6 class="title">방명록</h6>
                        <p class="subtitle">친구들 미니홈피에 방문해서 방명록을 작성해보세요!</p>
                    </div>
                </div>
            </div>
            <div class="col-md-6 col-lg-3">
                <div class="service-card">
                    <div class="body">
                        <img src="resources/imgs/toolbox.svg"
                             alt=""
                             class="icon">
                        <h6 class="title">게시판</h6>
                        <p class="subtitle">게시판에서 실시간으로 회원들과 소통해보세요</p>
                    </div>
                </div>
            </div>
            <div class="col-md-6 col-lg-3">
                <div class="service-card">
                    <div class="body">
                        <img src="resources/imgs/analytics.svg"
                             alt=""
                             class="icon">
                        <h6 class="title">게임</h6>
                        <p class="subtitle">게임코너에서 간단한 끝말잇기게임과 오늘의 복권번호를 알아보세요</p>
                    </div>
                </div>
            </div>
        </div><!-- end of row -->
    </div>
</section><!-- end of service section -->


<!-- footer -->
<div class="container">
    <footer class="footer">
        <p class="mb-0">Copyright
            <script>document.write(new Date().getFullYear())</script> &copy; <a
                    href="http://www.devcrud.com">DevCRUD</a></p>
        <div class="social-links text-right m-auto ml-sm-auto">
            <a href="javascript:void(0)" class="link"><i class="ti-facebook"></i></a>
            <a href="javascript:void(0)" class="link"><i class="ti-twitter-alt"></i></a>
            <a href="javascript:void(0)" class="link"><i class="ti-google"></i></a>
            <a href="javascript:void(0)" class="link"><i class="ti-pinterest-alt"></i></a>
            <a href="javascript:void(0)" class="link"><i class="ti-instagram"></i></a>
            <a href="javascript:void(0)" class="link"><i class="ti-rss"></i></a>
        </div>
    </footer>
</div> <!-- end of page footer -->

<!-- core  -->
<script src="resources/vendors/jquery/jquery-3.4.1.js"></script>
<script src="resources/vendors/bootstrap/bootstrap.bundle.js"></script>

<!-- bootstrap 3 affix -->
<script src="resources/vendors/bootstrap/bootstrap.affix.js"></script>

<!-- Meyawo js -->
<script src="resources/js/meyawo.js"></script>

</body>
</html>