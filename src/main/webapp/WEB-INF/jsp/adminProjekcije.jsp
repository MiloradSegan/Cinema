<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<head>

<title>MovieHunter</title>
<link rel="stylesheet" href="../resources/css/adminProjekcijeStyle.css" />
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">




</head>
<body>

	<!-- START PAGE SOURCE -->
	<div id="shell">
		<div id="header">
			<h1 id="logo">
				<a href="#">MovieHunter</a>
			</h1>

			<div id="navigation">
				<ul>

					 <li><a href="/logout">Logout</a></li>

				</ul>
			</div>
			<div id="sub-navigation">
				<ul>
					<li><a href="/homepage">HOME</a></li>
					<li><a  href="/filmoviProjekcije">FILMOVI</a></li>
					<li><a  href="/userProjekcije">PROJEKCIJE</a></li>
					<li><a  href="/adminFilmovi">EDIT FILMOVE</a></li>
					<li><a class="active" href="/adminProjekcije">EDIT PROJEKCIJE</a></li>
					<li><a href="/adminEvidencija">EVIDENCIJA ZAPOSLENIH</a></li>
					<li><a href="/evidencijaProdaje">EVIDENCIJA PRODAJE</a></li>
				</ul>
				<div id="search">
					<form action="#" method="get" accept-charset="utf-8">
						<label for="search-field">SEARCH</label> <input type="text"
							name="search field" value="Enter search here" id="search-field"
							class="blink search-field" /> <input type="submit" value="GO!"
							class="search-button" />
					</form>
				</div>
			</div>
		</div>
		<div id="main">
			<div id="content">

				<div class="box" >
					<div class="head" >
						<h4>SVE PROJEKCIJE</h4>
						<p class="text-right">
							<a href="/novaProjekcija" style="color:#f3b12b;">DODAJ NOVU</a>
						</p>
					</div>
					<div class="container" style="color:">
						<table class="table table-borderless" style="color: #f3b12b">

							<thead>
								<tr>
									<th>Film</th>
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

										<td>${p.film.naziv}</td>
										<td>${p.datum}</td>
										<td>${p.vreme}</td>
										<td>${p.cena}</td>
										<td>${p.brMesta}</td>
										<td>${p.sala}</td>
										<td><a type="button" class="btn btn-success"
											href="/updateProjekcija?id=${p.idPro}">Update</a></td>
										<td><a type="button" class="btn btn-warning"
											href="/deleteProjekcija?id=${p.idPro}">Delete</a></td>
									</tr>
								</c:forEach>

							</tbody>
						</table>



					</div>
				</div>
				

			</div>

		</div>
	</div>
	<!-- END PAGE SOURCE -->
	
</body>
</html>