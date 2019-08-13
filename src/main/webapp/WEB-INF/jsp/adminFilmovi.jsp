<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<head>
<style>

</style>
<title>MovieHunter</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />

<link rel="stylesheet" href="../resources/css/adminFilmoviStyle.css" />

<script type="text/javascript" src="engine1/jquery.js"></script>
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
					<li><a class="active"  href="/adminFilmovi">EDIT FILMOVE</a></li>
					<li><a  href="/adminProjekcije">EDIT PROJEKCIJE</a></li>
					<li><a href="/adminEvidencija">EVIDENCIJA ZAPOSLENIH</a></li>
					<li><a href="/evidencijaProdaje">EVIDENCIJA PRODAJE</a></li>
				</ul>
				<div id="search">
					<form action="#" method="get" accept-charset="utf-8">
						<label style="color=transparent" for="search-field">SEARCH</label> <input type="hidden"
							 /> <input type="submit" value="GO!"
							class="search-button" />
					</form>
				</div>
			</div>
		</div>
		<div id="main">
			<div id="content">

				<div class="box">
					<div class="head">
						<h2>FILMOVI KOJI SU NA REPERTOARU</h2>
						<p class="text-right">
							<a href="/add">DODAJ NOVI</a>
						</p>
					</div>
					<c:forEach items="${filmovi1}" var="f1">
						<div class="movie">
							<div class="movie-image">
								<button
									onclick="document.getElementById('${f1}').style.display='block'"
									id="button">
									<img src="/filmovi12?id=${f1.id}" alt="" />
								</button>

								<div id="${f1}" class="modal">

									<div class="modal-content animate">
										<span
											onclick="document.getElementById('${f1}').style.display='none'"
											class="close" title="Close">&times;</span>
										<div class="container">

											<form action="/add3" method="post" enctype="multipart/form-data" >
											
												<label> ODABERITE SLIKU: </label>
												<input type="hidden" name="id" value="${f1.id}" /> 
												<input type="file" name="fileUpload" size="50" />

											<button type="submit" class="btn btn-success">Snimi</button>
											
											</form>




										</div>
									</div>
								</div>

					</div>

							<div class="rating">
								<p style="padding-left: 5px;" >
									<a type="button" class="btn btn-success"
										href="/update?id=${f1.id}">UPDATE</a>
								</p>
								
								<p  style="padding-left: 15px;">
									<a type="button" class="btn btn-warning"
										href="/delete?id=${f1.id}">DELETE</a>
								</p>
								
							<p  style="padding-left: 5px;">
									<a type="button" class="btn btn-success"
										href="/novaProjekcijaFilm?id=${f1.id}">DODAJ PROJEKCIJU</a>
								</p>
								
							<p  style="padding-left: 5px;">
									<a type="button" class="btn btn-success"
										href="/projekcijeZaFilm?id=${f1.id}">SVE PROJEKCIJE</a>
								</p>	
							</div>
						</div>
					</c:forEach>

					<div class="cl">&nbsp;</div>

				</div>
				<div class="box">
					<div class="head">
						<h2>FILMOVI KOJI TREBA DA IZADJU</h2>
						<p class="text-right">
							<a href="/add2">DODAJ NOVI</a>
						</p>
					</div>
					<c:forEach items="${filmovi2}" var="f2">
						<div class="movie">
							<div class="movie-image">
							<button
									onclick="document.getElementById('${f2}').style.display='block'"
									id="button">
									<img src="/filmovi12?id=${f2.id}" alt="" />
								</button>

								<div id="${f2}" class="modal">

									<div class="modal-content animate">
										<span
											onclick="document.getElementById('${f2}').style.display='none'"
											class="close" title="Close">&times;</span>
										<div class="container">

											<form action="/add3" method="post" enctype="multipart/form-data" >
											
												<label> ODABERITE SLIKU: </label>
												<input type="hidden" name="id" value="${f2.id}" /> 
												<input type="file" name="fileUpload" size="50" />

											<button type="submit" class="btn btn-success">Snimi</button>
											
											</form>




										</div>
									</div>
								</div>
							
							</div>
							<div class="rating">
								<div class="rating">
									<p style="padding-left: 27px;">
										<a type="button" class="btn btn-success"
											href="/update?id=${f2.id}">UPDATE</a>
									</p>
									<p style="padding-left: 15px;">
										<a type="button" class="btn btn-warning"
											href="/delete?id=${f2.id}">DELETE</a>
									</p>
								</div>
							</div>
						</div>
					</c:forEach>
					<div class="cl">&nbsp;</div>
				</div>
			</div>
		</div>

	</div>
	<!-- END PAGE SOURCE -->
	<script>
		$(document).ready(function() {

			$(".movie-image").hover(function() {
				$(this).find(".play").show();

			}, function() {
				$(this).find(".play").hide();
			});

			$(".blink").focus(function() {
				if (this.title == this.value) {
					this.value = '';
				}
			}).blur(function() {
				if (this.value == '') {
					this.value = this.title;
				}
			});
		});
	</script>
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
			setTimeout(carousel, 9000);
		}
	</script>
</body>
</html>