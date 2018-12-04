
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
<link href="../res/lecheng/css/admin.css" rel="stylesheet" type="text/css" />
<link href="../res/common/css/theme.css" rel="stylesheet" type="text/css" />
<link href="../res/common/css/jquery.validate.css" rel="stylesheet"
	type="text/css" />
<link href="../res/common/css/jquery.treeview.css" rel="stylesheet"
	type="text/css" />
<link href="../res/common/css/jquery.ui.css" rel="stylesheet"
	type="text/css" />
<script type="text/javascript"  language="javascript" src="js/jquery-1.11.0.min.js"></script>
<script type="text/javascript" src="res/fckeditor/fckeditor.js"></script>
<script src="../res/common/js/jquery.js" type="text/javascript"></script>
<script src="../res/common/js/jquery.ext.js" type="text/javascript"></script>
<script src="../res/common/js/jquery.form.js" type="text/javascript"></script>
<script src="../res/common/js/lecheng.js" type="text/javascript"></script>
<script src="../res/lecheng/js/admin.js" type="text/javascript"></script>
<link rel="stylesheet" href="../res/css/style.css" />
<!--  引入标签库 -->
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>

<title>User-list</title>
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
			location.href="deletes.do?ids="+objs;
	}else{
		alert("请至少选中一条进行批量删除");
	}
}

</script>
</head>
<body>
	<div class="box-positon">
		<div class="rpos">当前位置: 用户管理 - 列表</div>
		<form class="ropt">
			<input class="add" type="button" value="添加"
				onclick="javascript:window.location.href='toadd.do'" />
		</form>
		<div class="clear"></div>
	</div>

		
	<form action="list.do" method="post" style="padding-top:5px;">	
		登录名: <input type="text" name="username" value="${QUERY.username} "/>

	<select name="isenabled">
	<option value="0"  selected="selected">请选择</option>
		<option value="1">有效</option>
		<option value="-1">无效</option>
	 <c:if test="${QUERY.isenabled==1}">
	<option value="0" >请选择</option>
		<option value="1"  selected="selected">有效</option>
		<option value="-1">无效</option>
		</c:if>
			<c:if test="${QUERY.isenabled==-1}">
	<option value="0" >请选择</option>
		<option value="1" >有效</option>
		<option value="-1"  selected="selected">无效</option>
		</c:if>
	</select>
	<input type="submit" class="query" value="查询"/>
</form>
<form action="deletes.do" method="post">
			<table cellspacing="1" cellpadding="0" width="100%" border="0"
				class="pn-ltable">
				<thead class="pn-lthead">
					<tr>
						<th width="20"><input type="checkbox" onchange="selectAll()" id="ids"/></th>
						<th>用户编号</th>
						<th>用户名</th>
						<th>真实姓名</th>
						<th>性别</th>
						<th>出生日期</th>					
						<th>邮箱</th>
						<th>部门名称</th>
						<th>是否可用</th>
						<th>头像</th>
						<th width="12%">操作选项</th>
					</tr>
				</thead>
				<tbody class="pn-ltbody">
					<c:forEach items="${LIST }" var="user">
						<tr bgcolor="#ffffff" onmouseover="this.bgColor='#eeeeee'"
							onmouseout="this.bgColor='#ffffff'">
							<td><input type="checkbox" name="ids" value="${user.id }"/></td>
							<td align="center">${user.id }</td>
							<td align="center">${user.username }</td>
							<td align="center">${user.realname }</td>
							<td align="center">${user.sex }</td>
							<td align="center">${user.birthdayTxt }</td>						
							<td align="center">${user.email }</td>
							<td align="center">${user.dept.name }</td>
							<td align="center">${user.isenabledTxt }</td>
							<td align="center"><img src="../upload/${user.pic}"  width="50px" height="50px" /></td>
							<td align="center"><a href="get.do?id=${user.id }" class="pn-opt">修改</a>
								| <a
								href="delete.do?id=${user.id }"
								onclick="if(!confirm('您确定删除吗？')) {return false;}" class="pn-opt">删除</a>
							</td>
						</tr>
					</c:forEach>

				</tbody>
			</table>
			</form>
			<div style="margin-top:15px;"><input class="del-button" type="button" value="删除" onclick="allDelete();"/></div>
</div>
			<div class="page pb15" style="float: right">
				<span class="r inb_a page_b"> <font size=2>
				<a href="list.do?page=1">首页</a></font>
	
			<a href="list.do?page=${ (PAGE-1)<=0?1:(PAGE-1) }&username=${QUERY.username}&isenabled=${QUERY.isenabled}">上一页</a>

			<a href="list.do?page=${PAGE+1>PAGECOUNT?PAGECOUNT:PAGE+1 }&username=${QUERY.username}&isenabled=${QUERY.isenabled}">下一页</a>
				 	 <font size=2>
			<a href="list.do?page=${PAGECOUNT }&username=${QUERY.username}&isenabled=${QUERY.isenabled}">最后页</a> 
</font>
			[当前页${PAGE }/共${PAGECOUNT }页]

				</span>
	
		</form>
	</div>
</body>
</html>