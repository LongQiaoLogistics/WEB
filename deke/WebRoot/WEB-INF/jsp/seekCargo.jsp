<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
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
		<link style="stylesheet" type="text/css" href="resource/css/style.css" />
		<link rel="stylesheet" type="text/css"
			href="resource/css/skeleton.css" />
		<link rel="stylesheet" type="text/css" href="resource/css/style.css" />
		<link rel="stylesheet" type="text/css" href="resource/css/color.css" />
		<link rel="stylesheet" type="text/css" href="resource/css/layout.css" />
		<link rel="shortcut icon" href="resource/images/favicon.ico" />
		<script type="text/javascript" src="resource/js/area.js">
</script>
		<script type="text/javascript" src="resource/js/areaEnd.js">
</script>

		<script type="text/javascript" src="resource/js/tableshow/jquery.js">
</script>
		<link rel="stylesheet" href="resource/css/font-awesome.min.css">
		<link rel="stylesheet" href="resource/css/longqiao.css">
		<link rel="stylesheet" type="text/css"
			href="resource/css/tableshow/jquery.dataTables.min.css" />
		<script type="text/javascript"
			src="resource/js/tableshow/jquery.dataTables.js">
</script>
		<script type="text/javascript" src="resource/js/bootstrap.min.js">
</script>
		<link rel="stylesheet" type="text/css"
			href="resource/css/bootstrap.min.css">
		<script type="text/javascript">

$(document).ready(function() {
	$('#data_table_send_cargo_list').DataTable( {
		"bSort" : false, //不自动排序
		"bAutoWidth" : true, //设置宽度自动
		"oLanguage" : {
			"sProcessing" : "正在加载中......",
			"sLengthMenu" : "每页显示 _MENU_ 条记录",
			"sZeroRecords" : "对不起，查询不到相关数据！",
			"sEmptyTable" : "表中无数据存在！",
			"sInfo" : "当前显示 _START_ 到 _END_ 条，共 _TOTAL_ 条记录",
			"sInfoFiltered" : "数据表中共为 _MAX_ 条记录",
			"sSearch" : "搜索关键字",
			"oPaginate" : {
				"sFirst" : "首页",
				"sPrevious" : "上一页",
				"sNext" : "下一页",
				"sLast" : "末页"
			}
		}
	});
	$('.carousel').carousel( {
		interval : 2000
	});
	$("#queryCargoButton").click(function() {
		origin_province = $("#s_province").val();
		if (origin_province == "省份") {
			alert("发布失败了额,	            错误原因为：您未设置起点,至少需要设置省份,如上海市!!!!!!!!");
			return false;
		}
	 dest_province= $("#s_province_end").val();
					if(dest_province == "省份"){
						alert("发布失败了额,	            错误原因为：您未设置终点,至少需要设置省份,如上海市!!!!!!!!");
						return false;
					}   
		$("#seekCargoForm").submit();
	});
	//结束
	});
</script>
		<style type="text/css">
tr th {
	text-align: center
}

ul li {
	padding-bottom: 0;
}
</style>
	</head>
	<body>
		<jsp:include page="bootStrapHead.jsp"></jsp:include>
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
							<i class="icon-beaker"></i>查询货物
						</li>
						<li style="color: 333333; font-weight: bold;">
							<span style="color: FF6633;">友情提示：</span>您只需设置好"省","市","县"便可查询对应货物,当然您也可以只设置"省"这个区域范围,
							如：上海市 至 江苏省
						</li>
					</ol>
				</div>
			</div>
		</div>
		<div class="info" style="text-align: center;">
			<form action="lq/cargo/queryCargoList" method="post"
				enctype="application/x-www-form-urlencoded" id="seekCargoForm">
				<div style="margin: 0 auto;">
					<label style="color: #1E90FF; font-weight: bold;">
						起点:
					</label>
					<select id="s_province" name="origin_province"></select>
					  
					<select id="s_city" name="origin_city"></select>
					  
					<select id="s_county" name="origin_country"></select>
					<script type="text/javascript">
_init_area();</script>
					<label style="color: #1E90FF; font-weight: bold;">
						终点:
					</label>
					<select id="s_province_end" name="dest_province"></select>
					  
					<select id="s_city_end" name="dest_city"></select>
					  
					<select id="s_county_end" name="dest_country"></select>
					<input type="submit" name="queryCargo" value="查询" class="button"
						id="queryCargoButton" />
					<script type="text/javascript">
_init_area_end();</script>
				</div>
			</form>
		</div>

		<div class="separator line"></div>
		<c:choose>
			<c:when test="${result == null}">
				<div id="carousel-example-generic" class="carousel slide"
					data-ride="carousel" style="width: 70%; left: 15%;">
					<!-- Indicators -->
					<ol class="carousel-indicators">
						<li data-target="#carousel-example-generic" data-slide-to="0"
							class="active"></li>
						<li data-target="#carousel-example-generic" data-slide-to="1"></li>
						<li data-target="#carousel-example-generic" data-slide-to="2"></li>
					</ol>

					<!-- Wrapper for slides -->
					<div class="carousel-inner" style="border-radius: 50px;">
						<div class="item active" ">
							<img src="pic/db.jpg" alt="...">
							<div class="carousel-caption ">
								德邦物流
							</div>
						</div>
						<div class="item" > 
							<img src="pic/DHL.jpg" alt="...">
							<div class="carousel-caption">
								德邦物流
							</div>
						</div>
						<div class="item" >
							<img src="pic/db.jpg" alt="...">
							<div class="carousel-caption">
								德邦物流
							</div>
						</div>
					</div>

					<!-- Controls -->
					<a class="left carousel-control" href="#carousel-example-generic"
						role="button" data-slide="prev"> <span
						class="glyphicon glyphicon-chevron-left"></span> <span
						class="sr-only">Previous</span> </a>
					<a class="right carousel-control" href="#carousel-example-generic"
						role="button" data-slide="next"> <span
						class="glyphicon glyphicon-chevron-right"></span> <span
						class="sr-only">Next</span> </a>
				</div>
			</c:when>
			<c:otherwise>
				<div style="width: 96%; position: relative; left: 2%;">
					<table id="data_table_send_cargo_list" class="display"
						style="color: #000">
						<thead>
							<tr>
								<th>
									用户
								</th>
								<th>
									起点
								</th>
								<th>
									终点
								</th>
								<th>
									货物类型
								</th>
								<th>
									数量
								</th>
								<th>
									车辆类型
								</th>
								<th>
									运费
								</th>
								<th>
									付款方式
								</th>
								<th>
									电话
								</th>
								<th>
									发货时间
								</th>
								<th>
									收货时间
								</th>
							</tr>
						</thead>
						<tbody id="content_tr">
							<c:forEach var="item" items="${result}">
								<tr style="font-weight: bold;">
									<td>
										${item.cargo_username}
									</td>
									<td>
										${item.origin_province}${item.origin_city}${item.origin_country}
									</td>
									<td>
										${item.dest_province}${item.dest_city}${item.dest_country}
									</td>
									<td>
										${item.cargo_type}
									</td>
									<td>
										${item.number}${item.unit}
									</td>
									<td>
										${item.truck_type}
									</td>
									<td>
										<c:choose>
											<c:when test="${empty item.freight}">
										面谈
									</c:when>
											<c:otherwise>
										${item.freight}
									</c:otherwise>
										</c:choose>
									</td>
									<td>
										${item.payment_method}
									</td>
									<td>
										${item.cargo_phone}
									</td>
									<td>
										<c:choose>
											<c:when test="${empty item.start_time}">
										未设置
									</c:when>
											<c:otherwise>
										${item.start_time}
									</c:otherwise>
										</c:choose>
									</td>
									<td>
										<c:choose>
											<c:when test="${empty item.end_time}">
										未设置
									</c:when>
											<c:otherwise>
										${item.end_time}
									</c:otherwise>
										</c:choose>
									</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
			</c:otherwise>
		</c:choose>
		<%--
		<div
			style=" bottom: 0px; width: 100%; text-align: center;">
			<jsp:include page="footer.jsp"></jsp:include>
		</div>
	--%>
	</body>

</html>
