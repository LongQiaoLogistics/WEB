<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page import="java.text.SimpleDateFormat"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<base href="<%=basePath%>">
		<meta name="robots" content="index, follow" />
		<meta name="keywords" content="" />
		<meta name="description" content="" />
		<meta name="author" content="" />
		<meta name="viewport"
			content="width=device-width, initial-scale=1, maximum-scale=1" />
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<script type="text/javascript" src="resource/js/area.js">
</script>
		<script type="text/javascript" src="resource/js/areaEnd.js">
</script>
		<script type="text/javascript" src="resource/js/jquery-1.9.0.js">
</script>
		<script type="text/javascript" src="resource/js/bootstrap.min.js">
</script>
		<script type="text/javascript" src="resource/js/icheck/icheck.min.js">
</script>
		<link rel="stylesheet" href="resource/css/longqiao.css">
		<link rel="stylesheet" href="resource/js/icheck/skins/square/blue.css">
		<link rel="stylesheet" type="text/css"
			href="resource/css/bootstrap.min.css">
		<link rel="stylesheet" href="resource/css/font-awesome.min.css">
		<style type="text/css">
i {
	color: #669900;
}
</style>
		<script type="text/javascript">
/*验证手机*/
var phoneReg = /^0{0,1}(13[0-9]|145|15[0-9]|153|156|18[0-9])[0-9]{8}$/;
function checkphone() {
	var phone = $("#phone").val();
	if (phone == "") {
		alert("发布失败了额,   	 错误原因为：您未设置手机号码!!!!!!!!");
		return false;
	}
	if (!phoneReg.test($.trim(phone))) {
		alert("发布失败了额,   	 错误原因为：您手机号码" + phone + "格式不正确!!!!!!!!");
		return false;
	}
}
function deliverDriver() {
	alert($("#username").val() + "" + $("#phone").val() + "" + $("#gzjy").val());
	temp = document.getElementsByName("radio");
	alert(temp.length);
	for (i = 0; i < temp.length; i++) {
		   if(temp[i].checked)
			alert("你选择了"+temp[i].value);
		}
	return false;
	$.post("lq/cargo/insertCargo", {
		"driver_name" : $("#username").val(),
		"driver_phone" : $("#phone").val(),
		"gzjy" : $("#gzjy").val(),
		"jzlx" : $("#jzlx").val(),
		"zgzlx" : $("#zgzlx").val(),
		"xqcllx" : $("#xqcllx").val(),
		"qwxz" : $("#qwxz").val(),
		"sex" : $("#sex").val()
	}, function(data) {
		if (data.flag) {
			alert("恭喜,发布成功!!!!!!!!")
		} else {
			alert("发布失败,请重新发布!")
		}
	});
	}
$(document).ready(function() {
	$('input').iCheck( {
		checkboxClass : 'icheckbox_square-blue',
		radioClass : 'iradio_square-blue',
		increaseArea : '20%' // optional
	});

});
</script>
	</head>
	<body style="background-image: url('pic/33.png');">
		<div class="header">
			<jsp:include page="bootStrapHead.jsp"></jsp:include>
		</div>
		<div class="row">
			<div class="col-md-12">
				<div class="row">
					<div class="col-md-10 col-md-offset-1">
						<ol class="breadcrumb" style="background-color: CCCC99">
							<li>
								<kbd>
									当前您的位置:
								</kbd>
							</li>
							<li class="active">
								<i class="icon-beaker"></i> 发布货物
							</li>
							<li style="color: 333333; font-weight: bold;">
								<span style="color: FF0000;">友情提示：</span>带
								<span style="color: FF0000">*</span>为必填项
							</li>
						</ol>
					</div>
				</div>
			</div>
		</div>
		<div class="row">
			<div class="col-md-4 col-md-offset-4" style="background-color: white">
				<div class="panel  panel-primary panel-page">
					<div class="panel-heading">
						<h2>
							发布司机
						</h2>
					</div>
				</div>
				<div class="col-md-12">
					<form id="register-form" class="form-vertical" method="post"
						action="lq/user/register">
						<div class="form-group username-error">
							<label class="control-label">
								<i class="icon-user icon-large"></i>&nbsp;&nbsp;姓名
								<span style="color: FF0000">*</span>
							</label>
							<div class="controls">
								<input type="text" id="username" name="username"
									class="form-control">
							</div>
						</div>
						<div class="form-group phone-error">
							<label class="control-label">
								<i class="icon-phone-sign icon-large"></i>&nbsp;&nbsp;手机号
								<span style="color: FF0000">*</span>
							</label>
							<div class="controls">
								<input type="text" id="phone" name="phone" class="form-control"
									onblur="checkphone()">
							</div>
						</div>
						<div class="form-group phone-error">
							<label class="control-label">
								<i class="  icon-trophy icon-large"></i>&nbsp;&nbsp;工作经验
								<span style="color: FF0000">*</span>
							</label>
							<div class="controls">
								<select class="form-control" id="gzjy">
									<option value="401" selected="selected">

									</option>
									<option>
										无经验
									</option>
									<option>
										1年以下
									</option>
									<option>
										1-2年
									</option>
									<option>
										3-5年
									</option>
									<option>
										6-10年
									</option>
									<option>
										10年以上
									</option>
								</select>
							</div>
						</div>

						<div class="form-group phone-error">
							<label class="control-label">
								<i class="  icon-list-alt icon-large"></i>&nbsp;&nbsp;驾照类型
								<span style="color: FF0000">*</span>
							</label>
							<div class="controls">
								<select class="form-control" name="iCheck" id="jzxl">
									<option value="402" selected="selected">

									</option>
									<option>
										小型汽车 C1
									</option>
									<option>
										大型货车 B2
									</option>
									<option>
										半挂车 A2
									</option>
									<option>
										中型客车 B1
									</option>
									<option>
										城市公交车 A3
									</option>
									<option>
										大型客车 A1
									</option>
								</select>
							</div>
						</div>
						<div class="form-group phone-error">
							<label class="control-label">
								<i class="icon-book icon-large"></i>&nbsp;&nbsp;资格证类型
								<span style="color: FF0000">*</span>
							</label>
							<div class="controls">
								<select class="form-control" name="iCheck" id="zgzlx">
									<option value="405" selected="selected">

									</option>
									<option>
										无
									</option>
									<option>
										普货资格证
									</option>
									<option>
										危险品资格证
									</option>
								</select>
							</div>
						</div>
						<div class="form-group phone-error">
							<label class="control-label">
								<i class="icon-truck icon-large"></i>&nbsp;&nbsp;寻求车辆类型
								<span style="color: FF0000">*</span>
							</label>
							<div class="controls">
								<select class="form-control" name="iCheck" id="xqcllx">
									<option value="403" selected="selected">

									</option>
									<option>
										小型汽车 C1
									</option>
									<option>
										大型货车 B2
									</option>
									<option>
										半挂车 A2
									</option>
									<option>
										中型客车 B1
									</option>
									<option>
										城市公交车 A3
									</option>
									<option>
										大型客车 A1
									</option>
								</select>
							</div>
						</div>
						<div class="form-group phone-error">
							<label class="control-label">
								<i class=" icon-money icon-large"></i>&nbsp;&nbsp;期望薪资
								<span style="color: FF0000">*</span>
							</label>
							<div class="controls">
								<select class="form-control">
									<option value="404" selected="selected" id="qwxz">

									</option>
									<option>
										不限
									</option>
									<option>
										面谈
									</option>
									<option>
										2000以下
									</option>
									<option>
										2000-3000
									</option>
									<option>
										3000-5000
									</option>
									<option>
										5000-8000
									</option>
									<option>
										8000-12000
									</option>
									<option>
										12000-20000
									</option>
									<option>
										20000以上
									</option>
								</select>
							</div>
						</div>
						<div class="form-group phone-error">
							<label class="control-label">
								<i class=" icon-group icon-large"></i>&nbsp;&nbsp;性别
								<span style="color: FF0000">*</span>
							</label>
							<div class="controls">
								<label class="radio-inline">
									<input type="radio" name="iCheck" value="男" name="radio">
									男
								</label>
								<label class="radio-inline">
									<input type="radio" name="iCheck" value="女" name="radio">
									女
								</label>
							</div>
						</div>
						<div class="form-group verification_code_error">
							<label class="control-label" for="register_code">
								<i class=" icon-check icon-large"></i>&nbsp;&nbsp; 验证码
								<kbd id="verification_code_success">
									7878
								</kbd>
							</label>
							<div class="controls">
								<input type="text" id="verification_code" class="form-control"
									name="verification code">
								<p class="help-block">
									请输入上面的验证码
								</p>
							</div>
						</div>

						<div class="form-group">
							<div class="controls">
								<button type="submit" id="register-btn"
									class="btn btn-primary btn-large btn-block"
									onclick="deliverDriver()">
									发布
							</div>
						</div>
					</form>
				</div>
			</div>
		</div>
	</body>
</html>
