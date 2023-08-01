<%-- 
   Document   : signincandidate1
   Created on : Apr 8, 2023, 3:07:47 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<c:url value ="/register/candidate/info" var ="action"/>


<div id="login_section">
    <div class="row w-80s">
            <form:form class="modal-content_login animate" enctype = "multipart/form-data" action="${action}" method = "post" modelAttribute="candidate">
                <div class="container form_moreinfo">
                    <h2 class="text-center">Bổ sung thông tin</h2>
                    <P class="text-center notification">Vui lòng bổ sung thông tin để hoàn tất đăng
                        ký tài khoản</P>
                    <label for="psw"><b>Họ và tên</b> <b class="text-danger">*</b></label>
                    <form:input class="input_username" placeholder="Enter fullname" id="fullname" path = "fullname" required = "required"/> 
                    <label for="sdt"><b>Số điện thoại</b> <b class="text-danger">*</b></label>
                    <form:input class="input_username" id="phone"  path = "phone"
                                placeholder="Ví dụ : 0927575201" pattern="[0]{1}[1-9]{9}" required = "required" />
                    <form:input hidden = "true" path="userID" value = "${user.id}"/>
                    <form:input hidden = "true" path="email" value = "${user.username}"/>
                    <label for="imgFile"><b>Ảnh cá nhân</b> <b class="text-danger">*</b></label>
                    <form:input class="form-control form-control-sm form-control_inputFile" id="formFileSm" path = "file"  type="file" required = "required"/>
                    <br>
                    <label for="dateOfBirth"><b>Ngày sinh</b></label>
                    <form:input class="input_date" type="date" path = "dateOfBirth" required = "required"/>
                    <label for="dateOfBirth"><b>Giới tính</b></label>
                    <form:select class="btn   btn_login text-dark btn-dropdown"
                                 type="button" id="dropdow"  data-bs-toggle="dropdown" aria-expanded="false" path = "sex">
                        <option value = "Nam">Nam</option>
                        <option value = "Nữ">Nữ</option>
                    </form:select>
                    <br>
                    <br>
                    <label ><b>Thành phố</b> <b class="text-danger">*</b></label>
                    <form:select class="btn   btn_login text-dark btn-dropdown"
                                 type="button" id="dropdowncity"  data-bs-toggle="dropdown" aria-expanded="false" path = "city">
                        <option value = "HCM">TP.HCM</option>
                        <option value = "Hà Nội">Hà Nội</option>
                        <option value = "Đà Nẵng">Đà Nẵng</option>
                    </form:select>
                    <br>
                    <!-- <hr class="hr_signlog"> -->
                    <label ><b>Bằng cấp</b> <b class="text-danger">*</b></label>
                    <form:select class="btn  btn_login text-dark btn-dropdown"
                                 type="button" id="dropdowncity"  data-bs-toggle="dropdown" aria-expanded="false" path = "degree">
                        <option value = "Cấp 3">Cấp 3</option>
                        <option value = "Bằng nghề">Bằng nghề</option>
                        <option value = "Cao đẳng">Cao đẳng</option>
                        <option value = "Đại học">Đại học</option>
                    </form:select>
                    <label ><b>Chọn chuyên ngành</b> <b class="text-danger">*</b></label>
                    <form:select class="btn btn_login text-dark btn-dropdown" multiple="none"  type="button" path = "major">
                        <c:forEach items="${majorAuto}" var="m">
                            <option value="${m.name}">${m.name}</option>
                        </c:forEach>
                    </form:select>
                    <br>
                    <button class="btn_login" style="background-color:black;color:gold;border-radius: 20px;" type="submit">Xác nhận</button>
                </div>
            </form:form>     
    </div>
</div>


