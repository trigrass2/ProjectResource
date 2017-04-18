<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<title>设备故障信息</title>
<meta name="author" content="leejean">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"> 
<script src="${pageContext.request.contextPath}/jslib/jquery-extensions-master/jquery/jquery-1.11.0.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/wct/js/comboboxUtil.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/wct/js/jquery.min.js" type="text/javascript" ></script>
<link href="${pageContext.request.contextPath}/jslib/bootstrap-2.3.1/css/bootstrap.css" rel="stylesheet" media="screen">
<link rel="stylesheet" type="text/css"	href="${pageContext.request.contextPath}/wct/css/wct_global.css"></link>
<script src="${pageContext.request.contextPath}/wct/js/wctTools.js" type="text/javascript" ></script>
<jsp:include page='../../initlib/initMyAlert.jsp' ></jsp:include>
<style type="text/css"> 
body{
background-color: #F4F4F4;
}
*{font-family: "Microsoft YaHei","宋体",Arial;}
	#hisBadQty-title{
		font-size: 20px;
		font-weight: bold;
		text-align: center;
		padding-top: 4px;
		background: #F4F4F4;
		color: #F4F4F4;
		border-radius: 0px 4px 0px 0px;
		line-height: 35px;
		height: 40px;
		border-bottom: 2px solid #F4F4F4;
	}
	#hisBadQty-seach-box{
		border: 1px solid #9a9a9a;
		width: 96%;
		margin-left: 10px;
		height: 45px;
		margin-top: 15px;
		font-size: 12px;
		font-weight: bold;
		padding-top: 8px;
		padding-left: 5px;
		border-radius: 4px;
		background: #dedcda;
	}
	
	#search_form td{
		font-size:14px;
	}
	#hisBadQty-tab{		
		width:97%;
		margin-left:10px;
		height:auto;
		margin-top:5px;
		font-size:12px;
		font-weight:bold;
		height: 462px;
	}
	.t-header{
		text-align:center;
	}
	#hisBadQty-tab-thead tr td,#hisBadQty-tab-tbody tr td{
		/* padding:7px; */
		height:40px;
		text-align:center;
	}
	#hisBadQty-page{
		width:97%;
		margin-left:10px;
		margin-top:5px;
		height:auto;
		font-size:12px;
		font-weight:bold;
		text-align:right;
		padding-top:4px;
	}
	#details{
		border:2px solid #dddddd;
		width:96%;
		margin-left:10px;
		height:80px;
		margin-top:5px;
		padding:2px;
		text-indent:15px;
	}
	#up,#down,.od{
		border:1px solid #9a9a9a;
		padding:3px 2px;
		width:70px;
		font-weight:bold;
		font-size:12px;
		cursor:pointer;
	}
	.btn-default {
color: #FFFFFF;
background-color: #5A5A5A;
border-color: #cccccc;
}

.btn {
  display: inline-block;
  padding:0px;
  margin-bottom: 0;
  font-size: 14px;
  font-weight: normal;
  line-height: 1.428571429;
  text-align: center;
  white-space: nowrap;
  vertical-align: middle;
  cursor: pointer;
  background-image: none;
  border: 1px solid transparent;
  border-radius: 4px;
  -webkit-user-select: none;
     -moz-user-select: none;
      -ms-user-select: none;
       -o-user-select: none;
          user-select: none;
}
.node ul{ 
margin-left:30px; 
} 
.node .node{ 
display:none; 
} 

.ce_ceng_close{ 
background:url(img/cd_zd1.png) left  no-repeat; 
padding-left: 15px; 
} 
.ce_ceng_open{ 
background:url(img/cd_zd.png) left  no-repeat; 
} 
</style>

<script type="text/javascript">
	var sbPid=${param.sbPid};
	var role=${param.role};
	var id_=${param.id};
	var type_=${param.type};
	var source_=${param.source};
	var trouble_name="";
	var description="";
	var useNum="";
	var tid=[];
	var l=0;
	var html="";
	var html1="";
	var html2="";
	 $(function(){
		 l=0;
		$("#area").val(null);
		$.post("${pageContext.request.contextPath}/pms/trouble/queryTroubleInfo.do",function(list){
			list=list.substring(1,list.length-1);
			$("#all").html(list);
			$(".tree").each(function(index, element) { 
				if($(this).next(".node").length>0){ 
					$(this).addClass("ce_ceng_close"); 
				} 
			}); 
			$(".tree").click(function(e){ 
				var ul = $(this).next(".node"); 
				if(ul.css("display")=="none"){ 
					ul.slideDown(); 
					$(this).addClass("ce_ceng_open"); 
					ul.find(".ce_ceng_close").removeClass("ce_ceng_open"); 
				}else{ 
					ul.slideUp(); 
					$(this).removeClass("ce_ceng_open"); 
					ul.find(".node").slideUp(); 
					ul.find(".ce_ceng_close").removeClass("ce_ceng_open"); 
				} 
			}); 
		});
		
	});
	 var codetest=[];
	 var nametest=[];
	 var name="";
 //向文本域中添加选中的故障信息
 	function save(code,des){
 		if(code!=codetest[0]){
 			codetest[0]=code;
 			var areaV=$("#area").val();
 	 		areaV=areaV+"\r"+des+"\r";
 	 		$("#area").val(areaV);
 	 		if(name!=nametest[0]){
 	 			nametest[0]=name;
 	 			name=name+"\r"+code+"\r";
 	 		}
 	 		//name=code;
 		}else{
 	 		jAlert("数据重复，请勿重复添加");
 		}
 		
 	}
 //添加故障信息
 	function add(){
 		var areaV=$("#area").val();
 		if(areaV!=null&&areaV!=""){
 			jConfirm('是否确认添加?添加后无法删除！', '提示', function(r) {
 	 			if(r){
 	 				$.post("${pageContext.request.contextPath}/wct/eqm/checkplan/addTrouble.do",{source_id:id_,source:source_,areaV:areaV,code:name},function(data){
 	 	 	 		});
 	 				$("#area").val("");
 	 	 			codetest=[];
 	 				if(type_==2){
 	 	 				window.location.href="${pageContext.request.contextPath}/wct/eqm/fixrec/sysStaffPage.do";
 	 	 			}else if(type_==1){
 	 	 				$.post("${pageContext.request.contextPath}/wct/eqm/checkplan/addEqmSpotchRecord.do",{ch_status:0,id:id_});
 	 	 				window.location.href="${pageContext.request.contextPath}/wct/eqm/eqp_spotch_list.jsp";
 	 	 			}
 	 	 			
 	 			}
 	 		})
 		}else{
 			jAlert("请选择要添加的数据！","提示");
 		}
 	}
 	function show(){
 		$("#bjType").val(null);
		$("#remarkName").val(null);
		$("#remark").val(null);
 		$("#hid_repair_div").css("display","block");
 		showEqp();
 	}
 	
 	function queryTroubleInfo(){
 		var troubleName=$("#troubleName").val();
 		//var troubleCode=$("#troubleCode").val();
 		$.post("${pageContext.request.contextPath}/pms/trouble/queryTroubleInfo.do",{troubleName:troubleName});
 	}
 	
 	 $(function(){
 		var url="${pageContext.request.contextPath}/wct/eqm/eqp_lb_jsp.jsp?planId="+sbPid+"&&role="+role+"";
 		$("#zlid").attr("href",url);
 	}) 
 	
 	var fourcode;
 	var fourid;
 	var pcode;
 	//当添加新的故障时，查询到此故障下有多少条原因，然后code+1，生成新的故障代码
 	function addNewCode(parentcode,code,id){
 		fourid=id;
 		fourcode=code;
 		pcode=parentcode;
 	}
 	
 	//添加新故障信息
 	function addNewTrouble(){
 		var des = $("#areaNew").val();
 		if(des!=null&&des!=""){
 			if(fourid!=null&&fourid!=""){
 				des=$.trim(des);
 	 	 		$.post("${pageContext.request.contextPath}/pms/trouble/addNewTrouble.do",{parent_id:fourid,description:des},function(data){
 	 	 			$("#areaNew").val("");
 	 	 			var five=data[0];
 	 	 			tid[l]=data[1];
 	 	 			if(data!=null&&data!=""){
 	 	 				var newcode=pcode+"-"+fourcode+"-"+five;
 	 	 	 	 		save(newcode,des);	
 	 	 			}
 	 	 			l++;
 	 	 		},"Json");
 			}else{
 				jAlert("请选择具体故障进行添加！","提示");
 			}
 		}else{
 			jAlert("请填写数据后再进行添加！","提示");
 		}
 	}
 	
 	//重置按钮
 	function refresh(){
 		var trouId=tid.join(',')
 		$("#areaNew").val("");
 		$("#area").val("");
 		codetest=[];
 		nametest=[];
 		name="";
 		$.post("${pageContext.request.contextPath}/pms/trouble/deleteNewTrouble.do",{id:trouId});
 	}
 	
 	
 	//备品备件添加记录后查询
 	var spare_name=new Array();
 	var spare_code=new Array();
 	var Num=new Array();
 	function showAddFixResult(tf,flag){
 		//$("#showAddFixResult").html(null);
 		
 		if(tf!=0&&flag==0){//手动添加
 			trouble_name=trouble_name.substring(1);
 			description=description.substring(1);
 			useNum=useNum.substring(1);
 			spare_name=trouble_name.split(",");
			spare_code=description.split(",");
			Num=useNum.split(",");
			for(var co=0;co<tf;co++){
				html1+="<tr><td width=10%>"+spare_name[co]+"</td><td width=10%>"+spare_code[co]+"</td><td width=10%>"+Num[co]+"</td></tr>"
			}
 		}else if(flag==1&&tf==0){//备品备件表中选取
 			/* console.info(value);
 			console.info(checkValue);
 			console.info(spareNmae);
 			console.info(sparetype); */
 			for(var cc=0;cc<checkValue.length;cc++){
 				if(checkValue[cc]!="0"){
 					spare_name[cc]=spareNmae[cc];
 					spare_code[cc]=sparetype[cc];
 					Num[cc]=checkValue[cc];
 				}
 			}
 			for(var co=0;co<Num.length;co++){
 				if(Num[co]!=undefined){
 					html1+="<tr><td width=10%>"+spare_name[co]+"</td><td width=10%>"+spare_code[co]+"</td><td width=10%>"+Num[co]+"</td></tr>"
 				}
			}
 		}else if(flag==1&&tf!=0){
 			var spare_name2=new Array();
 		 	var spare_code2=new Array();
 		 	var Num2=new Array();
 		 	for(var cc=0;cc<checkValue.length;cc++){
 				if(checkValue[cc]!=0){
 					spare_name2[cc]=spareNmae[cc];
 					spare_code2[cc]=sparetype[cc];
 					Num2[cc]=checkValue[cc];
 				}
 			}
 		 	trouble_name=trouble_name.substring(1);
 			description=description.substring(1);
 			useNum=useNum.substring(1);
 			spare_name=trouble_name.split(",");
			spare_code=description.split(",");
			Num=useNum.split(",");
			for(var co=0;co<tf;co++){
				html2+="<tr><td width=10%>"+spare_name[co]+"</td><td width=10%>"+spare_code[co]+"</td><td width=10%>"+Num[co]+"</td></tr>"
			}
			
			for(var coo=0;coo<Num2.length;coo++){
 				if(Num2[coo]!=undefined){
 					html1+="<tr><td width=10%>"+spare_name2[coo]+"</td><td width=10%>"+spare_code2[coo]+"</td><td width=10%>"+Num2[coo]+"</td></tr>"
 				}
			}
 		}
		html="<table>"
			+"<tr><td width=10%>名称</td><td width=10%>型号</td><td width=10%>更换数量</td></tr>"
			+" "+html1+" "+html2+" "
			+"</table>";
		$("#showAddFixResult").append(html);
		trouble_name="";
		description="";
		useNum="";
		spare_name=new Array();
	 	spare_code=new Array();
	 	Num=new Array();
 	}
</script>
</head>
<body >
<div id="hisBadQty-title"></div>
<c:if test="${param.type==1}">
		<jsp:include page="eqp_lb_changeEqpUnit.jsp"></jsp:include>
</c:if>
<c:if test="${param.type==5}">
		<jsp:include page="eqp_jx_changeEqpUnit.jsp"></jsp:include>
</c:if>
<c:if test="${param.type==3}">
		<jsp:include page="eqp_lb_repair.jsp"></jsp:include>
</c:if>
<c:if test="${param.type==2}">
		<jsp:include page="eqp_lb_changeEqpUnit.jsp"></jsp:include>
</c:if>
<!-- <div id="hisBadQty-seach-box" >
	<form id="search_form"  style="margin-top: 5px;">
		<table width="100%" cellspacing="0" cellpadding="0">
			<tr>	
			<th style="width:76px;text-align:right;">故障名称</th>
			<td style="width:140px;">
				<input type="text" id="troubleName" name="troubleName" placeholder="支持名称模糊查询" style="width:110px;height:20px;"/>
			</td>
			<th style="width:76px;text-align:right;">故障编号</th>
			<td style="width:140px;">
				<input type="text" id="troubleCode" name="troubleCode" placeholder="输入完整的设备编号" style="width:110px;height:20px;"/>
			</td>
			<td style="width:76px;text-align:center;"><input type="button" onclick="queryTroubleInfo()" id="hisBadQty-search" value="查询" style="height:28px;width:50px;" class="btn btn-default"/></td>
			<td  style="width:86px;text-align:center;"><input type="button" id="hisBadQty-reset" value="重置" style="height:28px;width:50px;" class="btn btn-default"/></td>
			</tr>
		</table>
	</form>
</div> -->
<div class="cv_fcv node" id="all" style="margin-left:5%; margin-top:2%; width:45%; float:left; height:450px; overflow:auto;"> </div>
<div style="margin-left:20px; margin-top:2%; width:40%; float:left; " >
	<textarea id="area" readonly="true" rows="7" cols="50" style="background-color: #F4F4F4;" >
	</textarea>
</div>
<div align="center">
	<textarea id="areaNew"  rows="3" cols="45" style="background-color: #F4F4F4; margin-top:2%;"></textarea>	
	<input type="button"  value="&nbsp;添加&nbsp;" style="background-color: #8F8F8F; height:30px; margin-top:5%;" class="btn btn-default" onclick="addNewTrouble()"/>
</div>
<div style="margin-left:40%; margin-top:3%;" align="center">
	<!-- 1-点检   2-维修呼叫   3-轮保   4-备品备件  5-检修  -->
	<c:if test="${param.type==1}">
		<input type="button" onclick="add()" value="&nbsp;确认&nbsp;" style="background-color: #8F8F8F; width:50px;" class="btn btn-default"/>&nbsp;&nbsp;&nbsp;&nbsp;
		<a href="${pageContext.request.contextPath}/wct/eqm/eqp_spotch_list.jsp" ><input type="button" value="&nbsp;返回&nbsp;" style="background-color: #8F8F8F; width:50px;" class="btn btn-default"/></a>&nbsp;&nbsp;&nbsp;&nbsp;
		<input type="button" onclick="refresh()" value="&nbsp;重置&nbsp;" style="background-color: #8F8F8F; width:50px;" class="btn btn-default"/>
	</c:if>
	<c:if test="${param.type==2}">
		<input type="button" onclick="add()" value="&nbsp;确认&nbsp;" style="background-color: #8F8F8F; width:50px;" class="btn btn-default"/>&nbsp;&nbsp;&nbsp;&nbsp;
		<a href="${pageContext.request.contextPath}/wct/eqm/fixrec/sysStaffPage.do" ><input type="button"  value="&nbsp;返回&nbsp;" style="background-color: #8F8F8F; width:50px;" class="btn btn-default"/></a>&nbsp;&nbsp;&nbsp;&nbsp;
		<input type="button" onclick="refresh()" value="&nbsp;重置&nbsp;" style="background-color: #8F8F8F; width:50px;" class="btn btn-default"/>
	</c:if>
	<c:if test="${param.type==3}">
		<a id="zlid" onclick="add()"><input type="button"  value="&nbsp;确认&nbsp;" style="background-color: #8F8F8F;" class="btn btn-default"/></a>
	</c:if>
	<%-- <c:if test="${param.type==4}">
		<a href="${pageContext.request.contextPath}/wct/eqm/eqp_spotch_list.jsp" onclick="add()">确定并返回</a>
	</c:if> --%>
	<c:if test="${param.type==5}">
		<a href="${pageContext.request.contextPath}/wct/eqm/eqpOverhaul.jsp" onclick="add()"><input type="button"  value="&nbsp;确认&nbsp;" style="background-color: #8F8F8F;" class="btn btn-default"/></a>
	</c:if>
	&nbsp;&nbsp;&nbsp;&nbsp;<a href="javascript:void(0);" onclick="show()"><input type="button"  value="备品备件更换" style="background-color: #8F8F8F;" class="btn btn-default"/></a>
</div>
<div id="showAddFixResult" align="center" style="margin-top:30px; height:200px; overflow: auto;">
</div>
</body>
</html>
