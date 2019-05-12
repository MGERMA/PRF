<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html lang="en">
<head>
<meta charset="UTF-8">
<link rel="shortcut icon" type="image/x-icon"
	href="https://static.codepen.io/assets/favicon/favicon-8ea04875e70c4b0bb41da869e81236e54394d63638a1ef12fa558a4a835f1164.ico">
<link rel="mask-icon" type=""
	href="https://static.codepen.io/assets/favicon/logo-pin-f2d2b6d2c61838f7e76325261b7195c27224080bc099486ddd6dccb469b8e8e6.svg"
	color="#111">
<title>PRFlix</title>
<style>
body * {
	font-family: 'Andale Mono', monospace;
	color: white
}

a {
	text-decoration: none;
}
</style>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/normalize/5.0.0/normalize.min.css">
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Gaegu">
<style>
body {
	color: white;
	background: #141414;
}

.wrapper {
	height: 50px;
	width: 100vw;
	display: flex;
	align-items: center;
	justify-content: center;
	overflow: hidden;
	margin-bottom: 20px;
}

.wrapper .disclaimer {
	bottom: 15px;
	position: absolute;
}

.input-group {
	position: relative;
}

.input-group .search {
	height: 25px;
	width: 25px;
	background-color: #fff;
	border: 0;
	border-radius: 50%;
	box-shadow: 0 2px 2px 0 rgba(0, 0, 0, 0.15);
	cursor: pointer;
	color: #fff;
	outline: none;
	padding: 5px;
	position: relative;
	transition: all 150ms cubic-bezier(0.2, 0.6, 0.252, 1.2);
}

.input-group .search ~ .bar {
	height: 4px;
	width: 15px;
	background: #fff;
	border-radius: 4px;
	box-shadow: 0 2px 2px 0 rgba(0, 0, 0, 0.15);
	position: absolute;
	display: block;
	opacity: 1;
	right: -9px;
	top: 24px;
	-webkit-transform: rotate(45deg);
	transform: rotate(45deg);
	transition: opacity 150ms ease;
}

.input-group .search::-webkit-input-placeholder {
	color: #fff;
}

.input-group .search:-ms-input-placeholder {
	color: #fff;
}

.input-group .search::-ms-input-placeholder {
	color: #fff;
}

.pochette {
	height: 200px;
	width: auto;
}

.listfilm {
	align-items: center;
	table-layout: fixed;
}

.input-group .search::placeholder {
	color: #fff;
}

.input-group .search:focus {
	height: 25px;
	width: 300px;
	text-align: center;
	border-radius: 3px;
	color: #26547c;
	cursor: initial;
}

.input-group .search:focus::-webkit-input-placeholder {
	color: #a1a1a1;
}

.input-group .search:focus:-ms-input-placeholder {
	color: #a1a1a1;
}

.input-group .search:focus::-ms-input-placeholder {
	color: #a1a1a1;
}

.input-group .search:focus::placeholder {
	color: #a1a1a1;
}

.input-group .search:focus ~ .bar {
	box-shadow: none;
	opacity: 0;
	right: 0;
	top: 5px;
}
</style>
<script>
	window.console = window.console || function(t) {
	};
</script>
<style>
.ad {
	display: none !important;
}
</style>
<script>
	if (document.location.search.match(/type=embed/gi)) {
		window.parent.postMessage("resize", "*");
	}
</script>
</head>
<body>


	<%@ page import="java.util.*, com.mvc.controller.*"%>

	<div style="text-align: left" color="w"></div>
	<%String user = (String) request.getAttribute("nom");%>
	Bonjour
	<%=user%>
	<!-- Refer to the video to understand how this works -->
	<div style="text-align: right">
		<a href="LogoutServlet">Se d�connecter</a>
	</div>

	<div class="entete">
		<div style="text-align: center">
			<h1>PRFlix</h1>
			<div class="wrapper">

				<div class="input-group">
					<input class="search" type="text"
						placeholder="Rechercher un film en particulier" style="")><span
						class="bar"></span>
				</div>
			</div>
		</div>
	</div>
	<div>

		Que pensez vous des films suivants :

		<table class="listfilm">
			<tr>
				<div class="unfilm">

					<%
					Collection<String> nomPochette = (Collection<String>) request.getAttribute("ListePochette");
					
					for (String p : nomPochette) {
							String s = "pochettes/" + p;							
					%>
					<td><img class="pochette" src=<%=s%>></td>

					<%
						}
					%>
				
			</tr>
			<tr>
				<%
				String iduser = (request.getAttribute("id")).toString();

				Collection<Integer> ListeIdFilms = (Collection<Integer>) request.getAttribute("ListeIdFilms");	
				for (Integer i : ListeIdFilms) { 
					String like = "VoteServ?id_user="+iduser+"&id_film="+Integer.toString(i)+"&note=2";
					String dislike = "VoteServ?id_user="+iduser+"&id_film="+Integer.toString(i)+"&note=1";
					
				%>
				<td><a href=<%=like%>>+1</a> <a href=<%=dislike%>>-1</a></td>
				<%
						}
					%>
			</tr>



		</table>

		<div>
			<a href="AccesBDD?op=lister"> Consulter la liste de films </a>
		</div>
</body>
</html>

