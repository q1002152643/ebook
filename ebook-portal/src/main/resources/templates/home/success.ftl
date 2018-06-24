<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" /> 
<meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">
<title>订单生成结果页面</title>
<link rel="stylesheet"  type="text/css" href="../AmazeUI-2.4.2/assets/css/amazeui.css"/>
<link href="../AmazeUI-2.4.2/assets/css/admin.css" rel="stylesheet" type="text/css">
<link href="../basic/css/demo.css" rel="stylesheet" type="text/css" />

<link href="../css/sustyle.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="../basic/js/jquery-1.7.min.js"></script>

</head>

<body>
	<#include "../common/header.ftl">
<div class="take-delivery">
 <div class="status">
   <h2>您已成功创建订单:${orderId}</h2>
   <div class="successInfo">
     <ul>
       <li>付款金额<em>¥${total}</em></li>
       
             请认真核对您的收货信息，如有错误请联系客服
                               
     </ul>
     <div class="option">
       <span class="info">您可以</span>
        <a href="${DomainBaseUrl}/order/findAllOrderInfoByUid" class="J_MakePoint">查看<span>已买到的宝贝</span></a>
        <a href="${DomainBaseUrl}/payment/paymentPre?orderId=${orderId}&total=${total}" class="J_MakePoint">或者去<span>付款</span></a>
     </div>
    </div>
  </div>
</div>


		<#include "../common/footer.ftl">
</body>
</html>
