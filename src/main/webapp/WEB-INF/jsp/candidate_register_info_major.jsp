<%-- 
    Document   : signincandidate2
    Created on : Apr 8, 2023, 3:07:47 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<c:url value ="/register/candidate/info/major" var ="action"/>
<div id="login_section">
        <div class="row">
            <div class="col-md-6">
                <div class="login_right">
                    <form class="modal-content_login animate" action="/action_page.php" method="post">
                        <div class="container form_moreinfo">
                            <P class="text-center"><h3 class="text-center">Bổ sung thông tin</h3></P>
                            <P class="text-center notification">Vui lòng bổ sung thông ngành nghề bạn quan tâm dưới đây để hoàn tất đăng
                                ký tài khoản</P>
                            <div class="row">
                                <div class="oneline_choosemayor">
                                    <div class="col-md-6">
                                        <div class="btn_choose_mayor">IT</div>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="btn_choose_mayor">Finance</div>
                                    </div>
                                </div>
                                <div class="oneline_choosemayor">
                                    <div class="col-md-6">
                                        <div class="btn_choose_mayor">Logistics</div>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="btn_choose_mayor">CEO</div>
                                    </div>
                                </div>
                                <div class="oneline_choosemayor">
                                    <div class="col-md-6">
                                        <div class="btn_choose_mayor">...</div>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="btn_choose_mayor">...</div>
                                    </div>
                                </div>
                                <div class="oneline_choosemayor">
                                    <div class="col-md-6">
                                        <div class="btn_choose_mayor">...</div>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="btn_choose_mayor">...</div>
                                    </div>
                                </div>
                                
                                
                            </div>
                            <button class="btn_login btn_login_choosemayor" type="submit">Xác nhận</button>
                            <!-- <div class="below_btn_login">

                                <span class="psw span_left">Bằng việc nhấn nút đăng ký bạn đã đồng ý với <a
                                        href="#">điều khoản</a></span>
                            </div> -->
                        </div>


                    </form>
                </div>
            </div>
        </div>
    </div>