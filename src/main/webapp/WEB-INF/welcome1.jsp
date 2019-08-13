<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
	<head>
	<style>
div.stars {
  width: 270px;
  display: block;

}

input.star { display: none; }

label.star {
  float: right;
  padding: 10px;
  font-size: 36px;
  color: #444;
  transition: all .2s;
}

input.star:checked  ~ label.star:before{
  content: '\2605';
  color: #FD4;
  transition: all .25s;
}

input.star-5:checked ~ label.star:before {
  color: #FE7;
  text-shadow: 0 0 20px #952;
}

input.star-1:checked ~ label.star:before { color: #F62; }

label.star:hover { transform: rotate(-15deg) scale(1.3); }

label.star:before {
  content: '\2605';
}
</style>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
	</head>
	<body>
	
	
	<div id="stars1" class="stars">
	
  <form id ="forma" method="post" action="/ocena?id1=${filmovi[0].id }">
  
  	 <input class="star star-5" id="star-5" type="radio" name="ocena" value="5"/>
    <label class="star star-5" for="star-5"></label>
    <input class="star star-4" id="star-4" type="radio" name="ocena" value="4"/>
    <label class="star star-4" for="star-4"></label>
    <input class="star star-3" id="star-3" type="radio" name="ocena" value="3"/>
    <label class="star star-3" for="star-3"></label>
    <input class="star star-2" id="star-2" type="radio" name="ocena" value="2"/>
    <label class="star star-2" for="star-2"></label>
    <input class="star star-1" id="star-1" type="radio" name="ocena" value="1"/>
    <label class="star star-1" for="star-1"></label>
    <input type="submit">
    </form>

</div>
  <div>
  <form id ="forma" method="post" action="/ocena?id1=${filmovi[0].id }">
  
  	 <input class="star star-5" id="star" type="radio" name="ocena" value="5"/>
    <label class="star star-5" for="star"></label>
    <input class="star star-4" id="star-" type="radio" name="ocena" value="4"/>
    <label class="star star-4" for="star-"></label>
    <input class="star star-3" id="st" type="radio" name="ocena" value="3"/>
    <label class="star star-3" for="st"></label>
    <input class="star star-2" id="sta" type="radio" name="ocena" value="2"/>
    <label class="star star-2" for="sta"></label>
    <input class="star star-1" id="s" type="radio" name="ocena" value="1"/>
    <label class="star star-1" for="s"></label>
    <input type="submit">
    </form>
   </div>

	</body>
</html>