<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">

<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">

	<title>购物车页面</title>

	<link href="../AmazeUI-2.4.2/assets/css/amazeui.css" rel="stylesheet"
		type="text/css" />
	<link href="../basic/css/demo.css" rel="stylesheet" type="text/css" />
	<link href="../css/cartstyle.css" rel="stylesheet" type="text/css" />
	<link href="../css/optstyle.css" rel="stylesheet" type="text/css" />

	<script type="text/javascript" src="../js/jquery.js"></script>

</head>

<body>
	<#include "../common/header.ftl">

			<!--购物车 -->
	<div class="concent">
		<div id="cartTable">
			<div class="cart-table-th">
				<div class="wp">
					<div class="th th-chk">
						<div id="J_SelectAll1" class="select-all J_SelectAll"></div>
					</div>
					<div class="th th-item">
						<div class="td-inner">图书信息</div>
					</div>
					<div class="th th-price">
						<div class="td-inner">单价</div>
					</div>
					<div class="th th-amount">
						<div class="td-inner">数量</div>
					</div>
					<div class="th th-sum">
						<div class="td-inner">金额</div>
					</div>
					
				</div>
			</div>
			<div class="clear"></div>


			 <#list orderVO.orderDetails as cart>
			<tr class="item-list">
				<div class="bundle  bundle-last ">
					<div class="bundle-main">
						<ul class="item-content clearfix">
							<li class="td td-item">
								<div class="item-pic">
									<a href="/book/${cart.id}" data-title="" class="J_MakePoint"
										data-point="tbcart.8.12"> <img src="${cart.image}"
										class="itempic J_ItemImg" style="height:80px"></a>
								</div>
								<div class="item-info">
									<div class="item-basic-info">
										<a href="/book/${cart.id}"
											title="${cart.name}" class="item-title J_MakePoint"
											data-point="tbcart.8.11">${cart.name}</a>
									</div>
								</div>
							</li>
							<li class="td td-info">
								<div class="item-props"></div>
							</li>
							<li class="td td-price">
								<div class="item-price price-promo-promo">
									<div class="price-content">
										<div class="price-line">
											<em id="price${cart.id}" class="J_Price price-now"
												tabindex="0">${cart.price}</em>
										</div>
									</div>
								</div>
							</li>
							<li class="td td-amount">
								<div class="amount-wrapper ">
									<div class="item-amount ">
										<div class="sl">
											${cart.num}
										</div>
									</div>
								</div>
							</li>
							<li class="td td-sum">
								<div class="td-inner">
									<em tabindex="0" id="sum${cart.id}" class="J_ItemSum number">${cart.num*cart.price}</em>
								</div>
							</li>
							
						</ul>
					</div>
				</div>
			</tr>
			</#list> 
			<div class="clear"></div>



			<div class="float-bar-wrapper">
				<div class="float-bar-right">
					<div class="price-sum">
						<span class="txt">合计:</span> <strong class="price">¥<em
							id="J_Total">${orderVO.payment}</em></strong>
					</div>
					<div class="btn-area">
						<a href="javascript:history.back();" id="J_Go"
							class="submit-btn submit-btn-disabled"
							aria-label=""> <span title="返回">返回</span></a>
					</div>
				</div>

			</div>


		</div>

		<#include "../common/footer.ftl">
</body>

</html>