<%-- 
    Document   : SubjectSettingDetail
    Created on : 13-Oct-2022, 00:10:23
    Author     : duyng
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="keywords" content="" />
        <meta name="author" content="" />
        <meta name="robots" content="" />
        <title>Subject Setting Detail</title>
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
                        <h1 class="text-white mt-5">Subject Setting Detail</h1>
                    </div>
                </div>
            </div>
            <div class="breadcrumb-row">
                <div class="container">
                    <ul class="list-inline">
                        <li><a href="subjectsettinglist">Subject Setting List</a></li>
                        <li>Subject Setting Detail</li>
                    </ul>
                </div>
            </div>

            <div style="width: 900px; padding: 30px; margin: auto;">
                <form action="subjectsettingdetail" method="POST">
                    <input name="id" type="hidden" value="${requestScope.ss.setting_id}">
                    <table>
                        <tr>
                            <td class="col-2">Setting type title</td>
                            <td>${ss.type_id.type_id.setting_title}</td>
                        </tr>
                        <tr>
                            <td>Setting type</td>
                            <td>
                                <c:if test="${requestScope.action == 'edit'}">
                                    <select name="setting_type">
                                        <c:forEach items="${requestScope.settings}" var="s" varStatus="loop">
                                            <option value="${s.setting_id}"
                                                    <c:if test="${s.setting_id eq ss.type_id.setting_id}">
                                                        selected
                                                    </c:if>
                                                    >
                                                ${s.setting_title}
                                            </option>
                                        </c:forEach>
                                    </select>
                                </c:if>
                                <c:if test="${requestScope.action == 'view'}">
                                    ${ss.setting_title}
                                </c:if>
                            </td>
                        </tr>
                        <tr>
                            <td>Subject</td>
                            <td>${ss.subject.code} - ${ss.subject.name}</td>
                        </tr>
                        <tr>
                            <td>Description</td>
                            <td>
                                <c:if test="${requestScope.action == 'edit'}">
                                    <textarea name="description" rows="4" cols="50">
                                        ${ss.description}
                                    </textarea>
                                </c:if>
                                <c:if test="${requestScope.action == 'view'}">
                                    ${ss.description}
                                </c:if>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <c:if test="${requestScope.action == 'edit'}">
                                    <input type="submit" value="SAVE">
                                </c:if>
                            </td>
                            <td>
                                <c:if test="${requestScope.updateState gt 0}">
                                    <p style="color: #00CC00">Setting updated successfully!</p>
                                </c:if>
                                <c:if test="${requestScope.updateState eq 0}">
                                    <p style="color: #d93223">Setting updated unsuccessfully!</p>
                                </c:if>
                            </td>
                        </tr>
                    </table>
                </form>
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
    </body>
</html>
