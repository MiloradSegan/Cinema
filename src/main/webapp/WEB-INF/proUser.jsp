<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<html>
<head>
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
				<li ><a href="/welcome">Home</a></li>
				<li ><a href="/filmovi">Edit Filmovi</a></li>
				<li ><a href="/projekcije">Edit Projekcije</a></li>
				<li><a href="/filmoviUser">Filmovi</a></li>
				<li class="active" ><a href="/projekcijeUser">Projekcije</a></li>
			</ul>
			<ul class="nav navbar-nav navbar-right">
			<li><a href="/logout">Logout</a></li>
		</ul>
		</div>
	</nav>
	<div class="container">
	<font color="red">${errorMessage}</font>
	<table class="table table-striped">
		<caption>Sve projekcije</caption>
			<thead>
				<tr>
					<th>Film</th>
					<th>Datum</th>
					<th>Vreme</th>
					<th>Cena</th>
					<th>BrMesta</th>
					<th>Sala</th>
					<th>TipProjekcije</th>
				</tr>
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
					<td>${p.tipProjekcije}</td>
					<td><button class="collapsible">Rezervise karte</button>
						<div class="content">
							<!-- <form action="/projekcijeUser" method="post">
    							<input type="hidden" name="id" value="${p.idPro}"/>
   								<input type="text" name="brKarata" />
    							<button type="submit" class="btn btn-success">rezervisi</button>
								</form>-->
								<form:form method="post" modelAttribute="rezervacija">
									<fieldset class="form-group">
			
										<form:input type="hidden"  path="projekcija.idPro" value="${p.idPro}"/>
										<form:input type="text" path="brMestaRez" required="required"/>
										<form:errors path="brMestaRez" cssClass="text-warning"/>
								</fieldset>
								<button type="submit" class="btn btn-success">Rezervisi</button>
							<a type="button" class="btn btn-warning" href="/deleteRez">Otkazi rezervaciju</a>
								</form:form>
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
    if (content.style.maxHeight){
      content.style.maxHeight = null;
    } else {
      content.style.maxHeight = content.scrollHeight + "px";
    } 
  });
}
</script>
</body>
</html>