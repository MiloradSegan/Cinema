<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<html>
<head>
<style >
body {
	font-size: 12px;
	line-height: 1.3;
	font-family: Arial, Helvetica, Sans-Serif;
	color: #ccc;
	background: url('body-bg.gif');
}
</style>

<title>Filmovi</title>
 <link href="webjars/bootstrap/3.3.6/css/bootstrap.min.css" 
rel="stylesheet"> 
</head>
<body >
<nav role="navigation" class="navbar navbar-default">
		<div class="navbar-collapse">
			<ul class="nav navbar-nav">
			<li ><a href="/welcome">Home</a></li>
				<li class="active" ><a href="/filmovi">Edit Filmovi</a></li>
				<li><a href="/projekcije">Edit Projekcije</a></li>
				<li><a href="/filmoviUser">Filmovi</a></li>
				<li><a href="/projekcijeUser">Projekcije</a></li>
				<li ><a href="/pretraga">Pretraga</a></li>
			</ul>
			<ul class="nav navbar-nav navbar-right">
			<li><a href="/logout">Logout</a></li>
		</ul>
		</div>
	</nav>
	<div class="container">
	<table class="table table-striped">
		<caption>Svi filmovi</caption>
			<thead>
				<tr>
					<th>Id</th>
					<th>Naziv</th>
					<th>Zanr</th>
					<th>Glumci</th>
					<th>Reditelj</th>
					<th>Opis</th>
					<th>Trailer</th>
					<th>Slika</th>
				</tr>
			</thead>
			
			<tbody>
				<c:forEach items="${filmovi}" var="t">  
				<tr>
					<td>${t.id}</td>
					<td>${t.naziv}</td>
					<td>${t.zanr}</td>
					<td><c:forEach items="${t.glumci}" var="g">
							${g }
					</c:forEach></td>
					<td>${t.reditelj}</td>
					<td>${t.opis}</td>
					
					<td><a href="${t.trailer}" target="_blank">Trailer</a></td>
					<td ><img src="/filmovi12?id=${t.id}" height="42" width="42"/></td>
					<td><a type="button" class="btn btn-success" href="/update?id=${t.id}">Update</a></td>
					<td><a type="button" class="btn btn-warning" href="/delete?id=${t.id}">Delete</a></td>
		
				</tr>
				</c:forEach>
				
			</tbody>
	</table>
	<BR/>
	<div class="button"><a href="/add" class="btn btn-success">Dodaj novi</a></div>
	
	</div>
	 <script src="webjars/jquery/1.9.1/jquery.min.js"></script>
	<script src="webjars/bootstrap/3.3.6/js/bootstrap.min.js"></script>
	
</body>
</html>