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
		<link rel="stylesheet"
			href="resource/css/bootstrap-datetimepicker.min.css">
		<link rel="stylesheet" href="resource/css/phpkt.css">
		<link rel="stylesheet" href="resource/css/longqiao.css">
		<script type="text/javascript" src="resource/js/jquery-1.9.0.js">
</script>
		<script type="text/javascript" src="resource/js/bootstrap.min.js">
</script>
		<script type="text/javascript"
			src="resource/js/bootstrap-datetimepicker.min.js">
</script>
		<script type="text/javascript"
			src="resource/js/locales/bootstrap-datetimepicker.zh-CN.js">
</script>
		<!-- javascript baiduMap插件 -->
		<script type="text/javascript"
			src="http://api.map.baidu.com/api?v=15&ak=RG2LQnQ0T6XUHc5BlHiqKeYl">
</script>
		<script type="text/javascript">
$(function() {
	$('.carousel').carousel( {
		interval : 2000,
		pause : 'hover'
	})
});
</script>
		<style type="text/css">
.navbar {
	margin-bottom: 2px;
}
.lq-deliver-form{
	font-size: 1px;
	font-weight: 200;
}
</style>
	</head>
	<body onload="mapInit()">
		<div class="header">
			<jsp:include page="bootStrapHead.jsp"></jsp:include>
		</div>

		<hr />
		<div class="row">
			<div class="col-md-4">
				<div class="row">
					<div class="col-md-12">
						<ol class="breadcrumb">
							<li>
								<kbd>
									分类方式:
								</kbd>
							</li>
							<li style="color: #333333; font-weight: bold;"
								id="baiduMapPrompt">
								请从以下选项卡中选择查询方式
							</li>
						</ol>
					</div>
				</div>
				<ul class="nav nav-tabs" role="tablist">
					<li class="active">
						<a href="#custom" role="tab" data-toggle="tab">条件查询</a>
					</li>
					<li>
						<a href="#home" role="tab" data-toggle="tab">业务范围</a>
					</li>
				</ul>
				<hr />
				<!-- Tab panes -->
				<div class="tab-content">
					<div class="tab-pane active" id="custom">
								<form class="form-inline" role="form">
									<div class="form-group">
										<div class="input-group">
											<div class="input-group-addon ">
												<i class="icon-circle-arrow-left icon-large"></i>&nbsp;起点
											</div>
											<select id="s_province" name="s_province"
												class="form-control lq-deliver-form col-md-3"></select>
										</div>
									</div>
									<div class="form-group">
										<select id="s_city" name="s_city"
											class="form-control lq-deliver-form col-md-3"></select>
									</div>
									<div class="form-group">
										<select id="s_county" name="s_county"
											class="form-control lq-deliver-form col-md-3"></select>
									</div>
									<script type="text/javascript">
_init_area();</script>
								</form>
								<form class="form-inline" role="form">
										<div class="input-group">
											<div class="input-group-addon">
												<i class="icon-circle-arrow-right icon-large"></i> 终点
											</div>
											<select id="s_province_end" name="s_province"
												class="form-control lq-deliver-form col-md-3"></select>
										</div>
										<div class="form-group">
											<select id="s_city_end" name="s_city"
												class="form-control lq-deliver-form col-md-3">
											</select>
										</div>
										<div class="form-group">
											<select id="s_county_end" name="s_county"
												class="form-control lq-deliver-form col-md-3"></select>
										</div>
										<script type="text/javascript">
_init_area_end();</script>
									</form>
								<form class="form-inline" role="form">
										<div class="input-group">
											<div class="input-group-addon">
												<i class="icon-circle-arrow-right icon-large"></i>运输方式
											</div>
											<select id="s_province_end" name="s_province"
												class="form-control lq-deliver-form col-md-3">
												<option>海运</option>
												<option>铁路</option>
												<option>公路</option>
												<option>空运</option>
												</select>
										</div>
										<div class="input-group">
											<div class="input-group-addon">
												<i class="icon-circle-arrow-right icon-large"></i>货物类型
											</div>
											<select id="s_province_end" name="s_province"
												class="form-control lq-deliver-form col-md-3">
												<option>普通货物</option>
												<option>危险品</option>
												<option>气体</option>
												<option>冷冻货物</option>
												</select>
										</div>
									</form>
									<input type="button" class="form-control btn-primary btn-large" value="搜索" name="搜索"></input>
					</div>
					<div class="tab-pane" id="home">
						<div class="list-group">
							<a href="#" class="list-group-item active"> <span
								class="badge">14</span>物流总计 </a>
							<a href="#" class="list-group-item"> <span class="badge">14</span>运输公司</a>
							<a href="#" class="list-group-item"> <span class="badge">14</span>仓储公司</a>
							<a href="#" class="list-group-item"> <span class="badge">14</span>物流信息公司</a>
							<a href="#" class="list-group-item"> <span class="badge">14</span>搬运公司</a>
							<a href="#" class="list-group-item"> <span class="badge">14</span>配送公司</a>
							<a href="#" class="list-group-item"> <span class="badge">14</span>快递公司</a>
						</div>
					</div>
				</div>
			</div>
			<div class="col-md-8">
				<div class="course-content">
					<div class="panel panel-nature panel-nature-primary">
						<div class="panel-heading">
							<h2 class="panel-title">
								精选物流
							</h2>
						</div>
						<div class="panel-heading">
							<ul class="nature-grids">
								<li class="nature-grid nature-course-grid">
									<a href="/course/25" class="course-picture"> <img
											src="pic/db.jpg"> </a>
									<p class="nature-default-course-tip"
										style="text-align: center; font-weight: bold; color: black;">
										江苏-上海专线
									</p>
									<span class="metas clearfix"> <span
										class="course-person"> <span
											class="glyphicon glyphicon-user "></span>&nbsp;<span
											style="font-weight: bold; color: black;">叶龙</span> </span> <span
										class="review-col"> <span class="review-rating">
												<span class="stars-5">&nbsp;</span> </span> </span> </span>
									<span class="teacher clearfix">电话: <span
										class="teachers" class="text-muted">13166266663 </span> <a
										href><span class="course-free">详情</span> </a> </span>
								</li>
								<li class="nature-grid nature-course-grid">
									<a href="/course/25" class="course-picture"> <img
											src="pic/sf.jpg"> </a>
									<p class="nature-default-course-tip"
										style="text-align: center; font-weight: bold; color: black;">
										江苏-上海专线
									</p>
									<span class="metas clearfix"> <span
										class="course-person"> <span
											class="glyphicon glyphicon-user "></span>&nbsp;<span
											style="font-weight: bold; color: black;">叶龙</span> </span> <span
										class="review-col"> <span class="review-rating">
												<span class="stars-5">&nbsp;</span> </span> </span> </span>
									<span class="teacher clearfix">电话: <span
										class="teachers" class="text-muted">13166266663 </span> 
										<a
										href><span class="course-free">详情</span> </a> </span>
								</li>
								<li class="nature-grid nature-course-grid">
									<a href="/course/25" class="course-picture"> <img
											src="pic/DHL.jpg"> </a>
									<p class="nature-default-course-tip"
										style="text-align: center; font-weight: bold; color: black;">
										江苏-上海专线
									</p>
									<span class="metas clearfix"> <span
										class="course-person"> <span
											class="glyphicon glyphicon-user "></span>&nbsp;<span
											style="font-weight: bold; color: black;">叶龙</span> </span> <span
										class="review-col"> <span class="review-rating">
												<span class="stars-5">&nbsp;</span> </span> </span> </span>
									<span class="teacher clearfix">电话: <span
										class="teachers" class="text-muted">13166266663 </span> <a
										href><span class="course-free">详情</span> </a> </span>
								</li>
								<li class="nature-grid nature-course-grid">
									<a href="/course/25" class="course-picture"> <img
											src="pic/f1.jpg"> </a>
									<p class="nature-default-course-tip"
										style="text-align: center; font-weight: bold; color: black;">
										江苏-上海专线
									</p>
									<span class="metas clearfix"> <span
										class="course-person"> <span
											class="glyphicon glyphicon-user "></span>&nbsp;<span
											style="font-weight: bold; color: black;">叶龙</span> </span> <span
										class="review-col"> <span class="review-rating">
												<span class="stars-5">&nbsp;</span> </span> </span> </span>
									<span class="teacher clearfix">电话: <span
										class="teachers" class="text-muted">13166266663 </span> <a
										href><span class="course-free">详情</span> </a> </span>
								</li>
								<li class="nature-grid nature-course-grid">
									<a href="/course/25" class="course-picture"> <img
											src="pic/f2.jpg"> </a>
									<p class="nature-default-course-tip"
										style="text-align: center; font-weight: bold; color: black;">
										江苏-上海专线
									</p>
									<span class="metas clearfix"> <span
										class="course-person"> <span
											class="glyphicon glyphicon-user "></span>&nbsp;<span
											style="font-weight: bold; color: black;">叶龙</span> </span> <span
										class="review-col"> <span class="review-rating">
												<span class="stars-5">&nbsp;</span> </span> </span> </span>
									<span class="teacher clearfix">电话: <span
										class="teachers" class="text-muted">13166266663 </span> <a
										href><span class="course-free">详情</span> </a> </span>
								</li>


							</ul>
							<a class="btn btn-default btn-lg btn-block more-course" href="#">更多物流信息</a>
						</div>
					</div>
				</div>
			</div>
			<jsp:include page="bootStrapFoot.jsp"></jsp:include>
		</div>
	</body>
</html>
