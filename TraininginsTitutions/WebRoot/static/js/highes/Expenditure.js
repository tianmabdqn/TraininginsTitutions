$(function() {
	for (var i = 0; i < $(".ids").text().length; i++) {
		for (var j = 0; j < $(".departmentOfPediatrics option").length; j++) {
			if ($(".ids").eq(i).text() == $(".departmentOfPediatrics option").eq(j).val()) {
				$(".ids").eq(i).text($(".departmentOfPediatrics option").eq(j).text());
			}
		}
	}
	$(".departmentofpediatricsIds").val($(".classes option:selected").attr("departmentOfPediatrics"));
	var Time = new Date();
	var month = null;
	$(".school").val($(".classes option:selected").attr("schoolIds2"));
	if ((Time.getMonth() + 1) < 10) {
		month = 0 + (Time.getMonth() + 1).toString();
	} else {
		month = Time.getMonth() + 1;
	}
	$(".date").val(Time.getFullYear() + "-" + month + "-" + Time.getDate());

	Hour = function() {
		var classId = $(".classesId").val();
		var studentName = $(".studentName").val();
		if (classId == 0 && studentName == "") {
			alert("请至少选择一项！");
			return false;
		}
		location.href = "selectOrderExpenditure.html?orderCounts=0&classId=" + classId + "&studentName=" + studentName;
	};
	
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
		if($(".QX").val() == 0 ) {
			alert("对不起，您没有权限删除！");
			return false;
		}
		if (confirm("确认删除吗？")) {
			var orderId = $(".customCheckes:checked").parent().parent().next().text();
			$.ajax({
				type : "POST",
				url : "delChargeOtheres.html",
				data : {
					orderId : orderId
				},
				dataType : "json",
				success : function(data) {
					data = JSON.parse(data);
					if (data.del == "1") {
						alert("删除成功！");
						location.href = "selectOrderExpenditure.html?orderCounts=0&classId=0&studentName=000111";
					} else {
						alert("删除失败！");
						location.href = "selectOrderExpenditure.html?orderCounts=0&classId=0&studentName=000111";
					}
				},
				error : function(data) {
					alert("系统出错！");
					location.href = "selectOrderExpenditure.html?orderCounts=0&classId=0&studentName=000111";
				}
			});
		} else {
			return false;
		}
	};
	
	updateOrder = function() {
		if ($(".customCheckes:checked").length < 1) {
			if (!$(".customCheckes").prop("checked")) {
				alert("请选中一条数据！");
				return false;
			}
		} else if ($(".customCheckes:checked").length > 1) {
			alert("只能选中一条数据！");
			return false;
		}
		$(".date").val($(".customCheckes:checked").parent().parent().next().next().next().text());
		$(".expenditureitemsId").val($(".customCheckes:checked").parent().parent().next().next().next().next().attr("class"));
		$(".paymentmethodId").val($(".customCheckes:checked").parent().parent().next().next().next().next().next().next().attr("class"));
		$(".personliable").val($(".customCheckes:checked").parent().parent().next().next().next().next().next().next().next().next().text());
		$(".remarks").val($(".customCheckes:checked").parent().parent().next().next().next().next().next().next().next().next().next().text());
		$(".feecategoryMoney").val($(".customCheckes:checked").parent().parent().next().next().next().next().next().next().next().text());
		$(".stuIds").before("<div class='col-md-6'><div class='form-group mb-3'><label for='example-select'>收款人</label><input class='form-control' type='text' id='billing-last-name' value=" + $(".customCheckes:checked").parent().parent().next().next().next().next().next().text() + " disabled /></div></div>");
		$(".departmentofpediatricsIds").val($(".customCheckes:checked").parent().parent().next().next().next().next().next().next().next().next().next().next().next().text());
		var orderId = $(".customCheckes:checked").parent().parent().next().text();
		$(".stuIds").remove();
		$(".classes2").remove();
		$(".showOrder").remove();
		$(".addOrder").show();
		$(".TiJiao").click(function() {
			var paymentmethodId = $(".paymentmethodId").val();
			var remarks = $.trim($(".remarks").val());
			var expenditureitemsId = $(".expenditureitemsId option:selected").val();
			var personliable = $.trim($(".personliable").val());
			var feecategoryMoney = $.trim($(".feecategoryMoney").val());
			if (feecategoryMoney == "" || parseFloat(feecategoryMoney) < 1) {
				alert("请输入正确的金额！");
				return false;
			} else if (personliable == "") {
				alert("请输入责任人！");
				return false;
			}
			$.ajax({
				type : "POST",
				url : "UpdateOrderExpenditure.html",
				data : {
					expenditureitemsId : expenditureitemsId,
					feecategoryMoney : feecategoryMoney,
					remarks : remarks,
					paymentmethodId : paymentmethodId,
					personliable : personliable,
					orderId : orderId
				},
				dataType : "json",
				success : function(data) {
					data = JSON.parse(data);
					if (data.update == "1") {
						alert("修改成功！");
						location.href = "selectOrderExpenditure.html?orderCounts=0&classId=0&studentName=000111";
					} else {
						alert("修改失败！");
						location.href = "selectOrderExpenditure.html?orderCounts=0&classId=0&studentName=000111";
					}
				},
				error : function(data) {
					alert("系统出错！");
					location.href = "selectOrderExpenditure.html?orderCounts=0&classId=0&studentName=000111";
				}
			});
		});
	};

	addOrders = function() {
		$(".showOrder").remove();
		$(".addOrder").show();
		$(".classes").click(function() {
			$(".departmentofpediatricsIds").val($(".classes option:selected").attr("departmentOfPediatrics"));
			var classIds = $(".classes option:selected").val();
			$.ajax({
				type : "POST",
				url : "selectClassStudent.html",
				data : {
					classId : classIds
				},
				dataType : "json",
				success : function(data) {
					data = JSON.parse(data);
					$(".delSt").remove();
					for (var i = 0; i < data.children.length; i++) {
						$(".stuId").append("<option class='delSt' value='" + data.children[i].studentId + "'> " + data.children[i].studentName + "</option>");
					}

				},
				error : function(data) {
					alert("系统出错！");
					location.href = "selectOrderExpenditure.html?orderCounts=0&classId=0&studentName=000111";
				}
			});
		});
		$(".TiJiao").click(function() {
			var personliable = $.trim($(".personliable").val());
			var feecategoryMoney = $.trim($(".feecategoryMoney").val());
			var stuId = $(".stuId option:selected").val();
			var paymentmethodId = $(".paymentmethodId").val();
			var remarks = $.trim($(".remarks").val());
			var classId = $(".classes option:selected").val();
			var expenditureitemsId = $(".expenditureitemsId option:selected").val();
			var startTime = $.trim($(".date").val());
			var date = Time.getFullYear().toString() + month.toString();
			var startTimes = " " + Time.getHours() + ":" + Time.getMinutes().toString();
			if (stuId == "") {
				alert("请选择学生！");
				return flase;
			}
			if (feecategoryMoney == "" || parseFloat(feecategoryMoney) < 1) {
				alert("请输入正确的金额！");
				return false;
			} else if (personliable == "") {
				alert("请输入责任人！");
				return false;
			}
			$.ajax({
				type : "POST",
				url : "AddOrderExpenditure.html",
				data : {
					stuId : stuId,
					expenditureitemsId : expenditureitemsId,
					feecategoryMoney : feecategoryMoney,
					startTime : startTime,
					remarks : remarks,
					paymentmethodId : paymentmethodId,
					date : date,
					classId : classId,
					personliable : personliable,
					startTimes : startTimes
				},
				dataType : "json",
				success : function(data) {
					data = JSON.parse(data);
					if (data.add == "1") {
						alert("添加成功！");
						location.href = "selectOrderExpenditure.html?orderCounts=0&classId=0&studentName=000111";
					} else {
						alert("添加失败！");
						location.href = "selectOrderExpenditure.html?orderCounts=0&classId=0&studentName=000111";
					}
				},
				error : function(data) {
					alert("系统出错！");
					location.href = "selectOrderExpenditure.html?orderCounts=0&classId=0&studentName=000111";
				}
			});
		});
	};

	Printing = function() {
		$(".dels").remove();
		$(".dels").next().remove();
		$("#dayin").hide();
		if ($(".customCheckes:checked").length < 1) {
			if (!$(".customCheckes").prop("checked")) {
				alert("请选中一条数据！");
				return false;
			}
		} else if ($(".customCheckes:checked").length > 1) {
			alert("只能选中一条数据！");
			return false;
		}
		$("#dayin").show();
		$(".DaYins").show();
		$(".DaYins2").parent().parent().hide();
		var Time = new Date();
		var gender = new Date($(".customCheckes:checked").parent().parent().next().next().next().next().next().next().next().next().next().next().next().next().text());
		var year = Time.getTime() - gender.getTime();
		var month = Math.ceil(year / 1000 / 60 / 60 / 24 / 365);
		$(".NL").text("年龄： " + (month).toString());
		$(".RiQi").text("日期：" + $(".customCheckes:checked").parent().parent().next().next().next().text() + "                   ");
		$(".DJBH").text("单据编号：" + "(" + $(".customCheckes:checked").parent().parent().next().next().text() + ")" + $(".customCheckes:checked").parent().parent().next().next().next().next().next().next().next().next().next().next().text());
		$(".BDKC").text("报读课程：" + $(".customCheckes:checked").parent().parent().next().next().next().next().next().next().next().next().next().next().next().text());
		$(".XSXM").text("学生姓名: " + $(".customCheckes:checked").parent().parent().next().next().next().next().next().text());
		$(".JDXX").text("就读学校：" + $(".customCheckes:checked").parent().parent().next().next().text());
		$(".KS").text("课时：");
		$(".YXQ").text("课程有效期：");
		$(".MONEY").text("￥" + $(".customCheckes:checked").parent().parent().next().next().next().next().next().next().next().text());
		for (var i = 0; i < $(".customCheckes:checked").parent().parent().next().next().next().next().text().split("/").length; i++) {
			for (var j = 0; j < $(".feecateIds option").length; j++) {
				if ($(".customCheckes:checked").parent().parent().next().next().next().next().text().split("/")[i] == $(".feecateIds option").eq(j).text()) {
					RMB = $(".feecateIds option").eq(j).attr("name");
				}
			}
			$(".apps").after("<tr class='dels'><td width='800' colspan='3' height='40px'>" + $(".customCheckes:checked").parent().parent().next().next().next().next().text().split("/")[i] + "</td><td width='800' colspan='3' style='text-align:center'height='40px'>￥" + $(".customCheckes:checked").parent().parent().next().next().next().next().next().next().next().text() + "</td></tr>");
		}
		$("#ChargePeriod td").click(function() {
			$(".WBK").parent().text($(".WBK").val());
			$(".WBK").remove();
			$(this).append("<input type='text' class='WBK'/>");
			$(".WBK").focus();
			$(".WBK").val($(this).text());
			if (!$(".WBK").is(":focus")) {
				alert();
				$(".WBK").focus();
			}
		});
	}

	$(".DaYins").click(function() {
		$("#ChargePeriod").css("width","1550px");
		$(".WBK").parent().text($(".WBK").val());
		$(".WBK").remove();
		bdhtml = $("#dayin").html();
		//alert(bdhtml);
		sprnstr = "<!--startprint-->"; //开始打印标识字符串有17个字符
		eprnstr = "<!--endprint-->"; //结束打印标识字符串
		prnhtml = bdhtml.substr(bdhtml.indexOf(sprnstr) + 17); //从开始打印标识之后的内容
		prnhtml = prnhtml.substring(0, prnhtml.indexOf(eprnstr)); //截取开始标识和结束标识之间的内容
		var iframe = null;
		iframe = document.getElementById("iframe1")

		var iwindow = null;
		var iwindow = iframe.contentWindow; //获取iframe的window对象
		iwindow.document.close();
		iwindow.document.write(prnhtml);
		iwindow.print(); //调用浏览器的打印功能打印指定区域
		$("#ChargePeriod").css("width","100%");
	});
});