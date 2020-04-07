<%@ page import="java.sql.*" %>
 <%
	    ResultSet rs=null;
    	String customername=(String)session.getAttribute("username");
	    try
		{
	    	Class.forName("oracle.jdbc.driver.OracleDriver");
			Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","satya","satya");
			PreparedStatement ps=con.prepareStatement("select * from user_booked_tickets where customername='"+customername+"'");
			rs=ps.executeQuery();	
	%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Payment Page</title>
	<link type="text/css" rel="stylesheet" href="css/bootstrap.css"/>
	<script src="js/jquery-3.2.1.min.js" type="text/javascript"></script>
	<script src="js/jquery.cycle.all.js" type="text/javascript"></script>
	<script src="js/bootstrap.js"></script>
	
	<script type="text/javascript">
		function navigate(url){
			$('#main-container').load(url);
		}
	
	</script>
	<style>
		@import url(css/style.css);	
	.btn
	{
		display: block;
		height: 40px;
		width: 290px; 
		margin: 20px auto;
		font-weight: bold;
		font-family: sans-serif;
		font-size: 18px;
	}
	</style>
</head>
<body>
	
	<jsp:include page="header.jsp"></jsp:include>
	
	<jsp:include page="userhomepagenavbar.jsp"></jsp:include>
	
	<article class="modify">
		<div class="container" style="background:#003580;height:40px;width:100%;">
			<div class="row">
				<div class="col-sm-12" style="margin-top:7px;">
					<div class="" style="color:white;text-align:center;font-size:20px;letter-spacing:10px;font-weight:bold;font-family:sans-serif;"><span>Payment Option</span></div>
				</div>
			</div>
		</div>
	</article>
	
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
			<form action="userprofile.jsp">
			<div class="modal-footer" style="background:#1ba1a7;">
				<center><button type="submit" class="btn btn-warning">Go To User Profile</button></center>
			</div>	
			</form>	
		</div>
	</div>
	
	<div class="modal fade" role="dialog" id="searchbusModal" style="width:500px;margin-left:500px;margin-top:20px;">
		<div class="modal-content">
			<form action="searchbus.jsp" method="post">
			<div class="modal-header" style="background:#1ba1a7;color:white;">
				<h3 class="modal-title"><span class="glyphicon glyphicon-remove pull-right" data-dismiss="modal" style="cursor:pointer;color:#f0a825;"></span>Search Bus<hr></h3>
				
				<ul>
					<li><input type="text" class="form-control" name="busname" placeholder="Enter Bus Name"></li>
				</ul>
			</div>
			<div class="modal-footer" style="background:#1ba1a7;">
				<button type="submit" class="btn btn-warning">Search</button>
			</div>	
			</form>	
		</div>
	</div>
	
	<div class="modal fade" role="dialog" id="cancelticketsModal" style="width:500px;margin-left:500px;margin-top:20px;">
		<div class="modal-content">
		<form action="">
			<div class="modal-header" style="background:#1ba1a7;color:white;">
				<h3 class="modal-title"><span class="glyphicon glyphicon-remove pull-right" data-dismiss="modal" style="cursor:pointer;color:#f0a825;"></span>Cancel Tickets<hr></h3>
				
				<ul>
					<li><input type="text" class="form-control" name="ticketnumber" placeholder="Enter Ticket Number"></li>
				</ul>
			</div>
			<div class="modal-footer" style="background:#1ba1a7;">
				<button type="submit" class="btn btn-warning">Search</button>
			</div>	
			</form>
		</div>
	</div>
	
	<div class="modal fade" role="dialog" id="updatepasswordModal" style="width:500px;margin-left:500px;margin-top:20px;">
		<div class="modal-content">
			<form action="updatepassword.jsp" method="post">
			<div class="modal-header" style="background:#1ba1a7;color:white;">
				<h3 class="modal-title"><span class="glyphicon glyphicon-remove pull-right" data-dismiss="modal" style="cursor:pointer;color:#f0a825;"></span>Update Password<hr></h3>
					<ul>
						<li><input type="password" class="form-control" name="oldpassword" placeholder="Enter Old Password"></li><br>
						<li><input type="password" class="form-control"  name="newpassword" placeholder="Enter New Password"></li><br>
						<li><input type="password" class="form-control"  name="confirmpassword" placeholder="Confirm New Password"></li>
					</ul>
			</div>
			<div class="modal-footer" style="background:#1ba1a7;">
				<button type="submit" class="btn btn-warning">Update</button>
			</div>	
			</form>	
		</div>
	</div>
	
	<div class="modal fade" role="dialog" id="helpModal" style="width:500px;margin-left:500px;margin-top:20px;">
		<div class="modal-content">
			<div class="modal-header" style="background:#1ba1a7;color:white;">
				<h3 class="modal-title"><span class="glyphicon glyphicon-remove pull-right" data-dismiss="modal" style="cursor:pointer;color:#f0a825;"></span>Need Help....<hr></h3>
				
				<ul>
					<li>Have You Forgot Your Password ?</li>
					<li>Enter Your E-Mail Id to Get The Password Reset Link.</li>
				</ul>
			</div>	
		</div>
	</div>
	
	<div class="modal fade" id="viewTicketModal" tabindex="-1" role="dialog" aria-labelledby="viewTicketModalLabel" aria-hidden="true">
    <div class="vertical-alignment-helper">
        <div class="modal-dialog vertical-align-center">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
                     <center><h4 class="modal-title" id="myModalLabel" style="font-weight:bold;">Booked Ticket</h4></center>
						
                </div>
                <div class="modal-body">
                	  <div class="table-responsive" style="height:100%;width:100%;">
					<table class="table">
				<thead style="color:white;background:#003580;width:1500px;;">
				<% 
			    	if(rs.next()){
			    		
			    %>
			    <%
		    		String paymentstatus=rs.getString("paymentstatus");
		    		/* out.print(paymentstatus); */ 
		    		if(paymentstatus.equals("PENDING"))
		    		{
		    			out.print("Your Payment Is Pending.Please Make The Payment To Confirm Your Ticket.");
		    			out.print("<br><br><center><a href='payment.jsp'>Go To Payment Page&nbsp;<span class='glyphicon glyphicon-hand-right'></span></a></center>");
		    		}
		    		else if(paymentstatus.equals("CONFIRM"))
		    		{
    			%> 
			      <tr>
				    <th colspan=2><b style="font-size:20px;"><%= rs.getString("busname") %></b><h6 style="color:#f78006;">(From <%=rs.getString("source")%> To <%=rs.getString("destination")  %> -Via <%=rs.getString("via")  %>)</h6></th>
			      </tr>
			    </thead>
			    <tbody>
			    	<tr style="color:black;font-size:15px;font-family:sans-serif;">
				        <td>Customer Name:-</td>
				        <td><%= rs.getString("customername") %></td>
				    </tr>
				    <tr style="color:black;font-size:15px;font-family:sans-serif;">
				        <td>Seat Number:-</td>
				       	<td><%= rs.getString("seatnumber") %></td>
				    </tr>
				    <tr style="color:black;font-size:15px;font-family:sans-serif;">
				        <td>Date Of Journey:-</td>
				       	<td><%= rs.getString("journey_dt") %></td>
				    </tr>
				    <tr style="color:black;font-size:15px;font-family:sans-serif;">
				        <td>Pickup Point:-</td>
				       	<td><%= rs.getString("pickuppoint") %></td>
				    </tr>
				    <tr style="color:black;font-size:15px;font-family:sans-serif;">
				        <td>Drop Point:-</td>
				        <td><%= rs.getString("droppoint") %></td>
				    </tr>
				    <tr style="color:black;font-size:15px;font-family:sans-serif;">
				        <td>Departure Time:-</td>
				        <td><%= rs.getString("departuretime") %>&nbsp;(From Starting Point)</td>
				    </tr>
				    <tr style="color:black;font-size:15px;font-family:sans-serif;">
				        <td>Arrival Time:-</td>
				        <td><%= rs.getString("arrivaltime") %>&nbsp;(At End Point)</td>
				    </tr>
				    <tr style="color:black;font-size:15px;font-family:sans-serif;">
				        <td>Conductor Number:-</td>
				        <td><%= rs.getString("conductornumber") %></td>
				    </tr>
				    <tr style="color:black;font-size:15px;font-family:sans-serif;">
				        <td>Source:-</td>
				        <td><%= rs.getString("source") %></td>
				    </tr>
				    <tr style="color:black;font-size:15px;font-family:sans-serif;">
				        <td>Destination:-</td>
				        <td><%= rs.getString("destination") %></td>
				    </tr>
				    <tr style="color:black;font-size:15px;font-family:sans-serif;">
				        <td>Payment Status:-</td>
				        <td style="color:#08cb08;"><%= rs.getString("paymentstatus") %><img src="images/approved1.png" style="height:30px;width:60px;"></td>
				    </tr>
				     <%
				     }
		    		else
		    		{
		    			out.print("No Ticket Has Been Booked");
		    		}
			    	}
			    	else
			    	{
			    		out.print("<b><center><img src='images/sad.png'><br><br>Currently No Ticket Has Been Booked...</center></b>");
			    	}
						con.close();
				}
				catch(Exception e)
				{
					out.println("MyConErr"+e);
				}
					    
			    %>
			    </tbody>
			    </table>              
               	</div>
                <div class="modal-footer">
                    <center>
                    <form action="deleteticket.jsp">
                    	<button type="button" class="btn btn-primary" onClick="js:window.print()" style="width:20%;">Print Ticket</button>
                    	<button type="submit" class="btn btn-primary" style="width:20%;">Cancel Ticket</button></form>
                    	<!-- <button type="button" class="btn btn-primary" data-dismiss="modal" style="width:70px;">Close</button> -->
                    </center>
                </div>
            </div>
        </div>
    </div>
</div>
</div>
	<div id="modalDiv">
	
	</div>
	<div class="row custom-row">	
		<div class="col-sm-3 pad-10">
			<div class="option_div">
				<h3 style="color:#1ba1a7;">Select Payment Option<hr></h3>
				
				<form action="">
				<input type="button" value="Credit Card" class="btn btn-primary" onclick="navigate('carddetails.jsp')">
				<input type="button" value="Debit Card" class="btn btn-primary" onclick="navigate('carddetails.jsp')">
				<input type="button" value="Master Card" class="btn btn-primary" onclick="navigate('carddetails.jsp')">
				<input type="button" value="Paytm" class="btn btn-primary" onclick="navigate('blank.jsp')">
				<input type="button" value="Free Charge" class="btn btn-primary" onclick="navigate('blank.jsp')">
				<input type="button" value="Mobikwik" class="btn btn-primary" onclick="navigate('blank.jsp')">
				</form>
			</div>
		</div>
		
		<div class="col-sm-9" id="main-container" style="background:white;margin-top:30px;height:430px;border-radius:5px;">
			<div class="typewriter">
  					<center><span class="blink_me">Please Make The Payment To Confirm Your Ticket !</span></center>
			</div>
		</div>
	</div>
	
	
	
	<div id="myDiv" style="text-align:center; margin-top:-688px; padding: 150px; height: 400px;">
    		Please wait...<img src="images/loader.gif" width="240" height="29" alt="loading..." /> Loading... <br>
    </div>
	
	
	<script type="text/javascript">
	  setTimeout(function() {
	        document.getElementById("myDiv").style.display="none";
	    }, 5000);
	</script>
	
</body>
</html>