<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
<title>Liste des villes</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<style>
body {
	font-family: Arial, sans-serif;
	background-color: #F5F5F5;
	margin: 0;
	padding: 0;
}

.container {
	max-width: 800px;
	margin: auto;
	padding: 20px;
	background-color: #FFF;
	box-shadow: 0px 0px 10px 2px rgba(0, 0, 0, 0.2);
}

h1 {
	font-size: 32px;
	font-weight: 600;
	margin: 0;
	padding: 10px 0;
	text-align: center;
	color: #007BFF;
}

table {
	width: 100%;
	border-collapse: collapse;
	margin: 20px 0;
	background-color: #FFF;
	box-shadow: 0px 0px 10px 2px rgba(0, 0, 0, 0.1);
	border-radius: 5px;
	overflow: hidden;
}

th, td {
	padding: 10px;
	text-align: center;
	border: 1px solid #E6E6E6;
}

th {
	background-color: #F5F5F5;
	color: #333;
	font-weight: bold;
}

tr:nth-child(even) {
	background-color: #F9F9F9;
}

nav ul {
	display: flex;
	list-style: none;
	margin: 0;
	padding: 10px;
}

nav li {
	margin: 0 5px;
}

nav a {
	display: inline-block;
	padding: 5px 10px;
	background-color: #007BFF;
	color: #FFF;
	border-radius: 5px;
	transition: all 0.15s ease-in-out;
}

nav a:hover {
	background-color: #0069D9;
	border-color: #0062CC;
	color: #FFF;
	text-decoration: none;
}

nav .current a {
	background-color: #0062CC;
	border-color: #005CBF;
}

nav .disabled a {
	background-color: #D8D8D8;
	color: #666;
	cursor: default;
}

.form-control {
	display: block;
	width: 100%;
	padding: 10px;
	margin: 10px 0;
	font-size: 16px;
	border-radius: 5px;
	border: 1px solid #ccc;
	background-color: #fff;
	box-shadow: none;
	transition: border-color 0.15s ease-in-out, box-shadow 0.15s ease-in-out;
}

.form-control:focus {
	border-color: #007BFF;
	box-shadow: 0 0 0 0.2rem rgba(0, 123, 255, 0.25);
	outline: none;
}

button {
	display: inline-block;
	font-weight: 400;
	color: #fff;
	text-align: center;
	vertical-align: middle;
	cursor: pointer;
	background-color: #007BFF;
	border: 1px solid #007BFF;
	border-radius: 5px;
	padding: 10px 20px;
	font-size: 16px;
	line-height: 1.5;
	transition: all 0.15s ease-in-out;
}

button:hover {
	background-color: #0069D9;
	border-color: #0062CC;
	color: #fff;
	text-decoration: none;
}

button:focus {
	box-shadow: 0 0 0 0.2rem rgba(0, 123, 255, 0.5);
	outline: none;
}
</style>
</head>
<body>
	<div class="container">
		<h1>Liste des villes</h1>
		<table>
			<thead>
				<tr>
					<th>Nom commune</th>
					<th>Code postal</th>
					<th>Latitude</th>
					<th>Longitude</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="ville" items="${villes}">
					<tr>
						<td>${ville.nomCommune}</td>
						<td>${ville.codePostale}</td>
						<td>${ville.latitude}</td>
						<td>${ville.longitude}</td>
					</tr>
				</c:forEach>
			</tbody>
			<tfoot>
				<tr>
					<td colspan="4">
						<nav>
							<ul>
								<c:if test="${currentPage > 1}">
									<li><a href="?page=1">1</a></li>
								</c:if>
								<c:if test="${currentPage > 2}">
									<li><span class="disabled">...</span></li>
								</c:if>
								<c:forEach var="i" begin="${currentPage - 1}"
									end="${currentPage + 1}">
									<c:if test="${i > 0 && i <= totalPages}">
										<li><a href="?page=${i}"
											class="${i == currentPage ? 'current' : ''}">${i}</a></li>
									</c:if>
								</c:forEach>
								<c:if test="${currentPage < totalPages - 1}">
									<li><span class="disabled">...</span></li>
								</c:if>
								<c:if test="${currentPage < totalPages}">
									<li><a href="?page=${totalPages}">${totalPages}</a></li>
								</c:if>
							</ul>
						</nav>
					</td>
				</tr>
			</tfoot>
		</table>
		<form action="villes" method="post">
			<button type="submit" name="page1">Page 1</button>
		</form>
	</div>
</body>
</html>