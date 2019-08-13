<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<style>
table, td, th {
  border: none;
}

table {
  border-collapse: collapse;
  width: 100%;
}

td {
  text-align: center;
}

.tiledBackground {
	background-image: url(cinema.jpg);
	background-size: 200%;
	background-repeat: none;
	background-position: center;
	width: auto;
	height: auto;
}

input[type=text], input[type=password] {
	width: 100%;
	padding: 12px 20px;
	margin: 8px 0;
	display: inline-block;
	border: 1px solid #ccc;
	box-sizing: border-box;
}

/* Set a style for all buttons */
button {

	/*background-color: #4CAF50;*/
	background-color:transparent;
	color: white;
	padding: 14px 20px;
	margin: 8px 0;
	border: none;
	cursor: pointer;
	width: 100%;
}

button:hover {
	opacity: 0.8;
}

/* Extra styles for the cancel button */
.cancelbtn {
	width: auto;
	padding: 10px 18px;
	background-color: #f44336;
}

/* Center the image and position the close button */
.imgcontainer {
	text-align: center;
	margin: 24px 0 12px 0;
	position: relative;
}

img.avatar {
	width: 40%;
	border-radius: 50%;
}

.container {
	padding: 16px;
}

span.psw {
	float: right;
	padding-top: 16px;
}

.modal {
	display: none; /* Hidden by default */
	position: fixed; /* Stay in place */
	z-index: 1; /* Sit on top */
	left: 0;
	top: 0;
	width: 100%; /* Full width */
	height: 100%; /* Full height */
	overflow: auto; /* Enable scroll if needed */
	background-color: rgb(0, 0, 0); /* Fallback color */
	background-color: rgba(0, 0, 0, 0.4); /* Black w/ opacity */
	padding-top: 60px;
}

.modal-content {
	background-color: #fefefe;
	margin: 5% auto 15% auto;
	/* 5% from the top, 15% from the bottom and centered */
	border: 1px solid #888;
	width: 90%; /* Could be more or less, depending on screen size */
}

.close {
	position: absolute;
	right: 25px;
	top: 0;
	color: #000;
	font-size: 35px;
	font-weight: bold;
}

.close:hover, .close:focus {
	color: red;
	cursor: pointer;
}

.animate {
	-webkit-animation: animatezoom 0.6s;
	animation: animatezoom 0.6s
}

@
-webkit-keyframes animatezoom {
	from {-webkit-transform: scale(0)
}

to {
	-webkit-transform: scale(1)
}

}
@
keyframes animatezoom {
	from {transform: scale(0)
}

to {
	transform: scale(1)
}

}
@media screen and (max-width: 300px) {
	span.psw {
		display: block;
		float: none;
	}
	.cancelbtn {
		width: 100%;
	}
}

/* Popup container - can be anything you want */
.popup {
	position: relative;
	display: inline-block;
	cursor: pointer;
	-webkit-user-select: none;
	-moz-user-select: none;
	-ms-user-select: none;
	user-select: none;
}

/* The actual popup */
.popup .popuptext {
	visibility: hidden;
	width: 160px;
	background-color: #555;
	color: #fff;
	text-align: center;
	border-radius: 6px;
	padding: 8px 0;
	position: absolute;
	z-index: 1;
	bottom: 10%;
	left: 50%;
	margin-left: -80px;
}

/* Popup arrow */
.popup .popuptext::after {
	content: "";
	position: absolute;
	top: 100%;
	left: 50%;
	margin-left: -5px;
	border-width: 5px;
	border-style: solid;
	border-color: #555 transparent transparent transparent;
}

/* Toggle this class - hide and show the popup */
.popup .show {
	visibility: visible;
	-webkit-animation: fadeIn 1s;
	animation: fadeIn 1s;
}

/* Add animation (fade in the popup) */
@
-webkit-keyframes fadeIn {
	from {opacity: 0;
}

to {
	opacity: 1;
}

}
@
keyframes fadeIn {
	from {opacity: 0;
}

to {
	opacity: 1;
}
}
</style>
<link href="webjars/bootstrap/3.3.6/css/bootstrap.min.css"
	rel="stylesheet">
	<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
</head>
<body class="tiledBackground">
	<nav style="background-color: transparent; border: none;"
		role="navigation" >
		<div class="navbar-collapse">
			<ul class="nav navbar-nav" style="color:red">
				<li><a href="/welcome">Home</a></li>
				<li class="active"><a href="/filmovi">Edit Filmovi</a></li>
				<li><a href="/projekcije">Edit Projekcije</a></li>
				<li><a href="/filmoviUser">Filmovi</a></li>
				<li><a href="/projekcijeUser">Projekcije</a></li>
				<li><a href="/pretraga">Pretraga</a></li>
			</ul>
			<ul class="nav navbar-nav navbar-right">
				<li><div>
						<button 
							onclick="document.getElementById('id01').style.display='block'"
							style="width: auto; color:red;">Login</button>

						<div id="id01" class="modal">

							<form class="modal-content animate">
								<div class="imgcontainer">
									<span
										onclick="document.getElementById('id01').style.display='none'"
										class="close" title="Close Modal">&times;</span>

								</div>

								<div class="container">
									<label for="uname"><b>Username</b></label> <input type="text"
										placeholder="Enter Username" name="uname" required> <label
										for="psw"><b>Password</b></label> <input type="password"
										placeholder="Enter Password" name="psw" required>

									<button type="submit">Login</button>
									<label> <input type="checkbox" checked="checked"
										name="remember"> Remember me
									</label>
								</div>

								<div class="container" style="background-color: #f1f1f1">
									<button type="button"
										onclick="document.getElementById('id01').style.display='none'"
										class="cancelbtn">Cancel</button>

								</div>
							</form>
						</div>
					</div></li>
			</ul>
		</div>
	</nav>
	
	<div class="w3-content w3-section" style="width:1000px">
  <p><font color="black">Uskoro</font></p>
	<img class="mySlides w3-animate-fading" src="/filmovi12?id=${filmovi2[0].id}"  height="500px" width="1000px">
 <img class="mySlides w3-animate-fading" src="/filmovi12?id=${filmovi2[1].id}" height="500px" width="1000px">
 <img class="mySlides w3-animate-fading" src="/filmovi12?id=${filmovi2[2].id}" height="500px" width="1000px">
 </div>
	<div class="container">
	<table>
		<thead><tr><th>Aktuelni filmovi</th></tr></thead>
		<tbody>
			<tr>
				<td><img  src="/filmovi12?id=${filmovi1[0].id}" style="width:90%"></td>	
				<td><img  src="/filmovi12?id=${filmovi1[1].id}" style="width:90%"></td>
				<td><img  src="/filmovi12?id=${filmovi1[2].id}" style="width:90%"></td>
			</tr>
			<tr>
				<td><img src="/filmovi12?id=${filmovi1[3].id}" style="width:90%"></td>
				<td><img src="/filmovi12?id=${filmovi1[4].id}" style="width:90%"></td>
				<td><img  src="/filmovi12?id=${filmovi1[5].id}" style="width:90%"></td>
			</tr>
		</tbody>
		
		
	</table>
	</div>
<!--
	<h2>Popup</h2>

  <div class="popup" onclick="myFunction()"><img src="/filmovi12?id=${filmovi1[1].id}" height="60" width="60" />
  <span class="popuptext" id="myPopup">
							<table>

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

									<tr>
										<td>${filmovi[1].id}</td>
										<td>${filmovi[1].naziv}</td>
										<td>${filmovi[1].zanr}</td>
										<td><c:forEach items="${filmovi[1].glumci}" var="g">
											-${g}
											<br />
											</c:forEach></td>
										<td>${filmovi[1].reditelj}</td>
										<td>${filmovi[1].opis}</td>
										<td><a type="button" class="c"
											href="${filmovi[1].trailer}" target="_blank">Trailer</a></td>
										<td>${filmovi[1].prosek}</td>
									</tr>
								</tbody>
							</table>
						</span>
</div>
-->
<script>
// When the user clicks on div, open the popup
function myFunction() {
  var popup = document.getElementById("myPopup");
  popup.classList.toggle("show");
}
</script>
-->
	<script src="webjars/jquery/1.9.1/jquery.min.js"></script>
	<script src="webjars/bootstrap/3.3.6/js/bootstrap.min.js"></script>
	<script>
		// Get the modal
		var modal = document.getElementById('id01');

		// When the user clicks anywhere outside of the modal, close it
		window.onclick = function(event) {
			if (event.target == modal) {
				modal.style.display = "none";
			}
		}
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
