<%-- 
    Document   : job_page
    Created on : Apr 8, 2023, 3:07:47 PM
    Author     : Admin
--%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="content-listjob">
    <div class="container wp-container">

        <div class="search_jobpage px-12 py-8 rounded-lg">
            <div class="items-center pb-2">
                <h1 class="text-dark leading-6 text_20">Việc làm ngành ${majorname.name}</h1>
            </div>
            <div class="search-form__keyword-section rounded" style="margin-bottom: 10px;">
                <div class="input-group input-group_jobpage dropdown">
                    <div class="search-form__icon svg-icon">
                        <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor"
                             class="bi bi-search text-dark" viewBox="0 0 16 16">
                            <path
                                d="M11.742 10.344a6.5 6.5 0 1 0-1.397 1.398h-.001c.03.04.062.078.098.115l3.85 3.85a1 1 0 0 0 1.415-1.414l-3.85-3.85a1.007 1.007 0 0 0-.115-.1zM12 6.5a5.5 5.5 0 1 1-11 0 5.5 5.5 0 0 1 11 0z" />
                        </svg>
                    </div>
                    <input class="form-control me-2 form-input_jobpage" id="search_index" type="text" placeholder="Tìm kiếm theo công việc">

                </div>

            </div>
            <div class="form_search_jobpage w-full items-center flex text-sm">
                <div class="rounded-lg select_city mr-10">
                    <select id="majors" class="select_btn">
                        <c:forEach items="${listNameMajor}" var="m">
                            <option value="${m.id}">${m.name}</option>
                        </c:forEach>

                    </select>
                </div>
                <div class="rounded-lg select_city mr-10">
                    <select id="city" class="select_btn">
                        <option value = "HCM">TP.HCM</option>
                        <option value = "Hà Nội">Hà Nội</option>
                        <option value = "Đà Nẵng">Đà Nẵng</option>
                        <option value="all">Tất cả</option>
                    </select>
                </div>

                <div class="btn_find_jobpage font-semibold p-2" >
                    <button type="button"  onclick="javascript:search_abc()" class="btn text-center font-semibold">Tìm kiếm</button>
                </div>

            </div>
        </div>


    </div>
</div>
<div id="list_job" class="mb-24" >
    <div class="container wp-container">
        <ul class="list-link flex">
            <li><a href="<c:url value="/"/>" class="text-dark">Trang chủ</a> /</li>
            <li><a href="<c:url value="/job-page"/>" class="text-dark">Việc làm</a> /</li>
            <li><a href="<c:url value="/job-page/${majorname.id}"/>" class="text-dark">${majorname.name}</a></li>
        </ul>
        <h1 class="name-content">Việc làm của ngành ${majorname.name}</h1>
        <div class="row">
            <div class="col-md-8 mb-10">
                <div class="row">
                    <c:forEach items="${jobpage}" var="j">
                        <c:choose>
                            <c:when test="${not empty jobpage}">
                                <div class="col-md-12">

                                    <div class="content-job">
                                        <a href="<c:url value="/job-detail/${j[7]}/${j[8]}"/>" class="text-dark flex w-100">
                                            <div class="left-job">
                                                <c:choose>
                                                    <c:when test="${j[6].startsWith('http') == true}">
                                                        <img
                                                            src="${j[6]}"
                                                            alt="" class="logo_company">
                                                        </c:when>
                                                        <c:when test="${j[6].startsWith('http') == false}">

                                                            <img src="#"
                                                                 alt="LOGO" class="logo_company">
                                                            </c:when>
                                                        </c:choose>

                                                        </div>
                                                        <div class="right-job">
                                                            <h4 class="title-job">${j[0]}</h4>
                                                            <p class="company-name">${j[1]}</p>
                                                            <div class="detail-job">
                                                                <ul>
                                                                    <li><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor"
                                                                             class="bi bi-currency-dollar job-content_icon" viewBox="0 0 16 16">
                                                                            <path
                                                                                d="M4 10.781c.148 1.667 1.513 2.85 3.591 3.003V15h1.043v-1.216c2.27-.179 3.678-1.438 3.678-3.3 0-1.59-.947-2.51-2.956-3.028l-.722-.187V3.467c1.122.11 1.879.714 2.07 1.616h1.47c-.166-1.6-1.54-2.748-3.54-2.875V1H7.591v1.233c-1.939.23-3.27 1.472-3.27 3.156 0 1.454.966 2.483 2.661 2.917l.61.162v4.031c-1.149-.17-1.94-.8-2.131-1.718H4zm3.391-3.836c-1.043-.263-1.6-.825-1.6-1.616 0-.944.704-1.641 1.8-1.828v3.495l-.2-.05zm1.591 1.872c1.287.323 1.852.859 1.852 1.769 0 1.097-.826 1.828-2.2 1.939V8.73l.348.086z" />
                                                                        </svg><b class="text-danger">${j[4]} - ${j[3]} triệu</b> </li>
                                                                    <li><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor"
                                                                             class="bi bi-geo-alt job-content_icon" viewBox="0 0 16 16">
                                                                            <path
                                                                                d="M12.166 8.94c-.524 1.062-1.234 2.12-1.96 3.07A31.493 31.493 0 0 1 8 14.58a31.481 31.481 0 0 1-2.206-2.57c-.726-.95-1.436-2.008-1.96-3.07C3.304 7.867 3 6.862 3 6a5 5 0 0 1 10 0c0 .862-.305 1.867-.834 2.94zM8 16s6-5.686 6-10A6 6 0 0 0 2 6c0 4.314 6 10 6 10z" />
                                                                            <path d="M8 8a2 2 0 1 1 0-4 2 2 0 0 1 0 4zm0 1a3 3 0 1 0 0-6 3 3 0 0 0 0 6z" />
                                                                        </svg>${j[2]}</li>
                                                                    <li><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor"
                                                                             class="bi bi-calendar job-content_icon" viewBox="0 0 16 16">
                                                                            <path
                                                                                d="M3.5 0a.5.5 0 0 1 .5.5V1h8V.5a.5.5 0 0 1 1 0V1h1a2 2 0 0 1 2 2v11a2 2 0 0 1-2 2H2a2 2 0 0 1-2-2V3a2 2 0 0 1 2-2h1V.5a.5.5 0 0 1 .5-.5zM1 4v10a1 1 0 0 0 1 1h12a1 1 0 0 0 1-1V4H1z" />
                                                                        </svg><jsp:useBean id="date" class="java.util.Date"/>
                                                                        <fmt:formatDate value="${j[5]}" type="date" pattern="dd-MM-yyyy"/></li>
                                                                </ul>
                                                            </div>
                                                        </div>
                                                        </a>
                                                        </div>

                                                        </div>

                                                    </c:when>
                                                    <c:otherwise>
                                                        No jobs sir
                                                    </c:otherwise>
                                                </c:choose>

                                            </c:forEach>



                                            </div>
                                            </div>
                                            <div class="col-md-3">
                                                <div class="group-menu">
                                                    <div class="group-menu-tittle">
                                                        <h2>DANH MỤC NGÀNH</h2>
                                                    </div>
                                                    <ul class="group-menu-list">
                                                        <c:forEach items="${listNameMajor}" var="n">
                                                            <li class="group-menu-items"><a href="<c:url value="/job-page/${n.id}"/>">${n.name}</a></li>
                                                            </c:forEach>

                                                    </ul>
                                                </div>
                                            </div>
                                            </div>
                                            </div>
                                            </div>
                                            <script type="text/javascript">
                                                search_abc = function () {
                                                    var inputsearch = document.getElementById('search_index');
                                                    var select = document.getElementById('majors');
                                                    var selectcity = document.getElementById('city');
                                                    if (inputsearch.value === "")
                                                    {
                                                        window.location.href = "/FindingJob/job-page/" + select.options[select.selectedIndex].value
                                                                + "/" + selectcity.options[selectcity.selectedIndex].value + "/" + "null";
                                                    } else {
                                                        window.location.href = "/FindingJob/job-page/" + select.options[select.selectedIndex].value
                                                                + "/" + selectcity.options[selectcity.selectedIndex].value + "/" + inputsearch.value;
                                                    }

                                                };
                                            </script>
                                            <script>
                                                var header = $(".group-menu");
                                                $(document).scroll(function (e) {
                                                    if ($(this).scrollTop() > $(".group-menu").height()) {
                                                        header.css({"position": "fixed", "top": "12%"});
                                                    } else {
                                                        header.css({"position": "relative", "top": "0%"});
                                                    }
                                                    if ($(this).scrollTop() > $("#list_job").max - height()) {
                                                        header.css({"position": "relative", "bottom": "2%"});
                                                    }

                                                });

                                            </script>