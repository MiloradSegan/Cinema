<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<html>

<head>
<title>Login page</title>
</head>
<link href="webjars/bootstrap/3.3.6/css/bootstrap.min.css" 
rel="stylesheet"> 
<body>
			<font color="red">${poruka}</font>
			<form method="post">
				User : <input type="text" name="username" />
				Password : <input type="password" name="password" /> 
				<input type="submit" />
				
				
			</form>
		
			<form><a type="button" href="/registracijaUser">Registracija </a></form>
			
		
	
	 <script src="webjars/jquery/1.9.1/jquery.min.js"></script>
	<script src="webjars/bootstrap/3.3.6/js/bootstrap.min.js"></script>
</body>
</html>