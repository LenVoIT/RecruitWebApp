<%-- 
    Document   : login
    Created on : Apr 8, 2023, 3:07:47 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:url value="/login" var="action" />

<div id="login_section">
    <div class="row justify-content-center">
        <div class="col-md-12">
            <div class="login_right">
                <form class="modal-content_login animate" action="${action}" method="post">
                    <div class="imgcontainer">
                        <p>Chào mừng bạn đến với LViec</p>
                        <h3>Đăng nhập</h3>
                    </div>
                    <hr class="hr_signlog">
                    <div class="container w-50">
                        <P><b>THÔNG TIN TÀI KHOẢN</b></P>
                            <c:if test="${param.error != null}">
                            <div class="alert alert-danger" >
                                Đã có lỗi xảy ra, vui lòng quay lại sau !!!
                            </div>
                        </c:if>
                        <label for="uname"><b>Username</b> <b class="text-danger">*</b></label>
                        <input type="text" class="input_username" placeholder="Enter Username" name="username" required>

                        <label for="psw"><b>Password</b> <b class="text-danger">*</b></label>
                        <input type="password" class="input_password" placeholder="Enter Password" name="password" required>


                        <button class="btn_login rounded bg-dark "  type="submit">Đăng Nhập</button>
                        <div class="below_btn_login">
                            <span class="psw span_left" >Bạn chưa có <a href="<c:url value="/register/candidate" />">Tài Khoản ?</a></span>
                            <span class="psw span_right" ><a href="#">Quên mật khẩu ?</a></span>
                        </div>
                    </div>


                </form>
            </div>
        </div>
    </div>
</div>
