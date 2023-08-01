<%-- 
    Document   : index
    Created on : Apr 8, 2023, 3:07:47 PM
    Author     : Admin
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>


<!DOCTYPE html >
<div class="main">
    <h2 class="tittle-card">Top công ty</h2>
    <div class="recruit">
        <div class="row">


            <c:forEach items="${companies}" var="c">

                <div class="col-md-3 col-xs-12">
                    <a href="<c:url value="/company-detail/${c[4]}"/>" class="text-dark">
                        <div class="card">
                            <div class="card-img">
                                <c:choose>
                                    <c:when test="${c[2].startsWith('http') == true}">
                                        <img class="card-img-top"
                                             src="${c[2]}"
                                             alt="Card image">
                                    </c:when>
                                    <c:when test="${c[2].startsWith('http') == false}">
                                        <img class="card-img-top"
                                             src="#"
                                             alt="Card image">
                                    </c:when>
                                </c:choose>
                            </div>

                            <div class="card-body">
                                <h5 class="card-title" style="text-align: center">${c[0]}</h5>
                                <div class="text-center"><span class="text-dark ">${c[1]}</span> </div>
                                <p class="card-text text-danger" style="text-align: center">Có ${c[3]} việc</p>

                            </div>
                        </div>
                    </a>
                </div>
            </c:forEach>

            <ul class="pagination">

                <c:choose>
                    <c:when test="${not empty counter}">
                        <c:forEach begin="1" end="${Math.ceil(counter/4)}" var="i">
                            <li class="page-item"><a class="page-link  text-dark" href="<c:url value="/"/>?page=${i}">${i}</a></li>
                            </c:forEach>
                        </c:when>
                        <c:when test="${not empty counter1}">

                    </c:when>
                    <c:when test="${not empty counter2}">

                    </c:when>
                    <c:when test="${not empty counter3}">

                    </c:when>
                </c:choose>


            </ul>



        </div>

    </div>
    <h2>Bài viết mới</h2>
    <div class="blog">

        <div class="row ">

            <div class="col-md-6">
                <div class="first-blog">

                    <div class="row">
                        <div class="col-md-6" style="background-image: url(../WEB-INF/resources/img/itviec.jpg)">
                            <a href="#" class="blog__image-link text-center">
                                <img class="img-titlt-blog"
                                     src="https://res.cloudinary.com/lenvo1202/image/upload/v1682235173/itviec-img-1_nrwq2p.webp"
                                     alt="">
                            </a>
                        </div>
                        <div class="col-md-6">
                            <div class="blog_description">
                                <div>
                                    <h5 class="blog_description-title">
                                        <a href="" class="text-dark">“Top 6 công ty công nghệ có môi trường làm việc tốt nhất Việt Nam để “nâng cấp” sự nghiệp</a>
                                        </h4>
                                </div>
                            </div>
                            <div class="blog_description-content">
                                Nếu bạn đang tìm kiếm một công việc hoặc một môi trường để có thể phát triển sự nghiệp IT thì 6 c...
                            </div>
                            <div class="blog_read-more">
                                <a href="#" class="text-primary">read more</a>
                            </div>
                        </div>
                    </div>


                </div>
            </div>
            <div class="col-md-6">
                <div class="first-blog">

                    <div class="row">
                        <div class="col-md-6">
                            <a href="#" class="blog__image-link text-center">
                                <img class="img-titlt-blog"
                                     src="https://res.cloudinary.com/lenvo1202/image/upload/v1682235173/itviec-img-2_xoq1cy.webp"
                                     alt="">
                            </a>
                        </div>
                        <div class="col-md-6">
                            <div class="blog_description">
                                <div>
                                    <h5 class="blog_description-title">
                                        <a href="" class="text-dark">“Danh sách Công ty IT tốt nhất Việt Nam 2023 có gì đáng chú ý?</a>
                                        </h4>
                                </div>
                            </div>
                            <div class="blog_description-content">
                                Danh sách Công ty IT tốt nhất Việt Nam 2023 được mở rộng và phân loại theo quy mô công ty, cung c...
                            </div>
                            <div class="blog_read-more">
                                <a href="#" class="text-primary">read more</a>
                            </div>
                        </div>
                    </div>


                </div>
            </div>
        </div>
    </div>
</div>
