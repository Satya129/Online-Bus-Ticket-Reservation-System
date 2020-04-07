<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Choose Seat</title>
	<link type="text/css" rel="stylesheet" href="css/bootstrap.css"/>
	<script src="js/jquery-3.2.1.min.js" type="text/javascript"></script>
	<script src="js/jquery.cycle.all.js" type="text/javascript"></script>
	<script src="js/bootstrap.js"></script>
	<style>
		@import url(css/style.css);	
	</style>
</head>
<body>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>
<%
	Integer busId=Integer.parseInt(request.getParameter("busId"));
	String busName="";
	String source="";
	String destination="";
	String via="";
	String pickup_point1="";
	String pickup_point2="";
	String pickup_point3="";
	String drop_point1="";
	String drop_point2="";
	String drop_point3="";
	int bseat=0;
	try
	{
		Class.forName("oracle.jdbc.driver.OracleDriver");
		Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","satya","satya");
		PreparedStatement ps=con.prepareStatement("select * from buslist where id="+busId);
		ResultSet rs=ps.executeQuery();
		if(rs.next()){
			busName=rs.getString("busname");
			source=rs.getString("source");
			destination=rs.getString("destination");
			via=rs.getString("via");
			pickup_point1=rs.getString("pickup_point1");
			pickup_point2=rs.getString("pickup_point2");
			pickup_point3=rs.getString("pickup_point3");
			drop_point1=rs.getString("drop_point1");
			drop_point2=rs.getString("drop_point2");
			drop_point3=rs.getString("drop_point3");
		}
		
		PreparedStatement ps1=con.prepareStatement("select seatnumber from user_booked_tickets where busname=?");
		ps1.setString(1,busName);
		ResultSet rs1=ps1.executeQuery();
		while(rs1.next())
		{
			String seat=request.getParameter("bseat");
			String b=rs1.getString("seatnumber");
			String[] bookedseats=b.split(",");
			for(int bi=0;bi<bookedseats.length;bi++){
				out.println("<script>$(function() {$(\"input[value|='"+bookedseats[bi]+"']\").attr(\"disabled\",\"1\");});</script>");
				++bseat;
			}
			
			
		}
		con.close();
	}
	catch(Exception e)
	{
	out.println("MyConErr"+e);
	}
%>
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
	<jsp:include page="header.jsp"></jsp:include>
	
	<jsp:include page="userhomepagenavbar.jsp"></jsp:include>
	<form action="confirmticket.jsp" method="post">
	<article class="modify">
		<div class="container" style="background:#003580;height:40px;width:100%;">
			<div class="row">
				<div class="col-sm-12" style="margin-top:7px;">
					<div class="" style="color:white;text-align:center;font-size:20px;letter-spacing:10px;font-weight:bold;font-family:sans-serif;"><span>Choose Your Seat</span></div>
				</div>
			</div>
		</div>
	</article>
	
	
	<div style="margin-top:50px;margin-bottom:10px;">
		<div class="row-custom-row">
			<h3 style="font-weight:bold; text-align: center;"><img src="images/bus-icon.png">&nbsp;<%=busName %></h3>
			<h6 style="color:#f78006;font-size:14px; text-align: center;">
				( <%=source %> To <%=destination %> -Via <%=via %> )
			<span class="pull-right" style="font-weight:bold;font-family:sans-serif;margin-top:10px;color:green;font-size:15px;letter-spacing:2px;cursor:pointer;">Available Seats:- <%= 40 - bseat %></span>
			<span class="pull-left" style="font-weight:bold;font-family:sans-serif;margin-top:10px;color:red;font-size:15px;letter-spacing:2px;cursor:pointer;">Booked Seats:- <%= bseat %></span>
			</h6>
			<hr>
		</div>
		<div class="row custom-row">
		  <div class="col-sm-7" >
			<div class="row custom-row" style="box-shadow:0px 0px 10px 0px gray;background:white;min-height:148px;">
				<div style="background:#f5f5f5;float:left;min-height:148px;text-align:center; padding:10px 10px; font-weight:bold;">
					<img src="images/upper.png" style="float:left;"> </div>
				<div  style="min-height:148px; padding:5px; overflow-x:auto;">
					<div class="row custom-row">
						<input type="checkbox" id="checkbox" value="Sleeper-1" name="clicked" style="height:30px;width:50px;" data-toggle="popover" title="Sleeper-1">
						<input type="checkbox" id="checkbox" value="Sleeper-2" name="clicked" style="height:30px;width:50px;" data-toggle="popover" title="Sleeper-2">
						<input type="checkbox" id="checkbox" value="Sleeper-3" name="clicked" style="height:30px;width:50px;" data-toggle="popover" title="Sleeper-3">
						<input type="checkbox" id="checkbox" value="Sleeper-4" name="clicked" style="height:30px;width:50px;" data-toggle="popover" title="Sleeper-4">
						<input type="checkbox" id="checkbox" value="Sleeper-5" name="clicked" style="height:30px;width:50px;" data-toggle="popover" title="Sleeper-5">
					</div>
					<div class="row custom-row">
						<input type="checkbox" id="checkbox" value="Sleeper-6" name="clicked" style="height:30px;width:50px;" data-toggle="popover" title="Sleeper-6">
						<input type="checkbox" id="checkbox" value="Sleeper-7" name="clicked" style="height:30px;width:50px;" data-toggle="popover" title="Sleeper-7">
						<input type="checkbox" id="checkbox" value="Sleeper-8" name="clicked" style="height:30px;width:50px;" data-toggle="popover" title="Sleeper-8">
						<input type="checkbox" id="checkbox" value="Sleeper-9" name="clicked" style="height:30px;width:50px;" data-toggle="popover" title="Sleeper-9">
						<input type="checkbox" id="checkbox" value="Sleeper-10" name="clicked" style="height:30px;width:50px;" data-toggle="popover" title="Sleeper-10">
					
					</div>
				</div>
				
			</div>
			<br><br><br><br>
			<div class="row custom-row" style="box-shadow:0px 0px 10px 0px gray;background:white;min-height:148px;">
				<div style="background:#f5f5f5;float:left;min-height:148px;text-align:center; padding:10px 10px; font-weight:bold;">
					<img src="images/lower.png" style="float:left;"> </div>
				<div style="min-height:148px;overflow-x:auto; padding:10px;">
					<div class="row custom-row">
						<input type="checkbox" value="Seat-1" name="clicked" style="height:30px;width:30px;" data-toggle="popover" title="Seat-1">
						<input type="checkbox" value="Seat-2" name="clicked" style="height:30px;width:30px;" data-toggle="popover" title="Seat-2">
						<input type="checkbox" value="Seat-3" name="clicked" style="height:30px;width:30px;" data-toggle="popover" title="Seat-3">
						<input type="checkbox" value="Seat-4" name="clicked" style="height:30px;width:30px;" data-toggle="popover" title="Seat-4">
						<input type="checkbox" value="Seat-5" name="clicked" style="height:30px;width:30px;" data-toggle="popover" title="Seat-5">
						<input type="checkbox" value="Seat-6" name="clicked" style="height:30px;width:30px;" data-toggle="popover" title="Seat-6">
						<input type="checkbox" value="Seat-7" name="clicked" style="height:30px;width:30px;" data-toggle="popover" title="Seat-7">
						<input type="checkbox" value="Seat-8" name="clicked" style="height:30px;width:30px;" data-toggle="popover" title="Seat-8">
						<input type="checkbox" value="Seat-9" name="clicked" style="height:30px;width:30px;" data-toggle="popover" title="Seat-9">
						<input type="checkbox" value="Seat-10" name="clicked" style="height:30px;width:30px;" data-toggle="popover" title="Seat-10">
						<input type="checkbox" value="Seat-11" name="clicked" style="height:30px;width:30px;" data-toggle="popover" title="Seat-11">
						<input type="checkbox" value="Seat-12" name="clicked" style="height:30px;width:30px;" data-toggle="popover" title="Seat-12">
						<input type="checkbox" value="Seat-13" name="clicked" style="height:30px;width:30px;" data-toggle="popover" title="Seat-13">
						<input type="checkbox" value="Seat-14" name="clicked" style="height:30px;width:30px;" data-toggle="popover" title="Seat-14">
						<input type="checkbox" value="Seat-15" name="clicked" style="height:30px;width:30px;" data-toggle="popover" title="Seat-15">
					</div>
					<div class="row custom-row">
						<input type="checkbox" value="Seat-16" name="clicked" style="height:30px;width:30px;" data-toggle="popover" title="Seat-16">
						<input type="checkbox" value="Seat-17" name="clicked" style="height:30px;width:30px;" data-toggle="popover" title="Seat-17">
						<input type="checkbox" value="Seat-18" name="clicked" style="height:30px;width:30px;" data-toggle="popover" title="Seat-18">
						<input type="checkbox" value="Seat-19" name="clicked"style="height:30px;width:30px;" data-toggle="popover" title="Seat-19">
						<input type="checkbox" value="Seat-20" name="clicked" style="height:30px;width:30px;" data-toggle="popover" title="Seat-20">
						<input type="checkbox" value="Seat-21" name="clicked" style="height:30px;width:30px;" data-toggle="popover" title="Seat-21">
						<input type="checkbox" value="Seat-22" name="clicked" style="height:30px;width:30px;" data-toggle="popover" title="Seat-22">
						<input type="checkbox" value="Seat-23" name="clicked" style="height:30px;width:30px;" data-toggle="popover" title="Seat-23">
						<input type="checkbox" value="Seat-24" name="clicked" style="height:30px;width:30px;" data-toggle="popover" title="Seat-24">
						<input type="checkbox" value="Seat-25" name="clicked" style="height:30px;width:30px;" data-toggle="popover" title="Seat-25">
						<input type="checkbox" value="Seat-26" name="clicked" style="height:30px;width:30px;" data-toggle="popover" title="Seat-26">
						<input type="checkbox" value="Seat-27" name="clicked" style="height:30px;width:30px;" data-toggle="popover" title="Seat-27">
						<input type="checkbox" value="Seat-28" name="clicked" style="height:30px;width:30px;" data-toggle="popover" title="Seat-28">
						<input type="checkbox" value="Seat-29" name="clicked" style="height:30px;width:30px;" data-toggle="popover" title="Seat-29">
						<input type="checkbox" value="Seat-30" name="clicked" style="height:30px;width:30px;" data-toggle="popover" title="Seat-30">
					
					</div>
				</div>
			</div>
		</div>
		<div class="col-md-5">
				<div class="row custom-row">
					<h3>Enter Pickup Point & Drop Point<hr></h3>
					<div class="form-group-lg styled-input" style="padding-left:0px;">
						<select class="form-control" name="boardingpoint" required>
							<option selected>---Select Pickup Point---</option>
							<option><%=pickup_point1 %></option>
							<option><%=pickup_point2 %></option>
							<option><%=pickup_point3 %></option>
						</select><br>
					</div>
					<div class="form-group-lg styled-input">
						<select class="form-control" name="droppoint" required>
							<option selected>---Select Drop Point---</option>
							<option><%=drop_point1 %></option>
							<option><%=drop_point2 %></option>
							<option><%=drop_point3 %></option>
						</select><br><br>
					</div>
					<input type="hidden" name="busId" value="<%=busId %>">
					<input type="submit" value="Continue" onclick="disable();" class="btn btn-primary">	
			</div>
		</div>
	  </div>
	</div>
	</form>
	
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
	<div id="myDiv" style="text-align:center; margin-top:-688px; padding: 150px; height: 400px;">
    		Please wait...<img src="images/loader.gif" width="240" height="29" alt="loading..." /> Loading... <br>
    </div>
	
	
	<script type="text/javascript">
	  setTimeout(function() {
	        document.getElementById("myDiv").style.display="none";
	    }, 5000);
	  
	  $(document).ready(function(){
		    $('[data-toggle="popover"]').popover({
		        placement : 'top',
		        trigger : 'hover'
		    });
		});
	  
	</script>
	
</body>
</html>