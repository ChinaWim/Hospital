<%@page contentType="text/html; UTF-8"  pageEncoding="UTF-8" language="java"  %>
<%@include file="common.jsp"%>
<!DOCTYPE html>
<html lang="zh_CN">
<head>
    <title>医者天下doctor_detail.jsp</title>
    <meta charset="UTF-8">
    <base target="_self" href="<%=basePath%>">
    <link rel="stylesheet" href="css/doctor_detail.css" />
    <style>
        .header .top-box .top-icon-img {
            width: 13px;
            height: 13px;
            vertical-align: middle;
            margin-bottom: 3px;
        }

        .header .top-box .sign a {
            color: #0c81f8;
            cursor: pointer;
        }
    </style>
</head>
<body>
<header class="header">
    <header id="fastTop" class="header" style="height: 100px;">
        <div class="search_box">
                <span class="logo">
                    <a href="">
                        <img src="images/logo.jpg"></a>
                </span>
            <input type="hidden" id="current-area-info" data-province="16" data-city="371" data-region="0" data-provtag="0" data-value="1">
        </div>
    </header>
</header>

<div class="wrap">
    <div class="ys-doctor-detail">
        <section class="container-crumb ys-util-text-auxiliary">
            <h5><a class="ys-util-text-min ys-util-text-auxiliary a-hover" href="hospital/detail/${doctor.hospital.hid}">首页</a></h5>
            &nbsp;&gt;&nbsp;<h5>
            <label class="ys-util-text-min ys-util-text-auxiliary">"${doctor.dname}"医生个人主页</label></h5>
        </section>
        <div class="ys-util-bg-gray container-box">
            <article class="container-frame">
                <section class="container-summary">
                    <div class="summary-img ys-util-img"><a class="ys-img-lazy-frame" href="javascript:void(0);">
                        <img class="" src="${doctor.image}" data-img-lazy-src="${doctor.image}" style="height: 100%;"></a></div>
                    <div class="summary-list">
                        <div class="summary-row" style="line-height: 16px;">
                            <h1 class="ys-util-text-medium">${doctor.dname}</h1>
                            <a href="#" target="_blank">
                                <img class="ys-icon-image ys-util-margin-l5" src="images/pic_identify_bdys.png" alt="认证医生"><span class="identify-text ys-util-text-min ys-util-text-auxiliary only-one-line a-hover">认证医生</span></a><label class="ys-util-margin-l5"><span class="ys-util-margin-l5">
                            <c:choose>
                                <c:when test="${doctor.grade == 1}">
                                    主任医师
                                </c:when>
                                <c:when test="${doctor.grade == 2}">
                                    副主任医师
                                </c:when>
                                <c:when test="${doctor.grade == 3}">
                                    主治医师
                                </c:when>
                                <c:when test="${doctor.grade == 4}">
                                    普通医师
                                </c:when>
                            </c:choose>
                        </span><span class="ys-util-margin-l5">/&nbsp;${doctor.gender}</span></label></div>
                        <div class="summary-row ys-util-margin-t12">
                            <span class="container-comment-star">

                                <img src="images/pic_star_light.png" class="ys-star-small">

                                <img src="images/pic_star_light.png" class="ys-star-small">

                                <img src="images/pic_star_light.png" class="ys-star-small">

                                <img src="images/pic_star_light.png" class="ys-star-small">

                                <img src="images/pic_star_light_gray.png" class="ys-star-small">
                            </span>
                            <span class="ys-util-text-primary ys-util-text-medium summary-comment-score ys-util-margin-r20">${doctor.score}</span><label class="ys-util-text-secondary ys-util-margin-r10">医生态度<span class="ys-util-margin-l6 ys-util-text-primary">9.0</span></label><label class="ys-util-text-secondary">治疗效果<span class="ys-util-margin-l6 ys-util-text-primary">7.0</span></label>
                        </div>
                        <div class="summary-row ys-util-margin-t12"><span class="ys-util-text-normal ys-util-margin-r10"><a class="a-hover" target="_blank" href="hospital/detail/${doctor.hospital.hid}">${doctor.hospital.hname}</a></span><span class="ys-util-text-normal ys-util-margin-r10"><a class="a-hover" target="_blank" href="#">${doctor.dept.dename}</a></span></div>
                        <div class="summary-row ys-util-margin-t5 doctor-goodat">
                            <h6 class="ys-util-text-normal ys-util-text-secondary">擅长：</h6>
                            <label class="ys-util-text-normal" id="goodat-label">${doctor.skill}</label>
                        </div>
                    </div>
                </section>
            </article>

        </div>
        <div class="map-layer" id="map-layer">
            <div class="container-tab-content">
                <article class="container-main">
                    <!-- Tab页：医生详情 -->
                    <div id="doctorInfo" class="tab-doctorInfo">
                        <div class="doctor-time">
                            <article class="select-card">
                                <h3 class="ys-util-text-medium" id="schedule-anchor">选择就诊时间</h3>
                                <div class="table">
                                    <div class="schedule-left">
                                        <table class="schedule">
                                            <tbody>
                                            <tr>
                                                <th class="ph">
                                                    <div class="inner-border">就诊时段</div>
                                                </th>
                                            </tr>
                                            <tr>
                                                <td class="ph">
                                                    <div class="inner-border">上午</div>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="ph">
                                                    <div class="inner-border">下午</div>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="ph">
                                                    <div class="inner-border">晚上</div>
                                                </td>
                                            </tr>
                                            </tbody>
                                        </table>
                                    </div>
                                    <div class="schedule-main">
                                        <!-- 向左箭头替代方案
        <i class="left-arrow"></i> -->
                                        <div class="arrow-bar left-arrow-bar">
                                            <i></i>
                                        </div>
                                        <div class="schedule-main-outer">
                                            <table id="f" class="schedule" style="">
                                                <tbody>
                                                <tr>
                                                    <!--<th class="ph">就诊时段</th>-->
                                                    <c:forEach items="${dayInfoList}" var="dayInfo">
                                                        <th>
                                                            <div class="date">${dayInfo.date}</div>
                                                            <div class="text">${dayInfo.week}</div>
                                                        </th>
                                                    </c:forEach>
                                                </tr>

                                                <tr>
                                                    <!--<td class="ph">上午</td>-->
                                                    <c:forEach items="${dayInfoList}" var="dayInfo">
                                                        <td>
                                                            <c:if test="${dayInfo.sw == 1}">
                                                                <div class="inner-border opening">
                                                                    <a hidefocus="true" class="opening" href="appointment/${doctor.did}?dayInfo=${dayInfo.fullDate}(${dayInfo.week})上午">
                                                                        <span class="normal-type">点击预约</span>
                                                                    </a>
                                                                </div>
                                                            </c:if>
                                                            <c:if test="${dayInfo.sw != 1}">
                                                                <div class="inner-border">
                                                                    <a hidefocus="true" href="javascript:void 0">点击预约
                                                                    </a>
                                                                </div>
                                                            </c:if>
                                                        </td>
                                                    </c:forEach>
                                                </tr>

                                                <tr>
                                                    <!--<td class="ph">下午</td>-->
                                                    <c:forEach items="${dayInfoList}" var="dayInfo">
                                                        <td>
                                                            <c:if test="${dayInfo.xw == 1}">
                                                                <div class="inner-border opening">
                                                                    <a hidefocus="true" class="opening" href="appointment/${doctor.did}?dayInfo=${dayInfo.fullDate}(${dayInfo.week})下午">
                                                                        <span class="normal-type">点击预约</span>
                                                                    </a>
                                                                </div>
                                                            </c:if>
                                                            <c:if test="${dayInfo.xw != 1}">
                                                            <div class="inner-border ">
                                                                <a hidefocus="true" href="javascript:void 0">点击预约
                                                                </a>
                                                                </c:if>
                                                        </td>
                                                    </c:forEach>

                                                </tr>
                                                <tr>
                                                    <!--<td class="ph">晚上</td>-->
                                                    <c:forEach items="${dayInfoList}" var="dayInfo">
                                                        <td>
                                                            <c:if test="${dayInfo.ws == 1}">
                                                                <div class="inner-border opening">
                                                                    <a hidefocus="true" class="opening" href="appointment/${doctor.did}?dayInfo=${dayInfo.fullDate}(${dayInfo.week})晚上">
                                                                        <span class="normal-type">点击预约</span>
                                                                    </a>
                                                                </div>
                                                            </c:if>
                                                            <c:if test="${dayInfo.ws != 1}">
                                                            <div class="inner-border ">
                                                                <a hidefocus="true" href="javascript:void 0">点击预约
                                                                </a>
                                                                </c:if>
                                                        </td>
                                                    </c:forEach>

                                                </tr>
                                                </tbody>
                                            </table>
                                        </div>
                                        <!-- 向右箭头替代方案
            <i class="right-arrow disabled"></i>-->
                                        <div class="arrow-bar right-arrow-bar">
                                            <i>

                                            </i>
                                        </div>

                                    </div>

                                </div>

                            </article>
                        </div>
                        <div class="doctor-experience">
                            <h3 class="ys-util-text-medium">执业经历</h3>
                            <p class="ys-util-text-smaller ys-util-margin-t10">${doctor.description}</p>
                        </div>
                        <!-- 用户评价 -->


                    </div>
                </article>


                <aside class="container-aside">
                    <article class="broad" style="border-bottom: none; margin-bottom: 0px;">
                        <div class="title">挂号规则</div>
                        <div class="ct">
                            <p class="depics"><span class="sq">1.&nbsp;</span><span class="text">每日8:00左右更新后一天号源</span></p>
                            <p class="depics"><span class="sq">2.&nbsp;</span><span class="text">可预约当天和未来2周号源</span></p>
                            <p class="depics"><span class="sq">3.&nbsp;</span><span class="text">请参考短信提示，到医院就诊</span></p>
                            <p class="depics"><span class="sq">4.&nbsp;</span><span class="text">就诊前一天16:00前，到“我的医者天下”&gt;“我的预约”，可取消预约</span></p>
                            <p class="depics"><span class="sq">5.&nbsp;</span><span class="text">如需帮助，可拨打客服4000-xxx-xxx(10:00-18:00)</span></p>
                        </div>
                    </article>
                    <article class="broad" style="margin-bottom: 0px;">
                        <div class="title">帮助中心<a class="more a-hover" target="_blank" href="#">更多&gt;</a></div>
                        <div class="ct">
                            <p class="depics"><span class="sq">1.&nbsp;</span><a target="_blank" href="#">医者天下是什么？</a></p>
                            <p class="depics"><span class="sq">2.&nbsp;</span><a target="_blank" href="#">如何选择医生？</a></p>
                            <p class="depics"><span class="sq">3.&nbsp;</span><a target="_blank" href="#">如何预约医生？</a></p>
                            <p class="depics"><span class="sq">4.&nbsp;</span><a target="_blank" href="#">如何评价医生？</a></p>
                        </div>
                    </article>

                </aside>
            </div>
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
<script type="text/javascript">

</script>
</body>
</html>

