<%-- 
    Document   : admin
    Created on : Apr 8, 2023, 3:07:47 PM
    Author     : Admin
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<c:url value="/api/admin/manage/company" var="endpoint" />
<c:url value="/api/admin/manage/job" var="endpoint1" />
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
<script type="text/javascript">
    colorGenera = function () {
        let r = parseInt(Math.random() * 255);
        let g = parseInt(Math.random() * 255);
        let b = parseInt(Math.random() * 255);

        return `rgba(${r},${g},${b})`;
    };
    function jobsChartjs(id, nameMajor = [], numJobs = []) {
        let color = [];
        for (let i = 0; i < nameMajor.length; i++)
            color.push(colorGenera());
        const data = {
            labels: nameMajor,
            datasets: [{
                    label: '',
                    data: numJobs,
                    backgroundColor: [
                        'rgb(28,32,186)',
                        'rgb(249,220,108)',
                        'rgb(255,167,218)',
                        'rgb(0,0,0)'
                    ],
                    hoverOffset: 4
                }]
        };
        const config = {
            type: 'doughnut',
            data: data
        };
        let ctx = document.getElementById(id).getContext("2d");
        new Chart(ctx, config);

    }
</script>    
<script type="text/javascript">
    let nameMajor = [], numJobs = [], nameMajorAplly = [], numJobsApply = [];
    <c:forEach items="${statsJobMajor}" var="jm">
    nameMajor.push('${jm[0]}');
    numJobs.push(${jm[1]});
    </c:forEach>
    <c:forEach items="${statsJobMajorA}" var="jm">
    nameMajorAplly.push('${jm[0]}');
    numJobsApply.push(${jm[1]});
    </c:forEach>
    window.onload = function () {
        jobsChartjs("myChartJobs", nameMajor, numJobs);
        jobsChartjs("myChartJobsApply", nameMajorAplly, numJobsApply);

    };
    function checkCompany(endpoint, companyID) {
        let id1 = companyID;
        fetch(endpoint, {
            method: 'post',
            body: JSON.stringify({
                "companyID": companyID
            }),
            headers: {
                "Content-Type": "application/json"}
        }).then(function () {
            document.getElementById('d' + id1).style.display = "none";
        });
    }
    ;
    function deleteUser(endpoint, email) {
        let id1 = email;
        fetch(endpoint, {
            method: 'post',
            body: JSON.stringify({
                "username": email
            }),
            headers: {
                "Content-Type": "application/json"}
        }).then(function () {
            document.getElementById('u' + id1).style.display = "none";
        });
    }
    function deleteJob(endpoint, jobID) {
        let id1 = jobID;
        fetch(endpoint, {
            method: 'post',
            body: JSON.stringify({
                "jobID": jobID
            }),
            headers: {
                "Content-Type": "application/json"}
        }).then(function () {
            document.getElementById('mj' + id1).style.display = "none";
        });
    }
    function checkJob(endpoint, jobID) {
        let id1 = jobID;
        fetch(endpoint, {
            method: 'post',
            body: JSON.stringify({
                "jobID": jobID
            }),
            headers: {
                "Content-Type": "application/json"}
        }).then(function () {
            document.getElementById('j' + id1).style.display = "none";
        });
    }
    ;
</script>
<div class="admin_section">
    <div class="row">
        <div class="col-md-2">
            <div class="menu_admin">
                <img src="https://res.cloudinary.com/lenvo1202/image/upload/v1682236426/LViec-logo1_a6nrk0.png"
                     alt="">
                <ul class="menu_admin_ul">
                    <li class="text-white"><a class="menunav" href="#check_company">Kiểm duyệt công ty</a></li>
                    <li class="text-white"><a class="menunav" href="#check_job">Kiểm duyệt tin</a></li>
                    <li class="text-white"><a class="menunav" href="#admin_manage-company">Quản lý doanh nghiệp</a></li>
                    <li class="text-white"><a class="menunav" href="#admin_manage-user">Quản lý người dùng</a></li>
                    <li class="text-white"><a class="menunav" href="#admin_manage-recruitment">Quản lý tin tuyển dụng</a></li>
                    <li class="text-white"><a class="menunav" href="#charjs">Thống kê</a></li>
                    <li class="text-white"><a class="menunav" href="<c:url value="/"/>">Về trang chủ</a></li>
                    <li class="text-white"><a class="menunav" href="<c:url value="/"/>"> Thoát</a></li>
                </ul>
            </div>
        </div>
        <div class="col-md-9">
            <div class="main_admin">
                <div id="check_company" class="check_company">
                    <h3 class="text-center text-uppercase" style="margin-top: 30px;">Kiểm duyệt công ty</h3>
                    <form >
                        <c:forEach items="${listCompanyCheck}" var="jc">
                            <div id = "d${jc.id}"  class="row">
                                <div  id="div${jc.id}" class="col-md-10">
                                    <div class="content-job content-job_admin">

                                        <div class="left-job">
                                            <img src="${jc.avatar}"
                                                 alt="" class="logo_company">
                                        </div>
                                        <div class="right-job">
                                            <h4 class="title-job">${jc.name}</h4>
                                            <p class="company-name">${jc.address}</p>
                                            <div class="detail-job">
                                                <ul>
                                                    <li><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-envelope job-content_icon" viewBox="0 0 16 16">
                                                        <path d="M0 4a2 2 0 0 1 2-2h12a2 2 0 0 1 2 2v8a2 2 0 0 1-2 2H2a2 2 0 0 1-2-2V4Zm2-1a1 1 0 0 0-1 1v.217l7 4.2 7-4.2V4a1 1 0 0 0-1-1H2Zm13 2.383-4.708 2.825L15 11.105V5.383Zm-.034 6.876-5.64-3.471L8 9.583l-1.326-.795-5.64 3.47A1 1 0 0 0 2 13h12a1 1 0 0 0 .966-.741ZM1 11.105l4.708-2.897L1 5.383v5.722Z"/>
                                                        </svg>${jc.email}</b> </li>
                                                    <li><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16"
                                                             fill="currentColor" class="bi bi-geo-alt job-content_icon"
                                                             viewBox="0 0 16 16">
                                                        <path
                                                            d="M12.166 8.94c-.524 1.062-1.234 2.12-1.96 3.07A31.493 31.493 0 0 1 8 14.58a31.481 31.481 0 0 1-2.206-2.57c-.726-.95-1.436-2.008-1.96-3.07C3.304 7.867 3 6.862 3 6a5 5 0 0 1 10 0c0 .862-.305 1.867-.834 2.94zM8 16s6-5.686 6-10A6 6 0 0 0 2 6c0 4.314 6 10 6 10z" />
                                                        <path
                                                            d="M8 8a2 2 0 1 1 0-4 2 2 0 0 1 0 4zm0 1a3 3 0 1 0 0-6 3 3 0 0 0 0 6z" />
                                                        </svg>${jc.city}</li>

                                                </ul>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-2">
                                    <button type = button onclick ="javascript:checkCompany('${endpoint}',${jc.id})" id="btn${jc.id}" class="btn_admin_check">Duyệt</button>
                                </div>
                            </div>
                        </c:forEach>

                    </form>
                </div>

                <div class="check_job" id="check_job">
                    <h3 class="text-center text-uppercase" style="margin-top: 30px;">Kiểm duyệt tin</h3>

                    <form>

                        <c:forEach items="${listJobCheck}" var="jc">
                            <div id = "j${jc[0]}"class="row">
                                <div class="col-md-10">
                                    <div class="content-job content-job_admin">
                                        <div class="left-job">
                                            <img src="${jc[7]}"
                                                 alt="" class="logo_company">
                                        </div>
                                        <div class="right-job">
                                            <h4 class="title-job">${jc[1]}</h4>
                                            <p class="company-name">${jc[8]}</p>
                                            <div class="detail-job">
                                                <ul>
                                                    <li><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16"
                                                             fill="currentColor"
                                                             class="bi bi-currency-dollar job-content_icon"
                                                             viewBox="0 0 16 16">
                                                        <path
                                                            d="M4 10.781c.148 1.667 1.513 2.85 3.591 3.003V15h1.043v-1.216c2.27-.179 3.678-1.438 3.678-3.3 0-1.59-.947-2.51-2.956-3.028l-.722-.187V3.467c1.122.11 1.879.714 2.07 1.616h1.47c-.166-1.6-1.54-2.748-3.54-2.875V1H7.591v1.233c-1.939.23-3.27 1.472-3.27 3.156 0 1.454.966 2.483 2.661 2.917l.61.162v4.031c-1.149-.17-1.94-.8-2.131-1.718H4zm3.391-3.836c-1.043-.263-1.6-.825-1.6-1.616 0-.944.704-1.641 1.8-1.828v3.495l-.2-.05zm1.591 1.872c1.287.323 1.852.859 1.852 1.769 0 1.097-.826 1.828-2.2 1.939V8.73l.348.086z" />
                                                        </svg><b class="text-danger">${jc[2]} - ${jc[3]} triệu</b> </li>
                                                    <li><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16"
                                                             fill="currentColor" class="bi bi-geo-alt job-content_icon"
                                                             viewBox="0 0 16 16">
                                                        <path
                                                            d="M12.166 8.94c-.524 1.062-1.234 2.12-1.96 3.07A31.493 31.493 0 0 1 8 14.58a31.481 31.481 0 0 1-2.206-2.57c-.726-.95-1.436-2.008-1.96-3.07C3.304 7.867 3 6.862 3 6a5 5 0 0 1 10 0c0 .862-.305 1.867-.834 2.94zM8 16s6-5.686 6-10A6 6 0 0 0 2 6c0 4.314 6 10 6 10z" />
                                                        <path
                                                            d="M8 8a2 2 0 1 1 0-4 2 2 0 0 1 0 4zm0 1a3 3 0 1 0 0-6 3 3 0 0 0 0 6z" />
                                                        </svg>TP.${jc[4]}</li>
                                                    <li><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16"
                                                             fill="currentColor" class="bi bi-calendar job-content_icon"
                                                             viewBox="0 0 16 16">
                                                        <path
                                                            d="M3.5 0a.5.5 0 0 1 .5.5V1h8V.5a.5.5 0 0 1 1 0V1h1a2 2 0 0 1 2 2v11a2 2 0 0 1-2 2H2a2 2 0 0 1-2-2V3a2 2 0 0 1 2-2h1V.5a.5.5 0 0 1 .5-.5zM1 4v10a1 1 0 0 0 1 1h12a1 1 0 0 0 1-1V4H1z" />
                                                        </svg><jsp:useBean id="date" class="java.util.Date"/>
                                                        <fmt:formatDate value="${jc[5]}" type="date" pattern="dd-MM-yyyy"/></li>
                                                    <li><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16"
                                                             fill="currentColor" class="bi bi-calendar job-content_icon"
                                                             viewBox="0 0 16 16">
                                                        <path
                                                            d="M3.5 0a.5.5 0 0 1 .5.5V1h8V.5a.5.5 0 0 1 1 0V1h1a2 2 0 0 1 2 2v11a2 2 0 0 1-2 2H2a2 2 0 0 1-2-2V3a2 2 0 0 1 2-2h1V.5a.5.5 0 0 1 .5-.5zM1 4v10a1 1 0 0 0 1 1h12a1 1 0 0 0 1-1V4H1z" />
                                                        </svg><jsp:useBean id="date1" class="java.util.Date"/>
                                                        <fmt:formatDate value="${jc[6]}" type="date" pattern="dd-MM-yyyy"/></li>
                                                </ul>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-2">
                                    <button type="button" id="${jc[0]}" onclick ="javascript:checkJob('${endpoint1}',${jc[0]})" class="btn_admin_check">Duyệt</button>
                                </div>
                            </div>
                        </c:forEach>


                    </form>
                </div>
                <div id="admin_manage-company">
                    <h3 class="text-center text-uppercase" style="margin-top: 30px;">Quản lý công ty</h3>
                    <div class="col-md-12 ms-4">

                        <form>
                            <table class="table  table-bordered table-hover" style="">
                                <tr class="text-center">
                                    <th>Mã</th>
                                    <th>Tên công ty</th>
                                    <th>Email</th>
                                    <th>Thành phố</th>
                                    <th>Kiểm duyệt</th>
                                    <th>Xóa</th>
                                </tr>
                                <c:forEach items="${listCompany}" var="j">
                                    <tr id = "u${j.email}">
                                        <td>${j.id}</td>
                                        <td>${j.name}</td>
                                        <td>${j.email}</td>
                                        <td>${j.city}</td>
                                        <td><c:choose>
                                                <c:when test="${j.isChecked == 0}">
                                                    Chưa duyệt
                                                </c:when>
                                                <c:when test="${j.isChecked == 1}">
                                                    Đã duyệt
                                                </c:when>
                                            </c:choose></td>
                                        <td>
                                            <div class="d-flex action_btn">


                                                <a onclick ="javascript:deleteUser('${endpoint2}', '${j.email}')"><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-trash-fill" viewBox="0 0 16 16">
                                                    <path d="M2.5 1a1 1 0 0 0-1 1v1a1 1 0 0 0 1 1H3v9a2 2 0 0 0 2 2h6a2 2 0 0 0 2-2V4h.5a1 1 0 0 0 1-1V2a1 1 0 0 0-1-1H10a1 1 0 0 0-1-1H7a1 1 0 0 0-1 1H2.5zm3 4a.5.5 0 0 1 .5.5v7a.5.5 0 0 1-1 0v-7a.5.5 0 0 1 .5-.5zM8 5a.5.5 0 0 1 .5.5v7a.5.5 0 0 1-1 0v-7A.5.5 0 0 1 8 5zm3 .5v7a.5.5 0 0 1-1 0v-7a.5.5 0 0 1 1 0z"/>
                                                    </svg></a>                                                                        

                                            </div>
                                        </td>
                                    </tr>
                                </c:forEach>
                            </table>
                        </form>
                    </div>
                </div>
                <div id="admin_manage-user">
                    <h3 class="text-center text-uppercase" style="margin-top: 30px;">Quản lý người dùng</h3>
                    <div class="col-md-12 ms-4">

                        <form>
                            <table class="table  table-bordered table-hover" style="">
                                <tr class="text-center">
                                    <th>Mã</th>
                                    <th>Tên người dùng</th>
                                    <th>Email</th>
                                    <th>Giới tính</th>
                                    <th>Xóa</th>
                                </tr>
                                <c:forEach items="${listUser}" var="j">
                                    <tr id = "u${j.email}">
                                        <td>${j.id}</td>
                                        <td>${j.fullname}</td>
                                        <td>${j.email}</td>
                                        <td>${j.sex}</td>
                                        <td>
                                            <div class="d-flex action_btn">
                                                <a onclick ="javascript:deleteUser('${endpoint2}', '${j.email}')"><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-trash-fill" viewBox="0 0 16 16">
                                                    <path d="M2.5 1a1 1 0 0 0-1 1v1a1 1 0 0 0 1 1H3v9a2 2 0 0 0 2 2h6a2 2 0 0 0 2-2V4h.5a1 1 0 0 0 1-1V2a1 1 0 0 0-1-1H10a1 1 0 0 0-1-1H7a1 1 0 0 0-1 1H2.5zm3 4a.5.5 0 0 1 .5.5v7a.5.5 0 0 1-1 0v-7a.5.5 0 0 1 .5-.5zM8 5a.5.5 0 0 1 .5.5v7a.5.5 0 0 1-1 0v-7A.5.5 0 0 1 8 5zm3 .5v7a.5.5 0 0 1-1 0v-7a.5.5 0 0 1 1 0z"/>
                                                    </svg></a>                                                                        

                                            </div>
                                        </td>
                                    </tr>
                                </c:forEach>
                            </table>
                        </form>
                    </div>
                </div>
                <div id="admin_manage-recruitment">
                    <h3 class="text-center text-uppercase" style="margin-top: 30px;">Quản lý tin tuyển dụng</h3>
                    <div class="col-md-12 ms-4">

                        <form>
                            <table class="table  table-bordered table-hover" style="">
                                <tr class="text-center">
                                    <th>Mã</th>
                                    <th>Tên công ty</th>
                                    <th>Tên công việc</th>
                                    <th>Ngày khởi tạo</th>
                                    <th>Xóa</th>
                                </tr>
                                <c:forEach items="${listJob}" var="j">
                                     <tr id = "mj${j[0]}">
                                        <td>${j[0]}</td>
                                        <td>${j[1]}</td>
                                        <td>${j[2]}</td>
                                        <td><jsp:useBean id="date8" class="java.util.Date"/>
                                            <fmt:formatDate value="${j[3]}" type="date" pattern="dd-MM-yyyy"/></td>
                                        <td>
                                            <div class="d-flex action_btn">
                                                <a onclick ="javascript:deleteJob('${endpoint3}', '${j[0]}')"><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-trash-fill" viewBox="0 0 16 16">
                                                    <path d="M2.5 1a1 1 0 0 0-1 1v1a1 1 0 0 0 1 1H3v9a2 2 0 0 0 2 2h6a2 2 0 0 0 2-2V4h.5a1 1 0 0 0 1-1V2a1 1 0 0 0-1-1H10a1 1 0 0 0-1-1H7a1 1 0 0 0-1 1H2.5zm3 4a.5.5 0 0 1 .5.5v7a.5.5 0 0 1-1 0v-7a.5.5 0 0 1 .5-.5zM8 5a.5.5 0 0 1 .5.5v7a.5.5 0 0 1-1 0v-7A.5.5 0 0 1 8 5zm3 .5v7a.5.5 0 0 1-1 0v-7a.5.5 0 0 1 1 0z"/>
                                                    </svg></a>                                                                        
                                            </div>
                                        </td>
                                    </tr>
                                </c:forEach>
                            </table>
                        </form>
                    </div>
                </div>
                <br>
                <div class="chartJs" id="charjs">
                    <hr style="margin-top: 60px;">
                    <div class="jobs" style="margin-top: 30px;">
                        <h5 class="text-center text-uppercase">Thống kê số lượng tin tuyển dụng</h5>
                        <br>
                        <div class="row">
                            <div class="col-md-4">

                                <table class="table  table-striped" style="margin-top: 150px;">
                                    <tbody><tr>
                                        <th>Tên ngành</th>
                                        <th>Số lượng tin tuyển dụng</th>
                                    </tr>
                                    
                                        <tr>
                                            <td>Công nghệ thông tin</td>
                                            <td>15</td>

                                        </tr>
                                    
                                        <tr>
                                            <td>Luật</td>
                                            <td>3</td>

                                        </tr>
                                    
                                        <tr>
                                            <td>Kinh tế</td>
                                            <td>6</td>

                                        </tr>
                                    
                                        <tr>
                                            <td>Tài chính</td>
                                            <td>4</td>

                                        </tr>
                                    
                                </tbody></table>
                            </div>
                            <div class="col-md-8">
                                <div style="width: 100%;height: 100%;">
                                    <canvas style="width: 568px; height: 568px; display: block; box-sizing: border-box;" id="myChartJobs" width="852" height="852"></canvas>
                                </div>
                            </div>
                        </div>

                    </div>


                    <hr style="margin-top: 60px;">
                    <div class="jobsApply" style="margin-top: 30px;">
                        <h5 class="text-center text-uppercase">Thống kê số lượng đơn nộp ứng tuyển</h5>
                        <br>
                        <div class="row">
                            <div class="col-md-4">

                                <table class="table table-striped" style="margin-top: 150px;">
                                    <tr>
                                        <th>Tên ngành</th>
                                        <th>Số lượng đơn nộp vào</th>
                                    </tr>
                                    <c:forEach items="${statsJobMajorA}" var="jm">
                                        <tr>
                                            <td>${jm[0]}</td>
                                            <td>${jm[1]}</td>

                                        </tr>
                                    </c:forEach>
                                </table>
                            </div>
                            <div class="col-md-8">
                                <div>
                                    <canvas id="myChartJobsApply"></canvas>
                                </div>
                            </div>
                        </div>
                    </div>


                </div>

            </div>
        </div>
    </div>
</div>
