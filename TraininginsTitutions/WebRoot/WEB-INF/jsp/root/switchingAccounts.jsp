<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
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
<!-- App favicon -->
<link rel="shortcut icon" href="assets/images/favicon.ico">

<!-- App css -->
<link href="${Path }/static/css/icons.min.css" rel="stylesheet"
	type="text/css" />
<link href="${Path }/static/css/app.min.css" rel="stylesheet"
	type="text/css" />

</head>

<body>

	<!-- Begin page -->
	<div class="wrapper">

		<!-- ========== Left Sidebar Start ========== -->
		<%@include file="/WEB-INF/jsp/leftSidebar/leftSidebar.jsp"%>
		<div class="content-page">
			<div class="content">

				<!-- Start Content-->
				<div class="container-fluid">

					<!-- start page title -->
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
									<a href="javascript:void(0);" class="dropdown-item notify-item"
										onclick="switchingAccounts()"> <i
										class="mdi mdi-account-edit mr-1"></i> <span>切换账号 </span>
									</a>


									<!-- item-->
									<a href="welCome.html" class="dropdown-item notify-item"> <i
										class="mdi mdi-lifebuoy mr-1"></i> <span>退出 </span>
									</a>


								</div></li>

						</ul>
						<button class="button-menu-mobile open-left disable-btn">
							<i class="mdi mdi-menu"></i>
						</button>
						<div class="app-search">
							<form>
								<div class="input-group">
									<input type="text" class="form-control" placeholder="Search...">
									<span class="mdi mdi-magnify"></span>
									<div class="input-group-append">
										<button class="btn btn-primary" type="submit">Search</button>
									</div>
								</div>
							</form>
						</div>
					</div>
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
								<th>学校所属类型</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${schoolListByUId }" var="sc">
								<tr class="schoolId">
									<td>
										<div class="custom-control custom-checkbox">
											<input type="checkbox" class="custom-control-input"
												id="customCheck2"> <label
												class="custom-control-label" for="customCheck2">&nbsp;</label>
										</div>
									</td>
									<td class="table-user"><a href="javascript:void(0);"
										class="text-body font-weight-semibold">${sc.school.schoolId }</a>
									</td>
									<td class="table-user"><a href="javascript:void(0);"
										class="text-body font-weight-semibold">${sc.school.schoolName }</a>
									</td>
									<td class="table-user"><a href="javascript:void(0);"
										class="text-body font-weight-semibold">${sc.school.city.cityName }</a>
									</td>
									<td class="table-user"><a href="javascript:void(0);"
										class="text-body font-weight-semibold">${sc.school.schoolRemarks }</a>
									</td>
									<td class="table-user"><a href="javascript:void(0);"
										class="text-body font-weight-semibold">${sc.school.province.provinceName }</a>
									</td>
									<c:choose>
										<c:when test="${sc.school.schoolType == 1}">
											<td class="table-user"><a href="javascript:void(0);"
												class="text-body font-weight-semibold"
												name="${sc.school.schoolType}">少儿</a></td>
										</c:when>

										<c:when test="${sc.school.schoolType == 2}">
											<td class="table-user"><a href="javascript:void(0);"
												class="text-body font-weight-semibold"
												name="${sc.school.schoolType}">高中</a></td>
										</c:when>

										<c:otherwise>
											<td class="table-user"><a href="javascript:void(0);"
												class="text-body font-weight-semibold"
												name="${sc.school.schoolType}">艺考</a></td>
										</c:otherwise>
									</c:choose>
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
			<script src="${Path }/static/js/root/switchingAccounts.js"></script>
</body>
</html>
