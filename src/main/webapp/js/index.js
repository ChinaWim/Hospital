/*! 2016 Baidu Inc. All Rights Reserved */
define("home/index", ["require", "search/search", "/js/ajax"], function (require) {
    var e = require("search/search");
    return {
        init: function (t) {
            if ("true" != window.localStorage.noCover && !$("#myCover").data("iscovered"))
                $("#myCover").show(), this.noCoverLayer(), window.localStorage.noCover = !0;
            else
                $("#myCover").remove();
            this.closeBannerImg(), this.carouselList(), this.carouselClick(), this.staticTop(), this.backTop(), this.cityTab(t), e.httpGet("/pc/doctor/listdata", this.getFilterData(), "relativeDoc", $("#excel-doctor-div"), 1, "", "", 4);
            $(".city-index span").on("click", function () {
                $(".city-list div").hide().eq($(".city-index span").removeClass("border-bottom3px").index($(this).attr("class", "border-bottom3px"))).show()
            }), $(".area-border").on("mouseenter", function () {
                $(this).find(".city-index").find("span").attr("class", "border-bottom1px"), $(this).find(".city-list").find("div").hide();
                var e = $(".select-city").find(".city-index").data("index");
                $(this).find(".city-index").find("span").eq(e).attr("class", "border-bottom3px"), $(this).find(".city-list").find("div").eq(e).show(), $(this).css("border-color", "#eaeaea").find(".select-city").show()
            }).on("mouseleave", function () {
                $(this).css("border-color", "#ffffff").find(".select-city").hide()
            }), $("#car-content img:first").animate({ filter: "alpha(opacity=100)", opacity: 1 }, {
                step: function (e, t) {
                    $(this).css("-webkit-transform", "scaleX(1) scaleY(1)")
                }, duration: 900
            }, "linear")
        }, src: function () {
            var e = $(".footer-three").data("src");
            return e
        }(), href: function () {
            var e = $(".footer-three").data("href");
            return e
        }(), api: function () {
            var e = $(".footer-three").data("api");
            return e
        }(), getFilterData: function () {
            var e = {};
            return e.pageSize = 12, e.departLevel1Id = 1, e.provId = $("#provId").attr("data-id"), e.cityId = $("#cityId").attr("data-id"), e.regionId = $("#regionId").attr("data-id"), e.medTitle = 4, e
        }, closeBannerImg: function () {
            $(".img-close").click(function () {
                $(".header-banner").remove(), $(".banner").css("margin-top", "77px")
            })
        }, staticTop: function () {
            var e = 0;
            $(window).load(function () {
                var t = $(this).scrollTop();
                if (t > e)
                    $(".header").addClass("header-shadow");
                else if (e >= t)
                    $(".header").removeClass("header-shadow")
            }), $(window).scroll(function () {
                var t = $(this).scrollTop();
                if ($(".header").removeClass("header-shadow"), t > e)
                    $(".header").addClass("header-shadow");
                else if (e >= t)
                    $(".header").removeClass("header-shadow")
            })
        }, noCoverLayer: function () {
            if (!$("#myCover").data("iscovered"))
                $("#layer-close").click(function () {
                    $("#myCover").remove()
                }), $(".know-btn").click(function () {
                    $("#layer-close").click()
                })
        }, backTop: function () {
            var e = $("#footer-three").height();
            $(window).scroll(function () {
                var t = $(this).scrollTop(), n = $(document).height(), i = $(this).height();
                if ($(window).scrollTop() > 30)
                    $("#feedback").show();
                else if ($(window).scrollTop() < 30)
                    $("#feedback").hide();
                var r = n - (t + i);
                if (e >= r)
                    $("#feedback").css("bottom", e - r + 15 + "px");
                else
                    $("#feedback").css("bottom", "20px")
            }), $("#back-top").click(function () {
                return $("html,body").animate({ scrollTop: "0px" }, 500), $(this).blur(), !1
            }), $("#back").click(function () {
                $(this).blur()
            }), $("#feedback").find("img").mouseenter(function () {
                $(this).attr("src", $(this).data("srchover"))
            }), $("#feedback").find("img").mouseleave(function () {
                $(this).attr("src", $(this).data("src"))
            })
        }, carouselList: function () {
            function e() {
                if (i == n.length - 1)
                    i = 0;
                else
                    i += 1;
                n[i].onmouseover()
            }
            for (var t = $("#car-content a"), n = $("#car-focus a"), i = 0, r = $("#car-content img").first().data("bg-style"), a = 0; a < n.length; a++)
                $(n[a]).data("index", a), n[a].onmouseover = function () {
                    i = parseInt($(this).data("index")), $("#car-content img").css({ "-webkit-transform": "scaleX(1.05) scaleY(1.05)", opacity: "0.4" });
                    for (var e = 0; e < n.length; e++)
                        n[e].className = "", t[e].style.display = "none";
                    this.className = "active";
                    var a = $(this).data("index");
                    t[a].style.display = "block", $("#car-content img").each(function (e, t) {
                        if (e == a)
                            r = $(t).data("bg-style"), $(".carousel-list").css({ background: /^#\w+/.test(r) ? r : "url(data:image/jpg;base64," + r + ") repeat scroll" }), $(t).animate({ filter: "alpha(opacity=100)", opacity: 1 }, {
                                step: function (e, t) {
                                    $(this).css("-webkit-transform", "scaleX(1) scaleY(1)")
                                }, duration: 900
                            }, "linear")
                    })
                };
            var o = setInterval(e, 3e3);
            $(".carousel-list").mouseover(function () {
                clearInterval(o)
            }), $(".carousel-list").mouseout(function () {
                o = setInterval(e, 3e3)
            }), $("#car-focus a").mouseover(function () {
                clearInterval(o)
            }), $("#car-focus a").mouseout(function () {
                o = setInterval(e, 3e3)
            }), $(".quick-pos").mouseover(function (e) {
                var t = e.target.className;
                if ("quick-con" == t || "quick-pos" == t)
                    clearInterval(o)
            }), $(".quick-pos").mouseout(function (t) {
                var n = t.target.className;
                if ("quick-con" == n || "quick-pos" == n)
                    o = setInterval(e, 3e3)
            })
        }, carouselClick: function () {
            $(".quick-pos").click(function (e) {
                var t = e.target.className;
                if ("quick-con" == t || "quick-pos" == t) {
                    var n = $("#car-focus").children(".active").data("index"), i = $($("#car-content a")[n]).attr("href");
                    window.open(i, "_blank")
                }
            })
        }, cityTab: function (e) {
            var t = this, n = require("common/js/ajax");
            $(".city-tab").on("click", function () {
                $(this).siblings("li").removeClass("curent"), $(this).addClass("curent"), $("#cityTab").css("min-height", "218px").html("");
                var i = { provId: $(this).data("prov"), cityId: $(this).data("city"), regionId: 0, page: 1, pageSize: 12 };
                data = $.extend(!0, {}, e, i), n({
                    url: "" + t.api + "/pc/hospital/listregion", type: "GET", data: data, success: function (e) {
                        if (0 == e.status)
                            t.cityViews(e.data.data), $("#hos-more").attr("href", e.data.moreUrl)
                    }, error: function (e) {
                    }
                })
            })
        }, cityViews: function (e) {
            var t = e.length, n = this, i = [];
            i.push("<ul>");
            for (var r = 0; 3 > r && t > r; r++) {
                if (2 == r)
                    i.push('<li class="hospital-detail content-last">');
                else
                    i.push('<li class="hospital-detail">');
                if ("" == e[r].logo)
                    i.push('<a target="_blank" href="' + e[r].url + '"><img src="' + n.src + '/common/img/home/nophoto.png" width="230" height="120"></a>'), i.push('<p class="hospital-name"><a href="' + e[r].url + '" title="' + e[r].name + '" target="_blank"><span class="span-name">' + e[r].name + '</span></a><label class="hospital-grade">');
                else
                    i.push('<a target="_blank" href="' + e[r].url + '"><img src="' + e[r].logo + '" width="230" height="120"></a>'), i.push('<p class="hospital-name"><a href="' + e[r].url + '" title="' + e[r].name + '" target="_blank"><span class="span-name">' + e[r].name + "</span></a>");
                for (var a = .5; 10 > a;) {
                    if (e[r].grade > a + 1)
                        i.push('<i class="star-right star-light star-fixed"></i>');
                    else if (e[r].grade > a)
                        i.push('<i class="star-right star-gray-light star-fixed"></i>');
                    else
                        i.push('<i class="star-right star-gray star-fixed"></i>');
                    a += 2
                }
                if (i.push('<span class="grade-text">' + e[r].grade + "</span>"), i.push('<label class="hospital-grade">'), "" != e[r].level)
                    i.push('<span class="grade">' + e[r].level + "</span>");
                if (1 == e[r].isInsurance)
                    i.push('<span class="corpt">医保</span>');
                i.push("</label></p>"), i.push('<p class="appointent_total"><label class="label-left">' + e[r].availDocNum + '位可挂号医生</label><label class="label-right"><span>' + e[r].serveNum + "</span>&nbsp;人成功预约</label></p></li>")
            }
            i.push('</ul><ul class="hospital-info">');
            for (var o = 3; t > o; o++) {
                if (5 == o || 8 == o || 11 == o)
                    i.push('<li class="content-last">');
                else
                    i.push("<li>");
                if (i.push('<a href="' + e[o].url + '" target="_blank" title="' + e[o].name + '"><span class="span-hospital ">' + e[o].name + "</span></a><label>"), "" != e[o].level)
                    i.push('<span class="span-grade">[' + e[o].level + "]</span>");
                if (1 == e[o].isInsurance)
                    i.push('<span class="span-corpt">[医保]</span>');
                i.push("</label></li>")
            }
            if (i.push("</ul>"), $("#cityTab").html(i.join("")), 3 >= t)
                $("#cityTab").find(".hospital-detail").css("border-bottom", "none"), $("#cityTab").css({ "padding-bottom": "0", "margin-bottom": "0" });
            else
                $("#cityTab").find(".hospital-detail").css("border-bottom", "1px dashed #d6d6d6"), $("#cityTab").css({ "padding-bottom": "0", "margin-bottom": "20px" })
        }
    }
});
