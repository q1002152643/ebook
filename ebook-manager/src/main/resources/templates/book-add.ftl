<link href="/js/kindeditor-4.1.10/themes/default/default.css" type="text/css" rel="stylesheet">
<script type="text/javascript" charset="utf-8" src="/js/kindeditor-4.1.10/kindeditor-all-min.js"></script>
<script type="text/javascript" charset="utf-8" src="/js/kindeditor-4.1.10/lang/zh_CN.js"></script>

<div style="padding:10px 10px 10px 10px">
	<form id="itemAddForm" class="itemForm" method="post">
	    <table cellpadding="5">
	        <tr>
	            <td>图书分类:</td>
	            <td>
	            	<a href="javascript:void(0)" class="easyui-linkbutton selectItemCat">选择分类</a>
	            	<input type="hidden" name="cid" style="width: 280px;"></input>
	            </td>
	        </tr>
	        <tr>
	            <td>图书名称:</td>
	            <td><input class="easyui-textbox" type="text" name="name" data-options="required:true" style="width: 280px;"></input></td>
	        </tr>
	        <tr>
	            <td>作者:</td>
	            <td><input class="easyui-textbox" type="text" name="author" data-options="required:true" style="width: 280px;"></input></td>
	        </tr>
	        <tr>
	            <td>图书价格:</td>
	            <td><input class="easyui-textbox" type="text" name="price" data-options="required:true" style="width: 280px;"></input></td>
	        </tr>
	        <tr>
	            <td>库存数量:</td>
	            <td><input class="easyui-numberbox" type="text" name="num" data-options="min:1,max:99999999,precision:0,required:true" /></td>
	        </tr>
	        <tr>
	            <td>出版社:</td>
	            <td><input class="easyui-textbox" type="text" name="press" data-options="required:true" style="width: 280px;"></input></td>
	        </tr>
	        <tr>
	            <td>出版时间:</td>
	            <td><input class="easyui-datebox" type="text" name="publishTime" data-options="required:true" style="width: 280px;"></input></td>
	        </tr>
	        <tr>
	            <td>版次:</td>
	            <td><input class="easyui-textbox" type="text" name="edition" data-options="required:true" style="width: 280px;"></input></td>
	        </tr>
	        <tr>
	            <td>页数:</td>
	            <td><input class="easyui-textbox" type="text" name="pageNum" data-options="required:true" style="width: 280px;"></input></td>
	        </tr>
	        <tr>
	            <td>字数:</td>
	            <td><input class="easyui-textbox" type="text" name="wordNum" data-options="required:true" style="width: 280px;"></input></td>
	        </tr>
	        <tr>
	            <td>图书图片:</td>
	            <td>
	            	 <a href="javascript:void(0)" class="easyui-linkbutton picFileUpload">上传图片</a>
	                 <input type="hidden" name="image"/>
	            </td>
	        </tr>
	    </table>

	</form>
	<div style="padding:10px">
	    <a href="javascript:void(0)" class="easyui-linkbutton" onclick="submitForm()">提交</a>
	    <a href="javascript:void(0)" class="easyui-linkbutton" onclick="clearForm()">重置</a>
	</div>
</div>
<script type="text/javascript">

	//页面初始化完毕后执行此方法
	$(function(){
		//初始化类目选择和图片上传器
		TAOTAO.init({fun:function(node){

		}});
	});
	
	//提交表单
	function submitForm(){
		//有效性验证
		if(!$('#itemAddForm').form('validate')){
			$.messager.alert('提示','表单还未填写完成!');
			return ;
		}
		
		//ajax的post方式提交表单
		$.post("/book",$("#itemAddForm").serialize(), function(data){
			if(data.status == 200){
				$.messager.alert('提示','新增图书成功!');
			}
		});
	}
	
	function clearForm(){
		$('#itemAddForm').form('reset');
	}
</script>
