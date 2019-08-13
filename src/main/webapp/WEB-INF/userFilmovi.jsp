<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<style>
#inline_li {
   
    display:inline;      
}
div.feature {
        position: relative;
       
    }

div.feature a {
        position: absolute;
        width: 100%;
        height: 100%;
        top: 0;
        left: 0;
        text-decoration: none; /* No underlines on the link */
        z-index: 10; /* Places the link above everything else in the div */
        background-color: red; /* Fix to make div clickable in IE */
        opacity: 0; /* Fix to make div clickable in IE */
        filter: alpha(opacity=1); /* Fix to make div clickable in IE */
       
    }

.tiledBackground {
	background-image: url(cinema.jpg);
	background-size: auto;
	background-repeat: repeat;
	background-position: center;
	width: auto;
	height: auto;
	position: relative;
	
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


.container {
	padding: 16px;
	
   color: #d9d9d9;

text-shadow: -1px -1px 1px rgba(255,255,255,.1), 1px 1px 1px rgba(0,0,0,.5);
color: #d9d9d9;
display:flex;
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
	
	 background-color: #cccccc;
  height: 250px;

  background-repeat: no-repeat;
  background-size: cover;
  position: relative;
	margin: 5% auto 15% auto;
	/* 5% from the top, 15% from the bottom and centered */
	border: 1px solid #888;
	width: 60%; /* Could be more or less, depending on screen size */
}



.animate {
	
	-webkit-animation: animatezoom 0.6s;
	animation: animatezoom 0.6s
}
#demotext {
color: #d9d9d9;

text-shadow: -1px -1px 1px rgba(255,255,255,.1), 1px 1px 1px rgba(0,0,0,.5);
color: #d9d9d9;

}
#bloc1, #bloc2
{
    display: inline-flex;
}


</style>
<link href="webjars/bootstrap/3.3.6/css/bootstrap.min.css"
	rel="stylesheet">
	<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
</head>
<body class="tiledBackground">
	<nav style="background-color: transparent; border: none;"
		role="navigation" >
		<div class="navbar-collapse"  id="demotext">
			<ul class="nav navbar-nav" >
				<li><a href="/welcome">Home</a></li>
				<li ><a href="/filmovi">Edit Filmovi</a></li>
				<li><a href="/projekcije">Edit Projekcije</a></li>
				<li class="active"><a href="/filmoviProjekcije">Filmovi </a></li>
				<li><a href="/projekcijeUser">Projekcije</a></li>
				<li><a href="/pretraga">Pretraga</a></li>
			</ul>
			<ul class="nav navbar-nav navbar-right">
				<li><a href="/logout">Logout</a></li>
			</ul>
		</div>
	</nav>
	
	<!--  <div class="container">	
				<c:forEach items="${filmovi}" var="f">
						<button 
							onclick="document.getElementById('${f}').style.display='block'"
							style="width: auto; color:red;"><img  src="/filmovi12?id=${f.id}"></button>

						<div id="${f}"  class="modal">

							<form class="modal-content animate;" style="background-image:url(/filmovi12?id=${f.id}); ">
								
									<span
										onclick="document.getElementById('${f}').style.display='none'"
										class="close" title="Close Modal">&times;</span>

								

								<div class="container"  >
								<div id="bloc1" id="demotext">
								<ul  >

								
									
									<li>Naziv: ${f.naziv}</li>	
									<li>Zanr: ${f.zanr}</li>	
									<li>Glumci: <br/>
									<c:forEach items="${f.glumci}" var="g">
											- ${g}
											<br />
											</c:forEach></li>	
									<li>Reditelj: ${f.reditelj}</li>	
									<li>Opis: ${f.opis}</li>	
									<li ><a type="button"  
											href="${f.trailer}" target="_blank">TRAILER</a></li>	
									
								</ul>
							</div>
							<div id="bloc2" id="demotext">
							<c:forEach items="${f.projekcija }" var="p">
							<div class="feature">
				
      								 <a  href="/projekcije">Rezervisi</a>
 				
								<ul>
								
									<li>${p.datum}</li>
									<li>${p.vreme}</li>
								
								</ul>
								</div>
							</c:forEach>
							<button 
							onclick="document.style.display='/filmovi'"
							style="width: auto; color:red;">pretisni</button>
							</div>
										
								</div>
				
								
							</form>
						</div>
				
	</c:forEach>
	
	</div>	

-->
<div class="container">
<form>
	<c:forEach items="${filmovi }" var="f">
	
		<img src="/filmovi12?id=${f.id }"><br/>
		<a type="button" href="/">Detalji filma</a><br>
		<a type="button" href="/">Projekcije filma</a> <br>
	
	</c:forEach>
</form>

</div>


   
 
	<script src="webjars/jquery/1.9.1/jquery.min.js"></script>
	<script src="webjars/bootstrap/3.3.6/js/bootstrap.min.js"></script>
	<script>
		// Get the modal
		var modal = document.getElementById();

		// When the user clicks anywhere outside of the modal, close it
		window.onclick = function(event) {
			if (event.target == modal) {
				modal.style.display = "none";
			}
		}
	</script>
	
</body>
</html>
