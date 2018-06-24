<table class="easyui-datagrid" id="itemList" title="分类列表" 
       data-options="singleSelect:false,collapsible:true,pagination:true,url:'/category/list',method:'get',pageSize:30,toolbar:toolbar">
    <thead>
        <tr>
        	<th data-options="field:'ck',checkbox:true"></th>
        	<th data-options="field:'id',width:60,align:'center'">分类ID</th>
            <th data-options="field:'name',width:250">分类名称</th>
            <th data-options="field:'description',width:350">描述</th>
        </tr>
    </thead>
</table>
<div id="itemEditWindow" class="easyui-window" title="编辑分类" data-options="modal:true,closed:true,iconCls:'icon-save',href:'/category-edit'" style="width:80%;height:80%;padding:10px;">
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
        	$(".tree-title:contains('新增分类')").parent().click();
        }
    },{
        text:'编辑',
        iconCls:'icon-edit',
        handler:function(){
        	var ids = getSelectionsIds();
        	if(ids.length == 0){
        		$.messager.alert('提示','必须选择一个分类才能编辑!');
        		return ;
        	}
        	if(ids.indexOf(',') > 0){
        		$.messager.alert('提示','只能选择一个分类!');
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
        		$.messager.alert('提示','未选中分类!');
        		return ;
        	}
        	$.messager.confirm('确认','确定删除ID为 '+ids+' 的分类吗？',function(r){
        	    if (r){
        	    	var params = {"ids":ids,"_method":"DELETE"};
                	$.post("/category",params, function(data){
            			if(data.status == 200){
            				$.messager.alert('提示','删除分类成功!',undefined,function(){
            					$("#itemList").datagrid("reload");
            				});
            			}
            		});
        	    }
        	});
        }
    }];
</script>