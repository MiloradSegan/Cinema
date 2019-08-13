<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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

</style>
<title>Web App</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">

<link href="webjars/bootstrap-datetimepicker/6aa746736d/css/datetimepicker.css" />

</head>
<body >
	<div class="container" style="color:#f3b12b;font-weight: bold" >
	<form:form method="post"  modelAttribute="zaposleni">
	 <fieldset class="form-group">
	 		<form:label path="imeKorisnika">Ime: </form:label>
			<form:input path="imeKorisnika" type="text" class="form-control" />
			<form:errors  path="imeKorisnika" cssClass="text-warning"/>
		</fieldset>
		
		<fieldset class="form-group">
			<form:label path="prezimeKorisnika">Prezime: </form:label>
			<form:input path="prezimeKorisnika" type="text" class="form-control" />
			<form:errors  path="prezimeKorisnika" cssClass="text-warning"/>
		</fieldset>
		<fieldset class="form-group">
			<form:label path="username">Username: </form:label>
			<form:input path="username" type="text" class="form-control" />
			<form:errors  path="username" cssClass="text-warning"/>
		</fieldset>
		  <fieldset class="form-group">
			<form:input path="idKorisnik" type="hidden"/>
			<form:input path="password" type="hidden" class="form-control" />
			
		</fieldset>
		<fieldset class="form-group">
			<form:label path="role">Role: </form:label>
			<form:select path="role" type="text" class="form-control" > 
					<option>ADMIN</option>
					<option>ZAPOSLENI</option>
			</form:select>
			<form:errors  path="role" cssClass="text-warning"/>
		</fieldset>
	<a href="/adminEvidencija" class="btn btn-danger">Back</a>
	<button type="submit" class="btn btn-success" >Snimi </button>
	</form:form>	
	</div>
	<script src="webjars/jquery/1.9.1/jquery.min.js"></script>
	<script src="webjars/bootstrap/3.3.6/js/bootstrap.min.js"></script>
	<script
		src="webjars/bootstrap-datepicker/1.0.1/js/bootstrap-datepicker.js"></script>
		<script src="webjars/bootstrap-datetimepicker/6aa746736d/js/bootstrap-datetimepicker.min.js"></script>
		
	
</body>
</html>