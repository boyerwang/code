
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title></title>
<script type="text/javascript">
	function getTime() {
		var date = new Date();
		//年
		var year = date.getFullYear();
		//月
		var mon = date.getMonth() + 1;
		//日
		var day = date.getDate();
		//时
		var hour = date.getHours();
		if (hour < 10) {
			hour = "0" + hour;
		}
		//分
		var min = date.getMinutes();
		if (min < 10) {
			min = "0" + min;
		}
		//秒
		var scn = date.getSeconds();
		if (scn < 10) {
			scn = "0" + scn;
		}
		document.getElementById("runtime").innerHTML = year + "年" + mon + "月"
				+ day + "日    " + hour + ":" + min + ":" + scn;
	}
	window.setInterval(getTime, 1000);
</script>
<link href="images/skin.css" rel="stylesheet" type="text/css" />
</head>
<body leftmargin="0" topmargin="0">
	<table width="100%" height="64" border="0" cellpadding="0"
		cellspacing="0" class="admin_topbg">
		<tr>
			<td width="61%" height="64" valign="top"><img
				src="images/logo4.png" width="176" height="54"></td>
			<td width="39%" valign="top"><table width="100%" border="0"
					cellspacing="0" cellpadding="0">
					<tr>
						<td width="54%" height="38" class="admin_txt"><b>${CHKUSER.realname}
						</b> &nbsp;&nbsp;&nbsp;&nbsp; <span id="runtime"></span>
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;感谢登录使用！</td>
						<td width="42%"><a href="login.do" target="_top"><img src="images/out.gif" alt="安全退出"
							width="46" height="20" border="0"
							onclick="javascript:window.history.go(-(history.length-1))"></a></td>
						<td width="4%">&nbsp;</td>
					</tr>
					<tr>
						<td height="19" colspan="3">&nbsp;</td>
					</tr>
				</table></td>
		</tr>
	</table>
</body>
</html>