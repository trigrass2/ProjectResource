<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- 资源编辑 -->
<script type="text/javascript">
$(function() {
	$("#pickIcon").click(function () {
	    $.easyui.icons.showSelector({
	        onEnter: function (val) { 
	        	$("#iconCls").removeClass().addClass(val);	        	
	        	$("#iconClsHid").attr("value",val);
	        }
	    });
	});
	
	$("#pidComboTree").combotree({
		width:150,
		dataPlain : true,
		value : "${checkedRes.pid}",
		url : "${pageContext.request.contextPath}/pms/sysRes/getAllMenuSelfNotIn.do?id=${checkedRes.id}"
	});
	
});
</script>
<div class="easyui-layout" data-options="fit:true,border:false">
	<div data-options="region:'center',border:false" title="" style="overflow: hidden;padding:5px">
		<form id="form" method="post">
			<fieldset>
				<legend>资源基本信息</legend>
				<table class="table" style="width: 100%;">
					<tr>
						<th>资源名称</th>
						<td>
							<input name="del" type="hidden" value="0"/>
							<input name="id" type="hidden" value="${checkedRes.id}"/>
							<input type="text" name="text" class="easyui-validatebox span2" data-options="required:true" value="${checkedRes.text}"/>
						</td>
						<th>资源类型</th>
						<td>
							<select name="typ" class="easyui-combobox fselect" data-options="panelHeight:'auto'">
								<option value="1" <c:if test="${checkedRes.typ=='1'}">selected="selected"</c:if>>菜单</option>
								<option value="2" <c:if test="${checkedRes.typ=='2'}">selected="selected"</c:if> >功能</option>
							</select>
						</td>
					</tr>

					<tr>
					</tr>
					<tr>
						<th>启用</th>
						<td>
							<select name="enable" class="easyui-combobox fselect" data-options="panelHeight:'auto'">
								<option value="1" <c:if test="${checkedRes.enable=='1'}">selected="selected"</c:if>>启用</option>
								<option value="0" <c:if test="${checkedRes.enable=='0'}">selected="selected"</c:if> >禁用</option>
							</select>
						</td>
						<th>图标</th>
						<td>
							<input id="iconClsHid" name="iconCls" type="hidden" value="${checkedRes.iconCls}"/>
							<span class="${checkedRes.iconCls}"
							 id="iconCls" 
							 style="display: inline-block;
									width: 16px;
									height: 16px;
									line-height: 16px;
									position: absolute;
									top: 104px;
									left: 415px;
									margin-top: -8px;
									font-size: 1px;">&nbsp;</span>
							<input id="pickIcon" type="button" style="
								display: inline-block;
								line-height: 16px;
								position: absolute;
								top: 101px;
								left: 499px;
								margin-top: -8px;
								font-size: 12px;" value="选择" />
						</td>
					</tr>
					<tr>
						<th>资源排序</th>
						<td>
							<input name="seq" class="easyui-numberspinner fselect"
        					required="required" 
        					style="width:158px"
        					data-options="min:1,max:999"
        					value="${checkedRes.seq}"
        					/>
						</td>
						<th>上级资源</th>
						<td>
							<select id="pidComboTree" name="pid"  class="fselect"></select>
						</td>
					</tr>
					<tr>
						<th>资源路径</th>
						<td>
							<input type="text" name="url" class="easyui-validatebox" data-options="" value="${checkedRes.url}"/>
						</td>
						<th>安全级别</th>
						<td>
							<input name="securityLevel" class="easyui-numberspinner"
        					required="required" 
        					value="${checkedRes.securityLevel}"
        					data-options="min:1,max:10,width:150"/>
						</td>
					</tr>
					<tr>
						<th>资源描述</th>
						<td colspan="3">
							<textarea rows="4" name="remark" cols="60">${checkedRes.remark}</textarea>
						</td>
					</tr>								
				</table>
			</fieldset>
		</form>
	</div>
	<div id="pickPidDialog" class="easyui-dialog" title="选择父级资源" style="width:250px;height:300px;"  
        data-options="iconCls:'icon-save',resizable:true,modal:true,closed:true">  
	<table id="pickPidTreeGrid"></table>
	</div>
</div>