
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
	
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

<!-- 引时间控件 -->

<script type="text/javascript"  language="javascript" src="../js/jquery-1.11.0.min.js"></script>
<script type="text/javascript"  language="javascript" src="../js/DatePicker/WdatePicker.js"></script>
<script type="text/javascript" src="../res/fckeditor/fckeditor.js"></script>
<script src="../res/common/js/jquery.js" type="text/javascript"></script>
<script src="../res/common/js/jquery.ext.js" type="text/javascript"></script>
<script src="../res/common/js/jquery.form.js" type="text/javascript"></script>
<script src="../res/common/js/lecheng.js" type="text/javascript"></script>
<script src="../res/lecheng/js/admin.js" type="text/javascript"></script>

<link rel="stylesheet" href="../res/css/style.css" />
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>

<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>User_add</title>
<!--  添加表单验证 -->
<script type="text/javascript">
/*
// 用户名：数字+字母，结束之前不能全都是数字，6-16
var CHKUSERNAME="^(?![0-9]+$)[a-zA-Z0-9]{6,16}$";
//密码：数字+字母，结束之前不能全是数字和字母，6-16
var CHKPASSWORD="^(?![0-9]+$)(?![a-zA-Z]+$)[a-zA-Z0-9]{6,16}$";
//邮箱xxxxxx@xxx.com,可以包含_      企业邮箱qwe@huewei.com.cn
var CHKEMAIL="^[a-zA-Z0-9_]+@[a-z0-9]{2,5}(\\.[a-z]{2,3}){1,2}$";
//真实姓名
var CHKREALNAME="^[\u4e00-\u9fa5]{2,}$";
//出生日期：yyyy-MM-dd月份1-12 日期1-31
var CHKDATE= "^([0-9]{4})-(0?[1-9]|1[0-2])-(0?[1-9]|[1-2][0-9]|3[0-1])$";

//验证用户名
function chkusername(){
	//获取用户名
	var username=$("#username").val();
	//定义匹配用户名的正则表达式
	var reg=new RegExp(CHKUSERNAME);
	if(reg.test(username)){
		if (chkExistUsername(username)) {
			return true;
		} else {
			return false;
		}
	}else{
		$("#resultName").html("用户名必须包含数字和字母，且不能少于6位");
		$("#resultName").css("color","red");
		//清空文本框
		$("#username").val("");
		//重新聚焦
		$("#username").focus();
		return false;
	}
}
//检查用户名是否重复
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
		success:function(aaa){
			if(aaa=='true'){//没有重复
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

//验证密码
function chkpassword(){
	//获取密码
	var password=$("#password").val();
	//定义匹配密码的正则表达式
	var reg=new RegExp(CHKPASSWORD);
	if(reg.test(password)){
		//表示输入正确
		$("#resultPwd").html("✔");
		$("#resultPwd").css("color","green");
	return true;
	}else{
		$("#resultPwd").html("密码必须包含数字和字母，且不能少于6位");
		$("#resultPwd").css("color","red");
		//清空文本框
		$("#password").val("");
		//重新聚焦
		$("#password").focus();
		return false;
	}
}
//验证两次密码是否一致
function chkrepwd(){
	//获取密码
	var repwdEle=document.getElementById("repwd");
	var repwd=repwdEle.value;
	var password=document.getElementById("password").value;
	//获取2次密码是否输入成功的元素对象
	var spanEle=document.getElementById("resultRepwd");
	if(repwd==password){
		spanEle.innerHTML="✔";
		spanEle.style.color="green";
		return true;
	}else{
		spanEle.innerHTML="两次密码不一致请重新输入";
		spanEle.style.color="red";
	repwdEle.value="";
			//重新聚焦
			repwdEle.focus();
		return false;
	}
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
		success:function(data){
			if(data=='true'){//没有重复
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

		function upload(){
		
			//绝对路径
			var args={
					url:$("#path").val()+"/upload/common.do",
					//返回类型
					dataType:"text",
					//提交方式
					type:"post",
					success:function (result){
						//设置图片的属性
						$("#img").attr("src",$("#path").val()+"/upload/"+result);
						//将路径设置到隐藏域中
						$("#pic").val(result);
					}
					
			}
			//表单局部提交
			$("#jvForm").ajaxSubmit(args);
		}

		//验证所有
		function chkAll(){
			return chkusername()&&chkpassword()&&chkrepwd()&&chkrealname()&&chkbirthday()&&chkemail();
		}

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
	<input type="hidden" id="path" value="${pageContext.request.contextPath }" />
	<div class="box-positon">
		<div class="rpos">当前位置: 用户管理 - 添加</div>
		<form class="ropt">
			<input type="submit" onclick="this.form.action='list.do';"
				value="返回列表" class="return-button" />
		</form>
		<div class="clear"></div>
	</div>

	<div class="body-box" style="float: right">
		<form name="fm" id="jvForm" action="add.do" method="post"  enctype="multipart/form-data">
			<table cellspacing="1" cellpadding="2" width="100%" border="0"
				class="pn-ftable">
				<tbody id="tab_1">
					<tr>
						<td width="20%" class="pn-flabel pn-flabel-h"><span
							class="pn-frequired"> </span> <span class="pn-frequired">${MSG}
						</span></td>
					</tr>
					<tr>
						<td width="20%" class="pn-flabel pn-flabel-h"><span
							class="pn-frequired">*</span> 用户名:</td>
						<td width="80%" class="pn-fcontent"><input type="text"
							class="required" name="username" id="username" maxlength="100"
							size="20" onblur="chkusername()" /> <span id="resultName"></span>
						</td>
					</tr>
					<tr>
						<td width="20%" class="pn-flabel pn-flabel-h"><span
							class="pn-frequired">*</span> 密码:</td>
						<td width="80%" class="pn-fcontent"><input type="password"
							class="required" name="password" id="password" maxlength="100"
							size="20" onblur="chkpassword()" /> <span id="resultPwd"></span>
						</td>
					</tr>
					<tr>
						<td width="20%" class="pn-flabel pn-flabel-h"><span
							class="pn-frequired">*</span> 确认密码:</td>
						<td width="80%" class="pn-fcontent"><input type="password"
							class="required" name="repwd" id="repwd" maxlength="100"
							size="20" onblur="chkrepwd()" /> <span id="resultRepwd"></span></td>
					</tr>

					<tr>
						<td width="20%" class="pn-flabel pn-flabel-h"><span
							class="pn-frequired">*</span>真实姓名:</td>
						<td width="80%" class="pn-fcontent"><input type="text"
							 class="required" name="realname" id="realname"
							maxlength="10" onblur="chkrealname()" /> <span
							id="resultrealname"></span></td>
					</tr>
					<tr>
						<td width="20%" class="pn-flabel pn-flabel-h">性别:</td>
						<td width="80%" class="pn-fcontent"><input type="radio"
							name="sex" value="男" checked="checked" />男 <input type="radio"
							name="sex" value="女" />女</td>
					</tr>
					<tr>
						<td width="20%" class="pn-flabel pn-flabel-h"><span
							class="pn-frequired">*</span>出生日期:</td>
						<td width="80%" class="pn-fcontent"><input type="text"
						  name="birthday" id="birthday" onblur="chkbirthday()" maxlength="80" class="Wdate" onclick="WdatePicker() "/>
							<span id="resultbirthday"></span>
							</td>
						
					</tr>

					<tr>
						<td width="20%" class="pn-flabel pn-flabel-h">部门:</td>
						<td width="80%" class="pn-fcontent"><select name="dep" id="dep">
								<c:forEach items="${DLIST }" var="dep">
									<option value="${dep.id }" >${dep.name }</option>
								</c:forEach>
						</select>
						<select name="dept.id" id="dep2">
								<c:forEach items="${DLIST2 }" var="dep2">
									<option value="${dep2.id }" >${dep2.name }</option>
								</c:forEach>
						</select>
						</td>
					</tr>
					<tr>
						<td width="20%" class="pn-flabel pn-flabel-h"><span
							class="pn-frequired">*</span>email:</td>
						<td width="80%" class="pn-fcontent"><input type="text"
							class="required" name="email" id="email" maxlength="100"
							onblur="chkemail()" />
							<span id="resultemail"></span>
							</td>
					
					</tr>
						<tr>
						<td width="20%" class="pn-flabel pn-flabel-h">头像:</td>
						<td width="80%" class="pn-fcontent"><input type="file"
						  name="file"  onchange="upload()"  />
							<img id="img" width="150px" height="150px"/>
							<input  type="hidden" name="pic" id="pic"/>
							</td>
						
					</tr>


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