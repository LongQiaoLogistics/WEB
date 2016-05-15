
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html lang="en">
	<!--<![endif]-->
	<head>
		<base href="<%=basePath%>">
		<meta charset="utf-8" />
		<title>龙巧物流网</title>
		<meta name="robots" content="index, follow" />
		<meta name="keywords" content="" />
		<meta name="description" content="" />
		<meta name="author" content="" />
		<meta name="viewport"
			content="width=device-width, initial-scale=1, maximum-scale=1" />
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	</head>
	<link rel="stylesheet" type="text/css" href="resource/css/skeleton.css" />
	<link rel="stylesheet" type="text/css" href="resource/css/style.css" />
	<link rel="stylesheet" type="text/css" href="resource/css/color.css" />
	<link rel="stylesheet" type="text/css" href="resource/css/layout.css" />
	<link rel="shortcut icon" href="resource/images/favicon.ico" />
	<link rel="apple-touch-icon"
		href="resource/images/apple-touch-icon.png" />
	<link rel="apple-touch-icon" sizes="72x72"
		href="resource/images/apple-touch-icon-72x72.png" />
	<link rel="apple-touch-icon" sizes="114x114"
		href="resource/images/apple-touch-icon-114x114.png" />
	<!--[if lt IE 9]>
		<script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
	<![endif]-->
	</head>
	<body>
		<!-- style="filter:alpha(Opacity=80);-moz-opacity:0.8;opacity: 0.8; background:#000000 no-repeat; -->
		<div id="bodychild">
			<div id="outercontainer">
				<jsp:include page="WEB-INF/jsp/head.jsp"></jsp:include>
				<!-- BEFORE CONTENT -->
				<div id="outerbeforecontent">
					<div class="container">
						<div id="beforecontent" class="twelve columns">
							<h1>
								<span class="colortext">龙巧物流 </span>在线平台<span class="colortext">永久免费</span>,	比你想象的更简单和强大								
							</h1>
						</div>
					</div>
				</div>
				<!-- END BEFORE CONTENT -->
				<!-- MAIN CONTENT -->
				<div id="outermain">
					<div class="container">
						<section id="maincontent" class="twelve columns">

						<h2 class="titleSection">
							我们可以为你做些什么?
						</h2>
						<div class="one_third firstcols">
							<h3 class="titleRegular"">
								<img src="resource/images/weixin/weixin4.jpg" alt=""
									class="alignleft" style="width: 50px; height: 50px;" />
								通过微信便可以进行发货,找货,管理我的物流
							</h3>
							<p>
								无缝接入微信公众平台,直接通过扫描龙巧物流在线平台二维码添加官方平台,在微信平台中便可以
								进行发货,找货,管理我的物流等操作。一次简单的扫描,便可以在不同的平台(iphone,ipad,android,WP)的使用,
								而这一些切得力于微信平台的开放,高效,便捷。
							</p>
						</div>
						<div class="one_third">
							<h3 class="titleRegular">
								<img src="resource/images/baidu/baidu2.jpg" alt=""
									class="alignleft" style="width: 50px; height: 50px;" />
								通过百度地图提供更快,更好,更稳定的定位服务
							</h3>
							<p>
								百度地图开放平台实现地图展示,信息搜索,定位和导航功能,这一切的操作和你平时操作百度地图一模一样,
								使你不需要花费任何的学习成本,让你的操作变得得心应手。
							</p>
						</div>
						<div class="one_third lastcols">
							<h3 class="titleRegular">
								<img src="resource/images/tree.png" alt="" class="alignleft"
									style="width: 50px; height: 50px;" />
								保护环境,大家有义务
							</h3>
							<p>
								请保护环境,关爱家园!,希望通过我们一点点的力量,让我们的物流智能一点,让我们的交通便捷,资源分配更加合理,环境 更加美好。
							</p>
						</div>

						<div class="separator line"></div>
						<div class="eight columns alpha" id="anchorTutorial">
							<h2 class="titleSection">
								教程
							</h2>
							<p>
								通过学习简单教程便可以使用龙巧物流在线平台
							</p>
							<div class="one_half firstcols">
								<ul class="row-list">
									<li>
										<span class="circle alignleft">1</span>
										<h5 class="titleSemibold colortext margin_bottomoff">
											注册
										</h5>
										<div class="indentleft">
											虽然在线平台不强制你注册,但是为了保证能够使用完整的功能,我们建议您注册账号.
										</div>
									</li>
									<li>
										<span class="circle alignleft">2</span>
										<h5 class="titleSemibold colortext margin_bottomoff">
											发货
										</h5>
										<div class="indentleft">
											输入始发地和目的地,便可以发布你的信息.
										</div>
									</li>
									<li>
										<span class="circle alignleft">3</span>
										<h5 class="titleSemibold colortext margin_bottomoff">
											找货
										</h5>
										<div class="indentleft">
											输入起点和终点,便可以查找到货物信息.
										</div>
									</li>
								</ul>
							</div>
							<div class="one_half lastcols">
								<ul class="row-list">
									<li>
										<span class="circle alignleft">4</span>
										<h5 class="titleSemibold colortext margin_bottomoff">
											我的物流
										</h5>
										<div class="indentleft">
											管理我的物流信息情况,查看我的发布情况和下架发布信息.
										</div>
									</li>
									<li>
										<span class="circle alignleft">5</span>
										<h5 class="titleSemibold colortext margin_bottomoff">
											驾驶员
										</h5>
										<div class="indentleft">
											此功能可以驾驶员可以发布自己信息,车主也可以通过这里寻找自己合适的驾驶员.
										</div>
									</li>
								</ul>
							</div>
						</div>
						<div class="four columns omega">
							<img src="resource/images/china/applecare_folks_tall.png" alt=""
								class="scale-with-grid" />
						</div>

						<div class="clear"></div>
						<!-- clear float -->
						</section>
					</div>
				</div>
				<!-- END MAIN CONTENT -->
				<jsp:include page="WEB-INF/jsp/footer.jsp"></jsp:include>
			</div>
			<!-- end outercontainer -->
		</div>
		<!-- end bodychild -->

		<script type="text/javascript">
jQuery(window).load(function() {
	jQuery('.flexslider').flexslider( {
		animation : "fade", //String: Select your animation type, "fade" or "slide"
		directionNav : false, //Boolean: Create navigation for previous/next navigation? (true/false)
		controlNav : true
	//Boolean: Create navigation for paging control of each clide? Note: Leave true for manualControls usage
			});
});
</script>
		<div style="display: none">
			<script src='http://v7.cnzz.com/stat.php?id=155540&web_id=155540'
				language='JavaScript' charset='gb2312'>
</script>
		</div>
	</body>
</html>
