<%-- 
    Document   : signincandidate
    Created on : Apr 8, 2023, 3:07:47 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<c:url value ="/register/candidate" var ="action"/>
<div id="login_section" style="margin-top: -15px;">
    <div class="row">
            <div class="login mx-12">
                <form:form class = "modal-content_login animate" action="${action}" method="post" modelAttribute = "user">


                    <div class="imgcontainer">
                        <h2>Đăng ký</h2>
                    </div>
                    <hr class="hr_signlog">
                    <div class="container w-50">
                        <h4><b>THÔNG TIN TÀI KHOẢN</b></h4>
                        <label for="uname"><b>Địa chỉ email</b> <b class="text-danger">*</b></label>
                        <form:input type = "email" class="input_username" placeholder="Enter Username " pattern=".+@gmail\.com"  id="username" path="username" required = "required"/>
                        <form:errors path="username" element="div" cssClass="text-danger"/>
                        <c:if test="${errMsg != null}">
                            <div > <p class="text-danger">${errMsg}</p></div>
                        </c:if>
                        <label for="psw"><b>Password</b> <b class="text-danger">*</b></label>
                        <form:input type="password" class="input_password" placeholder="Enter Password" id="password" path="password" required = "required"/>
                        <form:errors path="password" element="div" cssClass="text-danger"/> 
                        <label for="psw"><b>Nhập lại password</b> <b class="text-danger">*</b></label>
                        <form:input type="password" class="input_password" placeholder="Enter Password" id="repassword" path="repassword" required = "required"/>
                        <form:errors path="repassword" element="div" cssClass="text-danger"/> 

                        <div><button class="btn_login rounded bg-dark"  type="submit">Đăng Ký</button></div
                        
                        <div class="below_btn_login">
                            <span class="psw span_left" >Bằng việc nhấn nút đăng ký bạn đã đồng ý với <a href="#">điều khoản</a></span>
                        </div>
                    </div>


                </form:form>
            </div>
        <!--</div>-->
    </div>
</div>


