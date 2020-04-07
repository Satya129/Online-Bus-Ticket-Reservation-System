<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%
    	String username=(String)session.getAttribute("username");
    	if(username==null)
    		response.sendRedirect("index.jsp");
    %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title></title>
</head>
<body>
	<nav class="navbar navbar-default">
		<!-- Brand and toggle get grouped for better mobile display -->
		<div class="navbar-header" style="width:100%; padding: 5px;">			  
			<div style="display:inline;" class="hidden-xs">
				<a href="index.jsp" >
					<img src="images/logo.png" width="70" style="display:inline;" >
				</a>
			</div>
			<div style="display:inline;" >
				<h3 class="hidden-xs" style="font-size:30px;display:inline; margin-left:15px;">
					Online Bus Tickets Reservation System
				</h3>
				<p style="margin-left:90px;margin-top:-23px;">Wish You A Happy & Safe Journey</p>
				<h3 class="visible-xs" style="font-size:20px;display:inline; ">
					Online Bus Tickets Reservation System
				</h3>
				
				<span style="color:#40a6ea; float:right;font-size:21px;cursor:pointer;" data-toggle="modal" data-target="#logoutModal"><%=username%>
				<span class="glyphicon glyphicon-triangle-bottom" style="color:#40a6ea;font-size:21px;cursor:pointer;"></span></span>
				<span style="margin-top:0px; float:right; color:black;font-size:20px;">Welcome , </span>
			</div>
		</div>
	</nav>
	
	<div class="modal fade" role="dialog" id="logoutModal" style="width:500px;margin-left:500px;margin-top:20px;">
		<div class="modal-content">
			<div class="modal-header" style="background:#1ba1a7;color:white;">
				<h3 class="modal-title">Logout Your Self<hr></h3>
				<center><form action="logout.jsp"><input type="submit" value="Logout" class="btn btn-warning"></form></center>
			</div>
		</div>
	</div>
</body>
</html>