<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<link href="../res/lecheng/css/admin.css" rel="stylesheet" type="text/css" />
<link href="../res/common/css/theme.css" rel="stylesheet" type="text/css" />
<link href="../res/common/css/jquery.validate.css" rel="stylesheet"
	type="text/css" />
<link href="../res/common/css/jquery.treeview.css" rel="stylesheet"
	type="text/css" />
<link href="../res/common/css/jquery.ui.css" rel="stylesheet"
	type="text/css" />

<script type="text/javascript"  language="javascript" src="../js/jquery-1.11.0.min.js"></script>
<script type="text/javascript"  language="javascript" src="../js/DatePicker/WdatePicker.js"></script>
<script src="../res/common/js/jquery.js" type="text/javascript"></script>
<script src="../res/common/js/jquery.ext.js" type="text/javascript"></script>
<script src="../res/common/js/jquery.form.js" type="text/javascript"></script>
<script src="../res/common/js/lecheng.js" type="text/javascript"></script>
<script src="../res/lecheng/js/admin.js" type="text/javascript"></script>

<link rel="stylesheet" href="../res/css/style.css" />

<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
<title>Advert_Add</title>
<script type="text/javascript">
//广告内容
CHKCONTENT="^.{5,}$";
//广告标题
CHKTITLE="^.{1,}$";
//公告人
var CHKCMAN="^[\u4e00-\u9fa5]{2,}$";
/*//公告日期
var CHKDATE= "^([0-9]{4})-(0?[1-9]|1[0-2])-(0?[1-9]|[1-2][0-9]|3[0-1])$";
//验证公告日期
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
			spanEle.innerHTML="您输入的日期格式有误，请查证后重新输入";
			spanEle.style.color="red";
			//清空文本框
			 crtimeEle.value="";
			//重新聚焦
			crtimeEle.focus();
			return false;
		}
}*/
//验证公告人姓名
function chkcman(){
	var cmanEle=document.getElementById("cman");
	var cman=cmanEle.value;
		//定义匹配公告人的正则表达式
		var reg=new RegExp(CHKCMAN);
		//获取姓名是否输入成功的元素对象
		var spanEle=document.getElementById("resultcman");
		if(reg.test(cman)){
			spanEle.innerHTML="✔";
			spanEle.style.color="green";
			return true;
		}else{
			spanEle.innerHTML="您输入的姓名有误，请查证后重新输入";
			spanEle.style.color="red";
			//清空文本框
			cmanEle.value="";
			//重新聚焦
			 cmanEle.focus();
			return false;
		}

}
//验证标题
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
//标题唯一
/*function chkadtitle(title){
	var flag=false;
	$.ajax({
		//请求路径
		url:'chkadvert.do',
		//请求方式
		type:'post',
		//请求参数
		data:'title='+title,
		//是否异步
		async:false,
		//预期服务器返回的数据类型
		dataType:'text',
		//响应成功调用回调函数
		success:function(flag){
			if(flag=='true'){//没有重复
				$("#resulttitle").html("✔");
				$("#resulttitle").css("color","green");
				flag=true;
			}else{
				$("#resulttitle").html("此用户名已存在");
				$("#resulttitle").css("color","red");
				flag=false;
			}
		},
		error:function(){
			alert('请求数据失败。。。');
		}
	});
	return flag;
}*/
//验证文章内容
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
	return chkcman()&&chktitle()&&chkcontent();
}
</script>
<style type="">
.h2_ch a:hover, .h2_ch a.here {
    color: #FFF;
    font-weight: bold;
    background-position: 0px -32px;
}
.h2_ch a {
    float: left;
    height: 32px;
    margin-right: -1px;
    padding: 0px 16px;
    line-height: 32px;
    font-size: 14px;
    font-weight: normal;
    border: 1px solid #C5C5C5;
    background: url('../res/lecheng/img/admin/bg_ch.gif') repeat-x scroll 0% 0% transparent;
}
a {
    color: #06C;
    text-decoration: none;
}
</style>

</head>
<body>

<div class="box-positon">
	<div class="rpos">当前位置: 广告管理 - 添加</div>
	<form class="ropt">
		<input type="submit" onclick="this.form.action='../advertlist.do';" value="返回列表" class="return-button"/>
	</form>
	<div class="clear"></div>
</div>

<div class="body-box" style="float:right">
	<form id="jvForm" action="../advertadd.do" method="post" onsubmit="return chkAll()">
		<table cellspacing="1" cellpadding="2" width="100%" border="0" class="pn-ftable">
			<tbody id="tab_1">
			<tr>
						<td width="20%" class="pn-flabel pn-flabel-h"><span
							class="pn-frequired"> </span> <span class="pn-frequired">${msg}
							</span></td>
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
						公告时间:</td><td width="80%" class="pn-fcontent">
						<input type="text"  name="crtime" id="crtime" onblur="chkcrtime()" maxlength="80"   class="Wdate" onclick="WdatePicker()"/>
					<span id="resultcrtime"></span>
					</td>
				</tr>
				<tr>
					<td width="20%" class="pn-flabel pn-flabel-h">
						<span class="pn-frequired">*</span>
						公告人:</td><td width="80%" class="pn-fcontent">
						<input type="text" class="required" name="cman" id="cman" onblur="chkcman()" maxlength="100" size="20"/>
					<span id="resultcman"></span>
					</td>
				</tr>
				
			
			
			</tbody>
			
			<tbody>
				<tr>
					<td class="pn-fbutton" colspan="2">
						<input type="submit"  class="submit" value="提交"/> &nbsp; <input type="reset" class="reset" value="重置"/>
					</td>
				</tr>
			</tbody>
		</table>
	</form>
</div>
</body>
</html>
