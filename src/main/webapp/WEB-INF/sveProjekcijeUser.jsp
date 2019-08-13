<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<head>
<style>
.collapsible {
  background-color: #777;
  color: white;
  cursor: pointer;
  padding: 18px;
  width: 100%;
  border: none;
  text-align: left;
  outline: none;
  font-size: 15px;
}



.collapsible:after {
  content: '\002B';
  color: white;
  font-weight: bold;
  float: right;
  margin-left: 5px;
}


.content {
  padding: 0 18px;
  max-height: 0;
  overflow: hidden;
  transition: max-height 0.2s ease-out;
  background-color: #f1f1f1;
}
}
.play {
	background-image: none;
	filter: progid:DXImageTransform.Microsoft.AlphaImageLoader(src='css/images/image-hover.png',
		sizingMethod='image');
}

#table {
	font-size: 15px;
	color: #f3b12b;
	font-weight: bold;
	width: 900px;
}

#td{
	text-align: center;
}
#tr {
  height: 30px;
  
}
#ul {
	list-style-type: none;
	font-size: 14px;
	color: #f2a223;
	font-weight: bold;
	width: 500px;
	 padding-top: 40px;
}

body {
	font-size: 12px;
	line-height: 1.3;
	font-family: Arial, Helvetica, Sans-Serif;
	color: #ccc;
	background: url('body-bg.gif');
}

input, textarea, select {
	font-size: 12px;
	font-family: Arial, Helvetica, sans-serif;
}

textarea {
	overflow: auto;
}

.left, .alignleft {
	float: left;
	display: inline;
}

.right, .alignright {
	float: right;
	display: inline;
}

.text-right {
	text-align: right;
}

#h12 {
	font-size: 12px;
	color: #f2a223;
	font-weight: bold;
}

h2 {
	font-size: 10px;
	color: #f2a223;
	font-weight: bold;
}

h3 {
	font-size: 14px;
	color: #fff;
	font-weight: bold;
}

#h4 {
	font-size: 15px;
	color: #f3b12b;
	font-weight: bold;
	
}

#shell {
	width: 980px;
	margin: 0 auto;
}

#header {
	position: relative;
	padding-bottom: 10px;
}

#logo {
	top: 37px;
	left: 0;
}

#logo {
	float: left;
	font-size: 14px;
	line-height: 15px;
}

h1#logo {
	
	top: 37px;
	left: 0;
	float: left;
	width: 239px;
	height: 49px;
	background: url('logo.gif') no-repeat 0 0;
	
	font-size: 0;
	line-height: 0;
	text-indent: -4000px;
}



#navigation {
	float: right;
	clear: right;
	padding-top: 50px;
	padding-bottom: 40px;
}

#navigation ul {
	list-style: none;
}

#navigation ul li {
	float: left;
	display: inline;
	padding-left: 29px;
}

#navigation ul li a {
	font-size: 14px;
	font-weight: bold;
	color: #fff;
	text-decoration: none;
}

#navigation ul li a.active, #navigation ul li a:hover {
	color: #d91d2a;
}

#main {
	border-bottom: 1px dashed #413e3e;
}

#content {
	
}

.box {
	width: 1000px;
	border-bottom: none;
	padding-top: 60px;
}

.box .head {
	width: 980px;
	padding-top: 14px;
	padding-bottom: 11px;
	border-bottom: 1px dashed #413e3e;
}

.box h4 {
	float: left;
	display: inline;
}

.box .movie {
	width: 152px;
	float: left;
	padding-right: 12px;
	padding-top: 10px;
	
}

.movie img {
	width: 500px;
	height: 300px;
}

.play {
	position: absolute;
	top: 0;
	left: 0;
	width: 152px;
	height: 214px;
	background: url('image-hover.png');
	display: block;
	z-index: 5;
	cursor: pointer;
	display: none;
}




.container {
	padding: 16px;
	color: #d9d9d9;
	text-shadow: -1px -1px 1px rgba(255, 255, 255, .1), 1px 1px 1px
		rgba(0, 0, 0, .5);
	color: #d9d9d9;
	display: flex;
}

span {
	float: right;
	padding-top: 16px;
	padding-right: 16px;
}
#div1{
	display: flex;
}

#div2{
	padding-top: 10px;
}
#div1.1, #div1.2{
	display: inline;
}
</style>
<title>MovieHunter</title>
<script type="text/javascript" src="js/jquery-1.4.2.min.js"></script>
<script type="text/javascript" src="js/jquery-func.js"></script>
<link href="webjars/bootstrap/3.3.6/css/bootstrap.min.css" 
rel="stylesheet"> 

<!--[if IE 6]><link rel="stylesheet" href="css/ie6.css" type="text/css" media="all" /><![endif]-->


</head>
<body>

	<!-- START PAGE SOURCE -->
	<div id="shell">
		<div id="header">
			<h1 id="logo">
				MovieHunter
			</h1>

			<div id="navigation">
				<ul>
					<li><a href="/filmoviPodela">HOME</a></li>
					<li><a href="/filmoviProjekcije">NEWS</a></li>
					<li><a class="active" href="/detaljiFilm">IN THEATERS</a></li>
					<li><a href="#">COMING SOON</a></li>
					<li><a href="#">CONTACT</a></li>
					<li><a href="#">ADVERTISE</a></li>
				</ul>
			</div>

		</div>
		<div id="main">
			<div id="content">

				<div class="box">
					
					<div class="movie">
						
						<div style="width: 100%" id="div2">
						<font color="red">${error}${errorMessage}</font>
							<table id="table">
		<caption ><font color="#f3b12b">Sve projekcije za film ${film.naziv}</font> </caption>
			<thead>
				<tr >
					
					<th>Datum</th>
					<th>Vreme</th>
					<th>Cena</th>
					<th>BrMesta</th>
					<th>Sala</th>
					
				</tr>
			</thead>
			
			<tbody>
		
				<c:forEach items="${projekcije}" var="p">  
				<tr >
					
					
					<td>${p.datum}</td>
					<td>${p.vreme}</td>
					<td>${p.cena}</td>
					<td>${p.brMesta}</td>
					<td>${p.sala}</td>
					
					
				</tr>
				</c:forEach>
				
			</tbody>
	</table>
						</div>
						<br/>
						
					</div>

				</div>
				
			</div>
		</div>
		
	</div>
	
<script src="webjars/jquery/1.9.1/jquery.min.js"></script>
	<script src="webjars/bootstrap/3.3.6/js/bootstrap.min.js"></script>
	<script>
var coll = document.getElementsByClassName("collapsible");
var i;

for (i = 0; i < coll.length; i++) {
  coll[i].addEventListener("click", function() {
    this.classList.toggle("active");
    var content = this.nextElementSibling;
    if (content.style.maxHeight){
      content.style.maxHeight = null;
    } else {
      content.style.maxHeight = content.scrollHeight + "px";
    } 
  });
}
</script>
</body>
</html>