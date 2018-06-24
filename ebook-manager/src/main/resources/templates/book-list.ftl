<table class="easyui-datagrid" id="itemList" title="图书列表" 
       data-options="singleSelect:false,collapsible:true,pagination:true,url:'/book/list',method:'get',pageSize:30,toolbar:toolbar">
    <thead>
        <tr>
        	<th data-options="field:'ck',checkbox:true"></th>
        	<th data-options="field:'id',width:60,align:'center'">图书ID</th>
            <th data-options="field:'name',width:350">图书名称</th>
            <th data-options="field:'author',width:130">作者</th>
            <th data-options="field:'price',width:70,align:'center'">价格</th>
            <th data-options="field:'num',width:70,align:'center'">库存数量</th>
            <th data-options="field:'press',width:100">出版社</th>
            <th data-options="field:'publishTime',width:100">出版时间</th>
            <th data-options="field:'edition',width:50,align:'center'">版次</th>
            <th data-options="field:'pageNum',width:50">页数</th>
            <th data-options="field:'wordNum',width:70">字数</th>
        </tr>
    </thead>
</table>
<div id="itemEditWindow" class="easyui-window" title="编辑图书" data-options="modal:true,closed:true,iconCls:'icon-save',href:'/book-edit'" style="width:80%;height:80%;padding:10px;">
</div>
<script>

    function getSelectionsIds(){
    	var itemList = $("#itemList");
    	var sels = itemList.datagrid("getSelections");
    	var ids = [];
    	for(var i in sels){
    		ids.push(sels[i].id);
    	}
    	ids = ids.join(",");
    	return ids;
    }
    
    var toolbar = [{
        text:'新增',
        iconCls:'icon-add',
        handler:function(){
        	$(".tree-title:contains('新增图书')").parent().click();
        }
    },{
        text:'编辑',
        iconCls:'icon-edit',
        handler:function(){
        	var ids = getSelectionsIds();
        	if(ids.length == 0){
        		$.messager.alert('提示','必须选择一个图书才能编辑!');
        		return ;
        	}
        	if(ids.indexOf(',') > 0){
        		$.messager.alert('提示','只能选择一个图书!');
        		return ;
        	}
        	
        	$("#itemEditWindow").window({
        		onLoad :function(){
        			//回显数据
        			var data = $("#itemList").datagrid("getSelections")[0];
        			data.priceView = TAOTAO.formatPrice(data.price);
        			$("#itemeEditForm").form("load",data);

        			TAOTAO.init({
        				"pics" : data.image,
        				"cid" : data.cid
        			});
        		}
        	}).window("open");
        }
    },{
        text:'删除',
        iconCls:'icon-cancel',
        handler:function(){
        	var ids = getSelectionsIds();
        	if(ids.length == 0){
        		$.messager.alert('提示','未选中图书!');
        		return ;
        	}
        	$.messager.confirm('确认','确定删除ID为 '+ids+' 的图书吗？',function(r){
        	    if (r){
        	    	var params = {"ids":ids,"_method":"DELETE"};
                	$.post("/book",params, function(data){
            			if(data.status == 200){
            				$.messager.alert('提示','删除图书成功!',undefined,function(){
            					$("#itemList").datagrid("reload");
            				});
            			}
            		});
        	    }
        	});
        }
    }];
</script>