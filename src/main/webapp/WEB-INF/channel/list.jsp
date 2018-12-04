
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
<link href="res/lecheng/css/admin.css" rel="stylesheet" type="text/css"/>
<link href="res/common/css/theme.css" rel="stylesheet" type="text/css"/>
<link href="res/common/css/jquery.validate.css" rel="stylesheet" type="text/css"/>
<link href="res/common/css/jquery.treeview.css" rel="stylesheet" type="text/css"/>
<link href="res/common/css/jquery.ui.css" rel="stylesheet" type="text/css"/>
<script type="text/javascript"  language="javascript" src="js/jquery-1.11.0.min.js"></script>
<script type="text/javascript" src="../res/fckeditor/fckeditor.js"></script>
<script src="../res/common/js/jquery.js" type="text/javascript"></script>
<script src="../res/common/js/jquery.ext.js" type="text/javascript"></script>
<script src="../res/common/js/jquery.form.js" type="text/javascript"></script>
<script src="../res/common/js/lecheng.js" type="text/javascript"></script>
<script src="../res/lecheng/js/admin.js" type="text/javascript"></script>

<link rel="stylesheet" href="../res/css/style.css" />
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>

<title>Channel_list</title>
<script type="text/javascript" >
function selectAll(){
    var isCheck=$("#ids").is(':checked');  //获得全选复选框是否选中
    $("input[type='checkbox']").each(function() {  
        this.checked = isCheck;       //循环赋值给每个复选框是否选中
    });
}
//批量删除
function allDelete(){
	var f=false;
	//得到要删除的主键id
	//用于存要删除的选中的id值
	var objs=[];
	//得到一组checkbox  相当于数组
	var ck=document.getElementsByName("ids");
	//循环这一组checkbox让每一个checkbox选中
	for(var i=0;i<ck.length;i++){
		//代表选中
		if(ck[i].checked==true){
			objs.push(ck[i].value);
			f=true;
		}
	}
	//跳到删除的servlet里去
	if(f==true){
		if(confirm("您确认要删除吗？"))
			location.href="channeldelete.do?ids="+objs;
	}else{
		alert("请至少选中一条进行批量删除");
	}
}

</script>
</head>
<body>
<div class="box-positon">
	<div class="rpos">当前位置: 栏目管理 - 列表</div>
	<form class="ropt">
		<input class="add" type="button" value="添加" onclick="javascript:window.location.href='channelpid.do'"/>
	</form>
	<div class="clear"></div>
</div>
<div class="body-box">

<form method="post" id="tableForm">

<table cellspacing="1" cellpadding="0" width="100%" border="0" class="pn-ltable">
	<thead class="pn-lthead">
		<tr>
			<th width="20"><input type="checkbox" onchange="selectAll()" id="ids"/></th>
			<th>栏目编号</th>
			<th>栏目名</th>
			<th>上级栏目</th>
			<th >级别</th>
			<th >是否叶子</th>
			<th >顺序</th>
			<th width="12%">操作选项</th>
		</tr>
	</thead>
	<tbody class="pn-ltbody">
		
			<c:forEach items="${channels }" var="channel">
						<tr bgcolor="#ffffff" onmouseover="this.bgColor='#eeeeee'"
							onmouseout="this.bgColor='#ffffff'">
							
							<td><input type="checkbox" name="ids" value="${channel.id}"/></td>
							<td align="center">${channel.id }</td>
							<td align="center">${channel.cname }</td>
							<td align="center">${channel.name }</td>
							<td align="center">${channel.lev }</td>
							<td align="center">${channel.isleafTxt }</td>						
							<td align="center">${channel.sort }</td>
							<td align="center"><a href="channelget.do?id=${channel.id }" class="pn-opt">修改</a>
								| <a
								href="channeldelete.do?id=${channel.id }"
								onclick="if(!confirm('您确定删除吗？')) {return false;}" class="pn-opt">删除</a>
							</td>
						</tr>
					</c:forEach>
	</tbody>
</table>
<div style="margin-top:15px;"><input class="del-button" type="button" value="删除" onclick="allDelete();"/></div>
</div>
<div class="page pb15" style="float: right">
				<span class="r inb_a page_b"> <font size=2><a href="channellist.do?currentPage=1 ">首页</a></font>
				
				<c:if test="${requestScope.currentPage-1>0 }">
			<a href="channellist.do?currentPage=${requestScope.currentPage-1 }">上一页</a>
		</c:if>
		<c:if test="${requestScope.currentPage+1<=requestScope.pageCount }">
			<a href="channellist.do?currentPage=${requestScope.currentPage+1 }">下一页</a>
		</c:if>
				 	 <font size=2>
			<a href="channellist.do?currentPage=${requestScope.pageCount }">最后页</a> 
</font>
			[当前页${requestScope.currentPage }/共${requestScope.pageCount }页]

	</span>
</div>

</form>
</div>
</body>
</html>