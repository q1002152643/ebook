<link href="/js/kindeditor-4.1.10/themes/default/default.css" type="text/css" rel="stylesheet">
<script type="text/javascript" charset="utf-8" src="/js/kindeditor-4.1.10/kindeditor-all-min.js"></script>
<script type="text/javascript" charset="utf-8" src="/js/kindeditor-4.1.10/lang/zh_CN.js"></script>

<div style="padding:10px 10px 10px 10px">
	<form id="itemeEditForm" class="itemForm" method="post">
		<input type="hidden" name="id"/>
		<input type="hidden" name="_method" value="PUT"/>
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
	<div style="padding:5px">
	    <a href="javascript:void(0)" class="easyui-linkbutton" onclick="submitForm()">提交</a>
	</div>
</div>
<script type="text/javascript">
	
	function submitForm(){
		if(!$('#itemeEditForm').form('validate')){
			$.messager.alert('提示','表单还未填写完成!');
			return ;
		}
		
		$.post("/book",$("#itemeEditForm").serialize(), function(data){
			if(data.status == 200){
				$.messager.alert('提示','修改图书成功!','info',function(){
					$("#itemEditWindow").window('close');
					$("#itemList").datagrid("reload");
				});
			}
		});
	}
</script>