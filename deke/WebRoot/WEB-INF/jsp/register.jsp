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
		<link rel="stylesheet" type="text/css"
			href="resource/css/bootstrap.min.css">
		<link rel="stylesheet" href="resource/css/font-awesome.min.css">
		<style type="text/css">
i {
	color: #663300;
}
</style>
		<script type="text/javascript" src="resource/js/jquery-1.9.0.js">
</script>
		<script type="text/javascript" src="resource/js/bootstrap.min.js">
</script>
		<script type="text/javascript" src="resource/js/validateRegister.js">
</script>
	</head>
	<body>
		<div class="header">
			<jsp:include page="bootStrapHead.jsp"></jsp:include>
		</div>
		<div class="row">
			<div class="col-md-4 col-md-offset-4">
				<div class="panel  panel-primary panel-page">
					<div class="panel-heading">
						<h2>
							注册
						</h2>
					</div>
				</div>
				<div class="col-md-12">
					<form id="register-form" class="form-vertical" method="post"
						action="lq/user/register">
						<div class="form-group phone-error">
							<label class="control-label">
								<i class=" icon-mobile-phone icon-large"></i>&nbsp;&nbsp;手机号
							</label>
							<div class="controls">
								<input type="text" id="phone" name="phone" class="form-control">
								<p class="help-block">
									友情提醒：手机将作为以后登入的账号,请使用常用的手机注册!
								</p>
							</div>
						</div>

						<div class="form-group username-error">
							<label class="control-label">
								<i class="icon-user icon-large"></i>&nbsp;&nbsp;用户名
							</label>
							<div class="controls">
								<input type="text" id="username" name="username"
									class="form-control">
								<p class="help-block">
									长度不可以超过10个字符,建议使用真实名称
								</p>
							</div>
						</div>

						<div class="form-group password-error">
							<label class="control-label">
								<i class=" icon-lock icon-large"></i>&nbsp;&nbsp;密码
							</label>
							<div class="controls">
								<input type="password" id="password" class="form-control">
								<p class="help-block password-error-message">
									输入密码
								</p>
							</div>
						</div>
						<div class="form-group password-error">
							<label class="control-label">
								<i class="icon-unlock icon-large"></i>&nbsp;&nbsp;确认密码
							</label>
							<div class="controls">
								<input type="password" id="confirmPassword"
									name="confirmPassword" class="form-control">
								<p class="help-block">
									再输入一次密码
								</p>
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
									class="btn btn-primary btn-large btn-block">
									注册
								</button>
							</div>
						</div>
					</form>
				</div>
			</div>
		</div>
	</body>
</html>
