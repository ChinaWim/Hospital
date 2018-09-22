<%@page contentType="text/html; UTF-8"  pageEncoding="UTF-8" language="java"  %>
<%@include file="common.jsp"%>
<!DOCTYPE html>
<html lang="zh_CN">
<head>
    <title>医者天下hospital_list.jsp</title>
    <meta charset="UTF-8">
    <!--[if IE]>
    <script src="js/html5.js"></script>
    <![endif]-->

    <base target="_self" href="<%=basePath%>">
    <link rel="stylesheet" href="css/hospital.css" />

    <script type="text/javascript" src="js/jquery-1.11.2.min.js"></script>

</head>
<body>
<header class="header">
    <header id="fastTop" class="header" style="height: 100px;">
        <div class="search_box">
            <span class="logo">
                <a href="">
                    <img src="images/logo.jpg"></a>
            </span>

            <div class="keyword">
                <form method="post" id="med_form" action="hospital/hospitalList" onKeyDown="if(event.keyCode==13)return false;">
                    <input type="hidden" name = "times" value="${times}">
                    <input type="hidden" name="grade" value="${grade}">
                    <input type = "hidden" name="insurance" id = "hinsurance">
                    <input type="text" value="${name}" name="name" autocomplete="off" placeholder="请输入医院名称" id="search-tips-input" value="">
                    <button type="button" class="btn-doctor" id="querySearch">搜&nbsp;索</button>
                </form>
                <div class="search-suggest-layer" style="display: none; border: 1px #eaeaea solid; margin-top: -2px; width: 466px; background-color: #fff; border-bottom-left-radius: 4px; border-bottom-right-radius: 4px; position: absolute; z-index: 1;"></div>
            </div>
        </div>
    </header>
</header>

<div class="wrap">
    <div class="container">
        <div class="hospital-list" data-isrecommend="0">
            <div class="content-left">
                <div class="depart-select" style="padding-top: 0;">
                    <div class="select-detail hospital-level" data-type="3">
                        <h4>医院级别:</h4>
                        <ul class="dropmenus">
                            <li id="grade0" data-value="0"  <c:if test="${empty grade}"> class="select-cur" </c:if>  ><a href="hospital/hospitalList?name=${name}&insurance=${insurance}&times=${times}">全部</a></li>
                            <li id="grade1" data-value="12" <c:if test="${grade == 1}"> class="select-cur" </c:if>   ><a href="hospital/hospitalList/?grade=1&name=${name}&insurance=${insurance}&times=${times}">三甲医院</a></li>
                            <li id="grade2" data-value="12" <c:if test="${grade == 2}"> class="select-cur" </c:if>    ><a href="hospital/hospitalList/?grade=2&name=${name}&insurance=${insurance}&times=${times}">三乙医院</a></li>
                            <li id="grade3" data-value="9,10,11,12" <c:if test="${grade == 3}"> class="select-cur" </c:if>    ><a href="hospital/hospitalList/?grade=3&name=${name}&insurance=${insurance}&times=${times}">二甲医院</a></li>
                            <li id="grade4" data-value="5,6,7,8" <c:if test="${grade == 4}"> class="select-cur" </c:if>   ><a href="hospital/hospitalList/?grade=4&name=${name}&insurance=${insurance}&times=${times}">二级医院</a></li>
                        </ul>
                    </div>

                </div>
                <div class="sort-container">
                    <p class="fl">为您找到<em id="hos_region"></em>共<label class="curdotor"><i id="hos_total">${page.totalCount}</i></label>家医院</p>
                    <div class="hospital-sort fr">
                        <a href="hospital/hospitalList?grade=${grade}&name=${name}"><span data-value="1" class="sort-cur">综合排序</span></a>&nbsp;&nbsp;
                        <a href="hospital/hospitalList?grade=${grade}&name=${name}&insurance=${insurance}&times=1"><span data-value="4">按累计提供服务次数</span></a>&nbsp;&nbsp;
                        <span class="medical-care" data-value="医保定点">
                             <a href = "javascript:void(0);" onclick="orderByInsurance();">
                            <input  <c:if test="${insurance == 1}">checked</c:if> onclick="isInsurance();"  id = "insurance" type="checkbox" value="1"><label>医保定点</label>
                             </a>
                        </span>
                    </div>
                </div>
            </div>

            <!-- 医院列表 -->
            <ul id="hospital-list-ul">
                <c:forEach var="list" items="${page.data}">
                    <li class="hospital-info-li">
                        <div class="hospital-info">
                            <div class="hospital-pic">
                                <a target="_blank" href="hospital/detail/${list.hid}">
                                    <img class="fl" src="${list.image}">
                                </a>
                            </div>
                            <div class="hospital-introduces fl">
                                <div class="introduces-title"><a href="hospital/detail/${list.hid}">${list.hname}</a>
                                    <span class="hospital-sign">${list.grade}</span><c:if test="${list.insurance == 1}"><span class="hospital-health">医保</span></c:if>
                                </div>
                                <p class="grade-star"><i class="star-right star-light star-fixed"></i>
                                    <i class="star-right star-light star-fixed"></i>
                                    <i class="star-right star-light star-fixed"></i>
                                    <i class="star-right star-light star-fixed"></i>
                                    <i class="star-right star-light star-fixed"></i>
                                    <span class="grade-text ">${list.score}</span><span class="comment-text"></span>
                                </p>
                                <label >有优质医生<span>${list.doctorList.size()}人</span></label>
                                <table cellspacing="0" cellpadding="0">
                                    <tbody>
                                    <tr>
                                        <td valign="top" class="first-child">累计服务: </td>
                                        <td class="info-pos last-child">
                                            <p class="address">${list.times}次</p>
                                    </tr>
                                    <tr>
                                        <td valign="top" class="first-child">医院地址: </td>
                                        <td class="info-pos last-child">
                                            <p class="address">${list.address}</p>
                                            <a href="#" class="marker" target="_blank"><i class="fa fa-map-marker"></i>查看地图</a></td>
                                    </tr>
                                    </tbody>
                                </table>
                            </div>
                            <div class="server-but fr">
                                <p><a href="hospital/detail/${list.hid}" target="_blank">预约挂号</a></p>
                            </div>
                        </div>
                    </li>
                </c:forEach>
            </ul>

            <!-- END医院列表 -->
            <c:if test="${empty page.data}">
                <div class="result-empty doctor-empty" style="display: block;">
                    <img src="images/no-hospital.png" class="resultimg">
                    <div class="result-text">抱歉！没有符合条件的医院</div>
                </div>
            </c:if>
            <c:if test="${!empty page.data}">
                <div class="pagination-x pull-right"><span class="pagers">
                    <ul class="pagination-x-list">
                        <ul>
                                <li>
                                   <a class="dropmenus" href="hospital/hospitalList?pageNum=1&grade=${grade}&name=${name}&insurance=${insurance}&times=${times}" >
                                    <label>首页</label>
                                   </a>
                               </li>
                            <c:if test="${page.pageNum == 1}" >
                            <li>
                            <a class="prev-off" >
                                <label>上一页</label>
                            </a>
                            </li>
                            </c:if>
                            <c:if test="${page.pageNum != 1}">
                                <li>
                                 <a class="prev-on" href="hospital/hospitalList?pageNum=${page.pageNum-1}&grade=${grade}&name=${name}&insurance=${insurance}&times=${times}">
                                    <label>上一页</label>
                                </a>
                                </li>
                            </c:if>
                                <li>
                                    <span>
                                    第${page.pageNum}页/共${page.totalPage}页
                                    </span>
                               </li>

                            <c:if test="${page.pageNum == page.totalPage}">
                               <li>
                                   <a class="next-off" >
                                    <label>下一页</label>
                                   </a>
                               </li>
                            </c:if>
                           <c:if test="${page.pageNum != page.totalPage}">
                           <li>
                           <a class="next-on" href = "hospital/hospitalList?pageNum=${page.pageNum+1}&grade=${grade}&name=${name}&insurance=${insurance}&times=${times}">
                                <label>下一页</label>
                           </a>
                            </li>
                           </c:if>

                                <li>
                                   <a class="dropmenus" href="hospital/hospitalList?pageNum=${page.totalPage}&grade=${grade}&name=${name}&insurance=${insurance}&times=${times}">
                                    <label>末页</label>
                                   </a>
                               </li>
                        </ul>
                    </ul>
                </span>
                </div>
            </c:if>
        </div>
    </div>
    <input type="hidden" id="search-tag" value=""><aside class="right-sidebar">
    <article class="broad" style="border-bottom: none; margin-bottom: 0px;">
        <h1 class="title">挂号规则</h1>
        <div class="ct">
            <p class="depics"><b class="sq">1.</b>每日8:00左右更新后一天号源</p>
            <p class="depics"><b class="sq">2.</b>可预约当天和未来2周号源</p>
            <p class="depics"><b class="sq">3.</b>请参考短信提示，到医院就诊</p>
            <p class="depics"><b class="sq">4.</b>就诊前一天16:00前，到“我的医者天下”&gt;“我的预约”，可取消预约</p>
            <p class="depics"><b class="sq">5.</b>如需帮助，可拨打客服4000-xxx-xxx(10:00-18:00)</p>
        </div>
    </article>
    <article class="broad" style="margin-bottom: 0px;">
        <h1 class="title">帮助中心</h1>
        <div class="ct">
            <p class="depics"><b class="sq">1.</b><a target="_blank" href="#">医者天下是什么？</a></p>
            <p class="depics"><b class="sq">2.</b><a target="_blank" href="#">如何选择医生？</a></p>
            <p class="depics"><b class="sq">3.</b><a target="_blank" href="#">如何预约医生？</a></p>
            <p class="depics"><b class="sq">4.</b><a target="_blank" href="#">如何评价医生？</a></p>
            <a class="more" target="_blank" href="#">查看更多&gt;</a>
        </div>
    </article>


</aside>
    <div class="result-empty hospital-empty" style="display: none;">
        <img src="images/no-hospital.png" class="resultimg"><div class="result-text">抱歉！没有符合条件的医院</div>
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


<script src="js/jquery.SuperSlide.2.1.1.js"></script>

<script type="text/javascript">
    jQuery(".slideBox").slide({ mainCell: ".bd ul", autoPlay: true });

    jQuery(".slideBox2").slide({ mainCell: ".bd ul", vis: 4, scroll: 4, effect: "left", autoPlay: false, pnLoop: false });

    $(function () {
        $("#querySearch").click(function () {
            $("#med_form").submit();
        });

    });

    //点击医保按钮
    function isInsurance(){
        if($("#insurance").is(':checked')){
            $("#hinsurance").val("1");
        }else{
            $("#hinsurance").val("0");
        }
    };
    //按医保排序
    function orderByInsurance(){
        $("#med_form").submit();
    }

</script>
</body>
</html>

