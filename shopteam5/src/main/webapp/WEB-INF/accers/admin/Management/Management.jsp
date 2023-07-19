<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%-- <%@ taglib prefix="sec" --%>
<%-- 	uri="http://www.springframework.org/security/tags"%> --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="icon" href="/images/shopteam5_logo.png" />
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css" />
<!-- Bootstrap CSS -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet">

<title>Shopteam5 - Quản lý đơn hàng</title>
</head>
<style>
.button2 {
	display: inline-block;
	transition: all 0.2s ease-in;
	position: relative;
	overflow: hidden;
	z-index: 1;
	color: #090909;
	padding: 0.3em 1.0em;
	font-size: 18px;
	border-radius: 0.5em;
	background: #e8e8e8;
	border: 1px solid #e8e8e8;
	box-shadow: 6px 6px 12px #c5c5c5, -6px -6px 12px #ffffff;
}

.button2:active {
	color: #666;
	box-shadow: inset 4px 4px 12px #c5c5c5, inset -4px -4px 12px #ffffff;
}

.button2:before {
	position: absolute;
	left: 50%;
	transform: translateX(-50%) scaleY(1) scaleX(1.25);
	top: 100%;
	width: 140%;
	height: 180%;
	background-color: rgba(0, 0, 0, 0.05);
	border-radius: 50%;
	display: block;
	transition: all 0.5s 0.1s cubic-bezier(0.55, 0, 0.1, 1);
	z-index: -1;
}

.button2:after {
	content: "";
	position: absolute;
	left: 55%;
	transform: translateX(-50%) scaleY(1) scaleX(1.45);
	top: 180%;
	width: 160%;
	height: 190%;
	background-color: #009087;
	border-radius: 50%;
	display: block;
	transition: all 0.5s 0.1s cubic-bezier(0.55, 0, 0.1, 1);
	z-index: -1;
}

.button2:hover {
	color: #ffffff;
	border: 1px solid #009087;
}

.button2:hover:before {
	top: -35%;
	background-color: #009087;
	transform: translateX(-50%) scaleY(1.3) scaleX(0.8);
}

.button2:hover:after {
	top: -45%;
	background-color: #009087;
	transform: translateX(-50%) scaleY(1.3) scaleX(0.8);
}

.custom-link {
	color: black;
	font: bold;
	border-radius: 2px;
	text-decoration: none;
}

/* body {
	background: linear-gradient(45deg, #FFFFFF, #99FFFF);
}

table {
	background: linear-gradient(45deg, #FFFFFF, #FFCCFF);
} */
.custom-link:hover {
	background-color: gray;
	color: red;
	text-decoration: none;
}

.pagehd {
	margin-left: 34%;
}

.page-link {
	color: black;
}

.page-link:hover {
	background: #0099FF;
	color: #FFFFCC;
}

.input {
	width: 300px;
}

a {
	margin-right: 0px;
}
/* === removing default button style ===*/
</style>
<body>
	<div class="container-fluid">
		<div class="row">
			<div class="col-2 p-4 shadow"
				style="background-color: #0a3d62; height: 100vh">

				<%@include file="/WEB-INF/accers/admin/menuTaiKhoan.jsp"%>
			</div>
					<div class="col-10 px-0">
						<nav class="navbar navbar-expand-lg shadow-sm"
							style="background-color: #ffffff">
							<div class="container-fluid">
								<!-- <a class="navbar-brand" href="#">Navbar w/ text</a> -->

								<div class="collapse navbar-collapse" id="navbarText">
									<ul class="navbar-nav me-auto mb-2 mb-lg-0">
										<!-- <li class="nav-item"><a class="nav-link active"
									aria-current="page" href="#">Home</a></li>
								<li class="nav-item"><a class="nav-link" href="#">Features</a>
								</li>
								<li class="nav-item"><a class="nav-link" href="#">Pricing</a>
								</li> -->
									</ul>
									<span class="navbar-text" id="dropAccount" role="button"
										data-bs-toggle="dropdown" aria-expanded="false"> <sec:authorize
											access="isAuthenticated()">
											<span> Xin chào <sec:authentication
													property="principal.username" />
											</span>
										</sec:authorize> <i class="fa-solid fa-user fs-4"></i>
									</span>
									<ul class="dropdown-menu" aria-labelledby="dropAccount"
										style="left: auto; right: 10px">
										<li><a class="dropdown-item" href="/home">Trang chính</a></li>
										<li><a class="dropdown-item" href="/doimatkhau">Đổi mật khẩu</a></li>
										<li><a class="dropdown-item" href="/logout">Đăng xuất</a></li>
									</ul>
								</div>
							</div>
						</nav>
						<div class="bg-light p-3">
							<nav aria-label="breadcrumb"></nav>
						</div>
						<div class="px-4 p-3">
							<div class="row">

								<div class="col-5">


									<div class="shadow-lg p-3 mb-5 bg-body-tertiary rounded">
										<form action="/admin/management" method="get">
											<div class="input-group">
												<input type="text" class="form-control" name="trangThai"
													value="${trangThai}">
												<button type="submit" class="button2">Tìm kiếm</button>
											</div>

										</form>
									</div>

								</div>

								<div class="col-3">

									<form:form action="/admin/management" modelAttribute="hd">

										<div class="timkiem">
											<form:hidden path="maHoaDon" />
											<form:hidden path="diaChi" />
											<form:hidden path="tenNguoiMua" />
											<form:hidden path="sdt" />
											<form:hidden path="ngayDatHang" />
											<form:hidden path="tongTien" />
											<form:hidden path="ghiChu" />
											<form:hidden path="taiKhoan" />
										</div>
								</div>
								<div class="col-4">
									<div class="accordion accordion-flush"
										id="accordionFlushExample">
										<div class="shadow-lg p-3 mb-5 bg-body-tertiary rounded">
											<div class="accordion-item">
												<h2 class="accordion-header">
													<button class="accordion-button collapsed" type="button"
														data-bs-toggle="collapse"
														data-bs-target="#flush-collapseOne" aria-expanded="false"
														aria-controls="flush-collapseOne">Cập nhật trạng
														thái:</button>
												</h2>
												<div id="flush-collapseOne"
													class="accordion-collapse collapse"
													data-bs-parent="#accordionFlushExample">
													<div class="accordion-body">
														<div class="card">
															<div class="card-body">
																<!-- Nội dung bên trong khung -->
																<h4 class="card-title"></h4>
																<p class="card-text">
																	Trạng thái hiện tại:<br>--> <strong>${hd.trangThai}</strong>
																</p>
																<input type="hidden" name="maHoaDon"
																	value="${hd.maHoaDon}">

																<div class="mb-3">
																	<select class="form-select" name="trangThai">
																		<option value="Đang xét duyệt"
																			${hd.trangThai == 'Chờ xét duyệt' ? 'selected' : ''}>Chờ
																			xét duyệt</option>
																			<option value="Đã xét duyệt"
																			${hd.trangThai == 'Đã xét duyệt' ? 'selected' : ''}>Đã
																			xét duyệt</option>
																	<option value="Đã giao hàng"
																			${hd.trangThai == 'Đã giao hàng' ? 'selected' : ''}>Đã
																			giao hàng</option>
																		<option value="Đã nhận hàng"
																			${hd.trangThai == 'Đã nhận hàng' ? 'selected' : ''}>Đã
																			nhận hàng</option>
																			<option value="Xét duyệt thất bại"
																			${hd.trangThai == 'Xét duyệt thất bại' ? 'selected' : ''}>Xét duyệt thất bại</option>
																	</select>
																</div>

															</div>
															<button type="submit" formaction="/admin/updatehd"
																class="btn btn-primary">Cập nhật</button>
														</div>
													</div>
												</div>
											</div>
										</div>

									</div>
								</div>
							</div>

							</form:form>
							<div class="table-responsive mt-5" style="overflow-x: auto">
								<table class="table table-bordered table-hover">
									<thead>
										<tr>
											<th>Mã hóa đơn &nbsp; <a type="button"
												class="btn btn-outline-secondary"
												href="/admin/management?field=maHoaDon" role="button"> <svg
														xmlns="http://www.w3.org/2000/svg" width="13" height="13"
														fill="currentColor" class="bi bi-sort-numeric-down-alt"
														viewBox="0 0 16 16">
<path fill-rule="evenodd"
															d="M11.36 7.098c-1.137 0-1.708-.657-1.762-1.278h1.004c.058.223.343.45.773.45.824 0 1.164-.829 1.133-1.856h-.059c-.148.39-.57.742-1.261.742-.91 0-1.72-.613-1.72-1.758 0-1.148.848-1.836 1.973-1.836 1.09 0 2.063.637 2.063 2.688 0 1.867-.723 2.848-2.145 2.848zm.062-2.735c.504 0 .933-.336.933-.972 0-.633-.398-1.008-.94-1.008-.52 0-.927.375-.927 1 0 .64.418.98.934.98z"></path>
<path
															d="M12.438 8.668V14H11.39V9.684h-.051l-1.211.859v-.969l1.262-.906h1.046zM4.5 2.5a.5.5 0 0 0-1 0v9.793l-1.146-1.147a.5.5 0 0 0-.708.708l2 1.999.007.007a.497.497 0 0 0 .7-.006l2-2a.5.5 0 0 0-.707-.708L4.5 12.293V2.5z"></path>
</svg></a>
											</th>
											<th>Địa chỉ <br> &nbsp; <a type="button"
												class="btn btn-outline-secondary"
												href="/admin/management?field=diaChi" role="button"> <svg
														xmlns="http://www.w3.org/2000/svg" width="13" height="13"
														fill="currentColor" class="bi bi-sort-alpha-down-alt"
														viewBox="0 0 16 16">
<path
															d="M12.96 7H9.028v-.691l2.579-3.72v-.054H9.098v-.867h3.785v.691l-2.567 3.72v.054h2.645V7z"></path>
<path fill-rule="evenodd"
															d="M10.082 12.629 9.664 14H8.598l1.789-5.332h1.234L13.402 14h-1.12l-.419-1.371h-1.781zm1.57-.785L11 9.688h-.047l-.652 2.156h1.351z"></path>
<path
															d="M4.5 2.5a.5.5 0 0 0-1 0v9.793l-1.146-1.147a.5.5 0 0 0-.708.708l2 1.999.007.007a.497.497 0 0 0 .7-.006l2-2a.5.5 0 0 0-.707-.708L4.5 12.293V2.5z"></path>
</svg></a></th>
											<th>Tên người mua&nbsp; <a type="button"
												class="btn btn-outline-secondary"
												href="/admin/management?field=tenNguoiMua" role="button">
													<svg xmlns="http://www.w3.org/2000/svg" width="13"
														height="13" fill="currentColor"
														class="bi bi-sort-alpha-down-alt" viewBox="0 0 16 16">
<path
															d="M12.96 7H9.028v-.691l2.579-3.72v-.054H9.098v-.867h3.785v.691l-2.567 3.72v.054h2.645V7z"></path>
<path fill-rule="evenodd"
															d="M10.082 12.629 9.664 14H8.598l1.789-5.332h1.234L13.402 14h-1.12l-.419-1.371h-1.781zm1.57-.785L11 9.688h-.047l-.652 2.156h1.351z"></path>
<path
															d="M4.5 2.5a.5.5 0 0 0-1 0v9.793l-1.146-1.147a.5.5 0 0 0-.708.708l2 1.999.007.007a.497.497 0 0 0 .7-.006l2-2a.5.5 0 0 0-.707-.708L4.5 12.293V2.5z"></path>
</svg>
											</a></th>
											<th>Số điện thoại&nbsp; <a type="button"
												class="btn btn-outline-secondary"
												href="/admin/management?field=sdt" role="button"> <svg
														xmlns="http://www.w3.org/2000/svg" width="13" height="13"
														fill="currentColor" class="bi bi-sort-numeric-down-alt"
														viewBox="0 0 16 16">
<path fill-rule="evenodd"
															d="M11.36 7.098c-1.137 0-1.708-.657-1.762-1.278h1.004c.058.223.343.45.773.45.824 0 1.164-.829 1.133-1.856h-.059c-.148.39-.57.742-1.261.742-.91 0-1.72-.613-1.72-1.758 0-1.148.848-1.836 1.973-1.836 1.09 0 2.063.637 2.063 2.688 0 1.867-.723 2.848-2.145 2.848zm.062-2.735c.504 0 .933-.336.933-.972 0-.633-.398-1.008-.94-1.008-.52 0-.927.375-.927 1 0 .64.418.98.934.98z"></path>
<path
															d="M12.438 8.668V14H11.39V9.684h-.051l-1.211.859v-.969l1.262-.906h1.046zM4.5 2.5a.5.5 0 0 0-1 0v9.793l-1.146-1.147a.5.5 0 0 0-.708.708l2 1.999.007.007a.497.497 0 0 0 .7-.006l2-2a.5.5 0 0 0-.707-.708L4.5 12.293V2.5z"></path>
</svg></a></th>
											<th>Ngày đặt hàng&nbsp; <a type="button"
												class="btn btn-outline-secondary"
												href="/admin/management?field=ngayDatHang" role="button">
													<svg xmlns="http://www.w3.org/2000/svg" width="13"
														height="13" fill="currentColor"
														class="bi bi-sort-numeric-down-alt" viewBox="0 0 16 16">
<path fill-rule="evenodd"
															d="M11.36 7.098c-1.137 0-1.708-.657-1.762-1.278h1.004c.058.223.343.45.773.45.824 0 1.164-.829 1.133-1.856h-.059c-.148.39-.57.742-1.261.742-.91 0-1.72-.613-1.72-1.758 0-1.148.848-1.836 1.973-1.836 1.09 0 2.063.637 2.063 2.688 0 1.867-.723 2.848-2.145 2.848zm.062-2.735c.504 0 .933-.336.933-.972 0-.633-.398-1.008-.94-1.008-.52 0-.927.375-.927 1 0 .64.418.98.934.98z"></path>
<path
															d="M12.438 8.668V14H11.39V9.684h-.051l-1.211.859v-.969l1.262-.906h1.046zM4.5 2.5a.5.5 0 0 0-1 0v9.793l-1.146-1.147a.5.5 0 0 0-.708.708l2 1.999.007.007a.497.497 0 0 0 .7-.006l2-2a.5.5 0 0 0-.707-.708L4.5 12.293V2.5z"></path>
</svg>
											</a></th>
											<th>Tổng tiền&nbsp; <a type="button"
												class="btn btn-outline-secondary"
												href="/admin/management?field=tongTien" role="button"> <svg
														xmlns="http://www.w3.org/2000/svg" width="13" height="13"
														fill="currentColor" class="bi bi-sort-numeric-down-alt"
														viewBox="0 0 16 16">
<path fill-rule="evenodd"
															d="M11.36 7.098c-1.137 0-1.708-.657-1.762-1.278h1.004c.058.223.343.45.773.45.824 0 1.164-.829 1.133-1.856h-.059c-.148.39-.57.742-1.261.742-.91 0-1.72-.613-1.72-1.758 0-1.148.848-1.836 1.973-1.836 1.09 0 2.063.637 2.063 2.688 0 1.867-.723 2.848-2.145 2.848zm.062-2.735c.504 0 .933-.336.933-.972 0-.633-.398-1.008-.94-1.008-.52 0-.927.375-.927 1 0 .64.418.98.934.98z"></path>
<path
															d="M12.438 8.668V14H11.39V9.684h-.051l-1.211.859v-.969l1.262-.906h1.046zM4.5 2.5a.5.5 0 0 0-1 0v9.793l-1.146-1.147a.5.5 0 0 0-.708.708l2 1.999.007.007a.497.497 0 0 0 .7-.006l2-2a.5.5 0 0 0-.707-.708L4.5 12.293V2.5z"></path>
</svg></a></th>
											<th>Trạng thái&nbsp; <a type="button"
												class="btn btn-outline-secondary"
												href="/admin/management?field=trangThai" role="button">
													<svg xmlns="http://www.w3.org/2000/svg" width="13"
														height="13" fill="currentColor"
														class="bi bi-sort-alpha-down-alt" viewBox="0 0 16 16">
<path
															d="M12.96 7H9.028v-.691l2.579-3.72v-.054H9.098v-.867h3.785v.691l-2.567 3.72v.054h2.645V7z"></path>
<path fill-rule="evenodd"
															d="M10.082 12.629 9.664 14H8.598l1.789-5.332h1.234L13.402 14h-1.12l-.419-1.371h-1.781zm1.57-.785L11 9.688h-.047l-.652 2.156h1.351z"></path>
<path
															d="M4.5 2.5a.5.5 0 0 0-1 0v9.793l-1.146-1.147a.5.5 0 0 0-.708.708l2 1.999.007.007a.497.497 0 0 0 .7-.006l2-2a.5.5 0 0 0-.707-.708L4.5 12.293V2.5z"></path>
</svg>
											</a></th>

										<th></th>									

										</tr>
									</thead>
									<tbody>

										<c:forEach var="hd" items="${hds}">
											<tr>
												<td>${hd.maHoaDon}</td>
												<td>${hd.diaChi}</td>
												<td>${hd.tenNguoiMua}</td>
												<td>${hd.sdt}</td>
												<td>${hd.ngayDatHang}</td>
												<td><span style="color: red;"><fmt:formatNumber
															value="${hd.tongTien}" currencySymbol="VNĐ"
															type="currency" /></span></td>
												<td><a href="/admin/edithd/${hd.maHoaDon}"
													class="custom-link">${hd.trangThai}</a></td>

												<td><a href="/admin/chitietman/${hd.maHoaDon}">Chi Tiết</a></td>
											</tr>
										</c:forEach>


									</tbody>
								</table>



								<nav aria-label="Page navigation example">
									<ul class="pagination" style="padding-left: 34%">
										<li class="page-item"><a class="page-link"
											href="/admin/management?m=0"><svg
													xmlns="http://www.w3.org/2000/svg" width="16" height="16"
													fill="currentColor" class="bi bi-chevron-double-left"
													viewBox="0 0 16 16">
  <path fill-rule="evenodd"
														d="M8.354 1.646a.5.5 0 0 1 0 .708L2.707 8l5.647 5.646a.5.5 0 0 1-.708.708l-6-6a.5.5 0 0 1 0-.708l6-6a.5.5 0 0 1 .708 0z" />
  <path fill-rule="evenodd"
														d="M12.354 1.646a.5.5 0 0 1 0 .708L6.707 8l5.647 5.646a.5.5 0 0 1-.708.708l-6-6a.5.5 0 0 1 0-.708l6-6a.5.5 0 0 1 .708 0z" />
</svg></a></li>
										<li class="page-item"><a class="page-link"
											href="/admin/management?m=${pagehd.number-1}"><svg
													xmlns="http://www.w3.org/2000/svg" width="16" height="16"
													fill="currentColor" class="bi bi-chevron-left"
													viewBox="0 0 16 16">
  <path fill-rule="evenodd"
														d="M11.354 1.646a.5.5 0 0 1 0 .708L5.707 8l5.647 5.646a.5.5 0 0 1-.708.708l-6-6a.5.5 0 0 1 0-.708l6-6a.5.5 0 0 1 .708 0z" />
</svg></a></li>

										<c:forEach var="i" begin="0" end="${pagehd.totalPages}">
											<li class="page-item"><a class="page-link"
												href="/admin/management?m=${i}">${i + 1}</a></li>
										</c:forEach>
										<li class="page-item"><a class="page-link"
											href="/admin/management?m=${pagehd.number+1}"><svg
													xmlns="http://www.w3.org/2000/svg" width="16" height="16"
													fill="currentColor" class="bi bi-chevron-right"
													viewBox="0 0 16 16">
  <path fill-rule="evenodd"
														d="M4.646 1.646a.5.5 0 0 1 .708 0l6 6a.5.5 0 0 1 0 .708l-6 6a.5.5 0 0 1-.708-.708L10.293 8 4.646 2.354a.5.5 0 0 1 0-.708z" />
</svg></a></li>
										<li class="page-item"><a class="page-link"
											href="/admin/management?m=${pagehd.totalPages-1}"><svg
													xmlns="http://www.w3.org/2000/svg" width="16" height="16"
													fill="currentColor" class="bi bi-chevron-double-right"
													viewBox="0 0 16 16">
  <path fill-rule="evenodd"
														d="M3.646 1.646a.5.5 0 0 1 .708 0l6 6a.5.5 0 0 1 0 .708l-6 6a.5.5 0 0 1-.708-.708L9.293 8 3.646 2.354a.5.5 0 0 1 0-.708z" />
  <path fill-rule="evenodd"
														d="M7.646 1.646a.5.5 0 0 1 .708 0l6 6a.5.5 0 0 1 0 .708l-6 6a.5.5 0 0 1-.708-.708L13.293 8 7.646 2.354a.5.5 0 0 1 0-.708z" />
</svg></a></li>
									</ul>
								</nav>
							</div>
						</div>
				
		</div>
	</div>

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>