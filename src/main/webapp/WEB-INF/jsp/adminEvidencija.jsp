<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<head>

<title>MovieHunter</title>
<link rel="stylesheet"
	href="../resources/css/adminEvidencijaStyle.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">

<!--[if IE 6]><link rel="stylesheet" href="css/ie6.css" type="text/css" media="all" /><![endif]-->


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
					<li><a  href="/adminProjekcije">EDIT PROJEKCIJE</a></li>
					<li><a class="active" href="/adminEvidencija">EVIDENCIJA ZAPOSLENIH</a></li>
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
			<div class="box">
					<div class="head">
						<h4>SVI ZAPOSLENI</h4>
						<div id="div1">
							<a href="/addZaposlenog">DODAJ NOVOG ZAPOSLENOG</a>
						</div>
					</div>
					<div class="container" style="color:">
						<table class="table table-borderless" style="color: #f3b12b">
							<thead>
								<tr>
									<th>ID</th>
									<th>IME</th>
									<th>PREZIME</th>
									<th>USERNAME</th>
									<th>ROLE</th>
									<th></th>
									<th></th>
							</thead>
							<tbody>
								<c:forEach items="${users}" var="u">
									<tr>

										<td>${u.idKorisnik}</td>
										<td>${u.imeKorisnika}</td>
										<td>${u.prezimeKorisnika}</td>
										<td>${u.username}</td>
										<td>${u.role}</td>
										
										<td><a type="button" class="btn btn-success"
											href="/updateZaposlenog?id=${u.idKorisnik}">Update</a></td>
										<td><a type="button" class="btn btn-warning"
											href="/deleteKorisnik?id=${u.idKorisnik}">Delete</a></td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
					</div>
				</div>
				<div class="box">
					<div class="head1">
						<h4>SVI REGISTROVANI KORISNICI</h4>
					</div>
					<div class="container" style="color:">
						<table class="table table-borderless" style="color: #f3b12b">
							<thead>
								<tr>
									<th>ID</th>
									<th>IME</th>
									<th>PREZIME</th>
									<th>USERNAME</th>
									<th>ROLE</th>
									<th></th>
									
							</thead>
							<tbody>
								<c:forEach items="${usersU}" var="u">
									<tr>

										<td>${u.idKorisnik}</td>
										<td>${u.imeKorisnika}</td>
										<td>${u.prezimeKorisnika}</td>
										<td>${u.username}</td>
										<td>${u.role}</td>
										
								
										<td><a type="button" class="btn btn-warning"
											href="/deleteKorisnik?id=${u.idKorisnik}">Delete</a></td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
					</div>
				</div>

			</div>

	
	<!-- END PAGE SOURCE -->
	
</body>
</html>