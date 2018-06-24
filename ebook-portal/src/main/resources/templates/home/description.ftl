<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">

<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">

<title>图书详情页</title>

<link href="../AmazeUI-2.4.2/assets/css/admin.css" rel="stylesheet"
	type="text/css" />
<link href="../AmazeUI-2.4.2/assets/css/amazeui.css" rel="stylesheet"
	type="text/css" />
<link href="../basic/css/demo.css" rel="stylesheet" type="text/css" />
<link type="text/css" href="../css/optstyle.css" rel="stylesheet" />
<link type="text/css" href="../css/style.css" rel="stylesheet" />

<script type="text/javascript" src="../basic/js/jquery-1.7.min.js"></script>
<script type="text/javascript" src="../basic/js/quick_links.js"></script>

<script type="text/javascript"
	src="../AmazeUI-2.4.2/assets/js/amazeui.js"></script>
<script type="text/javascript" src="../js/jquery.imagezoom.min.js"></script>
<script type="text/javascript" src="../js/jquery.flexslider.js"></script>

</head>

<body>
	<#include "../common/header.ftl">
	<div class="listMain">
		<div class="item-inform">
			<div class="clearfixLeft" id="clearcontent">
				<div class="box">
					<div class="tb-booth tb-pic tb-s310">
						<img src="${book.image }"
							class="jqzoom" />
					</div>
				</div>
				<div class="clear"></div>
			</div>
			<div class="clearfixRight">

				<!--规格属性-->
				<!--名称-->
				<div class="tb-detail-hd">
					<h1>${book.name}</h1>
				</div>
				<div class="tb-detail-list">
					<!--价格-->
					<div class="tb-detail-price">
						<li class="price iteminfo_price">
							<dt>价格</dt>
							<dd>
								<em>¥</em><b class="sys_item_price">${book.price}</b>
							</dd>
						</li>
						
						<div class="clear"></div>
					</div>

					<div class="clear"></div>
				</div>
				
				
				<ul>
				<li>作者：${book.author} 著</li>
				<li>出版社：${book.press}</li>
				<li>出版时间：${book.publishTime}</li>
				<li>版次：${book.edition}</li>
				<li>页数：${book.pageNum}</li>
				<li>字数：${book.wordNum}</li>
				</ul>
			
				<div class="pay">
					<li>
						<div class="clearfix tb-btn tb-btn-buy theme-login">
							
						</div>
					</li>
					<li>
						<div class="clearfix tb-btn tb-btn-basket theme-login">
							<a id="LikBasket" title="加入购物车" href="${DomainBaseUrl}/cart/add/${book.id}"><i></i>加入购物车</a>
						</div>
					</li>
				</div>

			</div>

			<div class="clear"></div>

		</div>
		<#include "../common/footer.ftl">
</body>

</html>