<link rel="stylesheet" type="text/css" href="css/list.css" />

<p align="center">
按订单状态查询：
  <a class="easyui-linkbutton" href="javascript:void(0);" onclick="dianji(1)">未付款</a>   
  <a class="easyui-linkbutton" href="javascript:void(0);" onclick="dianji(2)">已付款</a>
  <a class="easyui-linkbutton" href="javascript:void(0);" onclick="dianji(3)">已发货</a>
  <a class="easyui-linkbutton" href="javascript:void(0);" onclick="dianji(4)">交易成功</a>
  <a class="easyui-linkbutton" href="javascript:void(0);" onclick="dianji(5)">已取消</a>
  
  <script>
  	function dianji(data){
		$("#result").load("/order/findAllOrderInfoByStatus?status="+data+" #result");
  	}
  	
  	function updateStatus(orderid,status,preStatus){
		$("#result").load("/order/updateOrderStatusById?id="+orderid+"&status="+status+"&preStatus="+preStatus+" #result");
  	}
  </script>
  
</p>


<div class="divMain" id="result">
<#if (orderVO?size>0)>
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
	<a class="link2" href="http://localhost/book/${orderDetails.bid }">
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
			
			<#if order.status == 1>
			  <a href="javascript:void(0);" onclick="updateStatus('${order.id?c }',5,1)">取消</a><br/>
			</#if>	
			<#if order.status == 2>
				<a href="javascript:void(0);" onclick="updateStatus('${order.id?c }',3,2)">发货</a><br/>
			</#if>	
			
			</td>
		</tr>
</#list>



	</table>
	<br/>


		<#else>

<h1 style="color:red;font-size:25px;text-align:center;margin-top:30px;margin-bottom:30px">当前没有此状态的订单记录!</h1>
		</#if>
</div>
