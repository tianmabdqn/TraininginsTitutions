$(function() {
	//	$(".dpMoney").val($(".feecateId option:selected").attr("name"));
	//	var Time = new Date();
	//	var month = null;
	//	if ((Time.getMonth() + 1) < 10) {
	//		month = 0 + (Time.getMonth() + 1).toString();
	//	}else {
	//		month = Time.getMonth()+1;
	//	}
	//	$(".date").val(Time.getFullYear() + "-" + month + "-" + Time.getDate());
	//	$(".feecateId").click(function() {
	//		$(".dpMoney").val($(".feecateId option:selected").attr("name"));
	//	});
	for (var i = 0; i < $(".giftIdes").length; i++) {
		if (($.trim($(".giftIdes").eq(i).text())) != "无") {
			for (var is = 0; is < $(".giftName option").length; is++) {
				if (parseInt($.trim($(".giftIdes").eq(i).attr("name"))) == ($.trim($(".giftName option").eq(is).val()))) {
					$(".giftIdes").eq(i).text($.trim($(".giftName option").eq(is).text()));
				}
			}
		}
	}
	for (var i = 0; i < $(".feecateIds2").length; i++) {
		for (var j = 0; j < $(".feecateIds2").eq(i).attr("name").split(",").length; j++) {
				$(".feecateIds option").each(function() {
					if($(".feecateIds2").eq(i).attr("name").split(",")[j] == $(this).val()) {
						$(".feecateIds2").eq(i).text($(".feecateIds2").eq(i).text().toString() + "/" + $(this).text().toString());
					}
				});
		}
	}
	var a = "";
	for (var i = 0; i < $(".feecateIds2").length; i++) {
		a = $(".feecateIds2").eq(i).text().toString();
		$(".feecateIds2").eq(i).text(a.substr(1));
	}
	delOrder = function() {
		if ($(".customCheckes:checked").length < 1) {
			if (!$(".customCheckes").prop("checked")) {
				alert("请选中一条数据！");
				return false;
			}
		} else if ($(".customCheckes:checked").length > 1) {
			alert("只能选中一条数据！");
			return false;
		}
		if (confirm("确认删除吗？")) {
			var orderId = $(".customCheckes:checked").parent().parent().next().text();
			var stuId = $(".customCheckes:checked").parent().parent().next().attr("class");
			var giftNumber = $(".customCheckes:checked").parent().parent().next().next().next().next().next().next().next().next().next().next().attr("class");
			var giftId = $(".customCheckes:checked").parent().parent().next().next().next().next().next().next().next().next().next().attr("class");
			var integral = -parseInt($(".customCheckes:checked").parent().parent().next().next().next().next().next().next().next().next().next().next().next().attr("class"));
			var hour = -parseInt((new Date($(".customCheckes:checked").parent().parent().next().next().next().next().next().next().next().next().next().text().replace(/-/g, "/")).getTime() - new Date($(".customCheckes:checked").parent().parent().next().next().next().next().next().next().next().next().text().replace(/-/g, "/")).getTime()) / (1000 * 60 * 60 * 24));
			$.ajax({
				type : "POST",
				url : "delCharge.html",
				data : {
					orderId : orderId,
					hour : hour,
					stuId : stuId,
					giftNumber : giftNumber,
					giftId : giftId,
					integral : integral
				},
				dataType : "json",
				success : function(data) {
					data = JSON.parse(data);
					if (data.del == "1") {
						alert("删除成功！");
						location.href = "selectOrderPeriod.html";
					} else {
						alert("删除失败！");
						location.href = "selectOrderPeriod.html";
					}
				},
				error : function(data) {
					alert("系统出错！");
					location.href = "selectOrderPeriod.html";
				}
			});
		} else {
			return false;
		}
	};

//	updateOrder = function() {
//		if ($(".customCheckes:checked").length < 1) {
//			if (!$(".customCheckes").prop("checked")) {
//				alert("请选中一条数据！");
//				return false;
//			}
//		} else if ($(".customCheckes:checked").length > 1) {
//			if ($(".customCheckes").prop("checked")) {
//				alert("只能选中一条数据！");
//				return false;
//			}
//		}
//		$(".date").val($(".customCheckes:checked").parent().parent().next().next().next().text());
//		$(".dpMoney").val($(".customCheckes:checked").parent().parent().next().next().next().next().next().next().next().text());
//		$(".firstdate").val($(".customCheckes:checked").parent().parent().next().next().next().next().next().next().next().next().text());
//		$(".lastdate").val($(".customCheckes:checked").parent().parent().next().next().next().next().next().next().next().next().next().text());
//		$(".stuId").val($(".customCheckes:checked").parent().parent().next().next().next().next().next().text());
//		$(".personliable").val($(".customCheckes:checked").parent().parent().next().next().next().next().next().next().next().next().next().next().text());
//		$(".paymentmethodId").val($(".customCheckes:checked").parent().parent().next().next().next().next().next().next().attr("class"));
//		$(".feecateId").val($(".customCheckes:checked").parent().parent().next().next().next().next().next().next().attr("class"));
//		$(".integral").val($(".customCheckes:checked").parent().parent().next().next().next().next().next().next().next().next().next().next().next().attr("class"));
//		$(".remarks").val($(".customCheckes:checked").parent().parent().next().next().next().next().next().next().next().next().next().next().next().text());
//		$(".giftName").val($(".customCheckes:checked").parent().parent().next().next().next().next().next().next().next().next().next().attr("class"));
//		$(".teacherId").val($(".customCheckes:checked").parent().parent().next().next().next().next().next().next().next().next().next().next().next().next().attr("class"));
//		$(".giftNumber").val($(".customCheckes:checked").parent().parent().next().next().next().next().next().next().next().next().next().next().attr("class"));
//		$(".dpMoneyActivity").val($.trim($(".customCheckes:checked").parent().parent().next().next().next().next().next().next().next().next().next().next().next().next().next().next().next().next().text()));
//		var integrals = parseInt($.trim($(".integral").val()));
//		var orderIds = $(".customCheckes:checked").parent().parent().next().text();
//		var integral = $(".integral").val();
//		var dpMoney2 = parseInt($(".customCheckes:checked").parent().parent().next().next().next().next().next().next().next().text());
//		var stuId = $(".customCheckes:checked").parent().parent().next().attr("class");
//		var giftNumber3 = parseInt($(".giftNumber").val());
//		var giftNumber2 = parseInt($(".giftNumber").val());
//		var giftId2 = parseInt($(".giftName").val());
//		var time = parseInt((new Date($(".customCheckes:checked").parent().parent().next().next().next().next().next().next().next().next().next().text().replace(/-/g, "/")).getTime() - new Date($(".customCheckes:checked").parent().parent().next().next().next().next().next().next().next().next().text().replace(/-/g, "/")).getTime()) / (1000 * 60 * 60 * 24));
//		$(".showOrder").remove();
//		$(".addOrder").show();
//		if ($(".giftName option:selected").val() == 0) {
//			$('.giftNumber').attr("disabled", true);
//			$(".giftNumber").val("");
//		}
//		var dpMoneys = parseFloat($(".money").val()) / parseInt($(".hour").val());
//		$(".hour").blur(function() {
//			if ($(".hour").val() != 0) {
//				$(".money").val((parseFloat(dpMoneys) * $(".hour").val()).toFixed(1));
//				$(".integral").val($(".money").val());
//			}
//		});
//		$(".money").blur(function() {
//			$(".integral").val($(".money").val());
//		});
//		$(".giftName").click(function() {
//			if ($(".giftName option:selected").val() == 0) {
//				$('.giftNumber').attr("disabled", true);
//				$(".giftNumber").val("");
//			} else {
//				$('.giftNumber').removeAttr("disabled");
//				$(".giftNumber").val(1);
//			}
//		});
//		$(".giftNumber").blur(function() {
//			if (parseInt($.trim($(".giftNumber").val())) > parseInt($.trim($(".giftName option:selected").attr("name")))) {
//				alert("赠品数量不足！");
//				$(".giftNumber").val(1);
//			}
//		});
//		$(".TiJiao").click(function() {
//			var date = $.trim($(".date").val());
//			var dpMoney = $.trim($(".dpMoney").val());
//			var firstdate = $.trim($(".firstdate").val());
//			var lastdate = $.trim($(".lastdate").val());
//			var remarks = $.trim($(".remarks").val());
//			var paymentmethodId = $.trim($(".paymentmethodId").val());
//			var feecateId = $.trim($(".feecateId").val());
//			var giftNumber = parseInt($.trim($(".giftNumber").val()));
//			var giftId = parseInt($.trim($(".giftName option:selected").val()));
//			var integral = parseInt($.trim($(".integral").val()));
//			var teacherId = $.trim($(".teacherId option:selected").val());
//			var personliable = $.trim($(".personliable").val());
//			var time2 = parseInt((new Date(lastdate.replace(/-/g, "/")).getTime() - new Date(firstdate.replace(/-/g, "/")).getTime()) / (1000 * 60 * 60 * 24));
//			var discount = $.trim($(".dpMoneyActivity").val());
//			if(discount == "") {
//				discount = null;
//			}
//			if (dpMoney == "") {
//				alert("请填写收费金额！");
//				return false;
//			} else if (dpMoney < 1) {
//				alert("请填写正确的收费金额！");
//				return false;
//			}
//			if (firstdate == "") {
//				alert("请填写起始日期！");
//				return false;
//			}
//			if (lastdate == "") {
//				alert("请填写截止日期！");
//				return false;
//			}
//			if (personliable == "") {
//				alert("请填写责任人！");
//				return false;
//			}
//			if (time2 > time) {
//				time2 = time2 - time;
//			} else if (time > time2) {
//				time2 = -(time - time2);
//			} else {
//				time2 = 0;
//			}
//			if (integral > integrals) {
//				integrals = integral - integrals;
//			} else if (integral < integrals) {
//				integrals = -(integrals - integral);
//			}
//			if (giftId == giftId2 && giftNumber2 == giftNumber) {
//				giftId = -1;
//			} else if (giftId == giftId2 && giftNumber2 != giftNumber) {
//				giftId = -2;
//				if (giftNumber > giftNumber2) {
//					giftNumber2 = -(parseInt(giftNumber) - parseInt(giftNumber2));
//				} else {
//					giftNumber2 = (parseInt(giftNumber2) - parseInt(giftNumber));
//				}
//			}
//			if (integral == integrals && time == time2) {
//				dpMoney = 0;
//			}
//			if ($(".giftNumber").val() == "") {
//				giftNumber = 0;
//				giftId = -2;
//			}
//			if (giftNumber == "") {
//				giftNumber = 0;
//			}
//			$.ajax({
//				type : "POST",
//				url : "updateCharge.html",
//				data : {
//					stuId : stuId,
//					dpMoney : dpMoney,
//					firstdate : firstdate,
//					lastdate : lastdate,
//					remarks : remarks,
//					paymentmethodId : paymentmethodId,
//					orderId : orderIds,
//					time : time2,
//					giftNumber : giftNumber,
//					giftId : giftId,
//					giftNumber2 : giftNumber2,
//					giftId2 : giftId2,
//					integral : integral,
//					teacherId : teacherId,
//					integrals : integrals,
//					personliable : personliable,
//					discount : discount
//				},
//				dataType : "json",
//				success : function(data) {
//					data = JSON.parse(data);
//					if (data.update == "1") {
//						alert("修改成功！");
//						location.href = "selectOrderPeriod.html";
//					} else {
//						alert("修改失败！");
//						location.href = "selectOrderPeriod.html";
//					}
//				},
//				error : function(data) {
//					alert("系统出错！");
//					location.href = "selectOrderPeriod.html";
//				}
//			});
//		});
//	};
	
//	$("#studentNames").change(function() {
//		if($("#studentNames").val() != 0) {
//			//$("#studentName").text($("#studentNames option:selected").text());
//			var gender = new Date($("#studentNames").val());
//			var year = Time.getFullYear() - gender.getFullYear();
//			var month = Time.getMonth() - gender.getMonth();
//			if(month < 0 || (month === 0 && Time.getDate() < gender.getDate())) {
//				$("#gender").text(year-1);
//			}
//		}
//	});
});