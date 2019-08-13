<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<style>

.collapsible {
	background-color: #777;
	color: white;
	cursor: pointer;
	padding: 18px;
	width: 100%;
	border: none;
	text-align: left;
	outline: none;
	font-size: 15px;
}

.collapsible:after {
	content: '\002B';
	color: white;
	font-weight: bold;
	float: right;
	margin-left: 5px;
}

.content {
	padding: 0 18px;
	max-height: 0;
	overflow: hidden;
	transition: max-height 0.2s ease-out;
	background-color: #f1f1f1;
}
</style>
<title>Filmovi</title>
<link href="webjars/bootstrap/3.3.6/css/bootstrap.min.css"
	rel="stylesheet">
</head>
<body>
	<nav role="navigation" class="navbar navbar-default">
		<div class="navbar-collapse">
			<ul class="nav navbar-nav">
				<li><a href="/filmoviPodela">Home</a></li>
				<li><a href="/filmovi">Edit Filmovi</a></li>
				<li><a href="/projekcije">Edit Projekcije</a></li>
				<li class="active"><a href="/filmoviUser">Filmovi</a></li>
				<li><a href="/projekcijeUser">Projekcije</a></li>

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

					<th>Naziv</th>
					<th>Zanr</th>
					<th>Glumci</th>
					<th>Reditelj</th>
					<th>Opis</th>
					<th>Trailer</th>
					<th>Prosek</th>

				</tr>
			</thead>

			<tbody>

				<c:forEach items="${filmovi}" var="t">
					<tr>
						<td>${t.naziv}</td>
						<td>${t.zanr}</td>
						<td><c:forEach items="${t.glumci}" var="g">
							-${g}
						<br />
							</c:forEach></td>
						<td>${t.reditelj}</td>
						<td>${t.opis}</td>
						<td><a type="button" class="c" href="${t.trailer}"
							target="_blank">Trailer</a></td>
						<td>${t.prosek}</td>
					</tr>
					<tr>
						<td><form action="/ocena" method="post">
								<input type="hidden" name="id" value="${t.id}" /> <input
									style="width: 100;" type="text" name="ocena" />

								<button class="btn btn-succes">Oceni film</button>

							</form></td>
						<td>
							<button class="collapsible">Ostavi komentar</button>
							<div class="content">
								<form action="/filmoviUser" method="post">
									<input type="hidden" name="idF" value="${t.id}" /> <input
										type="text" name="komentar" />
									<button type="submit" class="btn btn-success">Snimi</button>
								</form>
							</div> <br />
							<button class="collapsible">Pogledaj komentare</button>
							<div class="content">
								<c:forEach items="${t.komentari}" var="k">
								 	Datum: ${k.datumKom}
								 	<br />
								 	Komentar: ${k.tekst}
								 	
								 	<hr>
								</c:forEach>
							</div>

						</td>


					</tr>

				</c:forEach>

			</tbody>
		</table>
	</div>

	<script src="webjars/jquery/1.9.1/jquery.min.js"></script>
	<script src="webjars/bootstrap/3.3.6/js/bootstrap.min.js"></script>

	<script>
		var coll = document.getElementsByClassName("collapsible");
		var i;

		for (i = 0; i < coll.length; i++) {
			coll[i].addEventListener("click", function() {
				this.classList.toggle("active");
				var content = this.nextElementSibling;
				if (content.style.maxHeight) {
					content.style.maxHeight = null;
				} else {
					content.style.maxHeight = content.scrollHeight + "px";
				}
			});
		}
	</script>
</body>
</html>