<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%-- 	<%@ taglib prefix="sec" --%>
<%-- 	uri="http://www.springframework.org/security/tags"%> --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="shortcut icon" href="/images/shopteam5_logo.png">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css" />
<!-- Bootstrap CSS -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet">
<link rel="stylesheet" href="/images/shopteam5_logo.png">
<title>Trang Chủ - Thông Tin Tài Khoản</title>
</head>

<style>
.mgs_errors {
	color: red;
	font-style: italic;
}

.mataikhoan {
	display: none;
}
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

						<button class="navbar-toggler" type="button"
							data-bs-toggle="collapse" data-bs-target="#navbarText"
							aria-controls="navbarText" aria-expanded="false"
							aria-label="Toggle navigation">
							<span class="navbar-toggler-icon"></span>
						</button>
						<div class="collapse navbar-collapse" id="navbarText">
							<ul class="navbar-nav me-auto mb-2 mb-lg-0">

							</ul>
							<span class="navbar-text" id="dropAccount" role="button"
								data-bs-toggle="dropdown" aria-expanded="false"> <sec:authorize
									access="isAuthenticated()">
									<span> Xin chào </span>
								</sec:authorize> <i class="fa-solid fa-user fs-4">
									${sessionScope.tenTaiKhoan}</i>
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

				<div class="px-4 p-3">
					<div class="row">
						<h4>Hồ sơ của tôi</h4>
						<hr>
						<form action="/admin/capnhap" method="post"
							enctype="multipart/form-data">
							<div class="col-lg-9">
								<div class="border border-black border border-4">

									<div class="form-group mt-3">
										<label style="width: 15%; font-weight: bold;">Tên đăng
											nhập: </label> <input readonly="readonly" name="tenTaiKhoan"
											value="${thongtintaikhoan.tenTaiKhoan}" />

									</div>
									<div class="form-group mt-3">
										<label style="width: 15%; font-weight: bold;">Họ Tên:
										</label> <input name="hoTenNguoiDung" ${ten}
											value="${thongtintaikhoan.hoTenNguoiDung}" />

									</div>
									<div class="form-group mt-3">
										<label style="width: 15%; font-weight: bold;">Email: </label>
										<input name="email" value="${thongtintaikhoan.email}" ${ten} />
									</div>
									<div class="form-group mt-3">
										<label style="width: 15%; font-weight: bold;">Số Điện
											Thoại: </label> <input name="soDienThoai"
											value="0${thongtintaikhoan.soDienThoai}" ${ten} />
									</div>
									<div class="form-group mt-3">
										<label style="width: 15%; font-weight: bold;">Giới
											Tính </label> <input type="radio" ${ten}
											${thongtintaikhoan.gioiTinh? 'checked':''}
											value="${thongtintaikhoan.gioiTinh?' true':'false' }"
											id="contactChoice1" name="gioiTinh"
											value="${thongtintaikhoan.gioiTinh}" /> <label
											for="contactChoice1" class="me-3">Nam</label> <input
											${thongtintaikhoan.gioiTinh? 'checked':''} type="radio"
											id="contactChoice2" name="gioiTinh"
											value="${thongtintaikhoan.gioiTinh?' true':'false' }" /> <label
											for="contactChoice2" class="me-3">Nữ</label>
									</div>
									<div class="form-group mt-3">
										<label style="width: 15%; font-weight: bold;">Hình
											Ảnh: </label> <img alt="" src="/images/${thongtintaikhoan.hinhAnh}"
											width="80px"> <input type="file" name="photo_file"
											${ten} value="${thongtintaikhoan.hinhAnh}">
									</div>
									<div class="form-group mt-3">
										<label style="width: 15%; font-weight: bold;">Ngày
											Sinh: </label> <input name="ngaySinh" type="date" ${ten}
											value="${thongtintaikhoan.ngaySinh}" />
									</div>
									
									<div class="form-group mt-3">
										 <button type="submit" class="btn btn-primary">
											Lưu</button>
										 <a href="/admin/sua" class="btn btn-primary" type="button">Sửa</a>
									     <a href="/admin/huy"class="btn btn-primary" type="button">Hủy</a>
									</div>

								</div>
							</div>

							<div class="col-lg-3">
								 
								 
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>

	</div>



	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>