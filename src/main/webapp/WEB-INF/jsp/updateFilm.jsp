<html>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<head>
<style >
body{
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
</head>

<body>
	<div class="container" style="color: #f3b12b;font-weight: bold">
	
	<form:form method="post" modelAttribute="film" enctype="multipart/form-data">
		<fieldset class="form-group">
			<form:label path="naziv">Naziv: </form:label>
			<form:input path="naziv" type="text" class="form-control" required="required"/>
			<form:errors path="naziv" cssClass="text-warning"/>
		</fieldset>
		<fieldset class="form-group">
			<form:label path="zanr">Zanr: </form:label>
			<form:select path="zanr" name="zanr"> 
   				<option >Akcija</option>
   				<option >Komedija</option>
   				<option >Drama</option>
   				<option >Horor</option>
   				<option >Triler</option>
   				
			</form:select> 
			<form:errors  path="zanr" cssClass="text-warning"/>
		</fieldset>
		<fieldset class="form-group">
			<form:label path="glumci">Glumci: </form:label>
			<form:input path="glumci" type="text" class="form-control" required="required"/>
			<form:errors  path="glumci" cssClass="text-warning"/>
		</fieldset>
		<fieldset class="form-group">
			<form:label path="reditelj">Reditelj: </form:label>
			<form:input path="reditelj" type="text" class="form-control" required="required"/>
			<form:errors  path="reditelj" cssClass="text-warning"/>
		</fieldset>
		<fieldset class="form-group">
			<form:label path="opis">Opis: </form:label>
			<form:input path="opis" type="text" class="form-control" required="required"/>
			<form:errors  path="opis" cssClass="text-warning"/>
		</fieldset>
		<fieldset class="form-group">
			<form:label path="trailer">Trailer: </form:label>
			<form:input path="trailer" type="text" class="form-control" required="required"/>
			<form:errors  path="trailer" cssClass="text-warning"/>
		</fieldset>
		 <fieldset class="form-group">
		 	<form:label path="izasao">Izasao: </form:label>
			<form:checkbox path="izasao"  />
			<form:errors  path="izasao" cssClass="text-warning"/>
		</fieldset>
		 <fieldset class="form-group">
			<form:input path="slika" type="hidden" class="form-control" required="required"/>
			<form:errors  path="slika" cssClass="text-warning"/>
		</fieldset>
		 
		 <fieldset class="form-group">
			<form:input path="prosek" type="hidden" class="form-control" required="required"/>
			<form:errors  path="prosek" cssClass="text-warning"/>
		</fieldset>
		<a type="button" class="btn btn-danger" href="/adminFilmovi">Back</a>
	 <button type="submit" class="btn btn-success">Update </button>
	</form:form>
	</div>
	<script src="webjars/jquery/1.9.1/jquery.min.js"></script>
	<script src="webjars/bootstrap/3.3.6/js/bootstrap.min.js"></script>
	<script src="webjars/bootstrap-datepicker/1.0.1/js/bootstrap-datepicker.js"></script>

	
</body>
</html>  