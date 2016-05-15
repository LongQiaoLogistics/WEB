<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<!-- HEADER -->
<div id="outerheader">
	<div class="container">
		<header id="top" class="twelve columns">
		<div id="logo" class="three columns alpha" style="width: 100px;">
			<a href="WEB-INF/jsp/index.jsp"><img
					src="resource/images/weixin/longqiao2.png" style="width: 600px;height: 150px;float: left; position: relative;left:-90px;" alt="sf56" /> </a>
		</div>
		<%--<div style="float: left; position: relative; top: 125px; left: -90px;">
			<img src="resource/images/weixin/lq_logo_font.png" />
		</div>
		--%><div id="headerright" class="nine columns omega" style="float: right;">
			<form method="post" action="lq/user/login" id="searchform" />
				<c:choose>
					<c:when test="${sessionScope.user.userName==null}">
						<div class="search">
							<label>
								用户名
							</label>
							<input type="text" name="userName" size="35"
								style="width: 111px;border:1px black solid;" />
							<label>
								密码
							</label>
							<input type="password" name="password" size="35"
								style="width: 111px;border:1px black solid;" />
							<input type="submit" value="登录" id="s"/>
							<input type="submit" value="注册" id="s"/>
						</div>
					</c:when>
					<c:otherwise>
						<div class="login_name">
							<label>
								欢迎您:${sessionScope.user.userName }
							</label>
							&nbsp;&nbsp;
							<a href="lq/user/exit" class="login_name_exit">退出</a>
						</div>
					</c:otherwise>
				</c:choose>
				<div style="float: right; margin-top: 10px;">
					<img alt="" src="resource/images/china/china.png"">
				</div>
			</form>
		</div>

		<section id="navigation" class="twelve columns"/>
		<nav id="nav-wrap">
		<ul id="topnav" class="sf-menu" >
			<li>
				<a href="lq/cargo/seekCargo" >查找货物</a>
			</li>
			<li>
				<a href="lq/cargo/seekLogistics" >查找物流</a>
			</li>
			<li>
				<a href="lq/cargo/seekDriver">查找司机</a>
			</li>
			<li>
				<a href="lq/cargo/deliverCargo">发布货物</a>
			</li>
			<li>
				<a href="lq/cargo/deliverLogistics">发布物流</a>
			</li>
			<li>
				<a href="lq/cargo/deliverDriver">发布司机</a>
			</li>
		</ul>
		<!-- topnav -->
		</nav>
		</header>
	</div>
</div>
<!-- END HEADER -->
