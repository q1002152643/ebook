<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">

<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">

	<title>我的购物车</title>

	<link href="../AmazeUI-2.4.2/assets/css/amazeui.css" rel="stylesheet"
		type="text/css" />
	<link href="../basic/css/demo.css" rel="stylesheet" type="text/css" />
	<link href="../css/cartstyle.css" rel="stylesheet" type="text/css" />
	<link href="../css/optstyle.css" rel="stylesheet" type="text/css" />

	<script type="text/javascript" src="../js/jquery.js"></script>
	<script>
		function updateCart(id, num) {
			$.ajax({
				"url" : "/cart/update/" + id + "/" + num,
				"type" : "GET",
				"success" : function(data) {
					$("#J_Total").text(data);
					var price = $("#price" + id).text();
					var sum = Number(price) * num;
					$("#sum" + id).text(sum);
				},
				"dataType" : "json"
			});

		}
	</script>
</head>

<body>
	<#include "../common/header.ftl">
				<#if (lists?size==0)>
<h1 style="color:red;font-size:35px;text-align:center;margin-top:30px">您的购物车什么也没有呀!</h1>
		<#else>
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
					<div class="th th-op">
						<div class="td-inner">操作</div>
					</div>
				</div>
			</div>
			<div class="clear"></div>


			 <#list lists as cart>
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
											<input class="min am-btn" id="d${cart.id}" type="button"
												value="-" /> <input class="text_box" id="${cart.id}"
												type="text" value="${cart.num}" style="width: 30px;" /> <input
												class="add am-btn" id="u${cart.id}" type="button" value="+" />

											<script>
												$(function() {
													$("#${cart.id}")
															.change(
																	function() {
																		var num = $(
																				this)
																				.val();
																		var id = $(
																				this)
																				.attr(
																						"id");
																		if (num == 0) {
																			location.href = "/cart/delete/"
																					+ id;
																		} else {
																			updateCart(
																					id,
																					num);
																		}
																	});

													$("#d${cart.id}")
															.click(
																	function() {
																		var id = $(
																				"#d${cart.id}")
																				.attr(
																						"id")
																				.substring(
																						1);
																		var num = $(
																				"#"
																						+ id)
																				.val() - 1;
																		if (num == 0) {
																			location.href = "/cart/delete/"
																					+ id;
																		} else {
																			updateCart(
																					id,
																					num);
																		}
																	});

													$("#u${cart.id}")
															.click(
																	function() {
																		var id = $(
																				"#u${cart.id}")
																				.attr(
																						"id")
																				.substring(
																						1);
																		var num = Number($(
																				"#"
																						+ id)
																				.val()) + 1;
																		updateCart(
																				id,
																				num);
																	});
												});
											</script>
										</div>
									</div>
								</div>
							</li>
							<li class="td td-sum">
								<div class="td-inner">
									<em tabindex="0" id="sum${cart.id}" class="J_ItemSum number">${cart.num*cart.price}</em>
								</div>
							</li>
							<li class="td td-op">
								<div class="td-inner">
									<a href="/cart/delete/${cart.id}" data-point-url="#"
										class="delete">删除</a>
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
							id="J_Total">${total}</em></strong>
					</div>
					<div class="btn-area">
						<a href="/order/createOrder" id="J_Go"
							class="submit-btn submit-btn-disabled"
							aria-label=""> <span title="点击此按钮，提交订单">提交订单</span></a>
					</div>
				</div>

			</div>


		</div>
		
		
		</#if>
		<#include "../common/footer.ftl">
</body>

</html>