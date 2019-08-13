<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
<style>

body{
	font-size:12px;
	line-height:1.3;
	font-family:Arial, Helvetica, Sans-Serif;
	color:#ccc;
	background:url('body-bg.gif');
	opacity: 0.9;
}

</style>
<title>Web App</title>
<link href="webjars/bootstrap/3.3.6/css/bootstrap.min.css" 
rel="stylesheet"> 
</head>
<body>
	<div class="container"  style="color:#f3b12b ">
	<form:form method="post"  modelAttribute="projekcija">
	<fieldset class="form-group">
			
			<form:input path="idPro" type="hidden" class="form-control" />
			<form:errors  path="idPro" cssClass="text-warning"/>
		</fieldset>
	 <fieldset class="form-group">
			<form:label path="film.id">Film: </form:label>
			<form:select path="film.id"  class="form-control" >
				<c:forEach items="${filmovi}" var="f">
				
				<option value="${f.id}">${f.naziv}</option>
				
				</c:forEach>
			</form:select>
			<form:errors  path="film" cssClass="text-warning"/>
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
		
	<a href="/adminProjekcije" class="btn btn-danger">Back</a>
	<button type="submit" class="btn btn-success" >Update </button>
	</form:form>	
	</div>
	<script src="webjars/jquery/1.9.1/jquery.min.js"></script>
	<script src="webjars/bootstrap/3.3.6/js/bootstrap.min.js"></script>
</body>
</html>