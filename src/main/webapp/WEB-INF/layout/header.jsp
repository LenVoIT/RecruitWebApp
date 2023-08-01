<%-- 
    Document   : header
    Created on : Apr 6, 2023, 1:07:28 PM
    Author     : Admin
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<nav class="navbar navbar-expand-sm w-100 position-fixed" style="z-index: 100;
     background-color:#282828!important;">
    <div class="container-fluid">
        <div class="logo">
            <a class="navbar-brand" href="/FindingJob/">
                <img src="https://res.cloudinary.com/lenvo1202/image/upload/v1682236426/LViec-logo1_a6nrk0.png" alt="LOGO"/>
            </a>
        </div>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#mynavbar">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="mynavbar">
            <ul class="navbar-nav me-auto">
                <li class="nav-item dropdown">
                    <a class="nav-link  dropdown-toggle" data-bs-toggle="dropdown" href="javascript:void(0)">Việc làm</a>
                    <div class="dropdown-content bg-dark">
                        <ul class="cat-menu bg-dark">
                            <li class="dropdown-items"><a href="#" class="text-light">
                                    <div class="cat-menu-item--box">
                                        <span>Việc làm theo thành phố</span>
                                        <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor"
                                             class="bi bi-chevron-right arrowright-icon" viewBox="0 0 16 16">
                                            <path fill-rule="evenodd"
                                                  d="M4.646 1.646a.5.5 0 0 1 .708 0l6 6a.5.5 0 0 1 0 .708l-6 6a.5.5 0 0 1-.708-.708L10.293 8 4.646 2.354a.5.5 0 0 1 0-.708z" />
                                        </svg>
                                    </div>
                                </a>
                                <div class="cat-menu__sub-menu">
                                    <div>
                                        <a href="<c:url value="/job-page/1/HCM/null"/>" class="cat-menu__sub-menu-item text-light">Hồ Chí Minh</a>
                                        <a href="<c:url value="/job-page/1/Hà%20Nội/null"/>" class="cat-menu__sub-menu-item text-light">Hà Nội</a>
                                        <a href="<c:url value="/job-page/1/Đà%20Nẵng/null"/>" class="cat-menu__sub-menu-item text-light">Đà Nẵng</a>
                                        <a href="<c:url value="/job-page/1/all/null"/>" class="cat-menu__sub-menu-item text-light">Khác</a>
                                    </div>
                                </div>
                            </li>
                        </ul>
                    </div>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="<c:url value="/candidate-page"/>">Ứng viên</a>

                </li>
                <li class="nav-item">
                    <a class="nav-link" href="javascript:void(0)">Blog</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="javascript:void(0)">About us</a>
                </li>
            </ul>
            <ul class="d-flex navbar-nav">
                <li class="nav-item">
                    <a class="nav-link" href="<c:url value="/register/company" />">Liên hệ tuyển dụng </a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="<c:url value="/register/candidate" />">Đăng ký </a>
                </li>
                <li class="nav-item dropdown">
                    <c:if test="${pageContext.request.userPrincipal.name == null}">
                        <a class="nav-link" href="<c:url value="/login" />">Đăng nhập</a>
                    </c:if>
                    <c:if test="${pageContext.request.userPrincipal.name != null}">

                        <a class ="nav-link" href="#">Xin chào ${pageContext.request.userPrincipal.name}</a>
                        <c:choose>
                            <c:when test="${pageContext.request.userPrincipal.authorities == '[ROLE_COMPANY]' }">
                                <div class="dropdown-content bg-dark">
                                    <ul class="cat-menu bg-dark cat-menu_login">
                                        <li class="dropdown-items"><a href="<c:url value="/company/manage"/>" class="text-light">Quản lý tài khoản</a></li>
                                        <li class="dropdown-items"><a href="<c:url value="/logout"/>" class="text-light">Đăng xuất</a></li>
                                    </ul>
                                </div>
                            </c:when>
                            <c:when test="${pageContext.request.userPrincipal.authorities == '[ROLE_USER]' }">
                                <div class="dropdown-content bg-dark">
                                    <ul class="cat-menu bg-dark cat-menu_login">
                                        <li class="dropdown-items"><a href="<c:url value="/candidate/manage"/>" class="text-light">Quản lý tài khoản</a></li>
                                        <li class="dropdown-items"><a href="<c:url value="/candidate/update-info"/>" class="text-light">Cập nhật thông tin</a></li>
                                        <li class="dropdown-items"><a href="<c:url value="/logout"/>" class="text-light">Đăng xuất</a></li>
                                    </ul>
                                </div>
                            </c:when>
                            <c:when test="${pageContext.request.userPrincipal.authorities == '[ROLE_ADMIN]' }">
                                <div class="dropdown-content bg-dark">
                                    <ul class="cat-menu bg-dark cat-menu_login">
                                        <li class="dropdown-items"><a href="<c:url value="/admin/manage"/>" class="text-light">Quản lý trang</a></li>
                                        <li class="dropdown-items"><a href="<c:url value="/logout"/>" class="text-light">Đăng xuất</a></li>
                                    </ul>
                                </div>
                            </c:when>
                        </c:choose>


                    </c:if>
                </li>
            </ul>
        </div>
    </div>
</nav>
