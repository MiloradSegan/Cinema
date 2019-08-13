<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<head>
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
  color: yellow;
  font-size: 16px;
 
}
 .autocomplete {
  position: relative;
  display: inline-block;
}


.autocomplete-items {
  position: absolute;
  border: 1px solid #d4d4d4;
  border-bottom: none;
  border-top: none;
  z-index: 99;
  /*position the autocomplete items to be the same width as the container:*/
  top: 100%;
  left: 0;
  right: 0;
  color:red;
  font-weight: bold;
}

.autocomplete-items div {
  padding: 10px;
  cursor: pointer;
  background-color: #fff; 
  border-bottom: 1px solid #d4d4d4; 
}

/*when hovering an item:*/
.autocomplete-items div:hover {
  background-color: #e9e9e9; 
}

/*when navigating through the items using the arrow keys:*/
.autocomplete-active {
  background-color: DodgerBlue !important; 
  color: #ffffff; 
}
</style>

<title>MovieHunter</title>
<link rel="stylesheet" href="../resources/css/userIzasliFilmoviStyle.css"/>

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
					  <li><div id="divLog">
						<button 
							onclick="document.getElementById('id01').style.display='block'"
							style="width: auto; ">Registracija</button>

						<div id="id01" class="modal">

							<div class="modal-content animate">
								<div class="imgcontainer">
									<span
										onclick="document.getElementById('id01').style.display='none'"
										class="close" title="Close Modal" style="color:red">&times;</span>

								</div>

								<div class="container">
		<form:form method="post" modelAttribute="korisnik" action="/registracijaUser">
			<fieldset class="form-group">
				<form:label path="imeKorisnika">Ime: </form:label>
				<form:input placeholder="Enter Name" style="float: right;" path="imeKorisnika" type="text" class="form-control"
					required="required" />
				<form:errors path="imeKorisnika" cssClass="text-warning" />
			</fieldset>


			<fieldset class="form-group">
				<form:label path="prezimeKorisnika">Prezime: </form:label>
				<form:input placeholder="Enter Lastname" style="float: right;" path="prezimeKorisnika" type="text" class="form-control"
					required="required" />
				<form:errors path="prezimeKorisnika" cssClass="text-warning" />
			</fieldset>
			<fieldset class="form-group">
				<form:label path="username">Username: </form:label>
				<form:input placeholder="Enter Username" style="float: right;" path="username" type="text" class="form-control"
					required="required" />
				<form:errors path="username" cssClass="text-warning" />
			</fieldset>
			<fieldset class="form-group">
				<form:label path="password">Password: </form:label>
				<form:input placeholder="Enter Password" style="float: right;" path="password" type="text" class="form-control"
					required="required" />
				<form:errors path="password" cssClass="text-warning" />
			</fieldset>

			
			<button style="float: right;" type="submit" class="btn btn-success">Registruj se</button>
		</form:form>

	</div>
								
							</div>
						</div>
					</div></li>
        <li><div id="divLog">
						<button 
							onclick="document.getElementById('id02').style.display='block'"
							style="width: auto; ">Login</button>

						<div id="id02" class="modal">

							<div class="modal-content animate">
								<div class="imgcontainer">
									<span
										onclick="document.getElementById('id02').style.display='none'"
										class="close" title="Close Modal" style="color:red">&times;</span>

								</div>

								<div class="container">
								<form method="post" action="/loginPage">
									<label ><b>Username</b></label> 
									<input type="text" placeholder="Enter Username" name="username" required /> 
									<label ><b>Password</b></label> 
									<input type="password" placeholder="Enter Password" name="password" required/>
									<button type="submit" >Login</button>
									</form>
								</div>
							
								
								
							</div>
						</div>
					</div>
        
        </li>
        </c:if>
				</ul>
			</div>
			<div id="sub-navigation">
				<ul>
				
					<li><a href="/homepage">HOME</a></li>	
					
					
					<li><a class="active" href="/filmoviProjekcije">FILMOVI</a></li>
					<c:if test="${not empty korisnik.role }">
					<li><a href="/userProjekcije">PROJEKCIJE</a></li>
					</c:if>
					<c:if test="${korisnik.role eq 'ADMIN'}">
					
						<li><a href="/adminFilmovi">EDIT FILMOVI</a></li>
						<li><a href="/adminProjekcije">EDIT PROJEKCIJE</a></li>
						<li><a href="/adminEvidencija">EVIDENCIJA ZAPOSLENIH</a></li>
						<li><a href="/evidencijaProdaje">EVIDENCIJA PRODAJE</a></li>
					</c:if>
				</ul>
				<div id="search">
					<form autocomplete="off"   action="/filmNaziv">
						<label for="search-field">SEARCH</label> 
						<div class="autocomplete">
						<input style="color: red" type="text" name="film" placeholder="Naziv filma" id="myInput"
							class="blink search-field" /> 
							<input type="submit" value="GO!"
							class="search-button" />
							</div>
					</form>
				</div>
			</div>
		</div>
	
		<div id="main">
			<div id="content">

				<div class="box">
				
					<div class="head">
						<h2>SVI FILMOVI</h2>
						<p class="text-right" style="color:yellow;font-weight:bold; font-size: medium;"> ${error}${errorMessage}</p>
					</div>
					<c:if test="${empty filmoviNaziv }">
					
					<c:forEach items="${filmovi}" var="f">
						<div class="movie">
							<div class="movie-image">
								<a href="/detaljiFilma?id=${f.id}"><img src="/filmovi12?id=${f.id}" alt="" /></a>
								<div class="middle">
    						<div class="text">${f.naziv}</div>
  							</div>
							</div>
						  <div id="com">
								<button
									onclick="document.getElementById('${f}').style.display='block'"
									id="button"></button>
								<div id="${f}" class="modal">
									<div class="modal-content animate">
										<span
											onclick="document.getElementById('${f}').style.display='none'"
											class="close" title="Close">&times;</span>
										<div class="container">
										
											<div id="com2">Ostavi komentar
											<form action="/filmoviUser" method="post">
												<input type="hidden" name="idF" value="${f.id}" /> 
												<input type="text" name="komentar" />
									<button type="submit" class="btn btn-success">Snimi</button>
											
								</form>	
											</div>	
								
											<div id="com2">
											
											<c:forEach items="${f.komentari}" var="k">
								 	Datum: ${k.datumKom}
								 	<br />
								 	Komentar: ${k.tekst}
								 	
								 	<hr>
								</c:forEach>
							
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
						
					</c:forEach>
					</c:if>
					
					<c:if test="${not empty filmoviNaziv }">
					<c:forEach items="${filmoviNaziv}" var="f">
					
						<div class="movie">

							<div class="movie-image">
								<a href="/detaljiFilma?id=${f.id}"><img src="/filmovi12?id=${f.id}" alt="" /></a>
							</div>
						  <div id="com">
								<button
									onclick="document.getElementById('${f}').style.display='block'"
									id="button"></button>

								<div id="${f}" class="modal">

									<div class="modal-content animate">
										<span
											onclick="document.getElementById('${f}').style.display='none'"
											class="close" title="Close">&times;</span>
										<div class="container">
										
											<div id="com2">Ostavi komentar
											<form action="/filmoviUser" method="post">
												<input type="hidden" name="idF" value="${f.id}" /> 
												<input type="text" name="komentar" />
									<button type="submit" class="btn btn-success">Snimi</button>
											
								</form>	
											</div>	
								
											<div id="com2">
											
											<c:forEach items="${f.komentari}" var="k">
								 	Datum: ${k.datumKom}
								 	<br />
								 	Komentar: ${k.tekst}
								 	
								 	<hr>
								</c:forEach>
							
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
						
					</c:forEach>
					</c:if>
	<div class="cl">&nbsp;</div>
				</div>
				
	<!-- OVDE KRECE NOVI -->	
	<c:if test="${not empty filmoviRazlika }">		
				<div class="box">
					<div class="head">
						<h2>Preporuceni</h2>
						<p class="text-right" style="color:red;font-weight:bold;"> ${error}${errorMessage}</p>
					</div>
					
					<c:forEach items="${filmoviRazlika}" var="f">
					
						<div class="movie">

							<div class="movie-image">
								<a href="/detaljiFilma?id=${f.id}"><img src="/filmovi12?id=${f.id}" alt="" /></a>
								<div class="middle">
    						<div class="text">${f.naziv}</div>
  							</div>
							</div>
						  <div id="com">
								<button
									onclick="document.getElementById('${f}').style.display='block'"
									id="button"></button>

								<div id="${f}" class="modal">

									<div class="modal-content animate">
										<span
											onclick="document.getElementById('${f}').style.display='none'"
											class="close" title="Close">&times;</span>
										<div class="container">
										
											<div id="com2">Ostavi komentar
											<form action="/filmoviUser" method="post">
												<input type="hidden" name="idF" value="${f.id}" /> 
												<input type="text" name="komentar" />
									<button type="submit" class="btn btn-success">Snimi</button>
											
								</form>	
											</div>	
								
											<div id="com2">
											
											<c:forEach items="${f.komentari}" var="k">
								 	Datum: ${k.datumKom}
								 	<br />
								 	Komentar: ${k.tekst}
								 	
								 	<hr>
								</c:forEach>
							
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
						
					</c:forEach>
					
					
				</div>
				
				</c:if>
	
	
	
	
	
	
	<!--  OVDE SE ZAVRSAVA -->
			</div>

		</div>
	</div>
	<!-- END PAGE SOURCE -->
	

	<script>
		// Get the modal
		var modal = document.getElementById();

		// When the user clicks anywhere outside of the modal, close it
		onclick = function(event) {
			if (event.target == modal) {
				modal.style.display = "none";
			}
		}
	</script>
	
<script >

$(document).ready(function() {
    $('#star').click(function() {
       $('#forma').submit();
    });

}); 

</script>
<script>
function autocomplete(inp, arr) {
  /*the autocomplete function takes two arguments,
  the text field element and an array of possible autocompleted values:*/
  var currentFocus;
  /*execute a function when someone writes in the text field:*/
  inp.addEventListener("input", function(e) {
      var a, b, i, val = this.value;
      /*close any already open lists of autocompleted values*/
      closeAllLists();
      if (!val) { return false;}
      currentFocus = -1;
      /*create a DIV element that will contain the items (values):*/
      a = document.createElement("DIV");
      a.setAttribute("id", this.id + "autocomplete-list");
      a.setAttribute("class", "autocomplete-items");
      /*append the DIV element as a child of the autocomplete container:*/
      this.parentNode.appendChild(a);
      /*for each item in the array...*/
      for (i = 0; i < arr.length; i++) {
        /*check if the item starts with the same letters as the text field value:*/
        if (arr[i].substr(0, val.length).toUpperCase() == val.toUpperCase()) {
          /*create a DIV element for each matching element:*/
          b = document.createElement("DIV");
          /*make the matching letters bold:*/
          b.innerHTML = "<strong>" + arr[i].substr(0, val.length) + "</strong>";
          b.innerHTML += arr[i].substr(val.length);
          /*insert a input field that will hold the current array item's value:*/
          b.innerHTML += "<input type='hidden' value='" + arr[i] + "'>";
          /*execute a function when someone clicks on the item value (DIV element):*/
          b.addEventListener("click", function(e) {
              /*insert the value for the autocomplete text field:*/
              inp.value = this.getElementsByTagName("input")[0].value;
              /*close the list of autocompleted values,
              (or any other open lists of autocompleted values:*/
              closeAllLists();
          });
          a.appendChild(b);
        }
      }
  });
  /*execute a function presses a key on the keyboard:*/
  inp.addEventListener("keydown", function(e) {
      var x = document.getElementById(this.id + "autocomplete-list");
      if (x) x = x.getElementsByTagName("div");
      if (e.keyCode == 40) {
        /*If the arrow DOWN key is pressed,
        increase the currentFocus variable:*/
        currentFocus++;
        /*and and make the current item more visible:*/
        addActive(x);
      } else if (e.keyCode == 38) { //up
        /*If the arrow UP key is pressed,
        decrease the currentFocus variable:*/
        currentFocus--;
        /*and and make the current item more visible:*/
        addActive(x);
      } else if (e.keyCode == 13) {
        /*If the ENTER key is pressed, prevent the form from being submitted,*/
        e.preventDefault();
        if (currentFocus > -1) {
          /*and simulate a click on the "active" item:*/
          if (x) x[currentFocus].click();
        }
      }
  });
  function addActive(x) {
    /*a function to classify an item as "active":*/
    if (!x) return false;
    /*start by removing the "active" class on all items:*/
    removeActive(x);
    if (currentFocus >= x.length) currentFocus = 0;
    if (currentFocus < 0) currentFocus = (x.length - 1);
    /*add class "autocomplete-active":*/
    x[currentFocus].classList.add("autocomplete-active");
  }
  function removeActive(x) {
    /*a function to remove the "active" class from all autocomplete items:*/
    for (var i = 0; i < x.length; i++) {
      x[i].classList.remove("autocomplete-active");
    }
  }
  function closeAllLists(elmnt) {
    /*close all autocomplete lists in the document,
    except the one passed as an argument:*/
    var x = document.getElementsByClassName("autocomplete-items");
    for (var i = 0; i < x.length; i++) {
      if (elmnt != x[i] && elmnt != inp) {
        x[i].parentNode.removeChild(x[i]);
      }
    }
  }
  /*execute a function when someone clicks in the document:*/
  document.addEventListener("click", function (e) {
      closeAllLists(e.target);
  });
}

/*An array containing all the country names in the world:*/
 
 var countries = [];
 	<c:forEach items="${filmovi}" var="f">
 
		countries.push("${f.naziv}");
		 </c:forEach>
/*initiate the autocomplete function on the "myInput" element, and pass along the countries array as possible autocomplete values:*/
autocomplete(document.getElementById("myInput"), countries);
</script>


</body>
</html>