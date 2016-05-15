var password = null;
var confirmPassword = null;
$(function() {
	var pw = function() {
		password = $("#password").val();
		confirmPassword = $("#confirmPassword").val();
	}

	var pwsuccess = function() {
		$(".password-error").removeClass("has-error");
		$(".password-error").addClass("has-success");
		$(".password-error p").text("两次的密码一致");
	}
	var pwerror = function() {
		$(".password-error").removeClass("has-success");
		$(".password-error").addClass("has-error");
		$(".password-error p").text("两次的密码不一致,请重新输入");
	}
	$("#password").blur(function() {
		pw();
		if (("" != confirmPassword) && (confirmPassword != password)) {
			pwerror();
		} else if (confirmPassword == password && password != "") {
			pwsuccess();
		}
	});
	$("#confirmPassword").blur(function() {
		pw();
		if (confirmPassword != password) {
			pwerror();
		} else if (confirmPassword != "" && confirmPassword == password) {
			pwsuccess();
		}
	});
	/*手机号码正则表达式 /^0{0,1}(13[0-9]|145|15[7-9]|153|156|18[0-9])[0-9]{8}$/*/
	var phoneReg = /^0{0,1}(13[0-9]|145|15[0-9]|153|156|18[0-9])[0-9]{8}$/;
	$("#phone").blur(function() {
		var phone = $("#phone").val();
		if (phone != "") {
			if (!phoneReg.test($.trim(phone))) {
				$(".phone-error").addClass("has-error");
				$(".phone-error p").text("手机号码格式有误,请检查再次输入");
			} else {
				$(".phone-error").removeClass("has-error");
				$(".phone-error").addClass("has-success");
				$(".phone-error p").text("手机格式正确");
			}
		}else {
			$(".phone-error").removeClass("has-error");
			$(".phone-error").removeClass("has-success");
			$(".phone-error p").text("友情提醒：手机将作为以后登入的账号,请使用常用的手机注册!");
		}
	});
	/*验证码判断*/
	$("#verification_code").blur(function(){
		var verification_code_success = $.trim($("#verification_code_success").text());
		var verification_code = $.trim($("#verification_code").val());
			if(verification_code != "" && verification_code != verification_code_success){
				$(".verification_code_error").addClass("has-error");
				$(".verification_code_error p").text("验证码错误");
			}else if(verification_code == ""){
				$(".verification_code_error").removeClass("has-error");
				$(".verification_code_error").removeClass("has-success");
				$(".verification_code_error p").text("请输入上面的验证码");
			}else{
				$(".verification_code_error").removeClass("has-error");
				$(".verification_code_error").addClass("has-success");
				$(".verification_code_error p").text("验证码正确");
			}		
	});
	$("#username").change(function(){
			var username = $("#username").val();		
			if(username.length > 10){
				$(".username-error").addClass("has-error");
				$(".username-error p").text("用户名超长");
			}else if(username.length == 0){
				$(".username-error").removeClass("has-error");
				$(".username-error").removeClass("has-success");
				$(".username-error p").text("长度不可以超过10个字符,建议使用真实名称");
			}else {
				$(".username-error").removeClass("has-error");
				$(".username-error").addClass("has-success");
				$(".username-error p").text("用户名可用");
			}
		});
});