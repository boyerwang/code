
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
	<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link href="../res/lecheng/css/admin.css" rel="stylesheet" type="text/css"/>
<link href="../res/common/css/theme.css" rel="stylesheet" type="text/css"/>
<link href="../res/common/css/jquery.validate.css" rel="stylesheet" type="text/css"/>
<link href="../res/common/css/jquery.treeview.css" rel="stylesheet" type="text/css"/>
<link href="../res/common/css/jquery.ui.css" rel="stylesheet" type="text/css"/>

<!-- 引时间控件 -->
<script type="text/javascript"  language="javascript" src="../js/jquery-1.11.0.min.js"></script>
<script type="text/javascript"  language="javascript" src="../js/DatePicker/WdatePicker.js"></script>
<script type="text/javascript" src="../js/DatePicker/WdatePicker.js"></script>
<script type="text/javascript" src="../res/fckeditor/fckeditor.js"></script>
<script src="../res/common/js/jquery.js" type="text/javascript"></script>
<script src="../res/common/js/jquery.ext.js" type="text/javascript"></script>
<script src="../res/common/js/jquery.form.js" type="text/javascript"></script>
<script src="../res/common/js/lecheng.js" type="text/javascript"></script>
<script src="../res/lecheng/js/admin.js" type="text/javascript"></script>
<link rel="stylesheet" href="../res/css/style.css" />

<title>User_Update</title>
<script type="text/javascript">
/*
//用户名：数字+字母，结束之前不能全都是数字，6-16
var CHKUSERNAME="^(?![0-9]+$)[a-zA-Z0-9]{6,16}$";
//邮箱xxxxxx@xxx.com,可以包含_      企业邮箱qwe@huewei.com.cn
var CHKEMAIL="^[a-zA-Z0-9_]+@[a-z0-9]{2,5}(\\.[a-z]{2,3}){1,2}$";
//出生日期：yyyy-MM-dd月份1-12 日期1-31
var CHKDATE= "^([0-9]{4})-(0?[1-9]|1[0-2])-(0?[1-9]|[1-2][0-9]|3[0-1])$";
//真实姓名
var CHKREALNAME="^[\u4e00-\u9fa5]{2,}$";
//验证用户名
function chkusername(){
//获取用户名
var userEle=document.getElementById("username");
var username=userEle.value;
//定义匹配用户名的正则表达式
var reg=new RegExp(CHKUSERNAME);
//获取用户名是否输入成功的对象
var spanEle=document.getElementById("resultName");
if(reg.test(username)){
	if (chkExistUsername(username)) {
		return true;
	} else {
		return false;
	}
	}else{
	//输入失败
	spanEle.innerHTML="用户名必须包含数字和字母，且不能少于6位";
	spanEle.style.color="red";
	//清空文本框
	userEle.value="";
	//重新聚焦
	userEle.focus();
	return false;
	}	
}
//检查修改用户名是否重复
function chkExistUsername(username){
	var flag=false;
	$.ajax({
		//请求路径
		url:'chkexist.do',
		//请求方式
		type:'post',
		//请求参数
		data:'type=1&username='+username,
		//是否异步
		async:false,
		//预期服务器返回的数据类型
		dataType:'text',
		//响应成功调用回调函数
		success:function(flag){
			if(flag=='true'){//没有重复
				$("#resultName").html("✔");
				$("#resultName").css("color","green");
				flag=true;
			}else{
				$("#resultName").html("此用户名已存在");
				$("#resultName").css("color","red");
				flag=false;
			}
		},
		error:function(){
			alert('请求数据失败。。。');
		}
	});
	return flag;
}
//验证邮箱
function chkemail(){
	var  emailEle=document.getElementById("email");
	var email=emailEle.value;
		//定义匹配用户名的正则表达式
		var reg=new RegExp(CHKEMAIL);
		//获取邮箱是否输入成功的元素对象
		var spanEle=document.getElementById("resultemail");
		if(reg.test(email)){
			if (chkExistEmail(email)) {
				return true;
			} else {
				return false;
			}
		}else{
			spanEle.innerHTML="您输入的邮箱格式有误，请查证后重新输入";
			spanEle.style.color="red";
			//清空文本框
			 emailEle.value="";
			//重新聚焦
			 emailEle.focus();
			return false;
		}
}
//验证邮箱是否重复
function chkExistEmail(email){
	var flag=false;
	$.ajax({
		//请求路径
		url:'chkexist.do',
		//请求方式
		type:'post',
		//请求参数
		data:'type=2&email='+email,
		//是否异步
		async:false,
		//预期服务器返回的数据类型
		dataType:'text',
		//响应成功调用回调函数
		success:function(flag){
			if(flag=='true'){//没有重复
				$("#resultemail").html("✔");
				$("#resultemail").css("color","green");
				flag=true;
			}else{
				$("#resultemail").html("此邮箱已被注册");
				$("#resultemail").css("color","red");
				flag=false;
			}
		},
		error:function(){
			alert('请求数据失败。。。');
		}
	});
	return flag;
}
//验证真实姓名
function chkrealname(){
	var realnameEle=document.getElementById("realname");
	var realname=realnameEle.value;
		//定义匹配用户名的正则表达式
		var reg=new RegExp(CHKREALNAME);
		//获取邮箱是否输入成功的元素对象
		var spanEle=document.getElementById("resultrealname");
		if(reg.test(realname)){
			spanEle.innerHTML="✔";
			spanEle.style.color="green";
			return true;
		}else{
			spanEle.innerHTML="您输入的姓名有误，请查证后重新输入";
			spanEle.style.color="red";
			//清空文本框
			 realnameEle.value="";
			//重新聚焦
			 realnameEle.focus();
			return false;
		}

}
//验证出生日期
function chkbirthday(){
	var  birthdayEle=document.getElementById("birthday");
	var birthday=birthdayEle.value;
		//定义匹配生日的正则表达式
		var reg=new RegExp(CHKDATE);
		//获取生日是否输入成功的元素对象
		var spanEle=document.getElementById("resultbirthday");
		if(reg.test(birthday)){
			spanEle.innerHTML="✔";
			spanEle.style.color="green";
			return true;
		}else{
			spanEle.innerHTML="您输入的出生日期格式有误，请查证后重新输入";
			spanEle.style.color="red";
			//清空文本框
			 birthdayEle.value="";
			//重新聚焦
			 birthdayEle.focus();
			return false;
		}
}
//验证所有
function chkAll(){
	return chkusername()&&chkrealname()&&chkbirthday()&&chkemail();
}
*/
//文档就绪事件
$(function(){
	//下拉框change事件
	$("#dep").change(
		function(){
			
			//清空第二个下拉框
		$("#dep2").empty();
			//ajax异步提交
			$.post("getdep.do",
					//json类型数据 传值
					{pid:this.value
				},
					function(data){
						//成功后执行
					if(data!=null){
						$(data).each(
								function(){
									//添加数据到第二个下拉框
										$("#dep2").append("<option value="+this.id+">"+this.name+"</option>");
								});
					}
					},
					//返回类型
					"json"
					)
					
		});	
});

</script>


<style type="">
.h2_ch a:hover,.h2_ch a.here {
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
	background: url('../res/lecheng/img/admin/bg_ch.gif') repeat-x scroll 0%
		0% transparent;
}

a {
	color: #06C;
	text-decoration: none;
}
</style>

</head>
<body>

	<div class="box-positon">
		<div class="rpos">当前位置: 用户管理 - 修改</div>
		<form class="ropt">
			<input type="submit" onclick="this.form.action='list.do';"
				value="返回列表" class="return-button" />
		</form>
		<div class="clear"></div>
	</div>

	<div class="body-box" style="float: right">
		<form id="jvForm" action="update.do?id=${USER.id }" method="post"  >
			<table cellspacing="1" cellpadding="2" width="100%" border="0"
				class="pn-ftable">
				<tbody id="tab_1">
					<tr>
						<td width="20%" class="pn-flabel pn-flabel-h"><span
							class="pn-frequired"> </span> <span class="pn-frequired">${msg}
							</span></td>
					</tr>
					<tr>
						<td width="20%" class="pn-flabel pn-flabel-h"><span
							class="pn-frequired">*</span> 用户名:</td>
						<td width="80%" class="pn-fcontent"><input type="text"
							class="required" name="username" id="username" onblur="chkusername()" maxlength="100" size="20" value="${USER.username }" />
							<span id="resultName"></span>
							</td>
					</tr>
					<tr>
						<td width="20%" class="pn-flabel pn-flabel-h"><span
							class="pn-frequired">*</span> 密码:</td>
						<td width="80%" class="pn-fcontent"><input type="password"
							class="required" name="password" id="password" maxlength="100" value="${USER.password }
							size="20" onblur="chkpassword()" /> <span id="resultPwd"></span>
						</td>
					</tr>
					<tr>
						<td width="20%" class="pn-flabel pn-flabel-h"><span
							class="pn-frequired">*</span> 确认密码:</td>
						<td width="80%" class="pn-fcontent"><input type="password"
							class="required" name="repwd" id="repwd" maxlength="100" value="${USER.password}
							size="20" onblur="chkrepwd()" /> <span id="resultRepwd"></span></td>
					</tr>
					

					<tr>
						<td width="20%" class="pn-flabel pn-flabel-h"><span
							class="pn-frequired">*</span>真实姓名:</td>
						<td width="80%" class="pn-fcontent"><input type="text"
							value="${USER.realname}" class="required" name="realname" id="realname" onblur="chkrealname()" maxlength="10"   />
							<span id="resultrealname"></span>
							</td>
					</tr>
					<tr>
					<td width="20%" class="pn-flabel pn-flabel-h">
						性别:</td><td width="80%" class="pn-fcontent">
								<c:if test="${USER.sex=='男' }">
								<input type="radio" name="sex" value="男" checked="checked"/>男
								<input type="radio" name="sex" value="女" />女
								</c:if>
								<c:if test="${USER.sex=='女' }">
								<input type="radio" name="sex" value="男" />男
								<input type="radio" name="sex" value="女" checked="checked"/>女
								</c:if>
								
					</td>
					</tr>
					<tr>
						<td width="20%" class="pn-flabel pn-flabel-h">出生日期:</td>
						<td width="80%" class="pn-fcontent"><input type="text"
							value="${USER.birthdayTxt }" class="Wdate" onclick="WdatePicker() " name="birthday" id="birthday"  onblur="chkbirthday()" maxlength="10"  />
							<span id="resultbirthday"></span>
							</td>
					</tr>
		
					<tr>
						<td width="20%" class="pn-flabel pn-flabel-h">部门:</td>
						<td width="80%" class="pn-fcontent">
						<select name="dep" id="dep">
								<c:forEach items="${DLIST }" var="dep">
								<!-- 该部门所在上级部门的id等于一级部门的id就选择 -->
								<c:if test="${USER.dept.pid==dep.id }">
								<option value="${dep.id }"  selected="selected">${dep.name }</option>
								</c:if>
								<!--  否则不选中 -->
								<c:if test="${USER.dept.id!=dep.id }">
								<option value="${dep.id }"  >${dep.name }</option>
								</c:if>
									
								</c:forEach>
						</select>
						<select name="dept.id" id="dep2">
								<c:forEach items="${DLIST2 }" var="dep2">
								<!--  该部门所在部门的id等于二级部门的id就选择 -->
								<c:if test="${USER.dept.id==dep2.id }">
								<option value="${dep2.id }"  selected="selected">${dep2.name }</option>
								</c:if>
								<!--  -->
								<c:if test="${USER.dept.id!=dep2.id }">
								<option value="${dep2.id }"  >${dep2.name }</option>
								</c:if>
									
								</c:forEach>
						</select>
						</td>
					</tr>
						<tr>
						<td width="20%" class="pn-flabel pn-flabel-h">是否可用:</td>
						<td width="80%" class="pn-fcontent">
						<c:if test="${USER.isenabled==1 }">
						<input type="radio"name="isenabled" value="1" checked="checked" />可用
							<input type="radio"name="isenabled" value="2" />不可用
						</c:if>
						<c:if test="${USER.isenabled==2 }">
							<input type="radio"name="isenabled" value="1" />可用
							<input type="radio"name="isenabled" value="2" checked="checked" />不可用	
						</c:if>
					
							 </td>
					</tr>
					
					<tr>
						<td width="20%" class="pn-flabel pn-flabel-h"><span
							class="pn-frequired">*</span>email:</td>
						<td width="80%" class="pn-fcontent"><input type="text"
							 class="required" name="email" id="email" onblur="chkemail()" maxlength="100"  value="${USER.email }"/>
							 <span id="resultemail"></span>
							 </td>
					</tr>
					<input type="hidden" name="isenabled" value="${USER.isenabled }"/>
			<inputtype="hidden" name="id" value="${USER.id }"></input>
				</tbody>
				<tbody id="tab_2" style="display: none">
					<tr>
						<td><textarea rows="10" cols="10" id="productdesc"
								name="description"></textarea></td>
					</tr>
				</tbody>
				<tbody id="tab_3" style="display: none">
					<tr>
						<td><textarea rows="15" cols="136" id="productList"
								name="packageList"></textarea></td>
					</tr>
				</tbody>
				<tbody>
					<tr>
						<td class="pn-fbutton" colspan="2"><input type="submit"
							class="submit" value="提交" /> &nbsp; <input type="reset"
							class="reset" value="重置" /></td>
					</tr>
				</tbody>
			</table>
		</form>
	</div>
</body>
</html>