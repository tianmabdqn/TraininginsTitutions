<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<c:set scope="request" value="${pageContext.request.contextPath }"
	var="Path" />
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8" />
<title>管理员页面</title>
<meta http-equiv="X-UA-Compatible" content="IE=edge chrome=1">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta
	content="A fully featured admin theme which can be used to build CRM, CMS, etc."
	name="description" />
<meta content="Coderthemes" name="author" />
<!-- App favicon -->
<link rel="shortcut icon" href="assets/images/favicon.ico">
<meta http-equiv="X-UA-Compatible" content="IE=edge chrome=1">
<!-- App css -->
<link href="${Path }/static/css/icons.min.css" rel="stylesheet"
	type="text/css" />
<link href="${Path }/static/css/app.min.css" rel="stylesheet"
	type="text/css" />
<link href="${Path }/static/css/style.css" rel="stylesheet"
	type="text/css" />
</head>

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

									<span hidden="hidden" id="adminState">${user.state }</span>
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
								<div class="col-sm-12">
									<div class="text-center">
										<h3 class="">管理学校及城市</h3>
										<p class="text-muted mt-3">需要先添加 省份--->城市--->学校--->创建账号 步骤</p>

										<button type="button" class="btn btn-success btn-sm mt-2"
											onclick="createUser()">添加学校操作员</button>
										<button type="button" class="btn btn-info btn-sm mt-2 ml-1"
											onclick="updateUser()">修改操作员</button>
										<button type="button" class="btn btn-info btn-sm mt-2 ml-1"
											onclick="delUser()">删除操作员</button>
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
														id="customCheck1" disabled> <label
														class="custom-control-label" for="customCheck1">&nbsp;</label>
												</div>
											</th>
											<th>操作员编号</th>
											<th>操作员账号</th>
											<th>操作员所属学校</th>
											<th>操作员备注</th>
											<th>操作员电话</th>
										</tr>
									</thead>
									<tbody>
										<c:forEach items="${findUserAllByAdmin }" var="userList">
											<tr class="userId">
												<td>
													<div class="custom-control custom-checkbox">
														<input type="checkbox"
															class="customChecks custom-control-input"> <label
															class="custom-control-label  customCheck"
															for="customCheck2">&nbsp;</label>
													</div>
												</td>
												<td class="table-user"><a href="javascript:void(0);"
													class="text-body font-weight-semibold">${userList.uId }</a>
												</td>
												<td class="table-user"><a href="javascript:void(0);"
													class="text-body font-weight-semibold">${userList.loginName }</a>
												</td>
												<td class="table-user"><a href="javascript:void(0);"
													class="text-body font-weight-semibold"
													value="${userList.school.schoolId }">${userList.school.schoolName }</a>
												</td>
												<td class="table-user"><a href="javascript:void(0);"
													class="text-body font-weight-semibold">${userList.remarks }</a>
												</td>
												<td class="table-user"><a href="javascript:void(0);"
													class="text-body font-weight-semibold">${userList.telephone }</a>
												</td>
											</tr>
										</c:forEach>
									</tbody>
								</table>
							</div>

							<!-- ============================================================== -->
							<!-- End Page content -->
							<!-- ============================================================== -->

						</div>
						<!-- App js -->
						<%@include file="/WEB-INF/jsp/importJsFoot/foot.jsp"%>
						<script type="text/javascript"
							src="${Path }/static/js/admin/adminIndex.js"></script>
						<script src="${Path }/static/js/admin/leftSidebar.js"></script>
						<script src="${Path }/static/js/admin/operator.js"></script>
</body>
</html>
