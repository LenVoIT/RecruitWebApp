<%-- 
    Document   : manage_candidate
    Created on : Apr 8, 2023, 3:07:47 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<div class="admin_section">
    <div class="row">
        <div class="col-md-2">
            <div class="menu_admin">
                <img src="https://res.cloudinary.com/lenvo1202/image/upload/v1682236426/LViec-logo1_a6nrk0.png"
                     alt="LOGO">
                    <ul class="menu_admin_ul">
                        <li class="text-dark"><a class="menunav" href="#list_job">Công việc đã nộp đơn</a></li>
                        <li class="text-dark"><a class="menunav" href="#manage_job">Quản lý CV</a></li>
                        <li class="text-dark"><a class="menunav" href ="<c:url value = "/candidate/create-cv"/>">Tạo CV</a></li>
                        <li class="text-dark"><a class="menunav" href="<c:url value="/"/>">Về trang chủ</a></li>
                        <li class="text-dark"><a class="menunav" href="<c:url value="/"/>">Về trang chủ</a></li>
                    </ul>
            </div>
        </div>
        <div class="col-md-10">
            <div class="main_admin">
                <div id="list_job" class="">
                    <div class="container wp-container">

                        <h5 class="name-content w-70 text-center" style="margin-left: 20%;">Danh sách công việc bạn đã nộp đơn ứng tuyển</h5>
                        <div class="row">
                            <div class="col-md-12">
                                <div class="row">

                                    <c:forEach items="${listJbyCandidate}" var="j">
                                        <div class="col-md-12">

                                            <div class="content-job position-relative content-job_manageC">
                                                <a href="<c:url value="/job-detail/${j[0]}/1"/>" class="text-dark flex w-100">
                                                    <div class="left-job">
                                                        <c:choose>
                                                            <c:when test="${j[3].startsWith('http') == true}">
                                                                <img
                                                                    src="${j[3]}"
                                                                    alt="" class="logo_company">
                                                                </c:when>
                                                                <c:when test="${j[3].startsWith('http') == false}">

                                                                    <img src="https://res.cloudinary.com/lenvo1202/image/upload/v1682236426/LViec-logo1_a6nrk0.png"
                                                                         alt="" class="logo_company">
                                                                    </c:when>
                                                                </c:choose>

                                                                </div>
                                                                <div class="right-job">
                                                                    <h4 class="title-job">${j[1]}</h4>
                                                                    <p class="company-name">${j[2]}</p>
                                                                    <div class="detail-job">
                                                                        <ul>
                                                                            <li><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor"
                                                                                     class="bi bi-currency-dollar job-content_icon" viewBox="0 0 16 16">
                                                                                    <path
                                                                                        d="M4 10.781c.148 1.667 1.513 2.85 3.591 3.003V15h1.043v-1.216c2.27-.179 3.678-1.438 3.678-3.3 0-1.59-.947-2.51-2.956-3.028l-.722-.187V3.467c1.122.11 1.879.714 2.07 1.616h1.47c-.166-1.6-1.54-2.748-3.54-2.875V1H7.591v1.233c-1.939.23-3.27 1.472-3.27 3.156 0 1.454.966 2.483 2.661 2.917l.61.162v4.031c-1.149-.17-1.94-.8-2.131-1.718H4zm3.391-3.836c-1.043-.263-1.6-.825-1.6-1.616 0-.944.704-1.641 1.8-1.828v3.495l-.2-.05zm1.591 1.872c1.287.323 1.852.859 1.852 1.769 0 1.097-.826 1.828-2.2 1.939V8.73l.348.086z" />
                                                                                </svg><b class="text-danger">${j[4]} - ${j[5]} triệu</b> </li>
                                                                            <li><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor"
                                                                                     class="bi bi-geo-alt job-content_icon" viewBox="0 0 16 16">
                                                                                    <path
                                                                                        d="M12.166 8.94c-.524 1.062-1.234 2.12-1.96 3.07A31.493 31.493 0 0 1 8 14.58a31.481 31.481 0 0 1-2.206-2.57c-.726-.95-1.436-2.008-1.96-3.07C3.304 7.867 3 6.862 3 6a5 5 0 0 1 10 0c0 .862-.305 1.867-.834 2.94zM8 16s6-5.686 6-10A6 6 0 0 0 2 6c0 4.314 6 10 6 10z" />
                                                                                    <path d="M8 8a2 2 0 1 1 0-4 2 2 0 0 1 0 4zm0 1a3 3 0 1 0 0-6 3 3 0 0 0 0 6z" />
                                                                                </svg>${j[6]}</li>
                                                                            <li><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor"
                                                                                     class="bi bi-calendar job-content_icon" viewBox="0 0 16 16">
                                                                                    <path
                                                                                        d="M3.5 0a.5.5 0 0 1 .5.5V1h8V.5a.5.5 0 0 1 1 0V1h1a2 2 0 0 1 2 2v11a2 2 0 0 1-2 2H2a2 2 0 0 1-2-2V3a2 2 0 0 1 2-2h1V.5a.5.5 0 0 1 .5-.5zM1 4v10a1 1 0 0 0 1 1h12a1 1 0 0 0 1-1V4H1z" />
                                                                                </svg><jsp:useBean id="date" class="java.util.Date"/>
                                                                                <fmt:formatDate value="${j[7]}" type="date" pattern="dd-MM-yyyy"/></li>
                                                                        </ul>
                                                                    </div>

                                                                </div>
<!--                                                                <div class="like_icon position-absolute">
                                                                    <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-heart" viewBox="0 0 16 16">
                                                                        <path d="m8 2.748-.717-.737C5.6.281 2.514.878 1.4 3.053c-.523 1.023-.641 2.5.314 4.385.92 1.815 2.834 3.989 6.286 6.357 3.452-2.368 5.365-4.542 6.286-6.357.955-1.886.838-3.362.314-4.385C13.486.878 10.4.28 8.717 2.01L8 2.748zM8 15C-7.333 4.868 3.279-3.04 7.824 1.143c.06.055.119.112.176.171a3.12 3.12 0 0 1 .176-.17C12.72-3.042 23.333 4.867 8 15z"/>
                                                                    </svg>
                                                                </div>-->
                                                                </a>
                                                                </div>

                                                                </div>
                                                            </c:forEach>

                                                            </div>
                                                            </div>

                                                            </div>
                                                            </div>
                                                            </div>
                                                            <div id="manage_job">
                                                                <h5 style="margin-left: 44%;">QUẢN LÝ CV</h5>
                                                                <div class="col-md-12">


                                                                    <form>
                                                                        <div class="row">
                                                                            <c:forEach items="${listCV}" var="i">
                                                                                <div class="col-md-6">
                                                                                    <div class="img_cv" id="img_cv_${i.id}" >
                                                                                        <p class="text-center">Tiêu đề</p>
                                                                                        <div class="position-relative">
                                                                                            <a  onclick="document.getElementById('img_show_${i.id}').style.display = 'block'">
                                                                                                <img style="border: none; height: auto;" src="${i.cvLink}"
                                                                                                     alt="">
                                                                                            </a>
                                                                                            <a class="eye_btn" style="right: 83px;"><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-trash-fill" viewBox="0 0 16 16">
                                                                                                    <path d="M2.5 1a1 1 0 0 0-1 1v1a1 1 0 0 0 1 1H3v9a2 2 0 0 0 2 2h6a2 2 0 0 0 2-2V4h.5a1 1 0 0 0 1-1V2a1 1 0 0 0-1-1H10a1 1 0 0 0-1-1H7a1 1 0 0 0-1 1H2.5zm3 4a.5.5 0 0 1 .5.5v7a.5.5 0 0 1-1 0v-7a.5.5 0 0 1 .5-.5zM8 5a.5.5 0 0 1 .5.5v7a.5.5 0 0 1-1 0v-7A.5.5 0 0 1 8 5zm3 .5v7a.5.5 0 0 1-1 0v-7a.5.5 0 0 1 1 0z"/>
                                                                                                </svg></a>
                                                                                        </div>

                                                                                    </div>
                                                                                    <div id="img_show_${i.id}" class="modal">

                                                                                        <div class="modal-content animate" style="width: 80%;" action="/action_page.php" method="post">
                                                                                            <div class="position-relative">
                                                                                                <img style="width: 100%;height: 100%;"
                                                                                                     src="https://res.cloudinary.com/lenvo1202/image/upload/v1681568721/awotcsxe4ndrtmdevogw.png"
                                                                                                     alt="">
                                                                                                    <a class="eye_btn" onclick="document.getElementById('img_show_${i.id}').style.display = 'none'">x</a>
                                                                                            </div>
                                                                                        </div>
                                                                                    </div>
                                                                                </div>
                                                                            </c:forEach>


                                                                        </div>
                                                                    </form>
                                                                </div>
                                                                <div id="addjob">
                                                                    <a class="btn_addjob_manage" href ="<c:url value = "/candidate/create-cv"/>" style="margin-left: 40%;" href="">Thêm CV</a>
                                                                </div>
                                                            </div>

                                                            </div>

                                                            </div>

                                                            </div>


