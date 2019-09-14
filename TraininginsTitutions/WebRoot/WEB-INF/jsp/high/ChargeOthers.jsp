<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<c:set scope="request" value="${pageContext.request.contextPath }"
	var="Path" />
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8" />
<title>Hyper - Responsive Bootstrap 4 Admin Dashboard</title>
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
<!-- third party css end -->

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
		<!-- Left Sidebar End -->

		<!-- ============================================================== -->
		<!-- Start Page Content here -->
		<!-- ============================================================== -->

		<div class="content-page">
			<div class="content">

				<!-- Topbar Start -->
				<div class="navbar-custom">
					<ul class="list-unstyled topbar-right-menu float-right mb-0">

						<li class="dropdown notification-list topbar-dropdown"><a
							class="nav-link dropdown-toggle arrow-none"
							data-toggle="dropdown" href="#" role="button"
							aria-haspopup="false" aria-expanded="false"> <img
								src="assets/images/flags/us.jpg" alt="user-image" class="mr-1"
								height="12"> <span class="align-middle">English</span> <i
								class="mdi mdi-chevron-down"></i>
						</a>
							<div
								class="dropdown-menu dropdown-menu-right dropdown-menu-animated topbar-dropdown-menu">

								<!-- item-->
								<a href="javascript:void(0);" class="dropdown-item notify-item">
									<img src="assets/images/flags/germany.jpg" alt="user-image"
									class="mr-1" height="12"> <span class="align-middle">German</span>
								</a>

								<!-- item-->
								<a href="javascript:void(0);" class="dropdown-item notify-item">
									<img src="assets/images/flags/italy.jpg" alt="user-image"
									class="mr-1" height="12"> <span class="align-middle">Italian</span>
								</a>

								<!-- item-->
								<a href="javascript:void(0);" class="dropdown-item notify-item">
									<img src="assets/images/flags/spain.jpg" alt="user-image"
									class="mr-1" height="12"> <span class="align-middle">Spanish</span>
								</a>

								<!-- item-->
								<a href="javascript:void(0);" class="dropdown-item notify-item">
									<img src="assets/images/flags/russia.jpg" alt="user-image"
									class="mr-1" height="12"> <span class="align-middle">Russian</span>
								</a>

							</div></li>

						<li class="dropdown notification-list"><a
							class="nav-link dropdown-toggle arrow-none"
							data-toggle="dropdown" href="#" role="button"
							aria-haspopup="false" aria-expanded="false"> <i
								class="dripicons-bell noti-icon"></i> <span
								class="noti-icon-badge"></span>
						</a>
							<div
								class="dropdown-menu dropdown-menu-right dropdown-menu-animated dropdown-lg">

								<!-- item-->
								<div class="dropdown-item noti-title">
									<h5 class="m-0">
										<span class="float-right"> <a
											href="javascript: void(0);" class="text-dark"> <small>Clear
													All</small>
										</a>
										</span>Notification
									</h5>
								</div>

								<div class="slimscroll" style="max-height: 230px;">
									<!-- item-->
									<a href="javascript:void(0);" class="dropdown-item notify-item">
										<div class="notify-icon bg-primary">
											<i class="mdi mdi-comment-account-outline"></i>
										</div>
										<p class="notify-details">
											Caleb Flakelar commented on Admin <small class="text-muted">1
												min ago</small>
										</p>
									</a>

									<!-- item-->
									<a href="javascript:void(0);" class="dropdown-item notify-item">
										<div class="notify-icon bg-info">
											<i class="mdi mdi-account-plus"></i>
										</div>
										<p class="notify-details">
											New user registered. <small class="text-muted">5
												hours ago</small>
										</p>
									</a>

									<!-- item-->
									<a href="javascript:void(0);" class="dropdown-item notify-item">
										<div class="notify-icon">
											<img src="assets/images/users/avatar-2.jpg"
												class="img-fluid rounded-circle" alt="" />
										</div>
										<p class="notify-details">Cristina Pride</p>
										<p class="text-muted mb-0 user-msg">
											<small>Hi, How are you? What about our next meeting</small>
										</p>
									</a>

									<!-- item-->
									<a href="javascript:void(0);" class="dropdown-item notify-item">
										<div class="notify-icon bg-primary">
											<i class="mdi mdi-comment-account-outline"></i>
										</div>
										<p class="notify-details">
											Caleb Flakelar commented on Admin <small class="text-muted">4
												days ago</small>
										</p>
									</a>

									<!-- item-->
									<a href="javascript:void(0);" class="dropdown-item notify-item">
										<div class="notify-icon">
											<img src="assets/images/users/avatar-4.jpg"
												class="img-fluid rounded-circle" alt="" />
										</div>
										<p class="notify-details">Karen Robinson</p>
										<p class="text-muted mb-0 user-msg">
											<small>Wow ! this admin looks good and awesome design</small>
										</p>
									</a>

									<!-- item-->
									<a href="javascript:void(0);" class="dropdown-item notify-item">
										<div class="notify-icon bg-info">
											<i class="mdi mdi-heart"></i>
										</div>
										<p class="notify-details">
											Carlos Crouch liked <b>Admin</b> <small class="text-muted">13
												days ago</small>
										</p>
									</a>
								</div>

								<!-- All-->
								<a href="javascript:void(0);"
									class="dropdown-item text-center text-primary notify-item notify-all">
									View All </a>

							</div></li>

						<li class="dropdown notification-list"><a
							class="nav-link dropdown-toggle nav-user arrow-none mr-0"
							data-toggle="dropdown" href="#" role="button"
							aria-haspopup="false" aria-expanded="false"> <span
								class="account-user-avatar"> <img
									src="assets/images/users/avatar-1.jpg" alt="user-image"
									class="rounded-circle">
							</span> <span> <span class="account-user-name">Dominic
										Keller</span> <span class="account-position">Founder</span>
							</span>
						</a>
							<div
								class="dropdown-menu dropdown-menu-right dropdown-menu-animated topbar-dropdown-menu profile-dropdown">
								<!-- item-->
								<div class=" dropdown-header noti-title">
									<h6 class="text-overflow m-0">Welcome !</h6>
								</div>

								<!-- item-->
								<a href="javascript:void(0);" class="dropdown-item notify-item">
									<i class="mdi mdi-account-circle mr-1"></i> <span>My
										Account</span>
								</a>

								<!-- item-->
								<a href="javascript:void(0);" class="dropdown-item notify-item">
									<i class="mdi mdi-account-edit mr-1"></i> <span>Settings</span>
								</a>

								<!-- item-->
								<a href="javascript:void(0);" class="dropdown-item notify-item">
									<i class="mdi mdi-lifebuoy mr-1"></i> <span>Support</span>
								</a>

								<!-- item-->
								<a href="javascript:void(0);" class="dropdown-item notify-item">
									<i class="mdi mdi-lock-outline mr-1"></i> <span>Lock
										Screen</span>
								</a>

								<!-- item-->
								<a href="javascript:void(0);" class="dropdown-item notify-item">
									<i class="mdi mdi-logout mr-1"></i> <span>Logout</span>
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
											href="javascript: void(0);">Hyper</a></li>
										<li class="breadcrumb-item"><a
											href="javascript: void(0);">eCommerce</a></li>
										<li class="breadcrumb-item active">Customers</li>
									</ol>
								</div>
							</div>
						</div>
					</div>
					<!-- end page title -->

					<div class="row">
						<div class="col-12">
							<div class="card">
								<div class="card-body">
									<h4 style="text-align:center">其他费用收款单</h4>
									<div class="showOrder">
										<div class="col-12">
											<div class="card">
												<div class="card-body">
													<div class="row mb-2">
														<div class="col-sm-4">
															<a href="${Path }/ChargeOthers.html"
																class="btn btn-danger mb-2"><i
																class="mdi mdi-plus-circle mr-2"></i> 添加</a>
															<!-- <a
																href="javascript:void(0);"
																class="btn btn-danger mb-2 del" onclick="updateOrder()"><i
																class="mdi mdi-plus-circle mr-2"></i> 修改</a> -->
															<a href="javascript:void(0);"
																class="btn btn-danger mb-2 del" onclick="delOrder()"><i
																class="mdi mdi-plus-circle mr-2"></i> 删除</a>
															<button type="button" id="btn2"
																class="btn btn-danger mb-2" onclick="Printing()">打印</button>
															<button type="button" id="btn2"
																class="btn btn-danger mb-2 Exports">导出Excel</button>
														</div>

														<!-- end col-->
													</div>

													<div class="table-responsive mt-4 Expenditureitemses">
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
																	<th>序</th>
																	<th>校区信息</th>
																	<th>收款日期</th>
																	<th>收款项目</th>
																	<th>收款方式</th>
																	<th>收款金额</th>
																	<th>付款方</th>
																	<th>责任人</th>
																	<th>备注</th>
																	<th>单号</th>
																</tr>
															</thead>
															<tbody>
																<c:forEach items="${order}" var="o">
																	<tr>
																		<td>
																			<div class="custom-control custom-checkbox ">
																				<input type="checkbox"
																					class="custom-control-input customCheckes">
																				<label class="custom-control-label customCheck"
																					for="customCheck2">&nbsp;</label>
																			</div>
																		</td>
																		<td class="${o.stuId }">${o.orderId }</td>
																		<td>${o.school.schoolName }</td>
																		<td><fmt:formatDate value="${o.startTime }"
																				pattern="yyyy-MM-dd" /></td>
																		<td class="${o.feecateId }">${o.feeCategory.chargeTypeName }</td>
																		<td class="${o.paymentmethodId }">${o.paymentMethod.paymentmethodName }</td>
																		<td>${o.dpMoney }</td>
																		<td>${o.student.studentName }</td>
																		<td>${o.personliable }</td>
																		<td>${o.remarks }</td>
																		<td>${o.orderNumber }</td>
																		<td class="ids" style="display: none;">${o.classId }</td>
																		<td style="display: none;">${o.student.studentBirth }</td>
																	</tr>
																</c:forEach>
															</tbody>
														</table>
													</div>
													<!-- end card-body-->
												</div>
												<!-- end card-->
											</div>
											<!-- end col -->
										</div>
										<!-- end row -->
									</div>

									<div class="form-group mb-3" style="display: none;">
										<label for="example-select">课程类型</label> <select
											class="form-control departmentOfPediatrics"
											id="example-select">
											<c:forEach items="${departmentOfPediatrics }" var="d">
												<option value="${d.dpId }">${d.dpTypeName}</option>
											</c:forEach>
										</select>
									</div>

									<div class="row mb-2 addOrder" style="display: none;">
										<div class="col-md-12">
											<form>
												<div class="row">
													<div class="col-md-6">
														<div class="form-group">
															<label for="billing-first-name">校区信息</label> <input
																class="form-control school" type="text"
																id="billing-first-name" disabled />
														</div>
													</div>
													<div class="col-md-6">
														<div class="form-group">
															<label for="billing-last-name">收款日期</label> <input
																class="form-control date" type="text"
																id="billing-last-name" disabled />
														</div>
													</div>
													<div class="col-md-6">
														<div class="form-group mb-3">
															<label for="example-select">收款项目</label> <select
																class="form-control feecateId" id="example-select">
																<c:forEach items="${feeCategory }" var="f">
																	<option value="${f.chargeTypeId }"
																		name="${f.chargeMoney }">${f.chargeTypeName}</option>
																</c:forEach>
															</select>
														</div>
													</div>
													<div class="col-md-6">
														<div class="form-group mb-3">
															<label for="example-select">付款方</label> <input
																class="form-control stuId" type="text"
																id="billing-first-name" disabled />
														</div>
													</div>
													<div class="col-md-6">
														<div class="form-group mb-3">
															<label for="example-select">资金账户</label> <select
																class="form-control paymentmethodId" id="example-select">
																<c:forEach items="${paymentMethod }" var="p">
																	<option value="${p.paymentmethodId }">${p.paymentmethodName}</option>
																</c:forEach>
															</select>
														</div>
													</div>
													<div class="col-md-6">
														<div class="form-group mb-3">
															<label for="example-number">金额</label> <input
																class="form-control dpMoney" id="example-number"
																type="number" name="number">
														</div>
													</div>
													<div class="col-md-6">
														<div class="form-group">
															<label for="billing-first-name">责任人</label> <input
																class="form-control personliable" type="text"
																id="billing-first-name" />
														</div>
													</div>
													<div class="col-md-6">
														<div class="form-group">
															<label for="billing-last-name">备注</label> <input
																class="form-control remarks" type="text"
																id="billing-last-name" />
														</div>
													</div>
													<div class="col-md-12">
														<div class="form-group">
															<button type="button"
																class="btn btn-block btn-primary TiJiao">提交</button>
														</div>
													</div>
												</div>
											</form>
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

					<div class="row" id="dayin" style="display: none;">
						<!--startprint-->
						<div class="col-12">
							<div class="card">
								<div class="card-body">
									<h4 style="text-align:center">全国统一收款收据</h4>
									<div class="row mb-2">
										<table id="ChargePeriod" border="1" width="1600">
											<tr>
												<th width="400" height="20px" class="RiQi"
													style="text-align: left;"></th>
												<th width="400" colspan="2" height="20px"></th>
												<th width="100" height="20px"></th>
												<th width="300" height="20px" class="BDKC"></th>
												<th width="400" height="20px" class="DJBH"></th>
											</tr>
											<tr>
												<td width="400" height="40px" class="XSXM"></td>
												<td width="100" height="40px"></td>
												<td width="300" height="40px" class="NL"></td>
												<td width="400" height="40px" colspan="2"></td>
												<td width="400" height="40px" class="JDXX"></td>
											</tr>
											<tr>
												<td width="400" height="40px" class="KS"></td>
												<td width="100" height="40px"></td>
												<td width="300" height="40px" class="YXQ"></td>
												<td width="800" colspan="4" style="text-align:center"
													height="40px" class="FLYQX">&nbsp;&nbsp;&nbsp;年&nbsp;&nbsp;&nbsp;月&nbsp;&nbsp;&nbsp;日&nbsp;&nbsp;&nbsp;至&nbsp;&nbsp;&nbsp;年&nbsp;&nbsp;&nbsp;月&nbsp;&nbsp;&nbsp;日&nbsp;&nbsp;&nbsp;
												</td>
											</tr>
											<tr class="apps">
												<td width="800" colspan="3" style="text-align:center"
													height="40px">货物或劳务、服务名称：</td>
												<td width="800" colspan="3" style="text-align:center"
													height="40px">金额</td>
											</tr>


											<tr>
												<td width="800" colspan="3" height="40px"></td>
												<td width="800" colspan="3" style="text-align:center"
													height="40px"></td>
											</tr>
											<tr>
												<td width="800" colspan="3" height="40px"></td>
												<td width="800" colspan="3" style="text-align:center"
													height="40px"></td>
											</tr>
											<tr>
												<td width="400" height="40px"
													style="text-align:center;border-right: 0px;">人民币大写：</td>
												<td width="800" height="40px" colspan="4"
													style="border-left: 0px;"></td>
												<td width="400" height="40px" class="MONEY"></td>
											</tr>
											<tr>
												<td width="500" height="80px" colspan="2">收款单位盖章：</td>
												<td width="400" height="80px" colspan="2">收款人：</td>
												<td width="700" height="80px" colspan="2">备注：</td>
											</tr>
										</table>
									</div>
									
									<!-- end card-body-->
								</div>
								<!-- end card-->
							</div>
							<!-- end col -->
							<!--endprint-->
							<iframe id="iframe1" style="display: none"></iframe>
							<div class="col-md-12">
										<div class="form-group">
											<button type="button"
												class="btn btn-block btn-primary DaYins">打印</button>
										</div>
									</div>
									<div class="col-md-12" style="display: none;">
										<div class="form-group">
											<button type="button"
												class="btn btn-block btn-primary DaYins2">导出</button>
										</div>
									</div>
						</div>
						<!-- end row -->

					</div>

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
								<i
									class="mdi mdi-upload bg-info-lighten text-info timeline-icon"></i>
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
								<i
									class="mdi mdi-upload bg-info-lighten text-info timeline-icon"></i>
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


			<!-- App js -->

			<!-- third party js -->
			<%@include file="/WEB-INF/jsp/importJsFoot/foot.jsp"%>
			<script type="text/javascript"
				src="${Path }/static/js/highes/leftSidebar.js"></script>
			<script type="text/javascript"
				src="${Path }/static/js/highes/ChargeOthers.js"></script>
			<script type="text/javascript"
				src="${Path }/static/js/Excel/base64.js"></script>
			<script type="text/javascript"
				src="${Path }/static/js/Excel/tableExport.js"></script>
			<script type="text/javascript">
				$(document).ready(function() {
					$(".Exports").click(function() {
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
						$(".DaYins").hide();
						$(".DaYins2").parent().parent().show();
						var Time = new Date();
						var gender = new Date($(".customCheckes:checked").parent().parent().next().next().next().next().next().next().next().next().next().next().next().next().text());
						var year = Time.getTime() - gender.getTime();
						var month = Math.ceil(year / 1000 / 60 / 60 / 24 / 365);
						$(".NL").text("年龄： " + (month).toString());
						$(".RiQi").text("日期：" + $(".customCheckes:checked").parent().parent().next().next().next().text() + "                   ");
						$(".DJBH").text("单据编号：" + "(" + $(".customCheckes:checked").parent().parent().next().next().text() + ")" + $(".customCheckes:checked").parent().parent().next().next().next().next().next().next().next().next().next().next().text());
						$(".BDKC").text("报读课程：" + $(".customCheckes:checked").parent().parent().next().next().next().next().next().next().next().next().next().next().next().text());
						$(".XSXM").text("学生姓名: " + $(".customCheckes:checked").parent().parent().next().next().next().next().next().next().next().text());
						$(".JDXX").text("就读学校：" + $(".customCheckes:checked").parent().parent().next().next().text());
						$(".KS").text("课时：");
						$(".YXQ").text("课程有效期：");
						$(".MONEY").text("￥" + $(".customCheckes:checked").parent().parent().next().next().next().next().next().next().text());
						for (var i = 0; i < $(".customCheckes:checked").parent().parent().next().next().next().next().text().split("/").length; i++) {
							for (var j = 0; j < $(".feecateIds option").length; j++) {
								if ($(".customCheckes:checked").parent().parent().next().next().next().next().text().split("/")[i] == $(".feecateIds option").eq(j).text()) {
									RMB = $(".feecateIds option").eq(j).attr("name");
								}
							}
							$(".apps").after("<tr class='dels'><td width='800' colspan='3' height='40px'>" + $(".customCheckes:checked").parent().parent().next().next().next().next().text().split("/")[i] + "</td><td width='800' colspan='3' style='text-align:center'height='40px'>￥" + $(".customCheckes:checked").parent().parent().next().next().next().next().next().next().text() + "</td></tr>");
						}
						$("#ChargePeriod td").click(function() {
							if ($(".WBK").val() == ".") {
								$(".WBK").parent().remove();
							} else {
								$(".WBK").parent().text($(".WBK").val());
							}
							$(".WBK").remove();
							$(this).append("<input type='text' class='WBK' value='" + $(this).text() + "'/>");
							$(".WBK").focus();
			
						});
					});
			
					$(".DaYins2").click(function() {
						$(".WBK").remove();
						$("#ChargePeriod").tableExport({
							formats : [ "xlsx" ],
							fileName : "其他收费单-" + $(".customCheckes:checked").parent().parent().next().next().next().next().next().next().next().text(),
							bootstrap : false
						});
					});
				});
			</script>
			<!-- third party js ends -->
</body>
</html>