<%-- 
    Document   : createCV
    Created on : Apr 8, 2023, 3:07:47 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<c:url value ="/candidate/create-cv" var ="action"/>
<script type="text/javascript">
    save_canvas = function () {
        document.getElementById('btn').hidden = true;
        document.getElementById("title").innerText = " ";
        document.getElementById("title1").innerText = " ";
        document.getElementById('space').hidden = false;
        html2canvas(document.querySelector("#cv"), {useCORS: true, scrollY: -window.scrollY, foreignObjectRendering: true, scale: 2}).then(function (canvas) {
            var doc = new jsPDF('p', 'px', 'a3');
            canvas.toDataURL("image/png");
            doc.addImage(canvas, 'png', -115, 30);
            doc.save('CV.pdf');
            canvas.toBlob((blob) => {
                var file = new File([blob], 'test.png', {
                    type: 'image/png'
                });
                const dataTransfer = new DataTransfer();
                dataTransfer.items.add(file);
                document.getElementById('theimage9').files = dataTransfer.files;
                document.getElementById('myform').submit();
            });
        });
    };
</script>
<script src="https://cdn.jsdelivr.net/npm/es6-promise@4/dist/es6-promise.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/es6-promise@4/dist/es6-promise.auto.min.js"></script> 
<script src="https://html2canvas.hertzen.com/dist/html2canvas.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jspdf/1.3.5/jspdf.debug.js"></script>
<div id="CV_HTML" class="signin_company  radius-bg" style="height: 80vh;">
    <div  id ="cv"  class="" >
        <form:form id = "myform" class="modal-content animate model-recruitment" style="width: 70%;" action="${action}" enctype = "multipart/form-data"  method="post" modelAttribute="cv">
            <div class="imgcontainer">
                <div class="row">
                    <h3 id ="title" style="float: left;width: 100%;"><span style="opacity: .5;"></span> ${candidate.fullname}   </h3>

                    <h5 id ="title1" style="float: left;margin-top: 10px;">Chỉnh sửa trang CV</h5>


                </div>
            </div>
            <hr class="hr_signlog">
                <div class="container flex">

                    <div class="left_CV">
                        <div class="info_user">
                            <img id ="img" src="${candidate.avatar}" alt="" class="imgAvatar">
                                <h5>Thông tin cá nhân</h5>
                                <ul class="info_ul">
                                    <li><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-calendar2-date" viewBox="0 0 16 16">
                                            <path d="M6.445 12.688V7.354h-.633A12.6 12.6 0 0 0 4.5 8.16v.695c.375-.257.969-.62 1.258-.777h.012v4.61h.675zm1.188-1.305c.047.64.594 1.406 1.703 1.406 1.258 0 2-1.066 2-2.871 0-1.934-.781-2.668-1.953-2.668-.926 0-1.797.672-1.797 1.809 0 1.16.824 1.77 1.676 1.77.746 0 1.23-.376 1.383-.79h.027c-.004 1.316-.461 2.164-1.305 2.164-.664 0-1.008-.45-1.05-.82h-.684zm2.953-2.317c0 .696-.559 1.18-1.184 1.18-.601 0-1.144-.383-1.144-1.2 0-.823.582-1.21 1.168-1.21.633 0 1.16.398 1.16 1.23z"/>
                                            <path d="M3.5 0a.5.5 0 0 1 .5.5V1h8V.5a.5.5 0 0 1 1 0V1h1a2 2 0 0 1 2 2v11a2 2 0 0 1-2 2H2a2 2 0 0 1-2-2V3a2 2 0 0 1 2-2h1V.5a.5.5 0 0 1 .5-.5zM2 2a1 1 0 0 0-1 1v11a1 1 0 0 0 1 1h12a1 1 0 0 0 1-1V3a1 1 0 0 0-1-1H2z"/>
                                            <path d="M2.5 4a.5.5 0 0 1 .5-.5h10a.5.5 0 0 1 .5.5v1a.5.5 0 0 1-.5.5H3a.5.5 0 0 1-.5-.5V4z"/>
                                        </svg>${candidate.dateOfBirth}</li>
                                    <li><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-gender-male" viewBox="0 0 16 16">
                                            <path fill-rule="evenodd" d="M9.5 2a.5.5 0 0 1 0-1h5a.5.5 0 0 1 .5.5v5a.5.5 0 0 1-1 0V2.707L9.871 6.836a5 5 0 1 1-.707-.707L13.293 2H9.5zM6 6a4 4 0 1 0 0 8 4 4 0 0 0 0-8z"/>
                                        </svg> ${candidate.sex}</li>
                                    <li><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-envelope" viewBox="0 0 16 16">
                                            <path d="M0 4a2 2 0 0 1 2-2h12a2 2 0 0 1 2 2v8a2 2 0 0 1-2 2H2a2 2 0 0 1-2-2V4Zm2-1a1 1 0 0 0-1 1v.217l7 4.2 7-4.2V4a1 1 0 0 0-1-1H2Zm13 2.383-4.708 2.825L15 11.105V5.383Zm-.034 6.876-5.64-3.471L8 9.583l-1.326-.795-5.64 3.47A1 1 0 0 0 2 13h12a1 1 0 0 0 .966-.741ZM1 11.105l4.708-2.897L1 5.383v5.722Z"/>
                                        </svg> ${candidate.email}</li>
                                    <li><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-telephone" viewBox="0 0 16 16">
                                            <path d="M3.654 1.328a.678.678 0 0 0-1.015-.063L1.605 2.3c-.483.484-.661 1.169-.45 1.77a17.568 17.568 0 0 0 4.168 6.608 17.569 17.569 0 0 0 6.608 4.168c.601.211 1.286.033 1.77-.45l1.034-1.034a.678.678 0 0 0-.063-1.015l-2.307-1.794a.678.678 0 0 0-.58-.122l-2.19.547a1.745 1.745 0 0 1-1.657-.459L5.482 8.062a1.745 1.745 0 0 1-.46-1.657l.548-2.19a.678.678 0 0 0-.122-.58L3.654 1.328zM1.884.511a1.745 1.745 0 0 1 2.612.163L6.29 2.98c.329.423.445.974.315 1.494l-.547 2.19a.678.678 0 0 0 .178.643l2.457 2.457a.678.678 0 0 0 .644.178l2.189-.547a1.745 1.745 0 0 1 1.494.315l2.306 1.794c.829.645.905 1.87.163 2.611l-1.034 1.034c-.74.74-1.846 1.065-2.877.702a18.634 18.634 0 0 1-7.01-4.42 18.634 18.634 0 0 1-4.42-7.009c-.362-1.03-.037-2.137.703-2.877L1.885.511z"/>
                                        </svg>${candidate.phone}</li>
                                    <li><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-geo" viewBox="0 0 16 16">
                                            <path fill-rule="evenodd" d="M8 1a3 3 0 1 0 0 6 3 3 0 0 0 0-6zM4 4a4 4 0 1 1 4.5 3.969V13.5a.5.5 0 0 1-1 0V7.97A4 4 0 0 1 4 3.999zm2.493 8.574a.5.5 0 0 1-.411.575c-.712.118-1.28.295-1.655.493a1.319 1.319 0 0 0-.37.265.301.301 0 0 0-.057.09V14l.002.008a.147.147 0 0 0 .016.033.617.617 0 0 0 .145.15c.165.13.435.27.813.395.751.25 1.82.414 3.024.414s2.273-.163 3.024-.414c.378-.126.648-.265.813-.395a.619.619 0 0 0 .146-.15.148.148 0 0 0 .015-.033L12 14v-.004a.301.301 0 0 0-.057-.09 1.318 1.318 0 0 0-.37-.264c-.376-.198-.943-.375-1.655-.493a.5.5 0 1 1 .164-.986c.77.127 1.452.328 1.957.594C12.5 13 13 13.4 13 14c0 .426-.26.752-.544.977-.29.228-.68.413-1.116.558-.878.293-2.059.465-3.34.465-1.281 0-2.462-.172-3.34-.465-.436-.145-.826-.33-1.116-.558C3.26 14.752 3 14.426 3 14c0-.599.5-1 .961-1.243.505-.266 1.187-.467 1.957-.594a.5.5 0 0 1 .575.411z"/>
                                        </svg> ${candidate.city}</li>
                                </ul>
                                <h5>Tin Học</h5>
                                <ul class="computer_ul">
                                    <li><span >Word</span><span>
                                            <div class="rate col-md-12">
                                                <input type="radio" id="star5" name="rate" value="5" />
                                                <label for="star5" title="text">5 stars</label>
                                                <input type="radio" id="star4" name="rate" value="4" />
                                                <label for="star4" title="text">4 stars</label>
                                                <input type="radio" id="star3" name="rate" value="3" />
                                                <label for="star3" title="text">3 stars</label>
                                                <input type="radio" id="star2" name="rate" value="2" />
                                                <label for="star2" title="text">2 stars</label>
                                                <input type="radio" id="star1" name="rate" value="1" />
                                                <label for="star1" title="text">1 star</label>
                                            </div>
                                    </li>
                                    <li><span>Excel</span><span>
                                            <div class="rate1 col-md-12">
                                                <input type="radio" id="star51" name="rate1" value="5" />
                                                <label for="star51" title="text">5 stars</label>
                                                <input type="radio" id="star41" name="rate1" value="4" />
                                                <label for="star41" title="text">4 stars</label>
                                                <input type="radio" id="star31" name="rate1" value="3" />
                                                <label for="star31" title="text">3 stars</label>
                                                <input type="radio" id="star21" name="rate1" value="2" />
                                                <label for="star21" title="text">2 stars</label>
                                                <input type="radio" id="star11" name="rate1" value="1" />
                                                <label for="star11" title="text">1 star</label>
                                            </div>
                                        </span>
                                    </li>
                                    <li><span>PowerPoint</span><span>
                                            <div class="rate2 col-md-12">
                                                <input type="radio" id="star52" name="rate2" value="5" />
                                                <label for="star52" title="text">5 stars</label>
                                                <input type="radio" id="star42" name="rate2" value="4" />
                                                <label for="star42" title="text">4 stars</label>
                                                <input type="radio" id="star32" name="rate2" value="3" />
                                                <label for="star32" title="text">3 stars</label>
                                                <input type="radio" id="star22" name="rate2" value="2" />
                                                <label for="star22" title="text">2 stars</label>
                                                <input type="radio" id="star12" name="rate2" value="1" />
                                                <label for="star12" title="text">1 star</label>
                                            </div>
                                        </span>
                                    </li>
                                </ul>
                                <h5>Tiếng Anh</h5>
                                <ul class="English_ul">
                                    <li><span >Nghe</span><span>
                                            <div class="rate3 col-md-12">
                                                <input type="radio" id="star53" name="rate3" value="5" />
                                                <label for="star53" title="text">5 stars</label>
                                                <input type="radio" id="star43" name="rate3" value="4" />
                                                <label for="star43" title="text">4 stars</label>
                                                <input type="radio" id="star33" name="rate3" value="3" />
                                                <label for="star33" title="text">3 stars</label>
                                                <input type="radio" id="star23" name="rate3" value="2" />
                                                <label for="star23" title="text">2 stars</label>
                                                <input type="radio" id="star13" name="rate3" value="1" />
                                                <label for="star13" title="text">1 star</label>
                                            </div>
                                    </li>
                                    <li><span>Nói</span><span>
                                            <div class="rate4 col-md-12">
                                                <input type="radio" id="star54" name="rate4" value="5" />
                                                <label for="star54" title="text">5 stars</label>
                                                <input type="radio" id="star44" name="rate4" value="4" />
                                                <label for="star44" title="text">4 stars</label>
                                                <input type="radio" id="star34" name="rate4" value="3" />
                                                <label for="star34" title="text">3 stars</label>
                                                <input type="radio" id="star24" name="rate4" value="2" />
                                                <label for="star24" title="text">2 stars</label>
                                                <input type="radio" id="star14" name="rate4" value="1" />
                                                <label for="star14" title="text">1 star</label>
                                            </div>
                                        </span>
                                    </li>
                                    <li><span>Đọc</span><span>
                                            <div class="rate5 col-md-12">
                                                <input type="radio" id="star55" name="rate5" value="5" />
                                                <label for="star55" title="text">5 stars</label>
                                                <input type="radio" id="star45" name="rate5" value="4" />
                                                <label for="star45" title="text">4 stars</label>
                                                <input type="radio" id="star35" name="rate5" value="3" />
                                                <label for="star35" title="text">3 stars</label>
                                                <input type="radio" id="star25" name="rate5" value="2" />
                                                <label for="star25" title="text">2 stars</label>
                                                <input type="radio" id="star15" name="rate5" value="1" />
                                                <label for="star15" title="text">1 star</label>
                                            </div>
                                        </span>
                                    </li>
                                    <li><span>Viết</span><span>
                                            <div class="rate6 col-md-12" >
                                                <input type="radio"  id="star56" name="rate6" value="5" />
                                                <label for="star56" title="text">5 stars</label>
                                                <input type="radio" id="star46" name="rate6" value="4" />
                                                <label for="star46" title="text">4 stars</label>
                                                <input type="radio" id="star36" name="rate6" value="3" />
                                                <label for="star36" title="text">3 stars</label>
                                                <input type="radio" id="star26" name="rate6" value="2" />
                                                <label for="star26" title="text">2 stars</label>
                                                <input type="radio" id="star16" name="rate6" value="1" />
                                                <label for="star16" title="text">1 star</label>
                                            </div>
                                        </span>
                                    </li>

                                </ul>

                                <h5>Người liên hệ</h5>
                                <ul class="contactPerson_ul">
                                    <li><span>- Công ty : </span><span><input type="text" placeholder="Nhập tên công ty" class="input_CV"></span></li>
                                    <li><span>- Họ và tên  : </span><span><input type="text" placeholder="Nhập tên người liên hệ" class="input_CV"></span></li>
                                    <li><span>- Điện thoại : </span><span><input type="text" placeholder="Nhập số điện thoại" class="input_CV"></span></li>
                                    <li><span>- Chức vụ : </span><span><input type="text" placeholder="Nhập chức vụ" class="input_CV"></span></li>
                                </ul>
                        </div>
                    </div>
                    <div class="right_CV">
                        <h4 class="text-center">${candidate.fullname}</h4>
                        <div class="input_tittle"> <input type="text" style="font-size: 16px;text-align: center;" placeholder="Nhập tiêu đề CV" class="input_CV"></div>
                        <h5 class="text-center">Mục tiêu nghề nghiệp</h5>
                        <input type="text" style="font-size: 16px;margin-left: 70px;border: 1px solid #000;text-align: center;" placeholder="Nhập mục tiêu " class="input_CV">
                            <br>
                                <br>

                                    <div class="education_cv">
                                        <h5>Học Vấn</h5>
                                        <div class="input_education">
                                            Từ <input type="text" name="" id="" style="width: 60px; border: 1px solid #000;"  placeholder="08-2019">
                                                Đến  <input type="text" name="" id="" style="width: 60px; border: 1px solid #000;"  placeholder="08-2023">
                                                    </div>

                                                    <input type="text" style="font-size: 16px;margin-left: 45px;border: 1px solid #000;margin-top: 10px;" placeholder="Nhập tên trường" class="input_CV">
                                                        <ul class="education_ul">
                                                            <li><span>Chuyên ngành :</span><span><input type="text" placeholder="Nhập chuyên ngành" class="input_CV"></span></li>
                                                            <li><span>Loại bằng cấp :</span><span><input type="text" placeholder="Nhập loại bằng cấp" class="input_CV"></span></li>
                                                            <li><span>Loại tốt nghiệp :</span><span><input type="text" placeholder="Nhập loại tốt nghiệp" class="input_CV"></span></li>
                                                        </ul>
                                                        </div>
                                                        <div class="experience_cv">
                                                            <h5>Kinh nghiệm làm việc</h5>
                                                            <div class="input_education">
                                                                Từ <input type="text" name="" id="" style="width: 60px; border: 1px solid #000;"  placeholder="02-2023">
                                                                    Đến  <input type="text" name="" id="" style="width: 60px; border: 1px solid #000;"  placeholder="05-2023">
                                                                        </div>

                                                                        <input type="text" style="font-size: 16px;margin-left: 45px;border: 1px solid #000;margin-top: 10px;" placeholder="Nhập tên công ty" class="input_CV">
                                                                            <ul class="experience_ul education_ul">
                                                                                <li class="my-2"><input type="text" style="font-size: 16px;border: 1px solid #000;margin-top: 5px;" placeholder="Nhập chức danh " class="input_CV"></li>
                                                                                <li class="my-2"><input type="text" style="font-size: 16px;border: 1px solid #000;margin-top: 5px;" placeholder="Nhập mô tả " class="input_CV"></li>
                                                                                <li class="my-2"><input type="text" style="font-size: 16px;border: 1px solid #000;margin-top: 5px;" placeholder="Nhập thành tích đạt được " class="input_CV"></li>

                                                                            </ul>
                                                                            </div>
                                                                            <div class="skill_cv">
                                                                                <h5>KỸ NĂNG</h5>
                                                                                <ul class="skill_ul education_ul">
                                                                                    <li class="my-2"><span>Kỹ năng chính : </span><span><input type="text" style="width: 100%;font-size: 16px;border: 1px solid #000;margin-top: 5px;" placeholder="Siêu coding(tùy chọn)" class="input_CV"></span></li>
                                                                                    <li class="my-2"><span>Kỹ năng phụ : </span><span><input type="text" style="width: 100%;font-size: 16px;border: 1px solid #000;margin-top: 5px;" placeholder="Siêu coding(tùy chọn)" class="input_CV"></span></li>
                                                                                </ul>
                                                                            </div>
                                                                            </div>
                                                                            </div>
                                                                            <button  type ="button" onclick ="javascript:save_canvas()" id = "btn"class="btn_login bg-dark rounded-lg w-50" style="margin-left: 25%;" type="submit"><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-save" viewBox="0 0 16 16">
                                                                                    <path d="M2 1a1 1 0 0 0-1 1v12a1 1 0 0 0 1 1h12a1 1 0 0 0 1-1V2a1 1 0 0 0-1-1H9.5a1 1 0 0 0-1 1v7.293l2.646-2.647a.5.5 0 0 1 .708.708l-3.5 3.5a.5.5 0 0 1-.708 0l-3.5-3.5a.5.5 0 1 1 .708-.708L7.5 9.293V2a2 2 0 0 1 2-2H14a2 2 0 0 1 2 2v12a2 2 0 0 1-2 2H2a2 2 0 0 1-2-2V2a2 2 0 0 1 2-2h2.5a.5.5 0 0 1 0 1H2z"/>
                                                                                </svg>  Lưu CV</button>
                                                                            <div id = "space" hidden = "true" class ="row"> 
                                                                                <h5> </h5>
                                                                                <h5> </h5>
                                                                            </div>    
                                                                            <form:input id="theimage9" path = "file" type = "file" hidden = "true"  />

                                                                        </form:form>
                                                                        </div>
                                                                        </div>
                                                                        <div class="" style="height: 1000px;background-color: #fff;"></div>
