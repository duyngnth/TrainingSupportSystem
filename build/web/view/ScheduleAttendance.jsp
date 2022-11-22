<%-- 
    Document   : SubjectSettingList
    Created on : 12-Oct-2022, 22:20:34
    Author     : duyng
--%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="keywords" content="" />
        <meta name="author" content="" />
        <meta name="robots" content="" />
        <title>Schedule Attendance</title>
        <link rel="icon" href="assets/images/favicon.ico" type="image/x-icon" />
        <link rel="shortcut icon" type="image/x-icon" href="assets/images/favicon.png" />

        <!-- MOBILE SPECIFIC ============================================= -->
        <meta name="viewport" content="width=device-width, initial-scale=1">

        <link rel="stylesheet" type="text/css" href="assets/css/assets.css">
        <link rel="stylesheet" type="text/css" href="assets/css/typography.css">
        <link rel="stylesheet" type="text/css" href="assets/css/shortcodes/shortcodes.css">
        <link rel="stylesheet" type="text/css" href="assets/css/style.css">
        <link class="skin" rel="stylesheet" type="text/css" href="assets/css/color/color-1.css">

        <!-- PAGINATION ============================================= -->
        <link href="assets/css/pagination.css" rel="stylesheet" type="text/css"/>
        <script src="assets/js/pagination.js" type="text/javascript"></script>

        <!-- SORTTABLE ============================================= -->
        <script src="assets/js/sorttable.js" type="text/javascript"></script>
        <link href="assets/css/sorttable.css" rel="stylesheet" type="text/css"/>
        <style>
            table, th, td {
                border: 1px solid black;
                text-align: center;
            }
        </style>
    </head>
    <body>
        <header>
            <%@include file="./Header.jsp"%>
        </header>
        <div class="page-content bg-white" style="">
            <!-- inner page banner -->
            <div class="page-banner ovbl-dark" style="background-image:url(assets/images/banner/banner1.jpg);">
                <div class="container">
                    <div class="page-banner-entry">
                        <h1 class="text-white mt-5">Schedule Attendance</h1>
                    </div>
                </div>
            </div>

            <div >
                <div style="padding: 10px; margin-left: 20px; margin-right: 20px">
                    <form action="scheduleattendance" method="POST" id="filter">
                        <div class="row col-6">
                            <div class="col-sm-3">
                                <select name="class" onchange="document.getElementById('filter').submit()">
                                    <option value="0"
                                            <c:if test="${chosenClassId eq 0}">
                                                selected
                                            </c:if>
                                            >All classes</option>
                                    <c:forEach items="${classes}" var="c" varStatus="loop">
                                        <option value="${c.class_id}"
                                                <c:if test="${chosenClassId eq c.class_id}">
                                                selected
                                            </c:if>
                                                >${c.class_code}</option>
                                    </c:forEach>
                                </select>
                            </div>
                            <div class="col-sm-3">
                                <select name="status" onchange="document.getElementById('filter').submit()">
                                    <option value="null"
                                            <c:if test="${chosenStatus eq null}">
                                                selected
                                            </c:if>
                                            >All status</option>
                                    <option value="true"
                                            <c:if test="${chosenStatus eq true}">
                                                selected
                                            </c:if>
                                            >Present</option>
                                    <option value="false"
                                            <c:if test="${chosenStatus eq false}">
                                                selected
                                            </c:if>
                                            >Absent</option>
                                </select>
                            </div>
                        </div>
                    </form><br/>
                    <table class="text-center">
                        <thead>
                            <tr class="bg-light-gray">
                                <th class="text-uppercase">Slot</th>
                                <th class="text-uppercase">Date</th>
                                <th class="text-uppercase">Class</th>
                                <th class="text-uppercase">Status</th>
                                <th class="text-uppercase">Comment</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach items="${attendances}" var="a" varStatus="loop">
                                <tr>
                                    <td>${a.schedule_id.slot.slot_name}</td>
                                    <td>${a.schedule_id.training_date.toString()}</td>
                                    <td>${a.class_id.class_code}</td>
                                    <td>
                                        <c:if test="${a.status eq true}">
                                            <p style="color: #00CC00">Present</p>
                                        </c:if>
                                        <c:if test="${a.status eq false}">
                                            <p style="color: #ff0022">Absent</p>
                                        </c:if>
                                    </td>
                                    <td>${a.comment}</td> 
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                    <div id="pagination"></div><br/>
                </div>
            </div>

            <div class="footer-fixed" style="clear:  both">
                <%@include file="./Footer.jsp" %>
            </div>
        </div>
        <!-- Content END-->
        <script src="assets/js/jquery.min.js"></script>
        <script src="assets/vendors/bootstrap/js/popper.min.js"></script>
        <script src="assets/vendors/bootstrap/js/bootstrap.min.js"></script>
        <script src="assets/vendors/bootstrap-select/bootstrap-select.min.js"></script>
        <script src="assets/vendors/bootstrap-touchspin/jquery.bootstrap-touchspin.js"></script>
        <script src="assets/vendors/magnific-popup/magnific-popup.js"></script>
        <script src="assets/vendors/counter/waypoints-min.js"></script>
        <script src="assets/vendors/counter/counterup.min.js"></script>
        <script src="assets/vendors/imagesloaded/imagesloaded.js"></script>
        <script src="assets/vendors/masonry/masonry.js"></script>
        <script src="assets/vendors/masonry/filter.js"></script>
        <script src="assets/vendors/owl-carousel/owl.carousel.js"></script>
        <script src="assets/js/functions.js"></script>
        <script src="assets/js/contact.js"></script>
        <script>
                                    pagger_render("pagination",${requestScope.pageIndex},${requestScope.totalPage}, 2, "scheduleattendance?");
        </script>
    </body>
</html>