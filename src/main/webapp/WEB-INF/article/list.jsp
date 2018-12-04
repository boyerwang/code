
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
<link href="../res/lecheng/css/admin.css" rel="stylesheet" type="text/css"/>
<link href="../res/common/css/theme.css" rel="stylesheet" type="text/css"/>
<link href="../res/common/css/jquery.validate.css" rel="stylesheet" type="text/css"/>
<link href="../res/common/css/jquery.treeview.css" rel="stylesheet" type="text/css"/>
<link href="../res/common/css/jquery.ui.css" rel="stylesheet" type="text/css"/>
<script type="text/javascript"  language="javascript" src="../js/jquery-1.11.0.min.js"></script>
<script type="text/javascript" src="../res/fckeditor/fckeditor.js"></script>
<script src="../res/common/js/jquery.js" type="text/javascript"></script>
<script src="../res/common/js/jquery.ext.js" type="text/javascript"></script>
<script src="../res/common/js/jquery.form.js" type="text/javascript"></script>
<script src="../res/common/js/lecheng.js" type="text/javascript"></script>
<script src="../res/lecheng/js/admin.js" type="text/javascript"></script>

<link rel="stylesheet" href="../res/css/style.css" />
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>

<title>Article_list</title>
<script type="text/javascript" >
function selectAll(){
    var isCheck=$("#all").is(':checked');  //获得全选复选框是否选中
    $("input[type='checkbox']").each(function() {  
        this.checked = isCheck;       //循环赋值给每个复选框是否选中
    });
}

</script>
</head>
<body>
<div class="box-positon">
	<div class="rpos">当前位置: 文章管理 - 列表</div>
	<form class="ropt">
		<input class="add" type="button" value="添加" onclick="javascript:window.location.href='tochannel.do'"/>
	</form>
	<div class="clear"></div>
</div>


<form action="list.do" method="post" id="tableForm">

<table cellspacing="1" cellpadding="0" width="100%" border="0" class="pn-ltable">
	<thead class="pn-lthead">
		<tr>
			<th width="20"><input type="checkbox" onchange="selectAll()" id="all"/></th>
			<th>文章ID</th>
			<th>标题</th>
			<th width="12%" height="1%">内容</th>
			<th>作者</th>
			<th>创建日期</th>
			<th>所属栏目</th>
			<th>是否推荐</th>
			<th>是否热点</th>
			<th width="12%">操作选项</th>
		</tr>
	</thead>
	<tbody class="pn-ltbody">
		<c:forEach items="${articles }" var="article">
			<tr bgcolor="#ffffff" onmouseover="this.bgColor='#eeeeee'" onmouseout="this.bgColor='#ffffff'">
		<td><input type="checkbox" name="ids" value="73"/></td>
							<td align="center">${article.id }</td>
							<td align="center">${article.title }</td>
							<td align="center" >${article.content }</td>
							<td align="center" >${article.author }</td>
							<td align="center">${article.crtime }</td>
							<td align="center">${article.cname }</td>
							<td align="center">${article.isremodTxt }</td>
							<td align="center">${article.ishotTxt }</td>
							<td align="center">
					 <a href="articleget.do?id=${article.id }" class="pn-opt">修改</a> | <a href="articledelete.do?id=${article.id }" onclick="if(!confirm('您确定删除吗？')) {return false;}" class="pn-opt">删除</a> 
			</td>
		</tr>
		</c:forEach>
		
			
		
	</tbody>
</table>
<div class="page pb15" style="float: right">
				<span class="r inb_a page_b"> <font size=2>
				<a href="list.do?page=1">首页</a></font>
	
			<a href="list.do?page=${ (PAGE-1)<=0?1:(PAGE-1) }&title=${QUERY.title}&isremod=${QUERY.isremod}&ishot=${QUERY.ishot}">上一页</a>

			<a href="list.do?page=${PAGE+1>PAGECOUNT?PAGECOUNT:PAGE+1 }&title=${QUERY.title}&isremod=${QUERY.isremod}&ishot=${QUERY.ishot}">下一页</a>
				 	 <font size=2>
			<a href="list.do?page=${PAGECOUNT }&title=${QUERY.title}&isremod=${QUERY.isremod}&ishot=${QUERY.ishot}">最后页</a> 
</font>
			[当前页${PAGE }/共${PAGECOUNT }页]

				</span>
	
	
</div>
	</form>
</body>
</html>