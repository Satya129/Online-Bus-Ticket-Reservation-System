<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
   <%@ page import="java.sql.*" %>



<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title></title>
</head>
<body>
	<nav class="navbar navbar-expand-md navbar-dark bg-dark">
		<ul class="navbar-nav custom-nav">
			<li class="nav-item">
				<a class="nav-link" href="userhomepage.jsp">Home</a>
			</li>
			<li class="nav-item">
				<a class="nav-link" data-toggle="modal" data-target="#aboutusModal" style="cursor:pointer;">About Us</a>
			</li>
			<li class="nav-item">
				<a class="nav-link" data-toggle="modal" data-target="#contactusModal" style="cursor:pointer;">Contact Us</a>
			</li>
			<li class="nav-item">
				<a class="nav-link" data-toggle="modal" data-target="#searchbusModal" style="cursor:pointer;">Search Bus</a>
			</li>
			<!-- <li class="nav-item">
				<a class="nav-link" data-toggle="modal" data-target="#cancelticketsModal" style="cursor:pointer;">Cancel Tickets</a>
			</li> -->
			<li class="nav-item">
				<a class="nav-link" data-toggle="modal" data-target="#searchrouteModal" style="cursor:pointer;">User Profile</a>
			</li>
			<li class="nav-item">
				<a class="nav-link" data-toggle="modal" data-target="#updatepasswordModal" style="cursor:pointer;">Update Password</a>
			</li>
			<li class="nav-item">
				<a class="nav-link" data-toggle="modal" data-target="#viewTicketModal" style="cursor:pointer;">View Ticket</a>
			</li>
			<li class="nav-item">
				<a class="nav-link" data-toggle="modal" data-target="#helpModal" style="cursor:pointer;">Help</a>
			</li>
			<!-- <li class="nav-item">
				<a class="nav-link" data-toggle="modal" data-target="#ticketModal" style="cursor:pointer;">View Tickets</a>
			</li> -->
		</ul>
	</nav>
	
	
	<!--  <div class="modal fade" role="dialog" id="ticketModal" style="width:1350px;margin-left:90px;margin-top:20px;">
		<div class="modal-content">
			<div class="modal-header" style="background:#EDF;color:black;">
				<h3 class="modal-title pull-left" style="font-weight:bold"><img src="images/bus-icon.png">&nbsp;Bus Name</h3><h5 class="pull-right">Date Of Journey:- <br><br>Ticket Number:- </h5><br><br><hr><img class="pull-right" src="images/approved.png" style="height:100px;width:120px;">
				
						<h4 style="text-align:left;font-weight:bold;"> Customer Name:- </h4>
						<h4 style="text-align:left;font-weight:bold;"> Seat Number:- </h4>
						<h4 style="text-align:left;font-weight:bold;"> Pick Up Point:- ></h4>
						<h4 style="text-align:left;font-weight:bold;"> Drop Point:- </h4>
						<h4 style="text-align:left;font-weight:bold;"> Departure Time:- </h4>
						<h4 style="text-align:left;font-weight:bold;"> Arrival Time:-  </h4>
						<h4 style="text-align:left;font-weight:bold;"> Conductor Cont. Number:- </h4>
			</div>
			<div class="modal-footer" style="background:#EDF;">
				<button type="submit" class="btn btn-primary">Print Ticket</button>
			</div>		
		</div>
	</div>  -->
	
</body>
</html>