<%@ page session="true" language="java"
	contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="es">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Documentos Emilima | Documentos</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
	crossorigin="anonymous">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.3/font/bootstrap-icons.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/styles.css">
<script src="https://code.jquery.com/jquery-3.5.1.js"></script>
<script
	src="${pageContext.request.contextPath}/resources/js/Document.js"
	type="text/javascript"></script>
<script>
	let contextPath = "${pageContext.request.contextPath}"
</script>
<script src="${pageContext.request.contextPath}/resources/js/scripts.js"
	type="text/javascript"></script>
</head>
<body class="vh-100">
	<div class="container-fluid h-100">
		<div class="row h-100">
			<div
				class="d-flex flex-column flex-shrink-0 p-3 text-dark bg-white shadow-sm h-100 col-md-3">
				<a href="${pageContext.request.contextPath}/"
					class="d-flex align-items-center mb-3 mb-md-0 me-md-auto text-dark text-decoration-none">
					<img alt="Emilima logo"
					src="${pageContext.request.contextPath}/resources/img/logo-emilima-color.png"
					class="w-100">
				</a>
				<hr>
				<ul class="nav nav-pills flex-column mb-auto">
					<li class="nav-item"><a
						href="${pageContext.request.contextPath}/"
						class="nav-link text-dark" aria-current="page"> <svg
								class="bi me-2" width="16" height="16">
						<use xlink:href="#index" /></svg> Inicio
					</a></li>
					<li><a
						href="${pageContext.request.contextPath}/documentos/listar"
						class="nav-link active"> <svg class="bi me-2" width="16"
								height="16">
						<use xlink:href="#documents" /></svg> Documentos
					</a></li>
					<li><a
						href="${pageContext.request.contextPath}/solicitudes/listar"
						class="nav-link text-dark"> <svg class="bi me-2" width="16"
								height="16">
						<use xlink:href="#requests" /></svg> Solicitudes
					</a></li>
					<li><a
						href="${pageContext.request.contextPath}/usuarios/listar"
						class="nav-link text-dark"> <svg class="bi me-2" width="16"
								height="16">
						<use xlink:href="#users" /></svg> Usuarios
					</a></li>
				</ul>
				<hr>
				<div class="dropdown">
					<button
						class="d-flex align-items-center text-dark text-decoration-none dropdown-toggle"
						id="dropdownUser1" data-bs-toggle="dropdown" aria-expanded="false">
						<img alt="" width="32" height="32" class="rounded-circle me-2"
							id="user-photo"> <strong>${ sessionScope.loginedUser.username }</strong>
					</button>
					<ul class="dropdown-menu dropdown-menu-dark text-small shadow"
						aria-labelledby="dropdownUser1">
						<li><a class="dropdown-item"
							href="${pageContext.request.contextPath}/cuenta">Configuración</a></li>
						<li><hr class="dropdown-divider"></li>
						<li><button class="dropdown-item" id="logout-button">Salir</button></li>
					</ul>
				</div>
			</div>
			<div class="col-md-9 py-5 main-content h-100">
				<div class="d-flex justify-content-between align-items-center">
					<h1>Documentos</h1>
					<button type="button" class="btn btn-primary"
						data-bs-toggle="modal" data-bs-target="#register-document-modal"
						onclick="openRegisterDocumentModal()">Subir documento</button>
				</div>

				<div class="my-4">
					<input type="text" class="form-control w-100"
						id="search-document-name" placeholder="Buscar documentos">
				</div>
				<section class="documents-list container">
					<div class="row g-2" id="documents-list-grid"></div>
				</section>
			</div>
		</div>
	</div>
	<div class="modal fade" id="register-document-modal"
		data-backdrop="static" data-keyboard="false" tabindex="-1"
		aria-labelledby="staticBackdropLabel" aria-hidden="true">
		<div
			class="modal-dialog modal-dialog-centered modal-dialog-scrollable">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">Registro de
						documento</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<div class="modal-body">
					<form enctype="multipart/form-data" id="document-form-data">
						<div class="mb-3">
							<label for="document-name" class="form-label">Nombre</label> <input
								type="text" class="form-control" id="document-name"
								name="document-name" required>
						</div>
						<div class="mb-3">
							<label for="document-description" class="form-label">Descripción</label>
							<textarea class="form-control" id="document-description" rows="3"
								name="document-description"></textarea>
						</div>
						<div class="mb-3">
							<label for="document-upload-date" class="form-label">Fecha
								de subida</label> <input type="date" class="form-control"
								name="document-date" id="document-upload-date" readonly required>
						</div>
						<div class="mb-3">
							<input class="form-control" type="file" id="document-file"
								name="document-file"
								accept="application/pdf,.doc,.docx,application/msword,application/vnd.openxmlformats-officedocument.wordprocessingml.document"
								required>
						</div>
					</form>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-bs-dismiss="modal">Cancelar</button>
					<button type="button" class="btn btn-primary"
						id="register-document-accept-button">Registrar</button>
				</div>
			</div>
		</div>
	</div>
	<div class="modal fade" id="edit-document-modal" data-backdrop="static"
		data-keyboard="false" tabindex="-1"
		aria-labelledby="staticBackdropLabel" aria-hidden="true">
		<div
			class="modal-dialog modal-dialog-centered modal-dialog-scrollable">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">Edición de
						documento</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<div class="modal-body">
					<form enctype="multipart/form-data" id="edit-document-form-data">
						<div class="mb-3">
							<label for="document-name" class="form-label">Nombre</label> <input
								type="text" class="form-control" id="edit-document-name"
								name="document-name" required>
						</div>
						<div class="mb-3">
							<label for="document-description" class="form-label">Descripción</label>
							<textarea class="form-control" id="edit-document-description"
								rows="3" name="document-description"></textarea>
						</div>
						<div class="mb-3">
							<label for="document-upload-date" class="form-label">Fecha
								de subida</label> <input type="date" class="form-control"
								name="document-date" id="edit-document-upload-date" readonly
								required>
						</div>
						<div class="mb-3" id="edit-document-file"></div>
					</form>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-bs-dismiss="modal">Cancelar</button>
					<button type="button" class="btn btn-primary"
						id="edit-document-accept-button">Editar</button>
				</div>
			</div>
		</div>
	</div>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
		crossorigin="anonymous"></script>
</body>
</html>