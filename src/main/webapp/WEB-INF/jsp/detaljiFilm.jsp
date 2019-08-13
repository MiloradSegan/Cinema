<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<head>
<style>

</style>
<title>MovieHunter</title>
<link rel="stylesheet"
	href="../resources/css/detaljiFilmaStyle.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
</head>
<body>
	<!-- START PAGE SOURCE -->
	<div id="shell">
		<div id="header">
			
			<div id="navigation">
				<ul>				
    	<c:if test="${not empty korisnik.role }">
        <li><a href="/logout">Logout</a></li>
        </c:if>    
      </ul>
			</div>
<div id="sub-navigation">
      <ul>     
         <li><a href="/filmoviProjekcije">FILMOVI</a></li>
         <li><a class="active" href="">DETALJI FILMA</a></li>         
      </ul>   
		</div>
		<div id="main">
		<p style="text-align: right; color:red">${poruka }</p>
		<c:if test="${film.izasao eq true}">
		<div id="stars1" class="stars">
	<font color= "#f3b12b" style="font-weight: bold;">VOTE: </font>
  <form id ="forma" method="post" action="/ocena?id1=${film.id }">	
  	 <input class="star star-5" id="star-5" type="radio" name="ocena" value="5"/>
    <label class="star star-5" for="star-5"></label>
    <input class="star star-4" id="star-4" type="radio" name="ocena" value="4"/>
    <label class="star star-4" for="star-4"></label>
    <input class="star star-3" id="star-3" type="radio" name="ocena" value="3"/>
    <label class="star star-3" for="star-3"></label>
    <input class="star star-2" id="star-2" type="radio" name="ocena" value="2"/>
    <label class="star star-2" for="star-2"></label>
    <input class="star star-1" id="star-1" type="radio" name="ocena" value="1"/>
    <label class="star star-1" for="star-1"></label>
    </form>
</div>
</c:if>
			<div id="content">
				<div class="box">			
					<div class="movie">
						<div id="div1">
							<div id="h4" id="div1.1">
							<h4>${film.naziv}</h4>
						<a href="${ film.trailer}"  target="_blank">	<img src="/filmovi12?id=${film.id }"></a>
							</div>
							<div id="div1.2">				
							<ul id="ul">			
								<li >Zanr: ${film.zanr}</li>
								<li>Reditelj: ${film.reditelj}</li>
								<li>Rating: ${film.prosek}</li>
								<li>
										Glumci:
										<c:forEach items="${film.glumci }" var="g">
											<ul>
												<li>${g }</li>
											</ul>
										</c:forEach>
									</li>
								<li>Opis: ${film.opis}</li>
							</ul>
							</div>
						</div>
						<div style="width: 1000px" id="div2">					
						<c:if test="${film.izasao eq true}">
						<font color="#f3b12b">Sve projekcije za film ${film.naziv}</font>
						<font color="red">${error}${errorMessage}</font>
							<table id="table">						
		<caption > </caption>
			<thead>
				<tr >	
    			    <th>Datum</th>
					<th>Vreme</th>
					<th>Cena</th>
					<th>BrMesta</th>
					<th>Sala</th>				
				</tr>
			</thead>		
			<tbody>
			<c:forEach items="${film.projekcija}" var="p">  
				<tr >
					
					<td>${p.datum}</td>
					<td>${p.vreme}</td>
					<td>${p.cena}</td>
					<td>${p.brMesta}</td>
					<td>${p.sala}</td>
					
					<td>
						
								<form:form method="post" modelAttribute="rezervacija">
															<fieldset  class="form-group">
																
																<form:input size="5px" type="text" path="brMestaRez"
																	required="required" />
																	<form:input type="hidden" path="projekcija.idPro"
																	value="${p.idPro}" />
															
															
															<button type="submit" class="b">Rezervisi kartu</button>
							<a  class="b" href="/deleteRez?id1=${film.id }">Otkazi rezervaciju</a>
							</fieldset>
								</form:form>
							
							</td>
							
					
				</tr>
				</c:forEach>
				
			</tbody>
	</table>
			</c:if>
						</div>
						<br/>
						
					</div>

				</div>
				
			</div>
		</div>
		
	</div>
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
<script >

$(document).ready(function() {
    $('#stars1').click(function() {
       $('#forma').submit();
    });

}); 

</script>
</body>
</html>