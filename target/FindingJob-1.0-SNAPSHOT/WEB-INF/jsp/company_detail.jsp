<%-- 
    Document   : detail_company
    Created on : Apr 8, 2023, 3:07:47 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<c:url value = "/company-detail" var ="action"/>
<c:url value = "/api/company-detail/${company.id}/comments" var ="endpoint"/>
<script type = "text/javascript">
    checkSignIn = function () {
    <c:if test="${pageContext.request.userPrincipal.name == null}">
        window.location = "/FindingJob/login";
    </c:if>
    };
</script>
<script>
    window.onload = function () {
        let dates = document.querySelectorAll(".my-date > li");
        for (let i = 0; i < dates.length; i++) {
            let d = dates[i];
            d.innerText = moment(d.innerText).locale("vi").fromNow();
        }
    };
</script>
<script type="text/javascript" src="https://res.cloudinary.com/dnlryecwq/raw/upload/v1662058286/comment_hlzmzf.js"></script>
<script src ="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.29.4/moment.min.js"/>
<script src="http://code.jquery.com/jquery-3.1.1.js"></script>
<div id="info-company">
    <div class="info-company-img custom-1">
    </div>
    <div class="info-company-contact flex">
        <c:choose>
            <c:when test="${company.avatar.startsWith('http') == true}">
                <img src="${company.avatar}"
                     alt="" class="logo_company">
                </c:when>
                <c:when test="${company.avatar.startsWith('http') == false}">

                    <img src="#"
                         alt="LOGO" class="logo_company">
                    </c:when>
                </c:choose>
                <div class="info-company-contact_text">
                    <h4>${company.name}</h4>
                    <ul class="flex">
                        <li><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-geo-alt text-primary" viewBox="0 0 16 16">
                                <path d="M12.166 8.94c-.524 1.062-1.234 2.12-1.96 3.07A31.493 31.493 0 0 1 8 14.58a31.481 31.481 0 0 1-2.206-2.57c-.726-.95-1.436-2.008-1.96-3.07C3.304 7.867 3 6.862 3 6a5 5 0 0 1 10 0c0 .862-.305 1.867-.834 2.94zM8 16s6-5.686 6-10A6 6 0 0 0 2 6c0 4.314 6 10 6 10z"/>
                                <path d="M8 8a2 2 0 1 1 0-4 2 2 0 0 1 0 4zm0 1a3 3 0 1 0 0-6 3 3 0 0 0 0 6z"/>
                            </svg> ${company.city}</li>
                        <li><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-link text-primary" viewBox="0 0 16 16">
                                <path d="M6.354 5.5H4a3 3 0 0 0 0 6h3a3 3 0 0 0 2.83-4H9c-.086 0-.17.01-.25.031A2 2 0 0 1 7 10.5H4a2 2 0 1 1 0-4h1.535c.218-.376.495-.714.82-1z"/>
                                <path d="M9 5.5a3 3 0 0 0-2.83 4h1.098A2 2 0 0 1 9 6.5h3a2 2 0 1 1 0 4h-1.535a4.02 4.02 0 0 1-.82 1H12a3 3 0 1 0 0-6H9z"/>
                            </svg> <a class="text-dark" href="">https://itviec.com/</a></li>
                    </ul>
                </div>
                </div>
                </div>
                <br>
                    <br>
                        <div id="detail-info-company">
                            <div class="container wp-container">
                                <h2>Vị trí đang tuyển</h2>
                                <div class="row">
                                    <div class="col-md-9">
                                        <c:forEach items="${listJob}" var="ls">
                                            <a href="<c:url value="/job-detail/${ls.id}/1"/>" class="text-dark">
                                                <div id="list-jobofcompany">
                                                    <div  class="list-jobofcompany">
                                                        <div class="row">
                                                            <div class="col-md-12">
                                                                <div class="content-jobofcompany">
                                                                    <h5>${ls.name}</h5>
                                                                    <ul class="flex">
                                                                        <li><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor"
                                                                                 class="bi bi-currency-dollar job-content_icon" viewBox="0 0 16 16">
                                                                                <path
                                                                                    d="M4 10.781c.148 1.667 1.513 2.85 3.591 3.003V15h1.043v-1.216c2.27-.179 3.678-1.438 3.678-3.3 0-1.59-.947-2.51-2.956-3.028l-.722-.187V3.467c1.122.11 1.879.714 2.07 1.616h1.47c-.166-1.6-1.54-2.748-3.54-2.875V1H7.591v1.233c-1.939.23-3.27 1.472-3.27 3.156 0 1.454.966 2.483 2.661 2.917l.61.162v4.031c-1.149-.17-1.94-.8-2.131-1.718H4zm3.391-3.836c-1.043-.263-1.6-.825-1.6-1.616 0-.944.704-1.641 1.8-1.828v3.495l-.2-.05zm1.591 1.872c1.287.323 1.852.859 1.852 1.769 0 1.097-.826 1.828-2.2 1.939V8.73l.348.086z" />
                                                                            </svg><span> Lương: </span> ${ls.salaryFrom} - ${ls.salaryTo} triệu </li>
                                                                        <li><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor"
                                                                                 class="bi bi-geo-alt job-content_icon" viewBox="0 0 16 16">
                                                                                <path
                                                                                    d="M12.166 8.94c-.524 1.062-1.234 2.12-1.96 3.07A31.493 31.493 0 0 1 8 14.58a31.481 31.481 0 0 1-2.206-2.57c-.726-.95-1.436-2.008-1.96-3.07C3.304 7.867 3 6.862 3 6a5 5 0 0 1 10 0c0 .862-.305 1.867-.834 2.94zM8 16s6-5.686 6-10A6 6 0 0 0 2 6c0 4.314 6 10 6 10z" />
                                                                                <path d="M8 8a2 2 0 1 1 0-4 2 2 0 0 1 0 4zm0 1a3 3 0 1 0 0-6 3 3 0 0 0 0 6z" />
                                                                            </svg> <span> Nơi làm việc:</span> ${ls.city}</li>
                                                                        <li><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor"
                                                                                 class="bi bi-calendar job-content_icon" viewBox="0 0 16 16">
                                                                                <path
                                                                                    d="M3.5 0a.5.5 0 0 1 .5.5V1h8V.5a.5.5 0 0 1 1 0V1h1a2 2 0 0 1 2 2v11a2 2 0 0 1-2 2H2a2 2 0 0 1-2-2V3a2 2 0 0 1 2-2h1V.5a.5.5 0 0 1 .5-.5zM1 4v10a1 1 0 0 0 1 1h12a1 1 0 0 0 1-1V4H1z" />
                                                                            </svg> <span> Hạn nộp:</span> <jsp:useBean id="date" class="java.util.Date"/>
                                                                            <fmt:formatDate value="${ls.endDate}" type="date" pattern="dd-MM-yyyy"/></li>
                                                                    </ul>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </a>
                                        </c:forEach>
                                        <div id="advertising-company">
                                            <h2>Giới thiệu doanh nghiệp</h2>
                                            <span style="white-space: pre-line">${company.description}</span>
                                        </div>
                                        <div id="contact-company">
                                            <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-geo-alt" viewBox="0 0 16 16">
                                                <path d="M12.166 8.94c-.524 1.062-1.234 2.12-1.96 3.07A31.493 31.493 0 0 1 8 14.58a31.481 31.481 0 0 1-2.206-2.57c-.726-.95-1.436-2.008-1.96-3.07C3.304 7.867 3 6.862 3 6a5 5 0 0 1 10 0c0 .862-.305 1.867-.834 2.94zM8 16s6-5.686 6-10A6 6 0 0 0 2 6c0 4.314 6 10 6 10z"/>
                                                <path d="M8 8a2 2 0 1 1 0-4 2 2 0 0 1 0 4zm0 1a3 3 0 1 0 0-6 3 3 0 0 0 0 6z"/>
                                            </svg> <span>Địa chỉ :</span> <span> ${company.address} - ${company.city}</span>
                                        </div>
                                        <div id="comment-section">
                                            <h4>Đánh giá</h4>
                                            <br>
                                                <div class="row">
                                                    <div id = "cmtArea">
                                                        <c:forEach items ="${listComment}" var = "cmt">
                                                            <div class="col-md-12">
                                                                <div class="content_comment flex">
                                                                    <c:choose>
                                                                        <c:when test="${cmt.candidateID.avatar.startsWith('http') == true}">
                                                                            <img src="${cmt.candidateID.avatar}"
                                                                                 alt="" class="img-radius_50" style="width: 45px;height: 45px;">
                                                                            </c:when>
                                                                            <c:when test="${cmt.candidateID.avatar.startsWith('http') == false}">
                                                                                <img src="#"
                                                                                     alt="" class="img-radius_50" style="width: 45px;height: 45px;">
                                                                                </c:when>
                                                                            </c:choose>
                                                                            <div class="name_content">
                                                                                <div class="flex">
                                                                                    <p class="namecandidate">${cmt.candidateID.fullname}</p>
                                                                                    <div class="rating">
                                                                                        <c:forEach begin="0" end="4" var="i">
                                                                                            <c:choose>
                                                                                                <c:when test="${i < cmt.rating}">
                                                                                                    <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-star-fill" viewBox="0 0 16 16">
                                                                                                        <path d="M3.612 15.443c-.386.198-.824-.149-.746-.592l.83-4.73L.173 6.765c-.329-.314-.158-.888.283-.95l4.898-.696L7.538.792c.197-.39.73-.39.927 0l2.184 4.327 4.898.696c.441.062.612.636.282.95l-3.522 3.356.83 4.73c.078.443-.36.79-.746.592L8 13.187l-4.389 2.256z"/>
                                                                                                    </svg> 
                                                                                                </c:when>
                                                                                                <c:when test="${i >= cmt.rating}">
                                                                                                    <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-star" viewBox="0 0 16 16">
                                                                                                        <path d="M2.866 14.85c-.078.444.36.791.746.593l4.39-2.256 4.389 2.256c.386.198.824-.149.746-.592l-.83-4.73 3.522-3.356c.33-.314.16-.888-.282-.95l-4.898-.696L8.465.792a.513.513 0 0 0-.927 0L5.354 5.12l-4.898.696c-.441.062-.612.636-.283.95l3.523 3.356-.83 4.73zm4.905-2.767-3.686 1.894.694-3.957a.565.565 0 0 0-.163-.505L1.71 6.745l4.052-.576a.525.525 0 0 0 .393-.288L8 2.223l1.847 3.658a.525.525 0 0 0 .393.288l4.052.575-2.906 2.77a.565.565 0 0 0-.163.506l.694 3.957-3.686-1.894a.503.503 0 0 0-.461 0z"/>
                                                                                                    </svg>
                                                                                                </c:when>
                                                                                            </c:choose>
                                                                                        </c:forEach>

                                                                                    </div>
                                                                                </div>
                                                                                <p style="white-space: pre-line" class="comment-text">${cmt.assessment}</p>
                                                                            </div>

                                                                            </div>
                                                                            <div class="react-time">
                                                                                <ul class="react-time_ul flex my-date ">
                                                                                    <li>${cmt.createdDate}</li>
                                                                                </ul>
                                                                            </div>
                                                                            </div>
                                                                        </c:forEach>
                                                                        </div>

                                                                        <div class="col-md-12">
                                                                            <div class="row">
                                                                                <div class="rate col-md-12" style="margin-left: -6%; margin-top: -30px;">
                                                                                    <input type="radio" id="star5" name="rate" value="5" >
                                                                                        <label for="star5" title="text">5 stars</label>
                                                                                    </input>
                                                                                    <input type="radio" id="star4" " name="rate" value="4"> 
                                                                                        <label for="star4" title="text">4 stars</label> 
                                                                                    </input>
                                                                                    <input type="radio" id="star3" name="rate" value="3">
                                                                                        <label for="star3" title="text">3 stars</label>
                                                                                    </input>
                                                                                    <input type="radio" id="star2"  name="rate" value="2" >
                                                                                        <label for="star2" title="text">2 stars</label>
                                                                                    </input>
                                                                                    <input type="radio" id="star1" name="rate" value="1" >
                                                                                        <label for="star1" title="text">1 star</label>
                                                                                    </input>
                                                                                </div>
                                                                                <div class="content_comment flex">
                                                                                    <c:choose>
                                                                                        <c:when test="${user == null}">
                                                                                            <img src="https://res.cloudinary.com/lenvo1202/image/upload/v1683192338/avatar-none_jxkw6l.jpg" alt="" class="img-radius_50" style="width: 45px;height: 45px;">
                                                                                            </c:when>
                                                                                            <c:when test="${user != null}">
                                                                                                <img src="${user.candidate.avatar}"
                                                                                                     alt="" class="img-radius_50" style="width: 45px;height: 45px;">
                                                                                                </c:when>
                                                                                            </c:choose>


                                                                                            <textarea style="white-space: pre-line" onclick ="javascript:checkSignIn()" id="input_comment" cols="30" rows="5" placeholder="Nhập bình luận ....."></textarea>

                                                                                            <button style="border-radius:10px;width:50px; margin-left: 10px;  " onclick ="javascript:addComment('${endpoint}', ${company.id}, ${user.candidate.id})">Đăng</button>
                                                                                            </div>
                                                                                            </div>
                                                                                            </div>
                                                                                            </div>
                                                                                            </div>
                                                                                            </div>
                                                                                            <div class="col-md-3">
                                                                                                <!--                                <div class="list-scroll">
                                                                                                                                    <ul>
                                                                                                                                        <li><a href="#list-jobofcompany" class="text-dark">Vị trí đang tuyển (6)</a> </li>
                                                                                                                                        <li><a href="#advertising-company" class="text-dark">giới thiệu doanh nghiệp</a> </li>
                                                                                                                                        <li><a href="#comment-section" class="text-dark">Đánh giá</a></li>
                                                                                                                                        <li><a href="#contact-company" class="text-dark">thông tin liên hệ</a></li>
                                                                                                                                    </ul>
                                                                                                                                </div>-->
                                                                                            </div>
                                                                                            </div>
                                                                                            </div>
                                                                                            </div>
