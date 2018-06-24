<script src="../js/jquery.cookie.js"></script>
<div class="hmtop">
		<!--顶部导航条 -->
		<div class="am-container header">
			<ul class="message-l">
				<div class="topMessage">
					<div class="menu-hd" id="loginbar">
						<a href="${DomainBaseUrl}:8081/page/login" target="_top" class="h">亲，请登录</a> <a href="${DomainBaseUrl}:8081/page/register"
							target="_top">免费注册</a>
					</div>
					
					
					<script>
					
					
					var TT = TAOTAO = {
	checkLogin : function(){
		var _ticket = $.cookie("TOKEN");
		if(!_ticket){
			return ;
		}
		$.ajax({
			url : "${DomainBaseUrl}/user/token/" + _ticket,
			dataType : "json",
			type : "GET",
			success : function(data){
				if(data.status == 200){
					var username = data.data.username;
					var html = username + "，欢迎来到书城！<a href=\"${DomainBaseUrl}:8081/page/logout/"+_ticket+"\" class=\"link-logout\">[退出]</a>";
					$("#loginbar").html(html);
				}
			}
		});
	}
}

$(function(){
	// 查看是否已经登录，如果已经登录查询登录信息
	TT.checkLogin();
});
					
					
					
					
					</script>
					
					
					
					
					
				</div>
			</ul>
			<ul class="message-r">
				<div class="topMessage home">
					<div class="menu-hd">
						<a href="${DomainBaseUrl}" target="_top" class="h">书城首页</a>
					</div>
				</div>
				<div class="topMessage my-shangcheng">
					<div class="menu-hd MyShangcheng">
						<a href="${DomainBaseUrl}/order/findAllOrderInfoByUid" target="_top"><i class="am-icon-user am-icon-fw"></i>我的订单</a>
					</div>
				</div>
				<div class="topMessage mini-cart">
					<div class="menu-hd">
						<a id="mc-menu-hd" href="/cart/showCart" target="_top"><i
							class="am-icon-shopping-cart  am-icon-fw"></i><span>购物车</span></a>
					</div>
				</div>
			</ul>
		</div>

		<!--悬浮搜索框-->

		<div class="nav white">
			<div class="logo">
				<img src="../images/logo.png" />
			</div>
			<div class="logoBig">
				<li><img src="../images/logobig.png" /></li>
			</div>

			<div class="search-bar pr">
				<a name="index_none_header_sysc" href="${DomainBaseUrl}/query"></a>
				<form action="${DomainBaseUrl}/query" method="post">
					<input id="searchInput" name="q" type="text"
						placeholder="搜索" autocomplete="off"> <input
						id="ai-topsearch" class="submit am-btn" value="搜索" index="1"
						type="submit">
				</form>
			</div>
		</div>

		<div class="clear"></div>
	</div>
	