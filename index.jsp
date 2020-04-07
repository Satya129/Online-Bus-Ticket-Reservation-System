<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
   
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>OBTRS</title>
	<link type="text/css" rel="stylesheet" href="css/bootstrap.css"/>
	<script src="js/jquery-3.2.1.min.js" type="text/javascript"></script>
	<script src="js/jquery.cycle.all.js" type="text/javascript"></script>
	<script src="js/bootstrap.js"></script>
	<style>
		@import url(css/style.css);	
	</style>
	<script>
	function FormSubmit()
	{
		var password=documnet.getElementById("password").value;
		var confirmpassword=documnet.getElementById("confirmpassword").value;
		if(document.Register.password.value != document.Register.confirmpassword.value)
		{
			alert('Confirm Password Not Match');
			document.Register.confirmpassword.focus(); 
			return false;
		} 
		document.Register.submit();
	}
	function myFunction() {
	    var x = document.getElementById("myInput");
	    if (x.type === "password") {
	        x.type = "text";
	    } else {
	        x.type = "password";
	    }
	}
	</script>
</head>
<body bgcolor="#EDF">
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
				<p style="margin-left:90px;margin-top:-23px;">Happy And Safe Journey</p>
				<h3 class="visible-xs" style="font-size:20px;display:inline; ">
					Online Bus Tickets Reservation System
				</h3>
				
			</div>
		</div>
	</nav>
	
	<nav class="navbar navbar-expand-md navbar-dark bg-dark">
		<ul class="navbar-nav custom-nav">
			<li class="nav-item">
				<a class="nav-link" href="index.jsp">Home</a>
			</li>
			<li class="nav-item">
				<a class="nav-link" data-toggle="modal" data-target="#aboutusModal" style="cursor:pointer;">About Us</a>
			</li>
			<li class="nav-item">
				<a class="nav-link" data-toggle="modal" data-target="#contactusModal" style="cursor:pointer;">Contact Us</a>
			</li>
			<li class="nav-item">
				<a class="nav-link" data-toggle="modal" data-target="#searchrouteModal" style="cursor:pointer;">Search Route</a>
			</li>
			<li class="nav-item">
				<a class="nav-link" data-toggle="modal" data-target="#searchbusModal" style="cursor:pointer;">Search Bus</a>
			</li>
			<li class="nav-item">
				<a class="nav-link" data-toggle="modal" data-target="#cancelticketsModal" style="cursor:pointer;">Cancel Tickets</a>
			</li>
			<li class="nav-item">
				<a class="nav-link" data-toggle="modal" data-target="#helpModal" style="cursor:pointer;">Help</a>
			</li>
		</ul>
	</nav> 
	<div class="row custom-row">
		<div class="col-md-7">
			 <img src="images/anim.gif" class="img-responsive" style="height:465px;width:1000px;border-radius:5px;"/>
			 <br><h4 style="letter-spacing:9px;font-weight:bold;color:#0089E9;"><marquee>Welcome To OBTRS</marquee></h4>
		</div>
		<div class="col-md-5">
			<h3 style="letter-spacing:12px;"><span class="blink">Log In Yourself</span></h3><hr>
			<form action="login.jsp" method="post">
				<div class="form-group-lg styled-input">
					<input type="text" class="form-control" name="email" placeholder="Enter E-Mail Id" required autofocus><br>
				</div>
				<div class="form-group-lg styled-input">
					<input type="password" class="form-control" name="password" placeholder="Enter Password" id="myInput" required><br><input type="checkbox" onclick="myFunction()">&nbsp;Show Password<br><br>
				</div>
				<input type="submit" value="Login" onclick="checknull();" class="btn btn-primary">
				<button type="button" class="btn btn-primary" data-toggle="modal" data-target="#registerModal">Sign Up</button><br><br>	
				
				<a href="#"class="nav-link" data-toggle="modal" data-target="#forgotModal">Forgot Password ?</a>
				
			</form>
		</div>
	</div>
	
	<form action="register.jsp" method="post" name="Register">
	<div class="modal fade" role="dialog" id="registerModal"  style="width:600px;margin-left:450px;margin-top:20px;">
		<div class="modal-content" style="border-color:#1ba1a7;border-style:solid;border-radius:10px;">
			<div class="modal-header" style="background:#2e6da4;color:white;">
				<h3 class="modal-title">Register Yourself<button type="button" class="close" data-dismiss="modal" style="color:white;"><span aria-hidden="false">&times;</span></button></h3>
			</div>	
			<div class="modal-body">
				<div class="form-group-lg styled-input">
					<input type="text" class="form-control" name="userfirstname" placeholder="Enter User First Name" required><br>
				</div>
				<div class="form-group-lg styled-input">
					<input type="text" class="form-control" name="userlastname" placeholder="Enter User Last Name" required><br>
				</div>
				<div class="form-group-lg styled-input">
					<input type="email" class="form-control" name="email" placeholder="Enter E-Mail Id" required><br>
				</div>
				<div class="form-group-lg styled-input">
					<input type="number" class="form-control" name="phonenumber" placeholder="Enter Phone Number" required><br>
				</div>
				<div class="form-group-lg styled-input">
					<input type="number" class="form-control" name="age" placeholder="Enter Age" required><br>
				</div>
				<div class="form-group-lg styled-input">
					<input type="password" class="form-control" name="password" id="password" placeholder="Enter Password" required><br>
				</div>
				<div class="form-group-lg styled-input">
					<input type="password" class="form-control" name="confirmpassword" id="confirmpassword" placeholder="Confirm Password" required><br>
				</div>
			</div>
			
			<div class="modal-footer">
				<button type="submit" class="btn btn-primary">Register</button>
				<button type="button" class="btn btn-primary" data-dismiss="modal">Cancel</button>
			</div>
		</div>
	</div>
	</form>
	
	<form action="#">
	<div class="modal fade" role="dialog" id="forgotModal" style="width:500px;margin-left:500px;margin-top:20px;">
		<div class="modal-content" style="border-color:#1ba1a7;border-style:solid;border-radius:10px;">
			<div class="modal-header">
				<h3 class="modal-title" style="background:white;color:black;"><span class="glyphicon glyphicon-remove pull-right" data-dismiss="modal" style="cursor:pointer;color:#f0a825;"></span>Forgot Password ?<hr></h3>
				
				<ul>
					<li>Have You Forgot Your Password ?</li>
					<li>Enter Your E-Mail Id to Get The Password Reset Link.</li>
				</ul>
				
			</div>	
			<div class="modal-body">
				<div class="form-group-lg styled-input">
					<input type="email" class="form-control" name="emailid" placeholder="Enter E-Mail Id" required><br>
				</div>
			
			<div class="modal-footer">
				<button type="submit" class="btn btn-primary">Reset</button>
				<button type="button" class="btn btn-primary" data-dismiss="modal">Cancel</button>
			</div>
		</div>
		</div>
	</div>
	
	<div class="modal fade" role="dialog" id="aboutusModal" style="width:500px;margin-left:500px;margin-top:20px;">
		<div class="modal-content">
			<div class="modal-header" style="background:#1ba1a7;color:white;">
				<h3 class="modal-title"><span class="glyphicon glyphicon-remove pull-right" data-dismiss="modal" style="cursor:pointer;color:#f0a825;"></span>About Us<hr></h3>	
				<ul>
					<li>We Are Providing Online Bus Tickets Booking Services</li>
					<li>Its very efficient and you can book tickets online in a very less time.</li>
					<li>By booking , you can get many offers.</li>
				</ul>
			</div>	
		</div>
	</div>
	
	<div class="modal fade" role="dialog" id="contactusModal" style="width:500px;margin-left:500px;margin-top:20px;">
		<div class="modal-content">
			<div class="modal-header" style="background:#1ba1a7;color:white;">
				<h3 class="modal-title"><span class="glyphicon glyphicon-remove pull-right" data-dismiss="modal" style="cursor:pointer;color:#f0a825;"></span>Contact Us<hr></h3>
				
				<ul>
					<li>E-Mail Id- info@busreservstion.ac.in</li><br>
					<li>Contact - +91-7978926701</li>
				</ul>
			</div>	
		</div>
	</div>
	
	<div class="modal fade" role="dialog" id="searchrouteModal" style="width:500px;margin-left:500px;margin-top:20px;">
	
		<div class="modal-content">
			<form action="">
			<div class="modal-header" style="background:#1ba1a7;color:white;">
				<h3 class="modal-title"><span class="glyphicon glyphicon-remove pull-right" data-dismiss="modal" style="cursor:pointer;color:#f0a825;"></span>Search Route<hr></h3>
					<!-- <ul>
						<li><input type="text" class="form-control" name="source" placeholder="From"></li><br>
						<li><input type="text" class="form-control"  name="destination" placeholder="To"></li>
					</ul> -->
					<h4 align=center>Please Login Yourself To Search Bus On Route</h4>
			</div>
			<div class="modal-footer" style="background:#1ba1a7;">
				<!-- <input type="submit" class="btn btn-warning" value="Search Route Bus"> -->
			</div>	
			</form>
		</div>
	</div>
	
	
	<div class="modal fade" role="dialog" id="searchbusModal" style="width:500px;margin-left:500px;margin-top:20px;">
		<div class="modal-content">
			<form action="">
			<div class="modal-header" style="background:#1ba1a7;color:white;">
				<h3 class="modal-title"><span class="glyphicon glyphicon-remove pull-right" data-dismiss="modal" style="cursor:pointer;color:#f0a825;"></span>Search Bus<hr></h3>
				
				<!-- <ul>
					<li><input type="text" class="form-control" name="busname" placeholder="Enter Bus Name"></li>
				</ul> -->
				<h4 align=center>Please Login Yourself To Search Buses</h4>
			</div>
			<div class="modal-footer" style="background:#1ba1a7;">
				<!-- <button type="submit" class="btn btn-warning">Search</button> -->
			</div>	
			</form>
		</div>
	</div>
	
	<div class="modal fade" role="dialog" id="cancelticketsModal" style="width:500px;margin-left:500px;margin-top:20px;">
		<div class="modal-content">
			<form action="">
			<div class="modal-header" style="background:#1ba1a7;color:white;">
				<h3 class="modal-title"><span class="glyphicon glyphicon-remove pull-right" data-dismiss="modal" style="cursor:pointer;color:#f0a825;"></span>Cancel Tickets<hr></h3>
				
				<!-- <ul>
					<li><input type="text" class="form-control" name="ticketnumber" placeholder="Enter Ticket Number"></li>
				</ul> -->
				<h4 align=center>Please Login Yourself To Cancel Booked Tickets</h4>
			</div>
			<div class="modal-footer" style="background:#1ba1a7;">
				<!-- <button type="submit" class="btn btn-warning">Search</button> -->
			</div>	
			</form>	
		</div>
	</div>
	
	<div class="modal fade" role="dialog" id="helpModal" style="width:500px;margin-left:500px;margin-top:20px;">
		<div class="modal-content">
			<div class="modal-header" style="background:#1ba1a7;color:white;">
				<h3 class="modal-title">Need Help....<span class="glyphicon glyphicon-remove pull-right" data-dismiss="modal" style="cursor:pointer;color:#f0a825;"></span><hr></h3>
				
				<ul>
					<li>Have You Forgot Your Password ?</li>
					<li>Enter Your E-Mail Id to Get The Password Reset Link.</li>
				</ul>
			</div>	
		</div>
	</div>	
	
	<span class="blinking" style="font-size:20px;margin-top:-130px;margin-left:900px;">*&nbsp;Register Yourself Before Login&nbsp;*</span>
</body>
</html>