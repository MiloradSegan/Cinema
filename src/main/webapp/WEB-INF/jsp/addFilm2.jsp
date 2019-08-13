<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<html>
<head>
<style >
body {
	font-size:12px;
	line-height:1.3;
	font-family:Arial, Helvetica, Sans-Serif;
	color:#ccc;
	background:url('body-bg.gif');
	opacity: 0.8;
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
	!important;
}

.modal-content {
	background: url(body-bg.gif);
	opacity: 0.9;
	height: 250px;
	margin: 5% auto 15% auto;
	/* 5% from the top, 15% from the bottom and centered */
	border: 1px solid #888;
	width: 60%; /* Could be more or less, depending on screen size */
	position:relative;
	border-radius:6px;
	overflow:auto;
	
}

.close {
	size: 50px;
	padding: 16px;
	cursor: pointer;
	background: 0 0;
	border: 0;
}

.animate {
	-webkit-animation: animatezoom 1s;
	animation: animatezoom 1s
}
</style>
<title>Web App</title>
 <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
</head>
<body>
	<div class="container" style="color:#f3b12b">
		<form:form method="post" action="/add2" modelAttribute="film1" enctype="multipart/form-data" >
			<fieldset class="form-group">
				<form:label path="naziv">Naziv: </form:label>
				<form:input path="naziv" type="text" class="form-control"
					required="required" />
				<form:errors path="naziv" cssClass="text-warning" />
			</fieldset>
			<fieldset class="form-group">
				<form:label path="zanr">Zanr: </form:label>
				<form:select path="zanr" name="zanr">
					<option>Akcija</option>
					<option>Komedija</option>
					<option>Drama</option>
					<option>Horor</option>
					<option>Triler</option>
				</form:select>
				<form:errors path="zanr" cssClass="text-warning" />
			</fieldset>
			<fieldset class="form-group">
				<form:label path="glumci">Glumci: </form:label>
				<form:input path="glumci" type="text" class="form-control"
					required="required" />
				<form:errors path="glumci" cssClass="text-warning" />
			</fieldset>
			<fieldset class="form-group">
				<form:label path="reditelj">Reditelj: </form:label>
				<form:input path="reditelj" type="text" class="form-control"
					required="required" />
				<form:errors path="reditelj" cssClass="text-warning" />
			</fieldset>
			<fieldset class="form-group">
				<form:label path="opis">Opis: </form:label>
				<form:textarea path="opis" type="text" class="form-control"
					required="required" />
				<form:errors path="opis" cssClass="text-warning" />
			</fieldset>
			<fieldset class="form-group">
				<form:label path="trailer">Trailer: </form:label>
				<form:input path="trailer" type="text" class="form-control"
					required="required" />
				<form:errors path="trailer" cssClass="text-warning" />
			</fieldset>

		  <fieldset class="form-group">
				<form:label path="slika" > Slika: </form:label>
				<input type="file" name="fileUpload" size="50" class="form-control"/>
			
				<form:errors path="slika" cssClass="text-warning" />
			</fieldset>
			
			
			<a type="button" class="btn btn-danger" href="/adminFilmovi">Back</a>
			<button type="submit" class="btn btn-success">Snimi</button>


		</form:form>



	</div>
	<script src="webjars/jquery/1.9.1/jquery.min.js"></script>
	<script src="webjars/bootstrap/3.3.6/js/bootstrap.min.js"></script>
</body>
</html>