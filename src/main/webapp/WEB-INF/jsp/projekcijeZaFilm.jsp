<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<html>
<head>
<style>
body {
	font-size:12px;
	line-height:1.3;
	font-family:Arial, Helvetica, Sans-Serif;
	color:#ccc;
	background:url('body-bg.gif');
	opacity: 0.8;
}
</style>
<title>Filmovi</title>
 <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
</head>
<body >

	<div class="container" style="color:">
	<table class="table table-borderless" style="color:#f3b12b ">
		
			<thead>
				<tr>
					<th>Id</th>
					<th>Datum</th>
					<th>Vreme</th>
					<th>Cena</th>
					<th>BrMesta</th>
					<th>Sala</th>
					<th></th>
					<th></th>
			</thead>
			
			<tbody>
				<c:forEach items="${projekcije}" var="p">  
				<tr>
					
					<td>${p.idPro}</td>
					<td>${p.datum}</td>
					<td>${p.vreme}</td>
					<td>${p.cena}</td>
					<td>${p.brMesta}</td>
					<td>${p.sala}</td>
					<td><a type="button" class="btn btn-success" href="/updateProjekcija?id=${p.idPro}">Update</a></td>
					<td><a type="button" class="btn btn-warning" href="/deleteProjekcija?id=${p.idPro}">Delete</a></td>
				</tr>
				</c:forEach>
				
			</tbody>
	</table>
	<BR/>
	<div class="button"><a href="/adminFilmovi" class="btn btn-danger">Back</a></div>
	
	</div>
	 <script src="webjars/jquery/1.9.1/jquery.min.js"></script>
	<script src="webjars/bootstrap/3.3.6/js/bootstrap.min.js"></script>
	
</body>
</html>