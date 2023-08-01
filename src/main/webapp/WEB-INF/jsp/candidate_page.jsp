<%-- 
    Document   : candidate_page
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
                <h1 class="text-dark leading-6 text_20">Tìm kiếm</h1>
                <h1 class="text-dark leading-10 text_34 font-semibold">Ứng viên</h1>
            </div>

            <div class="form_search_jobpage w-full items-center flex text-sm">
                <div class="rounded-lg select_city mr-10">
                    <select id="degree" class="select_btn">
                        <option value = "Đại học">Đại học</option>
                        <option value = "Cao đẳng">Cao đẳng</option>
                        <option value = "Bằng nghề">Bằng nghề</option>
                        <option value = "Cấp 3">Cấp 3</option>
                    </select>
                </div>
                <div class="rounded-lg select_city mr-10">
                    <select id="majors" class="select_btn">
                        <c:forEach items="${listNameMajor}" var="m">
                            <option value="${m.name}">${m.name}</option>
                        </c:forEach>
                            <option value = "all">Tất cả</option>

                    </select>
                </div>
                <div class="rounded-lg select_city mr-10">
                    <select id="city" class="select_btn">
                        <option value = "HCM">TP.HCM</option>
                        <option value = "Hà Nội">Hà Nội</option>
                        <option value = "Đà Nẵng">Đà Nẵng</option>
                        <option value = "all">Tất cả</option>
                    </select>
                </div>

                <div class="btn_find_jobpage font-semibold p-2" >
                    <button type="button"  onclick="javascript:search_abc()" class="btn text-light text-center font-semibold">Tìm kiếm</button>
                </div>

            </div>
        </div>


    </div>
</div>
<div id="list_job" class="" >
    <div class="container wp-container">
        <ul class="list-link flex">
            <li><a href="<c:url value="/"/>" class="text-dark">Trang chủ</a> /</li>
            <li><a href="#" class="text-dark">Tìm ứng viên</a> /</li>

        </ul>
        <h1 class="name-content">Ứng viên</h1>
        <div class="row">
            <div class="col-md-10">
                <div class="row">
                    <c:forEach items="${listC}" var="j">
                        <div class="col-md-12">

                            <div class="content-job content-job_manageC">
                                <a href="#"  class="text-dark flex w-100">
                                    <div class="left-job">
                                        <c:choose>
                                            <c:when test="${j.avatar.startsWith('http') == true}">
                                                <img
                                                    src="${j.avatar}"
                                                    alt="" class="logo_company">
                                            </c:when>
                                            <c:when test="${j.avatar.startsWith('http') == false}">

                                                <img src="https://res.cloudinary.com/lenvo1202/image/upload/v1682236426/LViec-logo1_a6nrk0.png"
                                                     alt="" class="logo_company">
                                            </c:when>
                                        </c:choose>

                                    </div>
                                    <div class="right-job">
                                        <h4 class="title-job">${j.fullname}</h4>
                                        <p class="company-name">${j.email}</p>
                                        <div class="detail-job">
                                            <ul>
                                                <li><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-telephone job-content_icon" viewBox="0 0 16 16">
                                                    <path d="M3.654 1.328a.678.678 0 0 0-1.015-.063L1.605 2.3c-.483.484-.661 1.169-.45 1.77a17.568 17.568 0 0 0 4.168 6.608 17.569 17.569 0 0 0 6.608 4.168c.601.211 1.286.033 1.77-.45l1.034-1.034a.678.678 0 0 0-.063-1.015l-2.307-1.794a.678.678 0 0 0-.58-.122l-2.19.547a1.745 1.745 0 0 1-1.657-.459L5.482 8.062a1.745 1.745 0 0 1-.46-1.657l.548-2.19a.678.678 0 0 0-.122-.58L3.654 1.328zM1.884.511a1.745 1.745 0 0 1 2.612.163L6.29 2.98c.329.423.445.974.315 1.494l-.547 2.19a.678.678 0 0 0 .178.643l2.457 2.457a.678.678 0 0 0 .644.178l2.189-.547a1.745 1.745 0 0 1 1.494.315l2.306 1.794c.829.645.905 1.87.163 2.611l-1.034 1.034c-.74.74-1.846 1.065-2.877.702a18.634 18.634 0 0 1-7.01-4.42 18.634 18.634 0 0 1-4.42-7.009c-.362-1.03-.037-2.137.703-2.877L1.885.511z"/>
                                                    </svg><b class="">${j.phone}</b> </li>
                                                <li><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor"
                                                         class="bi bi-geo-alt job-content_icon" viewBox="0 0 16 16">
                                                    <path
                                                        d="M12.166 8.94c-.524 1.062-1.234 2.12-1.96 3.07A31.493 31.493 0 0 1 8 14.58a31.481 31.481 0 0 1-2.206-2.57c-.726-.95-1.436-2.008-1.96-3.07C3.304 7.867 3 6.862 3 6a5 5 0 0 1 10 0c0 .862-.305 1.867-.834 2.94zM8 16s6-5.686 6-10A6 6 0 0 0 2 6c0 4.314 6 10 6 10z" />
                                                    <path d="M8 8a2 2 0 1 1 0-4 2 2 0 0 1 0 4zm0 1a3 3 0 1 0 0-6 3 3 0 0 0 0 6z" />
                                                    </svg>TP.${j.city}</li>
                                                <li><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-gender-male job-content_icon" viewBox="0 0 16 16">
                                                    <path fill-rule="evenodd" d="M9.5 2a.5.5 0 0 1 0-1h5a.5.5 0 0 1 .5.5v5a.5.5 0 0 1-1 0V2.707L9.871 6.836a5 5 0 1 1-.707-.707L13.293 2H9.5zM6 6a4 4 0 1 0 0 8 4 4 0 0 0 0-8z"/>
                                                    </svg>${j.sex}</li>
                                                <li><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-book job-content_icon" viewBox="0 0 16 16">
                                                    <path d="M1 2.828c.885-.37 2.154-.769 3.388-.893 1.33-.134 2.458.063 3.112.752v9.746c-.935-.53-2.12-.603-3.213-.493-1.18.12-2.37.461-3.287.811V2.828zm7.5-.141c.654-.689 1.782-.886 3.112-.752 1.234.124 2.503.523 3.388.893v9.923c-.918-.35-2.107-.692-3.287-.81-1.094-.111-2.278-.039-3.213.492V2.687zM8 1.783C7.015.936 5.587.81 4.287.94c-1.514.153-3.042.672-3.994 1.105A.5.5 0 0 0 0 2.5v11a.5.5 0 0 0 .707.455c.882-.4 2.303-.881 3.68-1.02 1.409-.142 2.59.087 3.223.877a.5.5 0 0 0 .78 0c.633-.79 1.814-1.019 3.222-.877 1.378.139 2.8.62 3.681 1.02A.5.5 0 0 0 16 13.5v-11a.5.5 0 0 0-.293-.455c-.952-.433-2.48-.952-3.994-1.105C10.413.809 8.985.936 8 1.783z"/>
                                                    </svg>${j.major}</li>
                                                <li><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-mortarboard job-content_icon" viewBox="0 0 16 16">
                                                    <path d="M8.211 2.047a.5.5 0 0 0-.422 0l-7.5 3.5a.5.5 0 0 0 .025.917l7.5 3a.5.5 0 0 0 .372 0L14 7.14V13a1 1 0 0 0-1 1v2h3v-2a1 1 0 0 0-1-1V6.739l.686-.275a.5.5 0 0 0 .025-.917l-7.5-3.5ZM8 8.46 1.758 5.965 8 3.052l6.242 2.913L8 8.46Z"/>
                                                    <path d="M4.176 9.032a.5.5 0 0 0-.656.327l-.5 1.7a.5.5 0 0 0 .294.605l4.5 1.8a.5.5 0 0 0 .372 0l4.5-1.8a.5.5 0 0 0 .294-.605l-.5-1.7a.5.5 0 0 0-.656-.327L8 10.466 4.176 9.032Zm-.068 1.873.22-.748 3.496 1.311a.5.5 0 0 0 .352 0l3.496-1.311.22.748L8 12.46l-3.892-1.556Z"/>
                                                    </svg>${j.degree}</li>
                                            </ul>
                                        </div>
                                    </div>
                                </a>
                            </div>



                        </div>
                    </c:forEach>



                </div>
            </div>

        </div>
    </div>
</div>
<script type="text/javascript">
    search_abc = function () {
        var degree = document.getElementById('degree');
        var major = document.getElementById('majors');
        var selectcity = document.getElementById('city');

        window.location.href = "/FindingJob/candidate-page/" + selectcity.options[selectcity.selectedIndex].value
                + "/" + major.options[major.selectedIndex].value + "/" + degree.options[degree.selectedIndex].value;



    };
</script>
