<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>
<html>
<head>
	<title>Calcul distance entre 2 villes</title>
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
			box-shadow: 0px 0px 10px 2px rgba(0,0,0,0.2);
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
		.btn {
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
		.btn:hover {
			background-color: #0069D9;
			border-color: #0062CC;
			color: #fff;
			text-decoration: none;
		}
		.btn:focus {
			box-shadow: 0 0 0 0.2rem rgba(0, 123, 255, 0.5);
			outline: none;
		}
		h1 {
			font-size: 32px;
			font-weight: 600;
			margin: 0;
			padding: 10px 0;
			text-align: center;
			color: #007BFF;
		}
		p {
			font-size: 18px;
			margin: 20px 0;
		}
	</style>
</head>
<body>
	<div class="container">
		<h1>Calcul de distance entre 2 villes</h1>
		<form action="villes" method="post">
			<label for="villeDepart">Ville de départ:</label>
			<select name="villeDepart" id="villeDepart" class="form-control">
				<c:forEach var="ville" items="${villes}">
					<option value="${ville.nomCommune}">${ville.nomCommune}</option>
				</c:forEach>
			</select>
			<label for="villeArrivee">Ville d'arrivée:</label>
			<select name="villeArrivee" id="villeArrivee" class="form-control">
				<c:forEach var="ville" items="${villes}">
					<option value="${ville.nomCommune}">${ville.nomCommune}</option>
				</c:forEach>
			</select>
			<button type="submit" name="calculer" class="btn">Calculer</button>
			<button type="submit" name="page2" class="btn">Page 2</button>
		</form>
		<%
			String distance = request.getAttribute("distance").toString();
			String villeArrivee = (String) request.getAttribute("villeArrivee");
			String villeDepart = (String) request.getAttribute("villeDepart");
			if (distance != null) {
		%>
		<p>
			La distance entre <%=villeDepart%> et <%=villeArrivee%> est de <%=distance%> km.
		</p>
		<%
			}
		%>
	</div>
</body>
</html>