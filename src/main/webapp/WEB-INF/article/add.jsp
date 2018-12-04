<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<link href="../res/lecheng/css/admin.css" rel="stylesheet" type="text/css"/>
<link href="../res/common/css/theme.css" rel="stylesheet" type="text/css"/>
<link href="../res/common/css/jquery.validate.css" rel="stylesheet" type="text/css"/>
<link href="../res/common/css/jquery.treeview.css" rel="stylesheet" type="text/css"/>
<link href="../res/common/css/jquery.ui.css" rel="stylesheet" type="text/css"/>

<!-- <script src="/thirdparty/ckeditor/ckeditor.js" type="text/javascript"></script> -->
<!-- <script src="/thirdparty/My97DatePicker/WdatePicker.js" type="text/javascript"></script> -->
<script type="text/javascript" src="../res/fckeditor/fckeditor.js"></script>
<script src="../res/common/js/jquery.js" type="text/javascript"></script>
<script src="../res/common/js/jquery.ext.js" type="text/javascript"></script>
<script src="../res/common/js/jquery.form.js" type="text/javascript"></script>
<script src="../res/common/js/lecheng.js" type="text/javascript"></script>
<script src="../res/lecheng/js/admin.js" type="text/javascript"></script>
<!-- 引入jQuery -->
<script type="text/javascript" language="javascript" src="../js/jquery-1.11.0.min.js"></script>
<!-- 引入日期控件 -->
<script type="text/javascript" language="javascript" src="../js/DatePicker/WdatePicker.js"></script>
<link rel="stylesheet" href="../res/css/style.css" />
<title>Article-add</title>
<!-- 添加表单验证 -->
<script type="text/javascript">
//文章标题
CHKTITLE="^.{1,}$";
//验证文章内容
CHKCONTENT="^.{5,}$";
/*//文章的创建日期
var CHKCRTIME= "^([0-9]{4})-(0?[1-9]|1[0-2])-(0?[1-9]|[1-2][0-9]|3[0-1])$";
//验证创建日期
function chkcrtime(){
	var  crtimeEle=document.getElementById("crtime");
	var crtime=crtimeEle.value;
		//定义匹配创建日期的正则表达式
		var reg=new RegExp(CHKDATE);
		//获取创建是否输入成功的元素对象
		var spanEle=document.getElementById("resultcrtime");
		if(reg.test(crtime)){
			spanEle.innerHTML="✔";
			spanEle.style.color="green";
			return true;
		}else{
			spanEle.innerHTML="您输入的出生日期格式有误，请查证后重新输入";
			spanEle.style.color="red";
			//清空文本框
			 crtimeEle.value="";
			//重新聚焦
			crtimeEle.focus();
			return false;
		}
}
//验证文章名
function chktitle(){
	var  titleEle=document.getElementById("title");
	var title=titleEle.value;
		//定义匹配文章内容的正则表达式
		var reg=new RegExp(CHKTITLE);
		//获取文章是否输入成功的元素对象
		var spanEle=document.getElementById("resulttitle");
		if(reg.test(title)){
			spanEle.innerHTML="✔";
			spanEle.style.color="green";
			return true;
		}else{
			spanEle.innerHTML="标题不能为空";
			spanEle.style.color="red";
			//清空文本框
			 titleEle.value="";
			//重新聚焦
			titleEle.focus();
			return false;
		}
}

function chkcontent(){
	var  contentEle=document.getElementById("content");
	var content=contentEle.value;
		//定义匹配文章内容的正则表达式
		var reg=new RegExp(CHKCONTENT);
		//获取文章是否输入成功的元素对象
		var spanEle=document.getElementById("resultcontent");
		if(reg.test(content)){
			spanEle.innerHTML="✔";
			spanEle.style.color="green";
			return true;
		}else{
			spanEle.innerHTML="输入文章内容不得少于5位";
			spanEle.style.color="red";
			//清空文本框
			 contentEle.value="";
			//重新聚焦
			contentEle.focus();
			return false;
		}
}

//验证所有
function chkAll(){
	return chktitle()&&chkcontent();
}*/

</script>
</head>
<body>
<div class="box-positon">
	<div class="rpos">当前位置: 文章管理 - 添加</div>
	<form class="ropt">
		<input type="submit" onclick="this.form.action='list.do';" value="返回列表" class="return-button"/>
	</form>
	<div class="clear"></div>
</div>
<div class="body-box" style="float:right">
	<form id="jvForm" action="add.do" method="post"  onsubmit="return chkAll()">
		<table cellspacing="1" cellpadding="2" width="100%" border="0" class="pn-ftable">
			<tbody>
				<tr>
					<td width="20%" class="pn-flabel pn-flabel-h">
						<span class="pn-frequired"></span>
						<span class="pn-frequired">${msg}</span>
					</td>
				</tr>
				<tr>
					<td width="20%" class="pn-flabel pn-flabel-h">
						<span class="pn-frequired">*</span>
						标题:</td><td width="80%" class="pn-fcontent">
						<input type="text" class="required" name="title" id="title" onblur="chktitle()" maxlength="100" size="20"/>
					<span id="resulttitle"></span>
					</td>
				</tr>
				<tr>
					<td width="20%" class="pn-flabel pn-flabel-h">
						<span class="pn-frequired">*</span>
						内容:</td><td width="80%" class="pn-fcontent">
					<textarea name="content" id="content" onblur="chkcontent()" rows="20" cols="40"></textarea>
					<span id="resultcontent"></span>
					</td>
				</tr>
				<tr>
					<td width="20%" class="pn-flabel pn-flabel-h">
						作者:</td><td width="80%" class="pn-fcontent">
						<input type="text" class="required" name="author" id="author" maxlength="100" size="20"/>
				
					</td>
				</tr>
					<tr>
					<td width="20%" class="pn-flabel pn-flabel-h">
						创建日期:</td><td width="80%" class="pn-fcontent">
						<input type="text"  name="crtime" id="crtime" onblur="chkcrtime()" maxlength="80"   class="Wdate" onclick="WdatePicker()"/>
					<span id="resultcrtime"></span>
					</td>
				</tr>
				<tr>
						<td width="20%" class="pn-flabel pn-flabel-h">所属栏目:</td>
						<td width="80%" class="pn-fcontent"><select name="channel">
								<c:forEach items="${channelss }" var="channel">
									<option value="${channel.id }" name="id">${channel.cname }</option>
								</c:forEach>
						</select></td>
					</tr>
						<tr>
					<td width="20%" class="pn-flabel pn-flabel-h">
						是否推荐:</td><td width="80%" class="pn-fcontent">
						
						<input type="radio" name="isremod" value="1" checked="checked"/>是
						<input type="radio" name="isremod" value="2"/>不是
					</td>
				</tr>
					<tr>
					<td width="20%" class="pn-flabel pn-flabel-h">
						是否热点:</td><td width="80%" class="pn-fcontent">
						
						<input type="radio" name="ishot" value="1" checked="checked"/>是
						<input type="radio" name="ishot" value="2"/>不是
					</td>
				</tr>
			</tbody>
			<tbody>
				<tr>
					<td class="pn-fbutton" colspan="2">
						<input type="submit" class="submit" value="提交"/> &nbsp; <input type="reset" class="reset" value="重置"/>
					</td>
				</tr>
			</tbody>
		</table>
	</form>
</div>
</body>
</html>