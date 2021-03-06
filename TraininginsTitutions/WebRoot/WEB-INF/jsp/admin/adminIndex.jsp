<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<c:set scope="request" value="${pageContext.request.contextPath }"
	var="Path" />
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8" />
<title>管理员页面</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta
	content="A fully featured admin theme which can be used to build CRM, CMS, etc."
	name="description" />
<meta content="Coderthemes" name="author" />
<meta http-equiv="X-UA-Compatible" content="IE=Edge，chrome=1">
<script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>

<script
	src="https://oss.maxcdn.com/libs/respond.js/1.3.0/respond.min.js"></script>
<!-- App favicon -->
<link rel="shortcut icon" href="assets/images/favicon.ico">

<!-- App css -->
<link href="${Path }/static/css/icons.min.css" rel="stylesheet"
	type="text/css" />
<link href="${Path }/static/css/app.min.css" rel="stylesheet"
	type="text/css" />
<link href="${Path }/static/css/style.css" rel="stylesheet"
	type="text/css" />
<meta http-equiv="X-UA-Compatible" content="IE=edge chrome=1">
</head>
<!--[if lt IE9]>
	<script>
	  (function() {
	   if (!
	   /*@cc_on!@*/
	   0) return;
	   var e = "abbr, article, aside, audio, canvas, datalist, details, dialog, eventsource, figure, footer, header, hgroup, mark, menu, meter, nav, output, progress, section, time, video".split(', ');
	   var i= e.length;
	   while (i--){
	     document.createElement(e[i])
	   }
	})()
	</script>
	<![endif]-->

<body>

	<!-- Begin page -->
	<div class="wrapper">

		<!-- ========== Left Sidebar Start ========== -->
		<%@include file="/WEB-INF/jsp/admin/bar/leftSidebar.jsp"%>
		<div class="content-page">
			<div class="content">

				<!-- Start Content-->
				<div class="container-fluid">

					<div class="content">

						<!-- Start Content-->
						<div class="container-fluid">
							<div class="navbar-custom">
								<ul class="list-unstyled topbar-right-menu float-right mb-0">


									<li class="dropdown notification-list"><a
										class="nav-link dropdown-toggle nav-user arrow-none mr-0"
										data-toggle="dropdown" href="#" role="button"
										aria-haspopup="false" aria-expanded="false"> <span
											class="account-user-avatar"> <img
												src="${Path }/static/images/avatar-1.jpg" alt="user-image"
												class="rounded-circle">
										</span> <span> <span class="account-user-name">${user.loginName }
											</span> <span class="account-position">管理员</span>
										</span>
									</a>
										<div
											class="dropdown-menu dropdown-menu-right dropdown-menu-animated topbar-dropdown-menu profile-dropdown">
											<!-- item-->
											<div class=" dropdown-header noti-title">
												<h6 class="text-overflow m-0">欢迎 !</h6>
											</div>


											<!-- item-->
											<a href="javascript:void(0);"
												class="dropdown-item notify-item"
												onclick="switchingAccounts()"> <i
												class="mdi mdi-account-edit mr-1"></i> <span>切换账号 </span>
											</a>

											<!-- item-->
											<a href="welCome.html" class="dropdown-item notify-item">
												<i class="mdi mdi-lifebuoy mr-1"></i> <span>退出 </span>
											</a>


										</div></li>
								</ul>
								<button class="button-menu-mobile open-left disable-btn">
									<i class="mdi mdi-menu"></i>
								</button>
							</div>
							<!-- end Topbar -->
							<!-- start page title -->
							<div class="row">
								<div class="col-12">
									<div class="page-title-box">
										<div class="page-title-right">
											<ol class="breadcrumb m-0">
												<li class="breadcrumb-item"><a
													href="javascript: void(0);">Hyper</a></li>
												<li class="breadcrumb-item"><a
													href="javascript: void(0);">Pages</a></li>
												<li class="breadcrumb-item active">FAQ</li>
											</ol>
										</div>
										<h4 class="page-title">学校信息</h4>
									</div>
								</div>
							</div>
							<!-- end page title -->

							<!-- end row -->
							<div class="row">
								<div class="col-md-3">
									<div class="form-group">
										<label for="billing-first-name">开始日期</label> <input
											class="form-control" type="date" id="startTime" />
									</div>
								</div>
								<div class="col-md-3">
									<div class="form-group">
										<label for="billing-first-name">截至日期</label> <input
											class="form-control" type="date" id="endTime" />
									</div>
								</div>
								<div class="col-md-3">
									<div class="form-group">
										<label for="billing-first-name">省份</label> <select
											class="form-control" id="provinceId"
											onchange="provinceChange()">
											<option value="">请选择省份</option>
											<c:forEach items="${provinceList }" var="pro">
												<option value="${pro.provinceId }">${pro.provinceName }</option>
											</c:forEach>
										</select>
									</div>
								</div>

								<div class="col-md-3">
									<div class="form-group">
										<label for="billing-first-name">城市</label> <select
											class="form-control" id="cityId" onchange="cityChange()">
											<option value="">请选择城市</option>
											<c:forEach items="${cityList }" var="pro">
												<option value="${pro.cityId }">${pro.cityName }</option>
											</c:forEach>
										</select>
									</div>
								</div>
							</div>
							<div class="col-12">
								<div class="card">
									<div class="card-body">
										<div class="row mb-2">
											<div class="col-sm-4">
												<button type="button" class="btn btn-success btn-sm mt-2"
													onclick="createSchool()">创建学校</button>
												
												<button type="button" class="btn btn-success btn-sm mt-2"
													onclick="query()">查询</button>
												<button type="button" class="btn btn-success btn-sm mt-2"
													onclick="querySchool()">查看学校账户详情</button>
											</div>
											<div class="col-sm-8">
												<div class="text-sm-right">
												<button type="button" class="btn btn-success btn-sm mt-2"
													onclick="delSchool()">删除学校</button>
													<button type="button" class="btn btn-info btn-sm mt-2 ml-1"
														onclick="createUser()">创建账号</button>
													<button type="button" class="btn btn-info btn-sm mt-2 ml-1"
														onclick="createTeacher()">创建教师账号</button>
												</div>
											</div>
											<!-- end col-->
										</div>
										<div class="row">
											<div class="col-sm-12">
												<div class="text-center">
													<h3 class="">管理学校及城市</h3>
													<p class="text-muted mt-3">需要先添加 省份--->城市--->学校--->创建账号
														步骤</p>
												</div>
											</div>
											<!-- end col -->
										</div>
										<!-- end row -->
										<!-- Question/Answer -->
										<div class="table-responsive">
											<table
												class="table table-centered table-striped dt-responsive nowrap w-100"
												id="products-datatable">
												<thead>
													<tr>
														<th style="width: 20px;">
															<div class="custom-control custom-checkbox">
																<input type="checkbox" class="custom-control-input"
																	id="customCheck1"> <label
																	class="custom-control-label" for="customCheck1">&nbsp;</label>
															</div>
														</th>
														<th>学校编号</th>
														<th>学校名称</th>
														<th>学校所属城市</th>
														<th>学校备注</th>
														<th>学校所属省份</th>
														<th>学校支出金额</th>
														<th>学校收入金额</th>
														<th>学校账户余额</th>
														<th>手续费总额</th>
														<th>学校收入项目金额</th>
													</tr>
												</thead>
												<tbody>
													<c:forEach items="${schoolListAll }" var="school">
														<tr class="schoolId">
															<td>
																<div class="custom-control custom-checkbox">
																	<input type="checkbox"
																		class="custom-control-input customCheckes"> <label
																		class="custom-control-label customCheck"
																		for="customCheck2">&nbsp;</label>
																</div>
															</td>
															<td class="table-user"><a href="javascript:void(0);"
																class="text-body font-weight-semibold">${school.schoolId }</a>
															</td>
															<td class="table-user"><a href="javascript:void(0);"
																class="text-body font-weight-semibold">${school.schoolName }</a>
															</td>
															<td class="table-user"><a href="javascript:void(0);"
																class="text-body font-weight-semibold">${school.city.cityName }</a>
															</td>
															<td class="table-user"><a href="javascript:void(0);"
																class="text-body font-weight-semibold">${school.schoolRemarks }</a>
															</td>
															<td class="table-user"><a href="javascript:void(0);"
																class="text-body font-weight-semibold">${school.province.provinceName }</a>
															</td>
															<td class="table-user"><a href="javascript:void(0);"
																class="text-body font-weight-semibold">${school.schoolExPenSum}</a>
															</td>
															<td class="table-user"><a href="javascript:void(0);"
																class="text-body font-weight-semibold">${school.schoolFeeceat}</a>
															</td>
															<td class="table-user"><a href="javascript:void(0);"
																class="text-body font-weight-semibold">${school.schoolFeeceat - school.schoolExPenSum}</a>
															</td>
															<td class="table-user"><a href="javascript:void(0);"
																class="text-body font-weight-semibold">${school.serviceCharge}</a>
															</td>
															<td class="table-user"><a href="javascript:void(0);"
																class="text-body font-weight-semibold"> <c:forEach
																		items="${smList }" var="sm">
																		<c:if test="${sm.schoolId == school.schoolId }">
																	${sm.feeName } : ${sm.sumMoney }</a> </c:if>
													</c:forEach>
													</td>
													</tr>
													</c:forEach>
												</tbody>
											</table>
										</div>

									<span hidden="hidden" id="adminState">${user.state}</span>
										<!-- ============================================================== -->
										<!-- End Page content -->
										<!-- ============================================================== -->

									</div>
									<!-- App js -->
									<%@include file="/WEB-INF/jsp/importJsFoot/foot.jsp"%>
									<script src="${Path }/static/js/admin/leftSidebar.js"></script>
									<script src="${Path }/static/js/login.js"></script>
									<script src="${Path }/static/js/admin/adminIndex.js"></script>
</body>
</html>
