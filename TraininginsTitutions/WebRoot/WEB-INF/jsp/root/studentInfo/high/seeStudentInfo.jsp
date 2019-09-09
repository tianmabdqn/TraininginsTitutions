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
		<%@include file="/WEB-INF/jsp/leftSidebar/leftSidebar.jsp" %>		
		<div class="content-page">
			<div class="content">

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
											href="javascript: void(0);">Pages</a></li>
										<li class="breadcrumb-item active">FAQ</li>
									</ol>
								</div>
								<h4 class="page-title">管理员</h4>
							</div>
						</div>
					</div>
					<!-- end page title -->


					<div class="row">
						<div class="col-sm-12">
							<div class="text-center">
								<h3 class="">管理学校及城市</h3>
								<p class="text-muted mt-3">请选择要查看的教师学校</p>
                                   <button type="button" class="btn btn-success btn-sm mt-2" onclick="updateStudnet()">修改学生信息</button>
                                    <button type="button" class="btn btn-info btn-sm mt-2 ml-1" onclick="shiftWork()">学员转班</button>
                                    <button type="button" class="btn btn-info btn-sm mt-2 ml-1" onclick="exitSchool()">学员退学</button>
                                    <button type="button" class="btn btn-info btn-sm mt-2 ml-1" onclick="classRegistration()"> 学员上课登记</button>
                                    <button type="button" class="btn btn-info btn-sm mt-2 ml-1" onclick="classBatchRegistration()"> 学员批量登记</button>
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
																id="customCheck1" disabled="disabled"> <label
																class="custom-control-label" for="customCheck1" >&nbsp;</label>
														</div>
													</th>
													<th>所属校区</th>
													<th>就读学校</th>
													<th>学生姓名</th>
													<th>学生性别</th>
													<th>出生日期</th>
													<th>家长姓名</th>
													<th>联系电话</th>
													<th>家庭住址</th>
													<th>报名渠道</th>
													<th>招生老师</th>
													<th>接送人</th>
													<th>备注</th>
												</tr>
											</thead>
											<tbody>
												<c:forEach items="${highesClassStudnets }" var="high">
													<tr class="schoolId" >
														<td>
															<div class="custom-control custom-checkbox">
																<input type="checkbox" class="custom-control-input customChecks"
																	> <label class="custom-control-label customCheck" for="customCheck2">&nbsp;</label>
															</div>
														</td>
														<td class="table-user"><a href="javascript:void(0);"
															class="text-body font-weight-semibold" name="${children.student.studentId }" >${schoolName }</a>
														</td>
														<td class="table-user"><a href="javascript:void(0);"
															class="text-body font-weight-semibold">${high.student.school }</a>
														</td>
														<td class="table-user"><a href="javascript:void(0);"
															class="text-body font-weight-semibold" >${high.student.studentName}</a>
														</td>
														<c:choose>
															<c:when test="${high.student.studentSex == 0 }">
																<td class="table-user"><a href="javascript:void(0);"
																class="text-body font-weight-semibold" >女</a>
																</td>
															</c:when>
															<c:otherwise>
																<td class="table-user"><a href="javascript:void(0);"
																class="text-body font-weight-semibold" >男</a>
																</td>
															</c:otherwise>
														</c:choose>
														
														<td class="table-user"><a href="javascript:void(0);"
															class="text-body font-weight-semibold">${high.student.studentBirth }</a>
														</td>
														<td class="table-user"><a href="javascript:void(0);"
															class="text-body font-weight-semibold">${high.student.parentName }</a>
														</td>
														<td class="table-user"><a href="javascript:void(0);"
															class="text-body font-weight-semibold">${high.student.telephone }</a>
														</td>
														<td class="table-user"><a href="javascript:void(0);"
															class="text-body font-weight-semibold">${high.student.familyAddress }</a>
														</td>
														
														<td class="table-user"><a href="javascript:void(0);"
															class="text-body font-weight-semibold">${high.student.registrationChannels }</a>
														</td>
														<td class="table-user"><a href="javascript:void(0);"
															class="text-body font-weight-semibold">${high.student.registrationConsultant }</a>
														</td>
														<td class="table-user"><a href="javascript:void(0);"
															class="text-body font-weight-semibold">${high.student.registrationConsultant }</a>
														</td>
														<td class="table-user"><a href="javascript:void(0);"
															class="text-body font-weight-semibold">${high.student.remarks }</a>
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
				<%@include file="/WEB-INF/jsp/importJsFoot/foot.jsp" %>
				<script type="text/javascript" src="${Path }/static/js/admin/leftSidebar.js"></script>
				<script type="text/javascript" src="${Path }/static/js/root/studentInfo/high/selectStudentFeeInfo.js"></script>
</body>
</html>