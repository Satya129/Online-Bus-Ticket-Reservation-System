<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.sql.*" %>
	<%
		String journey_dt=(String)session.getAttribute("journey_dt");
	%>
    <%
    String bus_seat[]=request.getParameterValues("clicked");
	Integer busId=Integer.parseInt(request.getParameter("busId"));
	String busName="";
	String source="";
	String destination="";
	String via="";
	String departuretime="";
	String arrivaltime="";
	String ticketprice="";
	String conductornumber="";
	String username=(String)session.getAttribute("username");
	String boardingpoint=request.getParameter("boardingpoint");
	String droppoint=request.getParameter("droppoint"); 
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
			departuretime=rs.getString("departuretime");
			arrivaltime=rs.getString("arrivaltime");
			ticketprice=rs.getString("ticketprice");
			conductornumber=rs.getString("conductornumber");
		}
		con.close();
	}
	catch(Exception e)
	{
	out.println("MyConErr"+e);
	}
	
	
	String seatNumbers=""; 
	Integer amount=0;
	for(String val:bus_seat)
    {
		amount+=Integer.parseInt(ticketprice);
		seatNumbers+=val+",";					
    }
	seatNumbers=seatNumbers.substring(0,seatNumbers.length()-1); // to remove last comma (,)
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
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Confirm Submission</title>
	<link type="text/css" rel="stylesheet" href="css/bootstrap.css"/>
	<script src="js/jquery-3.2.1.min.js" type="text/javascript"></script>
	<script src="js/jquery.cycle.all.js" type="text/javascript"></script>
	<script src="js/bootstrap.js"></script>
	<style>
		@import url(css/style.css);	
	</style>

</head>
<body>

	<jsp:include page="header.jsp"></jsp:include>
	
	<jsp:include page="userhomepagenavbar.jsp"></jsp:include>
	
	<form id="bookTicket" action="ticketsubmission.jsp" onsubmit="return checkSpace();" method="post">
		<div class="container" style="height:100%;width:100%;box-shadow:0px 0px 10px 0px gray; margin-bottom:10px; padding:5px;" >
			<div class="row custom-row">
				<div class="col-md-10">
						<h2 style="text-align:left;font-weight:bold;"><img src="images/bus-icon.png">&nbsp;<%=busName %><h6 style="color:#f78006;font-size:14px;">(From <%=source %> To <%=destination %> -Via <%=via %>)</h6></h2><hr>
						<h4 style="text-align:left;font-weight:bold;"> Customer Name:-<%=username %> </h4>
						<h4 style="text-align:left;font-weight:bold;"> Seat Number:- <%=seatNumbers%></h4>
						<h4 style="text-align:left;font-weight:bold;"> Pick Up Point:- <%=boardingpoint %></h4>
						<h4 style="text-align:left;font-weight:bold;"> Drop Point:- <%=droppoint %></h4>
						<h4 style="text-align:left;font-weight:bold;"> Departure Time:- <%=departuretime %></h4>
						<h4 style="text-align:left;font-weight:bold;"> Arrival Time:-  <%=arrivaltime %></h4>
						<h4 style="text-align:left;font-weight:bold;"> Conductor Cont. Number:-<%=conductornumber %> </h4>						
				</div>
				<div class="col-md-2">
					<h5 style="text-align:left;font-weight:bold;">Date Of Journey:-&nbsp;&nbsp;&nbsp;<%=journey_dt %></h5>
					<h5 style="text-align:left;font-weight:bold;">Ticket Number:-&nbsp;&nbsp;&nbsp; <%=busName %></h5>
				</div>
			</div>
			<br><br><br>
			<div class="row custom-row">
				<div class="col-md-10">
					<h4 style="text-align:left;font-weight:bold;">Amount:- Rs <%=amount %>/- Only</h4>
				</div>
				<div col-md-2>
					<input type="hidden" name="username" value=<%=username %>>
					<input type="hidden" name="seatnumber" value=<%=seatNumbers %>>
					<input type="hidden" name="pickup_point" value=<%=boardingpoint %>>
					<input type="hidden" name="drop_point" value=<%=droppoint %>>
					<input type="hidden" name="departuretime" value=<%=departuretime %>>
					<input type="hidden" name="arrivaltime" value=<%=arrivaltime %>>
					<input type="hidden" name="conductornumber" value=<%=conductornumber %>>
					<input type="hidden" name="busname" value=<%=busName%>>
					<input type="hidden" name="source" value=<%=source %>>
					<input type="hidden" name="destination" value=<%=destination %>>
					<input type="hidden" name="via" value=<%=via %>>
					<input type="submit" value="Confirm Booking" class="btn btn-primary">
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
		function checkSpace(){
			(request.getContextPath()).replaceAll("%20", " ")
			return true;
		}
		
	
	  setTimeout(function() {
	        document.getElementById("myDiv").style.display="none";
	    }, 5000);
	</script>
	
</body>
</html>