<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<style>
.middle {
  transition: .5s ease;
  opacity: 0;
  position: absolute;
  top: 50%;
  left: 50%;
  transform: translate(-50%, -50%);
  -ms-transform: translate(-50%, -50%);
  text-align: center;
 
}

.movie-image:hover .image {
  opacity: 0.3;
}

.movie-image:hover .middle {
  opacity: 1;
}

.text {
  background-color:transparent;
  color: white;
  font-size: 16px;
 
}
</style>
<title>MovieHunter</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link rel="stylesheet" href="../resources/css/styleHomepage.css" />
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
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
					<c:if test="${not empty korisnik.role }">
						<li><a href="/logout">Logout</a></li>
					</c:if>
					<c:if test="${empty korisnik.role}">
						<li>
						<div id="divLog">
								<button
									onclick="document.getElementById('id01').style.display='block'"
									style="width: auto;">Registracija</button>
					        		<div id="id01" class="modal">
									<div class="modal-content animate">
										<div class="imgcontainer">
											<span
												onclick="document.getElementById('id01').style.display='none'"
												class="close" title="Close Modal" style="color: red">&times;</span>
										</div>
										<div class="container">
											<form:form method="post" modelAttribute="korisnik"
												action="/registracijaUser">
												<fieldset class="form-group">
													<form:label path="imeKorisnika">Ime: </form:label>
													<form:input placeholder="Enter Name" style="float: right;" path="imeKorisnika" type="text"
														class="form-control" required="required" />
													<form:errors path="imeKorisnika" cssClass="text-warning" />
												</fieldset>
												<fieldset class="form-group">
													<form:label path="prezimeKorisnika">Prezime: </form:label>
													<form:input placeholder="Enter Lastname" style="float: right;" path="prezimeKorisnika" type="text"
														class="form-control" required="required" />
													<form:errors path="prezimeKorisnika"
														cssClass="text-warning" />
												</fieldset>
												<fieldset class="form-group">
													<form:label path="username">Username: </form:label>
													<form:input placeholder="Enter Username" style="float: right;" path="username" type="text"
														class="form-control" required="required" />
													<form:errors path="username" cssClass="text-warning" />
												</fieldset>
												<fieldset class="form-group">
													<form:label path="password">Password: </form:label>
													<form:input placeholder="Enter Password" style="float: right;" path="password" type="text"
														class="form-control" required="required" />
													<form:errors path="password" cssClass="text-warning" />
												</fieldset>
												<button  style="float: right;" type="submit" class="btn btn-success">Registruj se</button>
											</form:form>
										</div>
									</div>
								</div>
							</div></li>
						<li><div id="divLog">
								<button
									onclick="document.getElementById('id02').style.display='block'"
									style="width: auto;">Login</button>

								<div id="id02" class="modal">

									<div class="modal-content animate">
										<div class="imgcontainer">
											<span
												onclick="document.getElementById('id02').style.display='none'"
												class="close" title="Close Modal" style="color: red">&times;</span>

										</div>

										<div class="container">
											<form method="post" action="/loginPage">
												<label><b>Username</b></label> <input type="text"
													placeholder="Enter Username" name="username" required /> <label><b>Password</b></label>
												<input type="password" placeholder="Enter Password"
													name="password" required />
												<button type="submit">Login</button>
											</form>
										</div>



									</div>
								</div>
							</div></li>
					</c:if>
				</ul>

			</div>
			<p style="float: right; color: red; font-size: large;">${poruka }</p>
			<div id="sub-navigation">
				<ul>
					<li><a class="active" href="/homepage">HOME</a></li>
					<c:if test="${korisnik.role ne 'ZAPOSLENI'}">
					<li><a href="/filmoviProjekcije">FILMOVI</a></li>
					<c:if test="${not empty korisnik.role }">
						<li><a href="/userProjekcije">PROJEKCIJE</a></li>
					</c:if>
					</c:if>
					<c:if test="${korisnik.role eq 'ZAPOSLENI'}">

						<li><a href="/zaposleniProjekcije">PROJEKCIJE</a></li>
						<li><a href="/sveRezervacije">REZERVACIJE</a></li>
						
					</c:if>
					<c:if test="${korisnik.role eq 'ADMIN'}">

						<li><a href="/adminFilmovi">EDIT FILMOVI</a></li>
						<li><a href="/adminProjekcije">EDIT PROJEKCIJE</a></li>
						<li><a href="/adminEvidencija">EVIDENCIJA ZAPOSLENIH</a></li>
						<li><a href="/evidencijaProdaje">EVIDENCIJA PRODAJE</a></li>
					</c:if>
				</ul>
				
			</div>
		</div>
		<div id="main">
			<div id="content">
			
				<div class="box">
					<div class="head">
						<h2>USKORO</h2>
						<p class="text-right"></p>
					</div>
					<div class="w3-content w3-section" style="max-width: 500px">
						<div class="movie-imageU">
							<c:forEach items="${filmovi2 }" var="f">
								<a href="/detaljiFilma?id=${f.id }"><img
									class="mySlides w3-animate-fading" src="/filmovi12?id=${f.id}"></a>
							</c:forEach>
						</div>
					</div>
					<div class="cl" style="color: red;">&nbsp;</div>
				</div>
				<div class="box">
					<div class="head">
						<h2>NAJPOPULARNIJI</h2>
						<p class="text-right" style="color: transparent">See all</p>
					</div>
					<div class="movie">
						<div class="movie-image">
							<a href="/detaljiFilma?id=${filmovi1[0].id}">
							<img src="/filmovi12?id=${filmovi1[0].id}" class="image"/>
							</a>
							<div class="middle">
    						<div class="text">${filmovi1[0].naziv}</div>
  							</div>
						</div>
						<div class="rating">
							<div class="stars">
								<p>${filmovi1[0].prosek}/5</p>
								<div class="stars-in"></div>
							</div>
						</div>
					</div>
					<div class="movie">
						<div class="movie-image">
							<a href="/detaljiFilma?id=${filmovi1[1].id}"><img
								src="/filmovi12?id=${filmovi1[1].id}"  class="image"/></a>
								<div class="middle">
    						<div class="text">${filmovi1[1].naziv}</div>
  							</div>
						</div>
						<div class="rating">

							<div class="stars">
								<p>${filmovi1[1].prosek}/5</p>
								<div class="stars-in"></div>
							</div>
						</div>
					</div>
					<div class="movie">
						<div class="movie-image">
							<a href="/detaljiFilma?id=${filmovi1[2].id}"><img
								src="/filmovi12?id=${filmovi1[2].id}" class="image" /></a>
								<div class="middle">
    						<div class="text">${filmovi1[2].naziv}</div>
  							</div>
						</div>
						<div class="rating">

							<div class="stars">
								<p>${filmovi1[2].prosek}/5</p>
								<div class="stars-in"></div>
							</div>
						</div>
					</div>
					<div class="movie">
						<div class="movie-image">
							<a href="/detaljiFilma?id=${filmovi1[3].id}"><img
								src="/filmovi12?id=${filmovi1[3].id}" class="image" /></a>
								<div class="middle">
    						<div class="text">${filmovi1[3].naziv}</div>
  							</div>
						</div>
						<div class="rating">

							<div class="stars">
								<p>${filmovi1[3].prosek}/5</p>
								<div class="stars-in"></div>
							</div>
						</div>
					</div>
					<div class="movie">
						<div class="movie-image">
							<a href="/detaljiFilma?id=${filmovi1[4].id}"><img
								src="/filmovi12?id=${filmovi1[4].id}" class="image" /></a>
								<div class="middle">
    						<div class="text">${filmovi1[4].naziv}</div>
  							</div>
						</div>
						<div class="rating">

							<div class="stars">
								<p>${filmovi1[4].prosek}/5</p>
								<div class="stars-in"></div>
							</div>
						</div>
					</div>
					<div class="movie last">
						<div class="movie-image">
							<a href="/detaljiFilma?id=${filmovi1[5].id}"><img
								src="/filmovi12?id=${filmovi1[5].id}" class="image" /></a>
								<div class="middle">
    						<div class="text">${filmovi1[5].naziv}</div>
  							</div>
						</div>
						<div class="rating">

							<div class="stars">
								<p>${filmovi1[5].prosek}/5</p>
								<div class="stars-in"></div>
							</div>
						</div>
					</div>
					<div class="cl" style="background-color:  red">&nbsp;</div>
				</div>

			</div>
		</div>

	</div>



	<script>
		var myIndex = 0;
		carousel();

		function carousel() {
			var i;
			var x = document.getElementsByClassName("mySlides");
			for (i = 0; i < x.length; i++) {
				x[i].style.display = "none";
			}
			myIndex++;
			if (myIndex > x.length) {
				myIndex = 1
			}
			x[myIndex - 1].style.display = "block";
			setTimeout(carousel, 10000);
		}
	</script>
	<script>
		// Get the modal
		var modal = document.getElementById('id01');
		var modal2 = document.getElementByName('id02');
		// When the user clicks anywhere outside of the modal, close it
		window.onclick = function(event) {
			if (event.target == modal)  {
				modal.style.display = "none";
			}
			window.onclick = function(event) {
				if (event.target == modal2)  {
					modal.style.display = "none";
				}
		}
	</script>

</body>
</html>