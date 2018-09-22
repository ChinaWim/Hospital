<%@page language="java" contentType="text/html; UTF-8" pageEncoding="UTF-8" %>
<%@include file="common.jsp"%>
<!DOCTYPE html>
<html lang="zh_CN">
<head>
    <base href="<%=basePath%>">
    <title>医者天下</title>
    <meta charset="UTF-8">
    <base target="_self">
    <link rel="stylesheet" href="css/index.css" />
    <script type="text/javascript" src="js/jquery-1.11.2.min.js"></script>
    <script type="text/javascript">
        function login(){
            var n = $('#username').val();
            var p = $('#pwd').val();
            if(n==''){
                alert('请输入用户名');
            }
            else if(p==''){
                alert('请输入密码');
            }
            else{
                $('#login_frm').submit();
            }
        }

        $(function(){
            $('#querySearch').click(function(){
                $('#med_form').submit();
            });
        });

    </script>

</head>
<body>
<header id="fastTop" class="header">
    <div class="search_box">
            <span class="logo">
                <a href="">
                    <img src="images/logo.jpg"></a>
            </span>
        <div class="keyword">
            <form method="post" id="med_form" action="hospital/hospitalList" onKeyDown="if(event.keyCode==13)return false;">
                <input type="text" name="name" autocomplete="off" placeholder="请输入医院名称"
                       id="search-tips-input" value="">
                <button type="button"  onclick="$('#med_form').submit() " class="btn-doctor" id="querySearch">搜&nbsp;索</button>
            </form>
            <div class="search-suggest-layer" style="display: none; border: 1px #eaeaea solid; margin-top: -2px; width: 466px; background-color: #fff; border-bottom-left-radius: 4px; border-bottom-right-radius: 4px; position: absolute; z-index: 1;"></div>
        </div>
        <c:if test="${! empty sessionScope.user }">
            <span  style="margin-left:40px;line-height:32px;font-size: 15px">尊敬的用户[<font color="red">${sessionScope.user.name}</font>]欢迎你！</span>
            &nbsp;&nbsp;<a href = "user/logout"><font color="blue">[退出登陆]</font></a>
        </c:if>
        <c:if test="${empty sessionScope.user}">
            <div class="login">
                <div class="my-doctor">
                    <div style="float: left;color:#2896f3;">
                        <form id="login_frm" action="user/login" method="post">
                            <div>用户名：<input type="text" name="user" id="user" style="border: 1px solid #2896f3;"/></div>
                            <div style="margin-top:2px">密码：<input type="password" name="pwd" id="pwd" style="border: 1px solid #2896f3;"/></div>
                        </form>
                    </div>
                    <div style="float: right;line-height:42px;margin-left:15px">
                        <div><input type="button" value="登&nbsp;录" onClick="login()"
                                    style="width:60px;height:40px;cursor:pointer;border: 1px solid #2896f3;color:#2896f3;"></input>
                        </div>
                        <div style="position: absolute;top: 0px;left: 280px">
                            <a href="${pageContext.request.contextPath}/register.jsp">
                                <input type="button" value="注&nbsp;册" style="width:60px;height:40px;cursor:pointer;border: 1px solid #2896f3;color:#2896f3;"></input>
                            </a>
                        </div>
                    </div>
                </div>
            </div>
        </c:if>
    </div>
</header>
<div class="banner">
    <div class="banner-content">
        <ul class="banner-left">
            <a href="#">
                <li class="active">首页</li>
            </a>
            <a href="hospital/hospitalList">
                <li>找医院</li>
            </a><a href="doctor/doctorList">
            <li>找医生</li>
        </a>
        </ul>
    </div>
</div>
<div class="opacity"></div>
<div class="carousel-infos">
    <div id="slideBox" class="slideBox">
        <div class="hd car-item">
            <ul><li class=""></li><li class=""></li><li class="on"></li></ul>
        </div>
        <div class="bd">
            <ul>
                <li style="display: none;"><a href="#" target="_blank"><img src="images/banner1.jpg"></a></li>
                <li style="display: none;"><a href="#" target="_blank"><img src="images/banner2.jpg"></a></li>
                <li style="display: list-item;"><a href="#" target="_blank"><img src="images/banner3.jpg"></a></li>
            </ul>
        </div>
    </div>

    <div class="wrap">
        <div class="container">

            <!-- 推荐医院-->
            <div class="find-hospital">
                <h3>
                    <ul class="tab">
                        <li class="first-tab">医院推荐</li>
                    </ul>
                    <a id="hos-more" href="hospital/hospitalList" target="_blank"><span class="more-hos">查看全部<img src="images/arrow_normal.png"></span></a></h3>
                <div class="content" id="cityTab">
                    <ul>
                        <c:forEach items="${hospitalTop3}" var="hospital">
                        <li class="hospital-detail"><a href="hospital/detail/${hospital.hid}" target="_blank">
                            <img src="${hospital.image}" alt="${hospital.hname}" width="230" height="120"></a>
                            <p class="hospital-name"><a href="hospital/detail/${hospital.hid}" title="${hospital.hname}" target="_blank"><span class="span-name">${hospital.hname}</span></a>
                            <i class="star-right star-light star-fixed"></i><i class="star-right star-light star-fixed"></i><i class="star-right star-light star-fixed"></i><i class="star-right star-light star-fixed"></i>
                            <i class="star-right star-light star-fixed"></i><span class="grade-text ">${hospital.score}</span>
                            <label class="hospital-grade"><span class="grade">${hospital.grade}</span>
                                <c:if test="${hospital.insurance == 1}"><span class="corpt">医保</span></c:if>
                            </label>
                            </p>
                            <p class="appointent_total">
                                <label class="label-right"><span>${hospital.times}</span>&nbsp;人成功预约</label>
                            </p>
                        </li>
                        </c:forEach>
                    </ul>
                    <ul class="hospital-info">
                        <c:forEach var="hospital" items="${hospitalList}">
                            <li><a href="hospital/detail/${hospital.hid}" title="${hospital.hname}" target="_blank"><span class="span-hospital ">${hospital.hname}</span></a>
                                <label><span class="span-grade">${hospital.grade}</span>
                                    <c:if test="${hospital.insurance == 1}">
                                        <span class="span-corpt">[医保]</span>
                                    </c:if>
                                </label>
                            </li>
                        </c:forEach>
                    </ul>
                </div>
            </div>
            <!-- END推荐医院-->

            <!-- 热门科室-->
            <div class="hot-department">
                <h3>热门科室</h3>
                <div class="content" style="width: 100%;height: 100%">
                    <ul>
                        <li class="first-info">
                            <div class="dep-left"><a target="_self" class="dep-title" href="doctor/doctorList?degrade=1"><b>一级科室</b></a></div>
                            <div class="dep-right">
                                <c:forEach var="list" items="${deptList1}">
                                    <a class="dep-item dep-light" href="doctor/doctorList?deid=${list.deid}" target="_self" title="${list.dename}">${list.dename}</a>
                                </c:forEach>
                            </div>
                        </li>
                        <li class="first-info">
                            <div class="dep-left"><a target="_self" class="dep-title" href="doctor/doctorList?degrade=2"><b>二级科室</b></a></div>
                            <div class="dep-right">
                                <c:forEach var="list" items="${deptList2}">
                                    <a class="dep-item dep-light" href="doctor/doctorList?deid=${list.deid}" target="_self" title="${list.dename}">${list.dename}</a>
                                </c:forEach>
                            </div>
                        </li>
                    </ul>
                </div>
            </div>
            <!-- END热门科室-->

            <!-- 优质医生-->
            <div id="excel-doctor-div" class="excel-doctor">
                <h3>名师名医<a href="doctor/doctorList" target="_blank"><span>更多名医<img src="images/arrow_normal.png"></span></a></h3>
                <div class="content slideBox2">
                    <div id="pre-arrow" class="pre-arrow prev">
                        <img data-gray="images/pre_disable.png" data-srchover="images/pre_hover.png" data-src="images/pre_normal.png" src="images/pre_disable.png">
                    </div>
                    <div class="doctail-detail bd">
                        <ul id="dictor-list-ul">
                            <c:forEach var="doctor" items="${doctorList}">
                                <li class="doctor-first" style="background-color: rgb(249, 249, 249);">
                                    <a href="doctor/detail/${doctor.did}" >
                                        <img src="${doctor.image}">
                                    </a>
                                    <p><a target="_blank" href="#"><span>${doctor.dname}</span></a>
                                        <span class="doctor-level">
                                            <c:choose>
                                                <c:when test="${doctor.grade == 1}">主任医师</c:when>
                                                <c:when test="${doctor.grade == 2}">副主任医师</c:when>
                                                <c:when test="${doctor.grade == 3}">主治医师</c:when>
                                                <c:when test="${doctor.grade == 4}">普通医师</c:when>
                                            </c:choose>
                                        </span>
                                    </p>
                                    <p>${doctor.dept.dename}</p>
                                    <p title="${doctor.hospital.hname}">${doctor.hospital.hname}</p>
                                    <p class="btn-appoint"><a href="doctor/detail/${doctor.did}"><span style="border-color: rgb(1, 151, 241); color: rgb(255, 255, 255); background-color: rgb(1, 151, 241);">一键预约</span></a></p>
                                </li>
                            </c:forEach>
                        </ul>
                    </div>
                    <div id="next-arrow" class="next-arrow next">
                        <img data-gray="images/arrow_disable.png" data-srchover="images/arrow_hover.png" data-src="images/arrow_normal.png" src="images/arrow_disable.png">
                    </div>
                </div>
            </div>
            <!-- END优质医生-->




        </div>
        <div class="right-sidebar-info">
            <!-- 右侧统计信息 -->
            <div class="res-info">
                <div class="city-info">
                    <h3 class="res-title">全国已开通</h3>
                    <i class="num">${hospitalList.size()}</i>家医院
                </div>
                <div class="num-info">
                    <h3 class="res-title">可预约医生数</h3>
                    <!-- 循环可预约医生数量 -->

                    <div class="img-container">
                        <img src="images/number_bg.png" class="number-bg "><i class="num">${doctorSize}</i>
                    </div>

                </div>
                <div class="num-info">
                    <h3 class="res-title">累计服务人数</h3>
                    <!-- 累计服务人数 -->

                    <div class="img-container">
                        <img src="images/number_bg.png" class="number-bg "><i class="num">${appointmentSize}</i>
                    </div>

                </div>
            </div>
            <!-- END右侧统计信息 -->

            <!-- 合作机构 -->
            <div class="news">
                <h3 class="news-title">合作机构</h3>
                <ul class="news-list">
                    <c:forEach items="${hospitalList}" var="hospital">
                        <li>
                            <a href="hospital/detail/${hospital.hid}" target="_blank">
                                    ${hospital.hname}
                            </a>

                        </li>
                    </c:forEach>
                </ul>
            </div>
            <!-- END合作机构 -->
        </div>
    </div>
</div>

<footer id="footer-three" class="footer-box footer-three clear path" data-src="http://dpp.bdimg.com/static/pc/201604261639/asset" data-href="" data-api="http://yi.baidu.com" data-passport="https://passport.baidu.com">
    <div class="footer-con">
        <div class="footer-info-url">
            <dd class="fo-link">
                <a href="#" target="_blank"><span>帮助</span>|</a>
                <a href="#" target="_blank"><span>用户协议</span>|</a>
                <a href="#" target="_blank"><span>意见反馈</span></a>
                <a href="#" target="_blank"><span>©2016 Mstanford &nbsp;&nbsp;隐私条款</span></a>
            </dd>
        </div>
    </div>
</footer>



<script src="js/jquery-1.11.2.min.js"></script>

<script src="js/uni_login_wrapper.js"></script>

<script src="js/jquery.SuperSlide.2.1.1.js"></script>

<script type="text/javascript">
    jQuery(".slideBox").slide({ mainCell: ".bd ul", autoPlay: true});

    jQuery(".slideBox2").slide({ mainCell: ".bd ul", vis: 4, scroll: 4, effect: "left", autoPlay: false ,pnLoop:false});


</script>
</body>
</html>

