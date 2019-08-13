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
	<form:form method="post"  modelAttribute="projekcija">
	 <fieldset class="form-group">
			
			<form:input path="film.id" type="hidden" class="form-control" />
			
		</fieldset>
		
		<fieldset class="form-group">
			<form:label path="cena">Cena: </form:label>
			<form:input path="cena" type="text" class="form-control" />
			<form:errors  path="cena" cssClass="text-warning"/>
		</fieldset>
		<fieldset class="form-group">
			<form:label path="datum">Datum: </form:label>
			<form:input path="datum" type="text" class="form-control" />
			<form:errors  path="datum" cssClass="text-warning"/>
		</fieldset>
		  <fieldset class="form-group">
			<form:label path="vreme">Vreme: </form:label>
			<form:input path="vreme" type="text" class="form-control" />
			<form:errors  path="vreme" cssClass="text-warning"/>
		</fieldset>
		<fieldset class="form-group">
			<form:label path="brMesta">BrMesta: </form:label>
			<form:input path="brMesta" type="text" class="form-control" />
			<form:errors  path="brMesta" cssClass="text-warning"/>
		</fieldset>
		<fieldset class="form-group">
			<form:label path="sala">Sala: </form:label>
			<form:input path="sala" type="text" class="form-control" />
			<form:errors  path="sala" cssClass="text-warning"/>
		</fieldset>
		
	<a href="/adminFilmovi" class="btn btn-danger">Back</a>
	<button type="submit" class="btn btn-success" >Snimi </button>
	</form:form>	
	</div>
	<script src="webjars/jquery/1.9.1/jquery.min.js"></script>
	<script src="webjars/bootstrap/3.3.6/js/bootstrap.min.js"></script>
	<script
		src="webjars/bootstrap-datepicker/1.0.1/js/bootstrap-datepicker.js"></script>
		<script src="webjars/bootstrap-datetimepicker/6aa746736d/js/bootstrap-datetimepicker.min.js"></script>
		
	<script>
		$('#datum').datepicker({
			format : 'dd/mm/yyyy'
		});
	</script>
	
</body>
</html>