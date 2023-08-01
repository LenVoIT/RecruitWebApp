<%-- 
    Document   : info_primary
    Created on : Apr 8, 2023, 3:07:47 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<div id="login_section">
    <div class="row">

        <div class="col-md-12">
            <div class="login_right">
                <form:form class="modal-content_login animate form_updateinfo" enctype = "multipart/form-data" action="${action}" method = "post" modelAttribute="candidate">
                    <div class="container row form_moreinfo">
                       <h3 class="text-center">Thông tin cá nhân</h3>
                        <div class="mb-4"><img id ="img" src="${candidate.avatar}" alt="" class="imgAvatar">
                        
                      
                        </div>
                        <div class="col-6">
                            <label for="psw"><b>Họ và tên</b> <b class="text-danger">*</b></label>

                            <form:input class="input_username" value = "${candidate.fullname}" placeholder="Enter name" id="fullname" path = "fullname" required = "required"/> 
                        </div>
                        <div class="col-6">
                            <label for="sdt"><b>Số điện thoại</b> <b class="text-danger">*</b></label>
                            <form:input value = "${candidate.phone}" class="input_username" id="phone"  path = "phone"
                                        placeholder="Ví dụ : 0927575201" pattern="[0]{1}[1-9]{9}" required = "required" />
                        </div>
                        
                        <form:input hidden = "true" path="userID" value = "${candidate.userID.id}"/>
                        <form:input hidden = "true" path="id" value = "${candidate.id}"/>
                        <form:input hidden = "true" path="email" value = "${candidate.email}"/>
                        <label for="dateOfBirth"><b>Ngày sinh</b></label>
                        <form:input value = "${candidate.dateOfBirth}" class="input_date" type="date" path = "dateOfBirth" required = "required"/>
                        <fmt:formatDate value="${j[6]}" type="date" pattern="dd-MM-yyyy"/>

                        <label for="dateOfBirth"><b>Giới tính</b></label>
                        <form:select value = "${candidate.sex}" class="btn btn_login text-dark btn-dropdown"
                                     type="button" id="dropdow"  data-bs-toggle="dropdown" aria-expanded="false" path = "sex">
                            <option value = "Nam">Nam</option>
                            <option value = "Nữ">Nữ</option>
                        </form:select>

                        <br>
                        <br>
                        <label ><b>Thành phố</b> <b class="text-danger">*</b></label>
                        <form:select value = "${candidate.city}" class="btn   btn_login text-dark btn-dropdown"
                                     type="button" id="dropdowncity"  data-bs-toggle="dropdown" aria-expanded="false" path = "city">
                            <option value = "TP.HCM">TP.HCM</option>
                            <option value = "Hà Nội">Hà Nội</option>
                            <option value = "Đà Nẵng">Đà Nẵng</option>
                            <option value = "Khác">Khác</option>
                        </form:select>

                        <br>
                        <!-- <hr class="hr_signlog"> -->
                        <label ><b>Bằng cấp</b> <b class="text-danger">*</b></label>
                        <form:select value = "${candidate.degree}" class="btn  btn_login text-dark btn-dropdown"
                                     type="button" id="dropdowncity"  data-bs-toggle="dropdown" aria-expanded="false" path = "degree">
                            <option value = "Cấp 3">Cấp 3</option>
                            <option value = "Bằng nghề">Bằng nghề</option>
                            <option value = "Cao đẳng">Cao đẳng</option>
                            <option value = "Đại học">Đại học</option>
                        </form:select>
                        <label ><b>Chọn chuyên ngành</b> <b class="text-danger">*</b></label>
                        <form:select value = "${candidate.major}" class="btn btn_login text-dark btn-dropdown" multiple="none"  type="button" path = "major">
                            <c:forEach items="${majorAuto}" var="m">
                                <option value="${m.name}">${m.name}</option>
                            </c:forEach>
                        </form:select>


                        <br>
                        <button class="btn_login rounded bg-dark" type="submit">Xác nhận</button>

                    </div>


                </form:form>
            </div>
        </div>
    </div>
</div>
