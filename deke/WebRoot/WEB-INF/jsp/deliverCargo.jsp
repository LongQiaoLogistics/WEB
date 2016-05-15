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
var s_province = null;
var s_city = null;
var s_county = null;
var s_province_end = null;
var s_city_end = null;
var s_county_end = null;
var originLocation = null;
var endLocation = null;
var output = "";
var map = null;
//初始化地图展示
function mapInit() {
	map.centerAndZoom("中国", 4);
	disptime();
}
/*baiduMap一些无法显示的区域,通过设置路名显示出来*/
var noWayShowCity = [ "上海市", "北京市", "天津市" ];
var noWayShowCountry = [ [ "长宁区", "闵行区", "宝山区", "嘉定区", "浦东新区" ],
		[ "西城区", "崇文区", "宣武区", "朝阳区", "丰台区", "海淀区", "昌平区" ],
		[ "汉沽区", "塘沽区", "和平区" ] ];
var showCountryByRoad = [
		[ "上海市长宁区政府", "上海市闵行区政府", "上海市宝山区政府", "上海市嘉定区政府", "浦东新区港城路" ],
		[ "北京市西城区政府", "北京市崇文区崇文门", "北京市宣武区宣武门", "北京市朝阳区政府", "北京市丰台区政府",
				"北京市海淀区政府", "北京市昌平区政府" ], [ "天津市汉沽区府南街", "天津市向阳街", "天津市和平区政府" ] ];
function disptime() {
	var time = new Date(); //获得当前时间 
	var year = time.getFullYear();
	var month = time.getMonth() + 1;
	var day = time.getDate();
	var hour = time.getHours(); //获得小时、分钟、秒 
	var minute = time.getMinutes();
	var second = time.getSeconds();
	if (minute < 10) //如果分钟只有1位，补0显示 
		minute = "0" + minute;
	if (second < 10) //如果秒数只有1位，补0显示 
		second = "0" + second;
	/*设置文本框的内容为当前时间*/
	$("#displayTime").html(
			"<span style=\"color:red;\">友情提示</span>:当前时间为" + year + "年" + month
					+ "月" + day + "日   " + hour + ":" + minute + ":" + second);
	/*设置定时器每隔1秒(1000毫秒)，调用函数disptime()执行，刷新时钟显示*/
	var myTime = setTimeout("disptime()", 1000);
}
$(document).ready(function() {
			map = new BMap.Map("baiduMap"); // 创建地图实例  
				map.addControl(new BMap.NavigationControl());
				map.addControl(new BMap.ScaleControl());
				map.addControl(new BMap.OverviewMapControl());
				map.addControl(new BMap.MapTypeControl());
				map.enableScrollWheelZoom(); //启用滚轮放大缩小，默认禁用
				map.enableContinuousZoom();
				map.addControl(new BMap.OverviewMapControl()); //添加默认缩略地图控件
				var driving = new BMap.DrivingRoute(map, {
					renderOptions : {
						map : map,
						autoViewport : true
					}
				});
				//设置起终点函数
				var setMap = function(origin, end) {
					driving.search(origin, end);
				}
				//计算距离函数
				var searchComplete = function(results) {
					if (transit.getStatus() != BMAP_STATUS_SUCCESS) {
						return;
					}
					var plan = results.getPlan(0);
					output = "";
					output += "<label style='color:red;'>从</label>" + s_county
							+ "<label style='color:red;'>至</label>"
							+ s_county_end + "  全程约:<label style='color:red;'>"
							+ plan.getDistance(true)
							+ "</label>  耗时约:<label style='color:red;'>"
							+ plan.getDuration(true) + "</label>";
				}
				var transit = new BMap.DrivingRoute(map, {
					renderOptions : {
						map : map
					},
					onSearchComplete : searchComplete,
					onPolylinesSet : function() {
						$("#baiduMapPrompt").html(output);
						setMap(originLocation, endLocation);
					}
				});
				var changeBaiduMap = function() {
					s_province = $("#s_province").val();
					s_city = $("#s_city").val();
					s_county = $("#s_county").val();
					s_province_end = $("#s_province_end").val();
					s_city_end = $("#s_city_end").val();
					s_county_end = $("#s_county_end").val();
					var findNoWay = false;
					var findNoWay_end = false;
					var markI = 0;
					var markJ = 0;
					var markI_end = 0;
					var markJ_end = 0;
					for ( var i = 0; i < noWayShowCity.length; i++) {
						if (s_city == noWayShowCity[i]) {
							for ( var j = 0; j < noWayShowCountry[i].length; j++) {
								if (s_county == noWayShowCountry[i][j]) {
									findNoWay = true;
									markI = i;
									markJ = j;
									break;
								}
							}
							break;
						}
					}
					for ( var i = 0; i < noWayShowCity.length; i++) {
						if (s_city_end == noWayShowCity[i]) {
							for ( var j = 0; j < noWayShowCountry[i].length; j++) {
								if (s_county_end == noWayShowCountry[i][j]) {
									findNoWay_end = true;
									markI_end = i;
									markJ_end = j;
									break;
								}
							}
							break;
						}
					}
					originLocation = (findNoWay == true ? showCountryByRoad[markI][markJ]
							: s_county);
					endLocation = (findNoWay_end == true ? showCountryByRoad[markI_end][markJ_end]
							: s_county_end);
					transit.search(originLocation, endLocation);
				}
				$("#s_county_end").change(function() {
					changeBaiduMap();
				});
				$("#s_county").change(function() {
					if ($("#s_county_end").val() != "市、县级市") {
						changeBaiduMap();
					}
				});
			function isfloat(oNum){
	  if(!oNum) return false;
	  var strP=/^\d+(\.\d+)?$/;
	  if(!strP.test(oNum)) return false;
	  try{
	  	if(parseFloat(oNum)!=oNum) return false;
	  }catch(ex){
	    return false;
	  }
	  return true;
	}
				var now = new Date();
        		var year = now.getFullYear();     
        		var month = now.getMonth() + 1;
        		var day = now.getDate();  
   				 $(".form_datetime").datetimepicker({　minView: "month",format:'yyyy-mm-dd',language: 'zh-CN',autoclose:true, startDate: year+"-"+month+"-"+day,});
   				 $("#release").click(function(){
   					origin_province = $("#s_province").val();
					if(origin_province == "省份"){
							alert("发布失败了额,	            错误原因为：您未设置起点,至少需要设置省份,如上海市!!!!!!!!");
						return false;
					}   					
					origin_country = $("#s_county").val();
					origin_city = $("#s_city").val();
					dest_city= $("#s_city_end").val();
			        dest_province= $("#s_province_end").val();
					if(dest_province == "省份"){
						alert("发布失败了额,	            错误原因为：您未设置终点,至少需要设置省份,如上海市!!!!!!!!");
						return false;
					}   					
					dest_country = $("#s_county_end").val();
					cargo_type = $("#cargo_type").val();//货物类型
					if(cargo_type == 400){
						alert("发布失败了额,	           错误原因为：您未设置货物类型!!!!!!!!");
						return false;
					}
					number = $("#number").val();//数量
					if(!isfloat(number)){
						alert("发布失败了额,	   	 错误原因为：您输入的数量的格式错误, 应该输入如: 88  或者  8.88 这种格式!!!!!!!!");
						return false;
					}
					unit = $("#unit").val();//单位
					if(unit == "401" ){
						alert("发布失败了额,   	 错误原因为：您未设置单位!!!!!!!!");
						return false;
					}
					truck_type = $("#truck_type").val();//车辆类型、、
					freight = $("#freight").val();//运费
					if(!isfloat(freight)){
						alert("发布失败了额,	   	 错误原因为：您输入的运费的格式错误, 应该输入如: 88  或者  88888.88 这种格式!!!!!!!!");
						return false;
					}
					payment_method = $("#payment_method").val();//付款方式
					if(payment_method == "403" ){
						alert("发布失败了额,   	 错误原因为：您未设置付款方式!!!!!!!!");
						return false;
					}
					start_time = $("#start_time").val();//起运时间
					end_time = $("#end_time").val();//到货时间
					username = $("#cargo_username").val();
					if(username == ""){
						alert("发布失败了额,   	 错误原因为：您未设置联系人!!!!!!!!");
						return false;
					}
					var phoneReg = /^0{0,1}(13[0-9]|145|15[0-9]|153|156|18[0-9])[0-9]{8}$/;
					phone = $("#cargo_phone").val();
					if(phone == ""){
						alert("发布失败了额,   	 错误原因为：您未设置手机号码!!!!!!!!");
						return false;
					}
					if (!phoneReg.test($.trim(phone))) {
						alert("发布失败了额,   	 错误原因为：您手机号码"+phone+"格式不正确!!!!!!!!");
						return false;
					}
   					 $.post("lq/cargo/insertCargo",{"cargo_username":username,"cargo_phone":phone,"origin_province":origin_province,"origin_country":origin_country,"origin_city":origin_city,"dest_province":dest_province,"dest_country":dest_country,"dest_city":dest_city,"cargo_type":cargo_type,"number":number,"unit":unit,"truck_type":truck_type,"freight":freight,"payment_method":payment_method,"start_time":start_time,"end_time":end_time},
  					 function(data){
   						if(data.flag){
   							alert("恭喜,发布成功!!!!!!!!")
   						}else{
   							alert("发布失败,请重新发布!")
   						}
     					});
   				 });
			});
</script>
	</head>
	<body onload="mapInit()">
		<div class="header">
			<!-- bootStrap头文件开始 -->
			<jsp:include page="bootStrapHead.jsp"></jsp:include>
			<!-- bootStrap头文件结束 -->
		</div>
		<div class="container-fluid">
			<div class="main">
				<div class="row">
					<div class="col-md-5">
						<div class="row">
							<div class="col-md-12">
								<ol class="breadcrumb" style="background-color: CCCC99">
									<li>
										<kbd>
											线路图:
										</kbd>
									</li>
									<li style="font-weight: bold;" id="baiduMapPrompt">
										<span style="color: red;">提示:</span>设置好起点和终点,地图会显示相应的路线,距离和时间
									</li>
								</ol>
							</div>
						</div>
						<div id="baiduMap"
							style="width: 100%; height: 500px; border: 2px #999999 solid;">
						</div>
					</div>
					<div class="col-md-7">
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
						<div class="row">
							<div class="col-md-10 col-md-offset-1">
								<form class="form-inline" role="form">
									<div class="form-group">
										<div class="input-group">
											<div class="input-group-addon">
												<i class="icon-circle-arrow-left icon-large"></i> 起点
												<span style="color: FF0000">*</span>
											</div>
											<select id="s_province" name="s_province"
												class="form-control lq-deliver-form"></select>
										</div>
									</div>
									<div class="form-group">
										<select id="s_city" name="s_city"
											class="form-control lq-deliver-form"></select>
									</div>
									<div class="form-group">
										<select id="s_county" name="s_county"
											class="form-control lq-deliver-form"></select>
									</div>
									<script type="text/javascript">
_init_area();</script>
								</form>
							</div>
						</div>
						<div class="row">
							<div class="col-md-10 col-md-offset-1">
								<div class="form-group">
									<form class="form-inline" role="form">
										<div class="input-group">
											<div class="input-group-addon">
												<i class="icon-circle-arrow-right icon-large"></i> 终点
												<span style="color: FF0000">*</span>
											</div>
											<select id="s_province_end" name="s_province"
												class="form-control lq-deliver-form"></select>
										</div>
										<div class="form-group">
											<select id="s_city_end" name="s_city"
												class="form-control lq-deliver-form">
											</select>
										</div>
										<div class="form-group">
											<select id="s_county_end" name="s_county"
												class="form-control lq-deliver-form"></select>
										</div>
										<script type="text/javascript">
_init_area_end();</script>
									</form>
								</div>
							</div>
						</div>
						<div class="row">
							<div class="col-md-10 col-md-offset-1">
								<div class="form-group">
									<form class="form-inline" role="form">
										<div class="input-group">
											<div class="input-group-addon">
												<i class=" icon-shopping-cart icon-large"></i> 货物类型
												<span style="color: FF0000">*</span>
											</div>
											<select class="form-control lq-deliver-form" id="cargo_type">
												<option value="400">
												</option>
												<c:forEach items="${peList}" var="pe">
													<c:if test="${fn:startsWith(pe.code,'0')}">
														<option value="${pe.code}">
															${pe.entity}
														</option>
													</c:if>
												</c:forEach>
											</select>
										</div>
										<div class="input-group">
											<div class="input-group-addon">
												<i class="icon-truck icon-large"></i> 车辆类型
											</div>
											<select class="form-control lq-deliver-form" id="truck_type">
												<option value="402">

												</option>
												<c:forEach items="${peList}" var="pe">
													<c:if test="${fn:startsWith(pe.code,'1')}">
														<option value="${pe.code}">
															${pe.entity}
														</option>
													</c:if>
												</c:forEach>
											</select>
										</div>
									</form>
								</div>
							</div>
						</div>

						<div class="row">
							<div class="col-md-10 col-md-offset-1">
								<div class="form-group">
									<form class="form-inline" role="form">
										<div class="input-group">
											<div class="input-group-addon">
												<i class=" icon-tags icon-large"></i> 数量
												<span style="color: FF0000; font-size: 4pt">*</span>
											</div>
											<input type="text" class="form-control lq-deliver-form"
												id="number" />
											<div class="input-group-addon">
												单位
												<span style="color: FF0000">*</span>
											</div>
											<select class="form-control lq-deliver-form" id="unit">
												<option value="401">

												</option>
												<c:forEach items="${peList}" var="pe">
													<c:if test="${fn:startsWith(pe.code,'2')}">
														<option value="${pe.code}">
															${pe.entity}
														</option>
													</c:if>
												</c:forEach>
											</select>
										</div>
										<span style="color: red; font-weight: bold;">例如88吨,或者88方</span>
									</form>
								</div>
							</div>
						</div>
						<div class="row">
							<div class="col-md-10 col-md-offset-1">
								<div class="form-group">
									<form class="form-inline" role="form">
										<div class="input-group">
											<div class="input-group-addon">
												<i class=" icon-money icon-large"></i> &nbsp;运费
											</div>
											<input type="text" class="form-control lq-deliver-form"
												id="freight">
											<div class="input-group-addon">
												元
											</div>
										</div>
										<div class="input-group">
											<div class="input-group-addon">
												<i class="icon-credit-card icon-large"></i> 付款方式
												<span style="color: FF0000">*</span>
											</div>
											<select class="form-control lq-deliver-form"
												id="payment_method">
												<option value="403">

												</option>
												<c:forEach items="${peList}" var="pe">
													<c:if test="${fn:startsWith(pe.code,'3')}">
														<option value="${pe.code}">
															${pe.entity}
														</option>
													</c:if>
												</c:forEach>
											</select>
										</div>
									</form>
								</div>
							</div>
						</div>
						<div class="row">
							<div class="col-md-10 col-md-offset-1">
								<div class="form-group">
									<form class="form-inline" role="form">
										<div class="input-group">
											<div class="input-group-addon">
												<i class="icon-large icon-user"></i> 联系人
												<span style="color: FF0000">*</span>
											</div>
											<input class="form-control lq-deliver-form"
												id="cargo_username" />
										</div>
										<div class="input-group">
											<div class="input-group-addon">
												<i class="icon-phone-sign icon-large"></i> 手机
												<span style="color: FF0000">*</span>
											</div>
											<input type="text" class="form-control lq-deliver-form"
												id="cargo_phone">
										</div>
									</form>
								</div>
							</div>
						</div>
						<div class="row">
							<div class="col-md-10 col-md-offset-1">
								<div class="form-group">
									<form class="form-inline" role="form">
										<div class="input-group">
											<div class="input-group-addon">
												<i class="icon-large icon-calendar"></i> 起运时间
											</div>
											<input type="text" readonly
												class="form_datetime form-control" id="start_time">
										</div>
										<div class="input-group">
											<div class="input-group-addon">
												<i class=" icon-time icon-large"></i> 收货时间
											</div>
											<input type="text" readonly
												class="form_datetime form-control" id="end_time">
										</div>
									</form>
								</div>

							</div>
						</div>
						<div class="row">
							<div class="col-md-10 col-md-offset-1">
								<span id="displayTime"
									style="color: #000066; font-weight: bold;"></span>
							</div>
						</div>
						<div class="row">
							<div class="col-md-10 col-md-offset-1">
								&nbsp;
							</div>
						</div>
						<div class="row">
							<div class="col-md-10 col-md-offset-1">
								<button type="button" class="form-control btn-primary release"
									id="release">
									发布
								</button>
							</div>
						</div>
					</div>
				</div>
			</div>
			<jsp:include page="bootStrapFoot.jsp"></jsp:include>
		</div>
	</body>
</html>
