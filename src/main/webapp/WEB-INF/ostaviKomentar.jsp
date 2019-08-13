<html>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<head>
<title>Web App</title>
<link href="webjars/bootstrap/3.3.6/css/bootstrap.min.css" 
rel="stylesheet"> 
</head>
</head>
<body>
	<div class="container">
	
	<form:form method="post" modelAttribute="komentar">
		
		<fieldset class="form-group">
			<form:label path="tekst">Ostavi komentar za film  ${komentar.film.naziv}</form:label>
			<form:input path="tekst" type="text"  class="form-control" />
			<form:errors  path="tekst" cssClass="text-warning"/>
		</fieldset>
		
		
		
	<button type="submit" class="btn btn-success">ADD </button>
	</form:form>
	</div>
	<script src="webjars/jquery/1.9.1/jquery.min.js"></script>
	<script src="webjars/bootstrap/3.3.6/js/bootstrap.min.js"></script>
	<script src="webjars/bootstrap-datepicker/1.0.1/js/bootstrap-datepicker.js"></script>

	
</body>
</html>  