<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">

<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">

	<title>搜索结果</title>

	<link href="../AmazeUI-2.4.2/assets/css/amazeui.css" rel="stylesheet"
		type="text/css" />
	<link href="../AmazeUI-2.4.2/assets/css/admin.css" rel="stylesheet"
		type="text/css" />

	<link href="../basic/css/demo.css" rel="stylesheet" type="text/css" />

	<link href="../css/seastyle.css" rel="stylesheet" type="text/css" />

	<script type="text/javascript" src="../basic/js/jquery-1.7.min.js"></script>
	<script type="text/javascript" src="../js/script.js"></script>
</head>

<body>

	<#include "../common/header.ftl">

		<#if (bookList?size>0)>

	<div class="search">
		<div class="search-list">

			<div class="am-g am-g-fixed">
				<div class="am-u-sm-12 am-u-md-12">

					<div class="search-content">



						<ul class="am-avg-sm-2 am-avg-md-3 am-avg-lg-4 am-avg-lg-5 boxes">

							<#list bookList as book>
							<li onclick="javascript:location.href='${DomainBaseUrl}/book/${book.id?c }'">
								<div class="i-pic limit">
									<img src="${book.image }" />
									<p class="title fl">${book.name }</p>
									<p class="price fl">
										<b>¥</b> <strong>${book.price }</strong>
									</p>
									<p class="number fl">
										作者：<span>${book.author }</span>
									</p>
								</div>
							</li> 
							</#list>

						</ul>

					</div>

					<div class="clear"></div>
					<!--分页 -->
					<ul class="am-pagination am-pagination-right">
						<li  <#if curPage==1>class="am-disabled"</#if>><a href="${DomainBaseUrl}/query?page=${curPage-1}&q=${queryString}">&laquo;</a></li>
						
						<#list 1..pageCount as page>
						<li <#if curPage==page>class="am-active"</#if>><a href="${DomainBaseUrl}/query?page=${page}&q=${queryString}">${page}</a></li>
						</#list>
						
						<li <#if curPage==pageCount>class="am-disabled"</#if>><a href="${DomainBaseUrl}/query?page=${curPage+1}&q=${queryString}">&raquo;</a></li>
					</ul>

				</div>
			</div>

		</div>
			<div class="clear"></div>


	</div>
		<#else>

<h1 style="color:red;font-size:35px;text-align:center;margin-top:30px;margin-bottom:30px">您要找的图书不存在呀!</h1>
		</#if>
		
	<div style="margin-left:80px"><#include "../common/footer.ftl">	</div>
	
	<script>
		window.jQuery
				|| document
						.write('<script src="basic/js/jquery-1.9.min.js"><\/script>');
	</script>
	<script type="text/javascript" src="../basic/js/quick_links.js"></script>


</body>

</html>