<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>订单列表</title>
    
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">

	<link href="../AmazeUI-2.4.2/assets/css/amazeui.css" rel="stylesheet"
		type="text/css" />
	<link href="../AmazeUI-2.4.2/assets/css/admin.css" rel="stylesheet"
		type="text/css" />

	<link href="../basic/css/demo.css" rel="stylesheet" type="text/css" />

	<link href="../css/hmstyle.css" rel="stylesheet" type="text/css" />
	<link href="../css/skin.css" rel="stylesheet" type="text/css" />
	<script src="../AmazeUI-2.4.2/assets/js/jquery.min.js"></script>
	<script src="../AmazeUI-2.4.2/assets/js/amazeui.min.js"></script>

	<link rel="stylesheet" type="text/css" href="../css/list.css" />

  </head>
  
  <body>
  	<#include "../common/header.ftl">

<#if (orderVO?size>0)>

<div class="divMain">
	<div class="divTitle">
		<span style="margin-left: 150px;margin-right: 280px;">商品信息</span>
		<span style="margin-left: 40px;margin-right: 38px;">金额</span>
		<span style="margin-left: 50px;margin-right: 40px;">订单状态</span>
		<span style="margin-left: 50px;margin-right: 50px;">操作</span>
	</div>
	<br/>
	<table align="center" border="0" width="100%" cellpadding="0" cellspacing="0">

<#list orderVO as order>

		<tr class="tt">
			<td width="320px">订单号：${order.id?c }</td>
			<td width="210px">下单时间：${order.createTime?date }</td>
			<td>&nbsp;</td>
			<td>&nbsp;</td>
			<td>&nbsp;</td>
			<td>&nbsp;</td>
		</tr>
		<tr style="padding-top: 10px; padding-bottom: 10px;">
			<td colspan="2">


<#list order.orderDetails as orderDetails>
	<a class="link2" href="${DomainBaseUrl}/book/${orderDetails.bid }">
	    <img border="0" width="70" style="width:90px;height:90px;" src="${orderDetails.image}"/>
	</a>
</#list>
	



			</td>
			<td width="115px">
				<span class="price_t">&yen;${order.payment }</span>
			</td>
			<td width="142px">
<#if order.status == 1>
 (等待付款)
<#elseif order.status == 2>
 (准备发货)
<#elseif order.status == 3>
 (等待确认)
<#elseif order.status == 4>
 (交易成功)
<#else>
  (已取消)
</#if>		

			</td>
			<td>
			<a href="${DomainBaseUrl}/order/findOrderDetailInfo?id=${order.id?c }">查看</a><br/>
			<#if order.status == 1>
				<a href="${DomainBaseUrl}/payment/paymentPre?orderId=${order.id?c }&total=${order.payment?c }">支付</a><br/>
				<a href="${DomainBaseUrl}/order/updateOrderStatusById?id=${order.id?c }&status=5">取消</a><br/>
			</#if>	
			<#if order.status == 3>
				<a href="${DomainBaseUrl}/order/updateOrderStatusById?id=${order.id?c }&status=4">确认收货</a><br/>
			</#if>	
			
			</td>
		</tr>
</#list>



	</table>
	<br/>
</div>

		<#else>

<h1 style="color:red;font-size:35px;text-align:center;margin-top:30px;margin-bottom:30px">您当前没有订单记录!</h1>
		</#if>

<#include "../common/footer.ftl">
  </body>
</html>
