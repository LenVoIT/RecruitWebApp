<%-- 
    Document   : signincompany1
    Created on : Apr 8, 2023, 3:07:47 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:url value="/register/company/info" var="action" />
<div class="signin_company radius-bg">
    <div style="height: 50vh;">
        <form:form id="myForm" class="modal-content animate" action="${action}" enctype = "multipart/form-data"  method="post" modelAttribute="company">
            <div class="imgcontainer">
                <h3>Đăng ký tài khoản công ty</h3>
            </div>
            <hr class="hr_signlog">
            <div class="container">



                <P><b>THÔNG TIN DOANH NGHIỆP</b></P>
                <label for="psw"><b>Tên công ty</b> <b class="text-danger">*</b></label>
                <form:input type="text" class="input_text" placeholder="Enter the name of the company" path="name"
                            required="required"></form:input>


                    <label for="addresscompany"><b>Địa chỉ</b> <b class="text-danger">*</b></label>
                <form:input type="text" class="input_text" placeholder="Enter address" path="address"
                            required="required"></form:input>
                    <br>
                <label ><b>Thành phố</b> <b class="text-danger">*</b></label>
                <form:select class="btn btn_login text-dark btn-dropdown"
                             type="button" id="dropdowncity"  data-bs-toggle="dropdown" aria-expanded="false" path = "city">
                    <option value = "HCM">TP.HCM</option>
                    <option value = "Hà Nội">Hà Nội</option>
                    <option value = "Đà Nẵng">Đà Nẵng</option>
                </form:select>
                
                <form:input hidden = "true" path="userID" value = "${user.id}"/>
                <form:input hidden = "true" path="email" value = "${user.username}"/>
                <form:input hidden = "true" path="isChecked" value = "0"/>
                
                <label for="imgFile"><b>Ảnh công ty</b> <b class="text-danger">*</b></label>
                <form:input class="form-control form-control-sm form-control_inputFile" id="formFileSm" path="file"   type="file" required = "required"/>
                <br>
                
                 <label for="description"><b>Mô tả công ty</b> <b class="text-danger">*</b></label>
     
                <form:textarea type="text" class="input_username" path ="description" placeholder="Enter description" style="white-space: pre-wrap; " rows="12" required="required"></form:textarea>
     
                

                <button class="btn_login btn_login_company bg-dark" style="color: gold;"  type="submit">Đăng Ký</button>
                <div class="below_btn_login">

                    <span class="psw span_left">Bằng việc nhấn nút đăng ký bạn đã đồng ý với <a href="#">điều khoản</a></span>
                </div>
            </div>   

        </form:form>
    </div>


</div>
<div class="" style="height: 800px;background-color: #fff;"></div>
