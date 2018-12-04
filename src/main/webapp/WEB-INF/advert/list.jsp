
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
<link href="res/lecheng/css/admin.css" rel="stylesheet" type="text/css" />
<link href="res/common/css/theme.css" rel="stylesheet" type="text/css" />
<link href="res/common/css/jquery.validate.css" rel="stylesheet"
	type="text/css" />
<link href="res/common/css/jquery.treeview.css" rel="stylesheet"
	type="text/css" />
<link href="res/common/css/jquery.ui.css" rel="stylesheet"
	type="text/css" />
<script type="text/javascript"  language="javascript" src="js/jquery-1.11.0.min.js"></script>
<script type="text/javascript" src="../res/fckeditor/fckeditor.js"></script>
<script src="../res/common/js/jquery.js" type="text/javascript"></script>
<script src="../res/common/js/jquery.ext.js" type="text/javascript"></script>
<script src="../res/common/js/jquery.form.js" type="text/javascript"></script>
<script src="../res/common/js/lecheng.js" type="text/javascript"></script>
<script src="../res/lecheng/js/admin.js" type="text/javascript"></script>
<link rel="stylesheet" href="../res/css/style.css" />
<!--  引入标签库 -->
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>



<title>Advert-list</title>
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
	<div class="rpos">当前位置: 广告管理 - 列表</div>
	<form class="ropt">
		<input class="add" type="button" value="添加" onclick="javascript:window.location.href='advert/add.jsp'"/>
	</form>
	<div class="clear"></div>
</div>
<div class="body-box">
<input type="hidden" name="pageNo" value=""/>
<form method="post" id="tableForm">
<input type="hidden" value="" name="pageNo"/>
<input type="hidden" value="" name="queryName"/>
<table cellspacing="1" cellpadding="0" border="0" width="100%" class="pn-ltable">
	<thead class="pn-lthead">
		<tr>
			<th width="20"><input type="checkbox" onchange="selectAll()" id="all"/></th>
						<th>广告编号</th>
						<th>标题</th>
						<th>内容</th>
						<th>公告时间</th>
						<th>公告人</th>
						<th>操作选项</th>
		</tr>
	</thead>
	<tbody class="pn-ltbody">
		<c:forEach items="${adverts }" var="advert">
			<tr bgcolor="#ffffff" onmouseover="this.bgColor='#eeeeee'" onmouseout="this.bgColor='#ffffff'">
			<td><input type="checkbox" name="ids" value="73"/></td>
			<td align="center">${advert.id }</td>
							<td align="center">${advert.title }</td>
							<td align="center">${advert.content }</td>
							<td align="center">${advert.crtime }</td>
							<td align="center">${advert.cman }</td>	
			<td align="center">
			<a href="advertget.do?id=${advert.id }" class="pn-opt">修改</a>
								| <a
								href="advertdelete.do?id=${advert.id }"
								onclick="if(!confirm('您确定删除吗？')) {return false;}" class="pn-opt">删除</a>
			</td>
		</tr>
		</c:forEach>
	</tbody>
</table>
<div class="page pb15" style="float: right">
				<span class="r inb_a page_b"> <font size=2><a href="advertlist.do?currentPage=1 ">首页</a></font>
				
				<c:if test="${requestScope.currentPage-1>0 }">
			<a href="advertlist.do?currentPage=${requestScope.currentPage-1 }">上一页</a>
		</c:if>
		<c:if test="${requestScope.currentPage+1<=requestScope.pageCount }">
			<a href="advertlist.do?currentPage=${requestScope.currentPage+1 }">下一页</a>
		</c:if>
				 	 <font size=2>
			<a href="advertlist.do?currentPage=${requestScope.pageCount }">最后页</a> 
</font>
			[当前页${requestScope.currentPage }/共${requestScope.pageCount }页]

				</span></div>
</form>
</div>
</body>
</html>