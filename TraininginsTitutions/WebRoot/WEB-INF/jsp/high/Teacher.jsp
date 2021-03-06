<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<c:set scope="request" value="${pageContext.request.contextPath }"
	var="Path" />
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8" />
<title>Hyper - Responsive Bootstrap 4 Admin Dashboard</title>
<meta http-equiv="X-UA-Compatible" content="IE=edge chrome=1">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta
	content="A fully featured admin theme which can be used to build CRM, CMS, etc."
	name="description" />
<meta content="Coderthemes" name="author" />
<!-- App favicon -->
<link rel="shortcut icon" href="assets/images/favicon.ico">

<!-- third party css -->
<link href="${Path }/static/css/vendor/dataTables.bootstrap4.css"
	rel="stylesheet" type="text/css" />
<link href="${Path }/static/css/vendor/responsive.bootstrap4.css"
	rel="stylesheet" type="text/css" />
<%@include file="/WEB-INF/jsp/leftSidebar/leftSidebar.jsp"%>
<!-- third party css end -->

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
		<%@include file="/WEB-INF/jsp/leftSidebar/leftSidebar.jsp"%>
		<!-- Left Sidebar End -->
		<!-- ============================================================== -->
		<!-- Start Page Content here -->
		<!-- ============================================================== -->

		<div class="content-page">
			<div class="content">

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
							<div class="dropdown-menu dropdown-menu-right dropdown-menu-animated topbar-dropdown-menu profile-dropdown">
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
				</div>
				<!-- end Topbar -->
				<!-- Start Content-->
				<div class="container-fluid">

					<!-- start page title -->
					<div class="row">
						<div class="col-12">
							<div class="page-title-box">
								<div class="page-title-right">
									<ol class="breadcrumb m-0">
										<li class="breadcrumb-item"><a
											href="javascript: void(0);">校区信息</a></li>
										<li class="breadcrumb-item"><a
											href="javascript: void(0);">教师信息</a></li>
									</ol>
								</div>
								<h4 class="page-title">教师信息</h4>
							</div>
						</div>
					</div>
					<!-- end page title -->

					<div class="row">
						<div class="col-12">
							<div class="card">
								<div class="card-body">
									<div class="row mb-2">
										<div class="col-sm-4">
											<a href="javascript:void(0);"
												class="btn btn-danger mb-2 adds" onclick="addTeacher()"><i
												class="mdi mdi-plus-circle mr-2"></i> 添加</a> <a
												href="javascript:void(0);"
												class="btn btn-danger mb-2 update" onclick="updateUser()"><i
												class="mdi mdi-plus-circle mr-2"></i> 修改</a>
										</div>
										<div class="col-sm-8">
											<div class="text-sm-right">
												<a href="javascript:void(0);"
													class="btn btn-danger mb-2 del" onclick="delTeacher()"><i
													class="mdi mdi-plus-circle mr-2"></i> 删除</a>
												<button type="button" class="btn btn-danger mb-2"
													data-toggle="modal" data-target="#top-modal"><i
													class="mdi mdi-plus-circle mr-2"></i>教师管理授权</button>
												 <a href="javascript:void(0);"
													class="btn btn-danger mb-2 del"
													onclick="teacherAuthorization()">教师跨区授权<i
													class="mdi mdi-plus-circle mr-2"></i>
												</a>  
											</div>
										</div>

										<!-- end col-->
									</div>

									<div class="table-responsive mt-4 Teachers">
										<table class="table table-bordered table-centered mb-0">
											<thead class="thead-light">
												<tr>
													<th style="width: 20px;">
														<div class="custom-control custom-checkbox">
															<input type="checkbox" class="custom-control-input"
																id="customCheck1" disabled> <label
																class="custom-control-label" for="customCheck1">&nbsp;</label>
														</div>
													</th>
													<th>校区</th>
													<th>姓名</th>
													<th>部门</th>
													<th>电话</th>
													<th>备注</th>
													<th>职业</th>
												</tr>
											</thead>
											<tbody>
												<c:forEach items="${ teacher}" var="t">
													<tr>
														<td>
															<div class="custom-control custom-checkbox">
																<input type="checkbox"
																	class="custom-control-input customCheckes"> <label
																	class="custom-control-label customCheck"
																	for="customCheck2">&nbsp;</label>
															</div>
														</td>
														<td id_teacherId="${t.teacherId }" class="schoolIds">${t.school.schoolName }</td>
														<td>${t.teacherName }</td>
														<td>${t.teacherType.teacherTypeName}</td>
														<td>${t.telephone }</td>
														<td id_password="${t.loginPassword }">${t.remarks }</td>
														<td name="${t.deparMent.departmentId}">${t.deparMent.departmentName}</td>
													</tr>
												</c:forEach>
											</tbody>
										</table>
									</div>
								</div>
								<!-- end card-->
								<div class="col-lg-6 addTeacher " style="display:none;">
									<div class="card">
										<div class="card-body">
											<form class="needs-validation">
												<div class="form-group position-relative mb-3">
													<label for="validationTooltip01">校区</label> <input
														type="text" class="form-control schoolName"
														id="validationTooltip01" disabled required> <label
														for="validationTooltip01">姓名</label> <input type="text"
														class="form-control teacherName" id="teacherName"
														onchange="changeTeacherName()" placeholder="请填写姓名"
														required> <label for="validationTooltip01">密码</label>
													<input type="password" class="form-control loginPassword"
														id="exampleInputPassword1" placeholder="请填写密码" required>
													<label for="validationTooltip01">请再次密码</label> <input
														type="password" class="form-control loginPasswords"
														id="exampleInputPassword1" placeholder="请再次填写密码" required>
													<label for="validationTooltip01">职业</label>
													<div class="row">
														<div class="col-12">
															<div class="form-group">
																<select data-toggle="select2" class="teacherTypeName"
																	title="Country">
																	<c:forEach items="${teacherType }" var="t">
																		<option value="${t.teacherTypeId }">${t.teacherTypeName}</option>
																	</c:forEach>
																</select>
															</div>
														</div>
													</div>
													<label for="validationTooltip01">教师部门</label>
													<div class="row">
														<div class="col-12">
															<div class="form-group">
																<select data-toggle="select2" class="departmentId"
																	title="Country">
																	<c:forEach items="${departMents }" var="d">
																		<option value="${d.departmentId }">${d.departmentName}</option>
																	</c:forEach>
																</select>
															</div>
														</div>
													</div>
													<label for="validationTooltip01">电话</label> <input
														type="text" class="form-control telephone"
														data-toggle="input-mask"> <label
														for="validationTooltip01">备注</label> <input type="text"
														class="form-control remarks" id="validationTooltip01"
														placeholder="请填写备注" required>
												</div>
												<button class="btn btn-primary add" type="button">提交</button>
												<button class="btn btn-primary back" type="reset"
													style="float: right;">重置</button>
											</form>

										</div>
										<!-- end card-body-->
									</div>
									<!-- end card-body-->
								</div>
								<!-- end card-->
							</div>
							<!-- end col -->
						</div>
						<!-- end row -->

					</div>
					<!-- container -->

				</div>
				<!-- content -->

				<!-- Footer Start -->
				<footer class="footer">
					<div class="container-fluid">
						<div class="row">
							<div class="col-md-6">2018 - 2019 Â© Hyper -
								Coderthemes.com</div>
							<div class="col-md-6">
								<div class="text-md-right footer-links d-none d-md-block">
									<a href="javascript: void(0);">About</a> <a
										href="javascript: void(0);">Support</a> <a
										href="javascript: void(0);">Contact Us</a>
								</div>
							</div>
						</div>
					</div>
				</footer>
				<!-- end Footer -->

			</div>

			<!-- ============================================================== -->
			<!-- End Page content -->
			<!-- ============================================================== -->


		</div>
		<!-- END wrapper -->


		<!-- Right Sidebar -->
		<div class="right-bar">

			<div class="rightbar-title">
				<a href="javascript:void(0);" class="right-bar-toggle float-right">
					<i class="dripicons-cross noti-icon"></i>
				</a>
				<h5 class="m-0">Settings</h5>
			</div>

			<div class="slimscroll-menu rightbar-content">

				<!-- Settings -->
				<hr class="mt-0" />
				<h5 class="pl-3">Basic Settings</h5>
				<hr class="mb-0" />

				<div class="p-3">
					<div class="custom-control custom-checkbox mb-2">
						<input type="checkbox" class="custom-control-input"
							id="notifications-check" checked> <label
							class="custom-control-label" for="notifications-check">Notifications</label>
					</div>

					<div class="custom-control custom-checkbox mb-2">
						<input type="checkbox" class="custom-control-input"
							id="api-access-check"> <label
							class="custom-control-label" for="api-access-check">API
							Access</label>
					</div>

					<div class="custom-control custom-checkbox mb-2">
						<input type="checkbox" class="custom-control-input"
							id="auto-updates-check" checked> <label
							class="custom-control-label" for="auto-updates-check">Auto
							Updates</label>
					</div>

					<div class="custom-control custom-checkbox mb-2">
						<input type="checkbox" class="custom-control-input"
							id="online-status-check" checked> <label
							class="custom-control-label" for="online-status-check">Online
							Status</label>
					</div>

					<div class="custom-control custom-checkbox mb-2">
						<input type="checkbox" class="custom-control-input"
							id="auto-payout-check"> <label
							class="custom-control-label" for="auto-payout-check">Auto
							Payout</label>
					</div>

				</div>


				<!-- Timeline -->
				<hr class="mt-0" />
				<h5 class="pl-3">Recent Activity</h5>
				<hr class="mb-0" />
				<div class="pl-2 pr-2">
					<div class="timeline-alt">
						<div class="timeline-item">
							<i class="mdi mdi-upload bg-info-lighten text-info timeline-icon"></i>
							<div class="timeline-item-info">
								<a href="#" class="text-info font-weight-bold mb-1 d-block">You
									sold an item</a> <small>Paul Burgess just purchased
									âHyper - Admin Dashboardâ!</small>
								<p class="mb-0 pb-2">
									<small class="text-muted">5 minutes ago</small>
								</p>
							</div>
						</div>

						<div class="timeline-item">
							<i
								class="mdi mdi-airplane bg-primary-lighten text-primary timeline-icon"></i>
							<div class="timeline-item-info">
								<a href="#" class="text-primary font-weight-bold mb-1 d-block">Product
									on the Bootstrap Market</a> <small>Dave Gamache added <span
									class="font-weight-bold">Admin Dashboard</span>
								</small>
								<p class="mb-0 pb-2">
									<small class="text-muted">30 minutes ago</small>
								</p>
							</div>
						</div>

						<div class="timeline-item">
							<i
								class="mdi mdi-microphone bg-info-lighten text-info timeline-icon"></i>
							<div class="timeline-item-info">
								<a href="#" class="text-info font-weight-bold mb-1 d-block">Robert
									Delaney</a> <small>Send you message <span
									class="font-weight-bold">"Are you there?"</span>
								</small>
								<p class="mb-0 pb-2">
									<small class="text-muted">2 hours ago</small>
								</p>
							</div>
						</div>

						<div class="timeline-item">
							<i
								class="mdi mdi-upload bg-primary-lighten text-primary timeline-icon"></i>
							<div class="timeline-item-info">
								<a href="#" class="text-primary font-weight-bold mb-1 d-block">Audrey
									Tobey</a> <small>Uploaded a photo <span
									class="font-weight-bold">"Error.jpg"</span>
								</small>
								<p class="mb-0 pb-2">
									<small class="text-muted">14 hours ago</small>
								</p>
							</div>
						</div>

						<div class="timeline-item">
							<i class="mdi mdi-upload bg-info-lighten text-info timeline-icon"></i>
							<div class="timeline-item-info">
								<a href="#" class="text-info font-weight-bold mb-1 d-block">You
									sold an item</a> <small>Paul Burgess just purchased
									âHyper - Admin Dashboardâ!</small>
								<p class="mb-0 pb-2">
									<small class="text-muted">1 day ago</small>
								</p>
							</div>
						</div>

					</div>
				</div>
			</div>
		</div>


		<div class="rightbar-overlay"></div>
		<!-- /Right-bar -->
		<!-- Top modal content -->
		<div id="top-modal" class="modal fade" tabindex="-1" role="dialog"
			aria-hidden="true">
			<div class="modal-dialog modal-top">
				<div class="modal-content">
					<div class="modal-header">
						<h4 class="modal-title" id="topModalLabel">请选择权限</h4>
						<button type="button" class="close" data-dismiss="modal"
							aria-hidden="true">×</button>
					</div>
					<div class="modal-body">
						<table
							class="table table-centered table-striped dt-responsive nowrap w-100"
							id="products-datatable">
							<thead>
								<tr>
									<th style="width: 20px;">
										<div class="custom-control custom-checkbox">
											<input type="checkbox" class="custom-control-input"
												id="customCheck1" disabled="disabled"> <label
												class="custom-control-label" for="customCheck1">&nbsp;</label>
										</div>
									</th>
									<th>权限名称</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td>
										<div class="custom-control custom-checkbox">
											<input type="checkbox" id="thId" class="custom-control-input customCheckes">
											<label class="custom-control-label customCheck" for="customCheck2">&nbsp;</label>
										</div>
									</td>
									<td class="table-user">删除修改账户信息权限</td>
								</tr>
								<tr>
									<td>
										<div class="custom-control custom-checkbox">
											<input type="checkbox" id="addId" class="custom-control-input customCheckes">
											<label class="custom-control-label customCheck" for="customCheck2">&nbsp;</label>
										</div>
									</td>
									<td class="table-user">增加班级信息权限</td>
								</tr>
							</tbody>
						</table>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-light" data-dismiss="modal">关闭</button>
						<button type="button" class="btn btn-primary" onclick="quanxiansave()">保存</button>
					</div>
				</div>
				<!-- third party js -->
				<%@include file="/WEB-INF/jsp/importJsFoot/foot.jsp"%>
				<script type="text/javascript" src="${Path }/static/js/highes/Teacher.js"></script>
				<!-- third party js ends -->
</body>
</html>
