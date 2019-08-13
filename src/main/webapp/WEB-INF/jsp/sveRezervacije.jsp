<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<head>
<style>


.b{
	background-color: transparent;
	border: none;
	color:#e7b038;
	text-decoration: none;
	font-family: cursive;
}

.b:hover{
	color:red;
	text-decoration: none;
}
th:hover{
	color:red;
	text-decoration: none;
}
th{
	cursor: pointer;
	font-family: cursive;
	font-size: large;
	}
.datum{
text-align: center;

}
.datum a{
padding-left:10px;
padding-right:10px;
display:inline-block;;
border:dashed;
border-radius:5em;
opacity: 0.9;


color:#e7b038;


}
.datum a:hover{
color:red;
text-decoration: none;
}
</style>
<title>MovieHunter</title>

<link rel="stylesheet"
	href="../resources/css/userProjekcijeStyle.css">
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
					<li><a   href="/zaposleniProjekcije">PROJEKCIJE</a></li>
					<li><a  class="active" href="/sveRezervacije">REZERVACIJE</a></li>
					
				</ul>
				<div id="search">
					<form action="#" method="get" accept-charset="utf-8">
						<label for="search-field">SEARCH</label> <input type="text"
							name="search field" value="Enter search here" id="myInput"
							class="blink search-field" onkeyup="myFunction()" title="Type in a name" /> 
					</form>
				</div>
			</div>
		</div>
		
		<div id="main">
			<div id="content">
			
			
			
					
					
					
			
				<div class="box">
					<div class="head">
						<p style="color:red">${errorMessage }</p>
					</div>
					
					<div class="container" style="color:">
					
						<table id="myTable" class="table table-borderless" style="color: #f3b12b">

							<thead>
								<tr>
									<th onclick="sortTable(0)">Projekcija</th>
									<th onclick="sortTable(1)">Br mesta</th>
									<th onclick="sortTable(2)">Datum</th>
									<th onclick="sortTable(2)">Korisnik</th>
									
									
							</thead>
							<tbody>
								<c:forEach items="${rezervacija}" var="p">
									<tr>

										<td>${p.projekcija.film.naziv}</td>
										<td>${p.brMestaRez}</td>
										<td>${p.projekcija.datum}</td>
										<td>${p.korisnik.username}</td>
										<td>
						
								<form:form method="post" modelAttribute="karta">
								
									<fieldset class="form-group">
										<input value="${p.idRez }" type="hidden" type="number" name="rez">
										<form:input type="hidden"  path="projekcija.idPro" value="${p.projekcija.idPro}"/>
										<form:input type="hidden"  path="cenaKarte" value="${p.projekcija.cena}"/>
										<form:input type="hidden" path="brojKarata" value="${p.brMestaRez}" required="required"/>
										<form:errors path="brojKarata" cssClass="text-warning"/>
								</fieldset>
								<button type="submit" class="b">Prodaj kartu</button>
							
								</form:form>
							
							</td>
										
							
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
	<script>

	function sortTable(n) {
	  var table, rows, switching, i, x, y, shouldSwitch, dir, switchcount = 0;
	  table = document.getElementById("myTable");
	  switching = true;
	  //Set the sorting direction to ascending:
	  dir = "asc"; 
	  /*Make a loop that will continue until
	  no switching has been done:*/
	  while (switching) {
	    //start by saying: no switching is done:
	    switching = false;
	    rows = table.rows;
	    /*Loop through all table rows (except the
	    first, which contains table headers):*/
	    for (i = 1; i < (rows.length - 1); i++) {
	      //start by saying there should be no switching:
	      shouldSwitch = false;
	      /*Get the two elements you want to compare,
	      one from current row and one from the next:*/
	      x = rows[i].getElementsByTagName("TD")[n];
	      y = rows[i + 1].getElementsByTagName("TD")[n];
	      /*check if the two rows should switch place,
	      based on the direction, asc or desc:*/
	      if (dir == "asc") {
	        if (x.innerHTML.toLowerCase() > y.innerHTML.toLowerCase()) {
	          //if so, mark as a switch and break the loop:
	          shouldSwitch= true;
	          break;
	        }
	      } else if (dir == "desc") {
	        if (x.innerHTML.toLowerCase() < y.innerHTML.toLowerCase()) {
	          //if so, mark as a switch and break the loop:
	          shouldSwitch = true;
	          break;
	        }
	      }
	    }
	    if (shouldSwitch) {
	      /*If a switch has been marked, make the switch
	      and mark that a switch has been done:*/
	      rows[i].parentNode.insertBefore(rows[i + 1], rows[i]);
	      switching = true;
	      //Each time a switch is done, increase this count by 1:
	      switchcount ++;      
	    } else {
	      /*If no switching has been done AND the direction is "asc",
	      set the direction to "desc" and run the while loop again.*/
	      if (switchcount == 0 && dir == "asc") {
	        dir = "desc";
	        switching = true;
	      }
	    }
	  }
	}
	</script>
<script>
function myFunction() {
  var input, filter, table, tr, td, i, txtValue;
  input = document.getElementById("myInput");
  filter = input.value.toUpperCase();
  table = document.getElementById("myTable");
  tr = table.getElementsByTagName("tr");
  for (i = 0; i < tr.length; i++) {
    td = tr[i].getElementsByTagName("td")[0];
    if (td) {
      txtValue = td.textContent || td.innerText;
      if (txtValue.toUpperCase().indexOf(filter) > -1) {
        tr[i].style.display = "";
      } else {
        tr[i].style.display = "none";
      }
    }       
  }
}
</script>
</body>
</html>