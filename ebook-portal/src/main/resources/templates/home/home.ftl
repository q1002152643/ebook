<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">

<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">

	<title>首页</title>

	<link href="../AmazeUI-2.4.2/assets/css/amazeui.css" rel="stylesheet"
		type="text/css" />
	<link href="../AmazeUI-2.4.2/assets/css/admin.css" rel="stylesheet"
		type="text/css" />

	<link href="../basic/css/demo.css" rel="stylesheet" type="text/css" />

	<link href="../css/hmstyle.css" rel="stylesheet" type="text/css" />
	<link href="../css/skin.css" rel="stylesheet" type="text/css" />
	<script src="../AmazeUI-2.4.2/assets/js/jquery.min.js"></script>
	<script src="../AmazeUI-2.4.2/assets/js/amazeui.min.js"></script>
</head>

<body>

	<#include "../common/header.ftl">

	<div class="banner">
		<!--轮播 -->
		<div class="am-slider am-slider-default scoll" data-am-flexslider
			id="demo-slider-0">
			<ul class="am-slides">
				<li class="banner1"><a><img src="../images/ad1.jpg" /></a></li>
				<li class="banner2"><a><img src="../images/ad2.jpg" /></a></li>
				<li class="banner3"><a><img src="../images/ad3.jpg" /></a></li>
				<li class="banner4"><a><img src="../images/ad4.jpg" /></a></li>
			</ul>
		</div>
		<div class="clear"></div>
	</div>
	<div class="shopNav">


<div class="slideall">

			<div class="long-title">
				<span class="all-goods">图书分类</span>
			</div>
			<div class="nav-cont">
			
			
				<ul>
					<#list category as category>
					<li class="qc"><a href="${DomainBaseUrl}/query?q=${category.text}">${category.text}</a></li>
					</#list>
				</ul>
				
				
			</div>
			</div>


			<!--轮播-->

			<script type="text/javascript">
				(function() {
					$('.am-slider').flexslider();
				});
				$(document)
						.ready(
								function() {
									$("li")
											.hover(
													function() {
														$(
																".category-content .category-list li.first .menu-in")
																.css("display",
																		"none");
														$(
																".category-content .category-list li.first")
																.removeClass(
																		"hover");
														$(this).addClass(
																"hover");
														$(this)
																.children(
																		"div.menu-in")
																.css("display",
																		"block")
													},
													function() {
														$(this).removeClass(
																"hover")
														$(this).children(
																"div.menu-in")
																.css("display",
																		"none")
													});
								})
			</script>

			<div class="clear"></div>
		</div>
		<script type="text/javascript">
			if ($(window).width() < 640) {
				function autoScroll(obj) {
					$(obj).find("ul").animate({
						marginTop : "-39px"
					}, 500, function() {
						$(this).css({
							marginTop : "0px"
						}).find("li:first").appendTo(this);
					})
				}
				$(function() {
					setInterval('autoScroll(".demo")', 3000);
				})
			}
		</script>
	</div>
	
	<#include "../common/footer.ftl">

	<script>
		window.jQuery
				|| document
						.write('<script src="basic/js/jquery.min.js "><\/script>');
	</script>
	<script type="text/javascript " src="../basic/js/quick_links.js "></script>
</body>

</html>