<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<html>
<head>
<title>Web App</title>
<link href="webjars/bootstrap/3.3.6/css/bootstrap.min.css"
	rel="stylesheet">
</head>
<body>
	<div class="container">
		<form:form method="post" modelAttribute="korisnik">
			<fieldset class="form-group">
				<form:label path="imeKorisnika">Ime: </form:label>
				<form:input path="imeKorisnika" type="text" class="form-control"
					required="required" />
				<form:errors path="imeKorisnika" cssClass="text-warning" />
			</fieldset>


			<fieldset class="form-group">
				<form:label path="prezimeKorisnika">Prezime: </form:label>
				<form:input path="prezimeKorisnika" type="text" class="form-control"
					required="required" />
				<form:errors path="prezimeKorisnika" cssClass="text-warning" />
			</fieldset>
			<fieldset class="form-group">
				<form:label path="username">Username: </form:label>
				<form:input path="username" type="text" class="form-control"
					required="required" />
				<form:errors path="username" cssClass="text-warning" />
			</fieldset>
			<fieldset class="form-group">
				<form:label path="password">Password: </form:label>
				<form:input path="password" type="text" class="form-control"
					required="required" />
				<form:errors path="password" cssClass="text-warning" />
			</fieldset>

			<a type="button" class="btn btn-danger" href="/loginPage">Back</a>
			<button type="submit" class="btn btn-success">Registruj se</button>
		</form:form>

	</div>
	<script src="webjars/jquery/1.9.1/jquery.min.js"></script>
	<script src="webjars/bootstrap/3.3.6/js/bootstrap.min.js"></script>
</body>
</html>