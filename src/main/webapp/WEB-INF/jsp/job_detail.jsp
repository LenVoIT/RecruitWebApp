<%-- 
    Document   : detail_job
    Created on : Apr 8, 2023, 3:07:47 PM
    Author     : Admin
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<c:url value="/job-detail" var="action" />
<c:url value="/api/job-detail/apply" var="endpoint" />
<div id="detail-info-job">
    <div class="container wp-container">
        <ul class="list-link flex">
            <li><a href="<c:url value="/"/>" class="text-dark">Trang chủ</a> /</li>
            <li><a href="<c:url value="/jobpage"/>" class="text-dark">Việc làm</a> /</li>
            <li><a href="<c:url value="/jobpage/${majorname.id}"/>" class="text-dark">${majorname.name}</a></li>

        </ul>
        <div class="detail-job-main">
            <div class="row">
                <div class="col-md-9">
                    <div class="row">
                        <div class="detail-job-content">
                            <div class="logo-name_company">
                                <c:choose>
                                    <c:when test="${detailJob[14].startsWith('http') == true}">
                                        <img src="${detailJob[14]}"
                                             alt="" class="logo_company">
                                        </c:when>
                                        <c:when test="${detailJob[14].startsWith('http') == false}">

                                            <img src="#"
                                                 alt="LOGO" class="logo_company">
                                            </c:when>
                                        </c:choose>

                                        <h5>${detailJob[13]}</h5>
                                        </div>
                                        <hr class="hr_signlog">
                                            <div class="infomation-job">
                                                <h2>${detailJob[0]}</h2>
                                                <ul class="flex date_apply">
                                                    <li><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16"
                                                             fill="currentColor" class="bi bi-calendar2 job-content_icon"
                                                             viewBox="0 0 16 16">
                                                            <path
                                                                d="M3.5 0a.5.5 0 0 1 .5.5V1h8V.5a.5.5 0 0 1 1 0V1h1a2 2 0 0 1 2 2v11a2 2 0 0 1-2 2H2a2 2 0 0 1-2-2V3a2 2 0 0 1 2-2h1V.5a.5.5 0 0 1 .5-.5zM2 2a1 1 0 0 0-1 1v11a1 1 0 0 0 1 1h12a1 1 0 0 0 1-1V3a1 1 0 0 0-1-1H2z" />
                                                            <path
                                                                d="M2.5 4a.5.5 0 0 1 .5-.5h10a.5.5 0 0 1 .5.5v1a.5.5 0 0 1-.5.5H3a.5.5 0 0 1-.5-.5V4z" />
                                                        </svg> Hạn nộp hồ sơ <jsp:useBean id="date" class="java.util.Date"/>
                                                        <fmt:formatDate value="${detailJob[6]}" type="date" pattern="dd-MM-yyyy"/></li>

                                                    <li><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16"
                                                             fill="currentColor" class="bi bi-clock-history job-content_icon"
                                                             viewBox="0 0 16 16">
                                                            <path
                                                                d="M8.515 1.019A7 7 0 0 0 8 1V0a8 8 0 0 1 .589.022l-.074.997zm2.004.45a7.003 7.003 0 0 0-.985-.299l.219-.976c.383.086.76.2 1.126.342l-.36.933zm1.37.71a7.01 7.01 0 0 0-.439-.27l.493-.87a8.025 8.025 0 0 1 .979.654l-.615.789a6.996 6.996 0 0 0-.418-.302zm1.834 1.79a6.99 6.99 0 0 0-.653-.796l.724-.69c.27.285.52.59.747.91l-.818.576zm.744 1.352a7.08 7.08 0 0 0-.214-.468l.893-.45a7.976 7.976 0 0 1 .45 1.088l-.95.313a7.023 7.023 0 0 0-.179-.483zm.53 2.507a6.991 6.991 0 0 0-.1-1.025l.985-.17c.067.386.106.778.116 1.17l-1 .025zm-.131 1.538c.033-.17.06-.339.081-.51l.993.123a7.957 7.957 0 0 1-.23 1.155l-.964-.267c.046-.165.086-.332.12-.501zm-.952 2.379c.184-.29.346-.594.486-.908l.914.405c-.16.36-.345.706-.555 1.038l-.845-.535zm-.964 1.205c.122-.122.239-.248.35-.378l.758.653a8.073 8.073 0 0 1-.401.432l-.707-.707z" />
                                                            <path d="M8 1a7 7 0 1 0 4.95 11.95l.707.707A8.001 8.001 0 1 1 8 0v1z" />
                                                            <path
                                                                d="M7.5 3a.5.5 0 0 1 .5.5v5.21l3.248 1.856a.5.5 0 0 1-.496.868l-3.5-2A.5.5 0 0 1 7 9V3.5a.5.5 0 0 1 .5-.5z" />
                                                        </svg> Ngày đăng <jsp:useBean id="date1" class="java.util.Date"/>
                                                        <fmt:formatDate value="${detailJob[17]}" type="date" pattern="dd-MM-yyyy"/></li>
                                                </ul>
                                                <div class="flex section-btn_detailjob">
                                                    <button class="btn btn_apply"  id="btn_applyCV" onclick="javascript:btnApplyClick()" >Nộp hồ sơ</button>
                                                    <button class="btn btn_share">
                                                        <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16"
                                                             fill="currentColor" class="bi bi-heart job-content_icon text-primary"
                                                             viewBox="0 0 16 16">
                                                            <path
                                                                d="m8 2.748-.717-.737C5.6.281 2.514.878 1.4 3.053c-.523 1.023-.641 2.5.314 4.385.92 1.815 2.834 3.989 6.286 6.357 3.452-2.368 5.365-4.542 6.286-6.357.955-1.886.838-3.362.314-4.385C13.486.878 10.4.28 8.717 2.01L8 2.748zM8 15C-7.333 4.868 3.279-3.04 7.824 1.143c.06.055.119.112.176.171a3.12 3.12 0 0 1 .176-.17C12.72-3.042 23.333 4.867 8 15z" />
                                                        </svg> Lưu</button>
                                                    <button class="btn btn_share">
                                                        <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16"
                                                             fill="currentColor" class="bi bi-share job-content_icon text-primary"
                                                             viewBox="0 0 16 16">
                                                            <path
                                                                d="M13.5 1a1.5 1.5 0 1 0 0 3 1.5 1.5 0 0 0 0-3zM11 2.5a2.5 2.5 0 1 1 .603 1.628l-6.718 3.12a2.499 2.499 0 0 1 0 1.504l6.718 3.12a2.5 2.5 0 1 1-.488.876l-6.718-3.12a2.5 2.5 0 1 1 0-3.256l6.718-3.12A2.5 2.5 0 0 1 11 2.5zm-8.5 4a1.5 1.5 0 1 0 0 3 1.5 1.5 0 0 0 0-3zm11 5.5a1.5 1.5 0 1 0 0 3 1.5 1.5 0 0 0 0-3z" />
                                                        </svg> chia sẻ</button>
                                                </div>
                                                <hr class="hr_signlog">
                                                    <div class="detail-job-request">
                                                        <ul>
                                                            <li><span>Yêu cầu kinh nghiệm</span> <span>${detailJob[18]} năm</span></li>
                                                            <li><span>Mức lương</span> <span>${detailJob[2]} - ${detailJob[3]} triệu</span></li>
                                                            <li><span>Cấp bậc</span> <span>${detailJob[11]}</span></li>
                                                            <li><span>Hình thức làm việc</span> <span>${detailJob[12]}</span></li>
                                                        </ul>
                                                    </div>
                                                    <hr class="hr_signlog">
                                                        <div class="detail-infomation">
                                                            <h5>Thông tin</h5>
                                                            <div class="detail-infomation-content">
                                                                <div class="row">
                                                                    <div class="col-md-6">
                                                                        <ul>
                                                                            <li><span>Ngành nghề:</span> <c:forEach items="${listmajorname}" var="m">${m[1]} ,</c:forEach>
                                                                                </li>
                                                                                <li><span>Thời gian thử việc:</span> <span>${detailJob[8]} tháng</span> </li>
                                                                            <li><span>Khu vực tuyển:</span> <span>${detailJob[1]}</span> </li>
                                                                            <li><span>Số lượng tuyển:</span> <span>${detailJob[7]}</span></li>
                                                                        </ul>

                                                                    </div>
                                                                    <div class="col-md-6">
                                                                        <ul>
                                                                            <li><span>Yêu cầu độ tuổi:</span> <span>${detailJob[4]} - ${detailJob[5]}</span></li>
                                                                            <li><span>Yêu cầu giới tính:</span> <span>${detailJob[9]}</span></li>
                                                                            <li><span>Yêu cầu bằng cấp:</span> <span>${detailJob[10]}</span></li>
                                                                            <li><span>Hạn nộp hồ sơ:</span> <span><jsp:useBean id="date2" class="java.util.Date"/>
                                                                                    <fmt:formatDate value="${detailJob[6]}" type="date" pattern="dd-MM-yyyy"/></span></li>
                                                                        </ul>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        </div>
                                                        </div>
                                                        <div class="detail-job-more detail-job-content">
                                                            <div class="description-job">
                                                                <h5>Mô tả công việc</h5>
                                                                <p>${detailJob[19]}</p>
                                                            </div>
                                                            <div class="request-job">
                                                                <h5>Yêu cầu công việc</h5>
                                                                <p></p>
                                                            </div>
                                                            <div class="benefits-job">
                                                                <h5>Quyền lợi</h5>
                                                                <p>${detailJob[20]}</p>
                                                            </div>
                                                            
                                                        </div>
                                                        <div class="contact-company detail-job-content">
                                                            <h4>${detailJob[13]}</h4>
                                                            <p><span>Hội sở :</span> ${detailJob[15]} - ${detailJob[16]}
                                                            </p>
                                                            <p><span>Người liên hệ :</span> Khối Nguồn Nhân lực Tập đoàn ${detailJob[13]}</p>
                                                        </div>

                                                        </div>
                                                        </div>
                                                        <div class="col-md-3">
                                                            <div class="list-thesame-job">
                                                                <h5>Việc làm tương tự cho bạn</h5>
                                                                <button class="bi bi-x" style="width:20px;height:20px;"></button>
                                                                <div class="border-bottom"></div>
                                                                <div class="row">
                                                                    <c:forEach items="${jobpageRecommened}" var="j">
                                                                        <a href="<c:url value="/job-detail/${j[7]}/${j[8]}"/>" class="text-dark w-100">
                                                                            <div class="box-job">
                                                                                <div class="col-md-12">

                                                                                    <div class="row">
                                                                                        <div class="col-md-12">
                                                                                            <div class="flex">
                                                                                                <img src="${j[6]}"
                                                                                                     alt="" class="logo_company"
                                                                                                     style="width: 50px;height: 40px;border-radius: 2px;">
                                                                                                    <div class="name-company">
                                                                                                        <p>${j[0]}</p>
                                                                                                        <p>${j[1]}</p>
                                                                                                    </div>
                                                                                            </div>
                                                                                        </div>
                                                                                        <div class="col-md-12">
                                                                                            <ul>
                                                                                                <li><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16"
                                                                                                         fill="currentColor"
                                                                                                         class="bi bi-currency-dollar job-content_icon"
                                                                                                         viewBox="0 0 16 16">
                                                                                                        <path
                                                                                                            d="M4 10.781c.148 1.667 1.513 2.85 3.591 3.003V15h1.043v-1.216c2.27-.179 3.678-1.438 3.678-3.3 0-1.59-.947-2.51-2.956-3.028l-.722-.187V3.467c1.122.11 1.879.714 2.07 1.616h1.47c-.166-1.6-1.54-2.748-3.54-2.875V1H7.591v1.233c-1.939.23-3.27 1.472-3.27 3.156 0 1.454.966 2.483 2.661 2.917l.61.162v4.031c-1.149-.17-1.94-.8-2.131-1.718H4zm3.391-3.836c-1.043-.263-1.6-.825-1.6-1.616 0-.944.704-1.641 1.8-1.828v3.495l-.2-.05zm1.591 1.872c1.287.323 1.852.859 1.852 1.769 0 1.097-.826 1.828-2.2 1.939V8.73l.348.086z" />
                                                                                                    </svg><b class="text-danger"> ${j[4]} - ${j[3]} triệu</b> </li>
                                                                                                <li><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16"
                                                                                                         fill="currentColor" class="bi bi-geo-alt job-content_icon"
                                                                                                         viewBox="0 0 16 16">
                                                                                                        <path
                                                                                                            d="M12.166 8.94c-.524 1.062-1.234 2.12-1.96 3.07A31.493 31.493 0 0 1 8 14.58a31.481 31.481 0 0 1-2.206-2.57c-.726-.95-1.436-2.008-1.96-3.07C3.304 7.867 3 6.862 3 6a5 5 0 0 1 10 0c0 .862-.305 1.867-.834 2.94zM8 16s6-5.686 6-10A6 6 0 0 0 2 6c0 4.314 6 10 6 10z" />
                                                                                                        <path
                                                                                                            d="M8 8a2 2 0 1 1 0-4 2 2 0 0 1 0 4zm0 1a3 3 0 1 0 0-6 3 3 0 0 0 0 6z" />
                                                                                                    </svg> TP.${j[2]}</li>
                                                                                                <li><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16"
                                                                                                         fill="currentColor" class="bi bi-briefcase job-content_icon"
                                                                                                         viewBox="0 0 16 16">
                                                                                                        <path
                                                                                                            d="M6.5 1A1.5 1.5 0 0 0 5 2.5V3H1.5A1.5 1.5 0 0 0 0 4.5v8A1.5 1.5 0 0 0 1.5 14h13a1.5 1.5 0 0 0 1.5-1.5v-8A1.5 1.5 0 0 0 14.5 3H11v-.5A1.5 1.5 0 0 0 9.5 1h-3zm0 1h3a.5.5 0 0 1 .5.5V3H6v-.5a.5.5 0 0 1 .5-.5zm1.886 6.914L15 7.151V12.5a.5.5 0 0 1-.5.5h-13a.5.5 0 0 1-.5-.5V7.15l6.614 1.764a1.5 1.5 0 0 0 .772 0zM1.5 4h13a.5.5 0 0 1 .5.5v1.616L8.129 7.948a.5.5 0 0 1-.258 0L1 6.116V4.5a.5.5 0 0 1 .5-.5z" />
                                                                                                    </svg> 2 năm</li>
                                                                                            </ul>
                                                                                        </div>
                                                                                    </div>


                                                                                </div>
                                                                            </div>
                                                                        </a>
                                                                    </c:forEach>


                                                                </div>
                                                            </div>
                                                        </div>
                                                        </div>
                                                        </div>

                                                        </div>
                                                        </div>
                                                        
                                                        
                                                        
                                                        <div id="id01" class="modal">
                                                            <form class="modal-content animate" style="width: 60%; height: auto;"  >
                                                                <div class="position-relative">

                                                                    <h5 class="text-center">Lựa chọn CV</h5>
                                                                    <div class="row">
                                                                        <c:forEach items="${candidate.curriculumVitaeSet}" var="i">
                                                                            <div class="col-md-4"> 
                                                                                    <div class="img_cv" id="img_cv_1" style="opacity: .7;">
                                                                                        <div class="position-relative">

                                                                                                <img src="${i.cvLink}"
                                                                                                     alt="">

                                                                                            <a class="eye_btn" onclick="document.getElementById('img${i.id}').style.display = 'block'"><svg
                                                                                                    xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor"
                                                                                                    class="bi bi-eye" viewBox="0 0 16 16">
                                                                                                    <path
                                                                                                        d="M16 8s-3-5.5-8-5.5S0 8 0 8s3 5.5 8 5.5S16 8 16 8zM1.173 8a13.133 13.133 0 0 1 1.66-2.043C4.12 4.668 5.88 3.5 8 3.5c2.12 0 3.879 1.168 5.168 2.457A13.133 13.133 0 0 1 14.828 8c-.058.087-.122.183-.195.288-.335.48-.83 1.12-1.465 1.755C11.879 11.332 10.119 12.5 8 12.5c-2.12 0-3.879-1.168-5.168-2.457A13.134 13.134 0 0 1 1.172 8z" />
                                                                                                    <path
                                                                                                        d="M8 5.5a2.5 2.5 0 1 0 0 5 2.5 2.5 0 0 0 0-5zM4.5 8a3.5 3.5 0 1 1 7 0 3.5 3.5 0 0 1-7 0z" />
                                                                                                </svg></a>

                                                                                        </div>
                                                                                            <button type ="button"   onclick ="javascript:applyCV('${endpoint}',${detailJob[21]}, ${candidate.id}, ${i.id})" class="btn_login" style="padding: 10px 20px; width: auto;margin-left: 35%;">Apply</button>
                                                                                    </div>
                                                                            
                                                                            <div id="img${i.id}" class="modal">

                                                                                <div class="modal-content animate">
                                                                                    <div class="position-relative">
                                                                                        <img style="width: 100%;height: 100%;"
                                                                                             src="${i.cvLink}"
                                                                                             alt="">
                                                                                            <a href="#" class="eye_btn" onclick="document.getElementById('img${i.id}').style.display = 'none'">x</a>
                                                                                    </div>
                                                                                </div>
                                                                            </div>
                                                                        </div>
                                                                        <a href="#" class="eye_btn" onclick="document.getElementById('id01').style.display = 'none'">x</a>
                                                                        </c:forEach>
                                                                        
                                                                    </div>
                                                                    
                                                                </div>
                                                            </form> 
                                                        </div>
                                                        <div class="alert" id="alert">
                                                            <span class="closebtn" onclick="this.parentElement.style.display = 'none';">&times;</span> 
                                                            <strong>Nộp hồ sơ thành công!!!</strong> 
                                                        </div>
                                                        <script type ='text/javascript'>
                                                            function applyCV(endpoint,jobId,candidateID, cvID){
                                                                fetch(endpoint, {
                                                                    method: 'post',
                                                                    body: JSON.stringify({
                                                                        "jobID": jobId,
                                                                        "candidateID": candidateID,
                                                                        "cvID": cvID
                                                                    }),
                                                                    headers: {
                                                                        "Content-Type": "application/json"}
                                                                    }).then(function () {
                                                                        document.getElementById('id01').style.display = 'none';
                                                                        document.getElementById('alert').style.display = 'block';
                                                                        document.getElementById('btn_applyCV').innerText = 'Đã nộp hồ sơ';
                                                                    });                                                           
                                                            }
                                                            function btnApplyClick(){
                                                                <c:if test="${pageContext.request.userPrincipal.name == null}">
                                                                    window.location ="/FindingJob/login";
                                                                </c:if>
                                                                <c:if test="${pageContext.request.userPrincipal.name != null}">
                                                                    if(document.getElementById('btn_applyCV').innerText  != 'Đã nộp hồ sơ'){
                                                                    document.getElementById('id01').style.display = 'block';
                                                                    }
                                                                </c:if>
                                                                    
                                                            }
                                                        </script>
                                                        <script>
                                                            window.onload = function(){
                                                                    <c:if test="${pageContext.request.userPrincipal.authorities == '[ROLE_COMPANY]'}">
                                                                        document.getElementById('btn_applyCV').hidden = true;
                                                                     </c:if>
                                                                
                                                                <c:if test="${pageContext.request.userPrincipal.authorities != '[ROLE_COMPANY]'}">
                                                                    
                                                                     <c:if test = "${candidateJob.id != null}">
                                                                          document.getElementById('btn_applyCV').innerText = 'Đã nộp hồ sơ';
                                                                     </c:if>
                                                                </c:if>    
                                                            };
                                                        </script>