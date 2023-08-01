<%-- 
    Document   : belownav
    Created on : Apr 6, 2023, 1:07:28 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div class="below-nav">
    <div class="container">
        <div class="row">
            <ul class="below-nav-list">
                <li>
                    <h2>7749 việc làm cho dân văn phòng cực"CHẤT"</h2>
                </li>
                <li>
                    <form class="d-flex">
                        <div class="search-form__keyword-section rounded">
                            <div class="input-group dropdown">
                                <div class="search-form__icon svg-icon">
                                    <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor"
                                         class="bi bi-search text-dark" viewBox="0 0 16 16">
                                        <path
                                            d="M11.742 10.344a6.5 6.5 0 1 0-1.397 1.398h-.001c.03.04.062.078.098.115l3.85 3.85a1 1 0 0 0 1.415-1.414l-3.85-3.85a1.007 1.007 0 0 0-.115-.1zM12 6.5a5.5 5.5 0 1 1-11 0 5.5 5.5 0 0 1 11 0z" />
                                    </svg>
                                </div>
                                <input class="form-control me-1" id="search_index" type="text" placeholder="Tìm kiếm theo tên công ty">
                            </div>

                        </div>

                        <div class="dropdown">
                            <select id="city" style="background-color: gold; border-radius: 5px; margin-left: 5px; color:black;cursor: pointer;" class="select_btn">
                                <option value = "HCM">TP.HCM</option>
                                <option value = "Hà Nội">Hà Nội</option>
                                <option value = "Đà Nẵng">Đà Nẵng</option>
                                <option value = "all">Tất cả</option>
                            </select>
                        </div>
                        <button class="btn btn-primary" onclick="javascript:search_abc()" type="button">Tìm Kiếm</button>
                    </form>
                </li>
                <li>
                    <ul class="list-langue">
                        <c:forEach items="${listMajor}" var="m">
                            <li><a href="<c:url value="/job-page/${m.id}"/>">${m.name}</a></li>
                            </c:forEach>

                    </ul>
                </li>
            </ul>

        </div>
    </div>
    <div class="back-to-top" style="display: block;"><svg class="scale-50 md:scale-100" clip-rule="evenodd" fill="#fff" fill-rule="evenodd" height="24" style="margin-top:-15px;" width="24" xmlns="http://www.w3.org/2000/svg"><path d="M23.245 20l-11.245-14.374-11.219 14.374-.781-.619 12-15.381 12 15.391-.755.609z"></path></svg></div>
    <div class="hotline-phone-ring-wrap">
        <div class="hotline-phone-ring">
            <div class="hotline-phone-ring-circle">&nbsp;</div>

            <div class="hotline-phone-ring-circle-fill">&nbsp;</div>

            <div class="hotline-phone-ring-img-circle"><a class="pps-btn-img" href="tel:0777834399">
                    <img src="https://isharevn.net/wp-content/uploads/2021/05/icon-call-nh.png" alt="Gọi điện thoại" width="50"> </a></div>
        </div>
    </div>
</div>

<script type="text/javascript">
    search_abc = function () {
        var select = document.getElementById('search_index');
        var selectcity = document.getElementById('city');
        //tìm tất cả
        if (select.value === '' && selectcity.options[selectcity.selectedIndex].value === 'all')
        {
            window.location.href = "/FindingJob/";
        }
        // tìm kiếm công ty theo thành phố
        if (select.value === '' && selectcity.options[selectcity.selectedIndex].value !== 'all')
        {
            window.location.href = "/FindingJob/" + selectcity.options[selectcity.selectedIndex].value;
        }
        // tìm kiếm theo tên công ty và thành phố
        if (select.value !== '' && selectcity.options[selectcity.selectedIndex].value !== 'all') {

            window.location.href = "/FindingJob/" + select.value + "/" + selectcity.options[selectcity.selectedIndex].value;

        }
        // tìm kiếm theo tên công ty
        if (select.value !== '' && selectcity.options[selectcity.selectedIndex].value === 'all')
        {
            window.location.href = "/FindingJob/" + select.value
                    + "/2/3";
        }

    };
    $(function () {
        $(window).scroll(function () {
            if ($(this).scrollTop() > 200) {
                $('.back-to-top').fadeIn();
            } else {
                $('.back-to-top').fadeOut();
            }
        });
        $('.back-to-top').click(function () {
            $('body,html').animate({
                scrollTop: 0
            }, 100);
        });
    });
</script>
