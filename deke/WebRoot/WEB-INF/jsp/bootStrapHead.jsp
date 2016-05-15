<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<nav class="navbar navbar-default  navbar-inverse" role="navigation">
<div class="container-fluid"
	style="background-image: url('pic/black.jpg');width:100%;">
	<!-- Brand and toggle get grouped for better mobile display -->
	<div class="navbar-header">
		<button type="button" class="navbar-toggle collapsed"
			data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
			<span class="sr-only">Toggle navigation</span>
			<span class="icon-bar"></span>
			<span class="icon-bar"></span>
			<span class="icon-bar"></span>
		</button>
		<!-- logo链接处 -->
		<a class="navbar-brand-logo" href="#"> <img
				src="resource/images/weixin/longqiao.png" style="height: 100px;width: 400px;position: relative;left:-50px;" /> </a>
	</div>

	<!-- Collect the nav links, forms, and other content for toggling -->
	<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
		<ul class="nav navbar-nav">
			<li class="dropdown lq-deliver-form">
				<a href="#" class="dropdown-toggle" data-toggle="dropdown"
					style="color: white;"> <i class="icon-pencil"></i> 发布功能 <span
					class="caret"></span> </a>
				<ul class="dropdown-menu" role="menu">
					<li>
						<a href="lq/cargo/deliverCargo"><i class=" icon-shopping-cart icon-large"></i> 发布货物</a>

					</li>
					<li class="divider"></li>
					<li>
						<a href="lq/cargo/deliverLogistics"><i class="icon-truck icon-large"></i> 发布物流</a>
					</li>
					<li class="divider"></li>
					<li>
						<a href="lq/cargo/deliverDriver"><i class=" icon-user icon-large"></i> 发布司机</a>
					</li>
				</ul>
			</li>
		</ul>
		<ul class="nav navbar-nav">
			<li class="dropdown lq-deliver-form">
				<a href="#" class="dropdown-toggle " data-toggle="dropdown"
					style="color: white;"><i class=" icon-search"></i> 查询功能 <span
					class="caret"></span> </a>
				<ul class="dropdown-menu" role="menu">
					<li>
						<a href="lq/cargo/seekCargo"><i class=" icon-shopping-cart icon-large"></i> 查询货物</a>
					</li>
					<li class="divider"></li>
					<li>
						<a href="lq/cargo/seekLogistics"><i class="icon-truck icon-large"></i> 查询物流</a>
					</li>
					<li class="divider"></li>
					<li>
						<a href="lq/cargo/seekDriver"><i class=" icon-user icon-large"></i> 查询司机</a>
					</li>
				</ul>
			</li>
		</ul><%--
		<ul class="nav navbar-nav navbar-right">
			<li>
				<a href="#"><img src="resource/images/china/china.png"
						style="height: 20px" /> </a>
			</li>
		</ul>
		--%><ul>
			<li>
				<form class="navbar-form navbar-right">
					<c:choose>
					<c:when test="${user.userName==null}">
					<div class="form-group">
						<input type="text" class="form-control input-sm" placeholder="手机号">
						<input type="password" class="form-control input-sm"
							placeholder="密码">
					</div>
					<button type="submit" class="btn btn-primary btn-sm">
						登录
						<span class="glyphicon glyphicon-user"></span>
					</button>
					<a href="lq/user/register" class="btn btn-primary btn-sm"> 注册 <span
						class="glyphicon glyphicon-pencil"></span> </a>
				</c:when>
					<c:otherwise>
						<div class="login_name" style="color: white;">
							<label>
								欢迎您：${user.userName}
							</label>
							&nbsp;&nbsp;
							<a href="lq/user/exit" class="login_name_exit">退出</a>
						</div>
					</c:otherwise>
				</c:choose>
				</form>
			</li>
		</ul>
	</div>
	<!-- /.navbar-collapse -->
</div>
<!-- /.container-fluid -->
</nav>