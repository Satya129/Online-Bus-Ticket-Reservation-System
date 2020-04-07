<%@ page import="java.sql.*" %>
<%
	ResultSet rs=null;
    String username=(String)session.getAttribute("username");
	try
	{
		Class.forName("oracle.jdbc.driver.OracleDriver");
		Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","satya","satya");
		PreparedStatement ps=con.prepareStatement("select * from busreservation_system where username='"+username+"'");
		rs=ps.executeQuery();
			
	%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<title>User Profile</title>
	<link type="text/css" rel="stylesheet" href="css/bootstrap.css"/>
	<script src="js/jquery-3.2.1.min.js" type="text/javascript"></script>
	<script src="js/jquery.cycle.all.js" type="text/javascript"></script>
	<script src="js/bootstrap.js"></script>
	<style>
		@import url(css/style.css);	
	</style>
	 <script>
            var $imageupload = $('.imageupload');
            $imageupload.imageupload();
     </script>
</head>
<body>
	
	<jsp:include page="header.jsp"></jsp:include>
	
	<jsp:include page="userhomepagenavbar.jsp"></jsp:include>
	<% 
	while(rs.next())
	{
	%>	
		<center><h1>User Profile</h1><hr></center>
		<div class="row">
			<div class="col-md-2">
			
				<div class="container">
				<form action="FileUploadServlet" method="post" enctype="multipart/form-data">
            		<div class="imageupload panel panel-default" style="height:400px;">
                		<div class="panel-heading clearfix">
                    		<h3 class="panel-title pull-left">Select Image file</h3>
                    		<div class="btn-group pull-right">
 
                    		</div>
                		</div>
       	         		<div class="file-tab panel-body">
 
                    		<label class="btn btn-primary btn-file" style="height:70px;">
		                        <span>Click Here To Browse</span><br><br>
                        			<input type="file" name="image-file" required>
                    		</label>
                		</div>
                		<div class="url-tab panel-body">
                    		<div class="input-group">
                        		<div class="input-group-btn">
                        			<input type="hidden" name="image-url">
                            		<button type="submit" class="btn btn-default">Submit</button>
                       	 		</div>
                    		</div>
                    			
                		</div>
            		</div>
            	</form>
        		</div>
			</div>
		<div class="col-md-8">
			<center>
				<table height=250px width=700px border=1>
					<tr><td><h4><b>User Name:-</b></h4></td><td><h4><i><%= rs.getString("username") %>&nbsp;<%= rs.getString("lastname") %></i></h4></td></tr><br>
					<tr><td><h4><b>E-Mail Id:-</b></h4></td><td><h4><i><%= rs.getString("email") %></i></h4></td></tr><br>
					<tr><td><h4><b>Contact Number:-</b><h4></td><td><h4><i><%= rs.getString("mobilenumber") %></h4></i></td></tr><br>
					<tr><td><h4><b>Age:-</b></h4></td><td><h4><i><%= rs.getString("age") %>&nbsp;Years</h4></i></td></tr>
					<tr>
						<td colspan="2"><!-- <center><input type="button" class="btn btn-primary btn-disable nav-link" data-toggle="modal" disabled="disabled" data-target="#EditProfileModal" style="cursor:pointer;" value="Edit Profile"> -->
							<center><input type="button" class="btn btn-primary nav-link" data-toggle="modal" data-target="#MyBookingsModal" style="cursor:pointer;" value="My Bookings"></center>
						</td>
					</tr>
				</table>
				<div class="typewriter">
					<br><h4 style="color:black;">Now Check Your Booking History By Clicking On <i><b><span class="blink_me">"My Bookings"</span></b></i></h4>
				</div>
			</center>
		</div>
		<div class="col-md-2">
			<%
				if(username.equals("Satyabrata"))
				{
			%>		<img src="profileimages/BAPU-PICTURE.jpg" style="cursor:pointer;margin-left:-115px;height:398px;width:324px;border-radius:10px;">
			<% 	
				}
				else
				{
					out.print("<h4 style='margin-left:-70px;font-weight:bold;'>Profile Photo Is Not Available</h4>");	
				}
			%>
			
		</div>
	</div>
	<%
	}
	}
	catch(Exception e)
	{
		out.print("MyConErr"+e);
	}
	%>
	
	<%
	    ResultSet rs1=null;
    	String customername=(String)session.getAttribute("username");
	    try
		{
	    	Class.forName("oracle.jdbc.driver.OracleDriver");
			Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","satya","satya");
			PreparedStatement ps=con.prepareStatement("select * from user_booked_tickets where customername='"+customername+"'");
			rs=ps.executeQuery();
			
			
	%>
	
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
				<center><button type="submit" class="btn btn-warning">Go User To Profile</button></center>
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

<div class="modal fade" id="MyBookingsModal" tabindex="-1" role="dialog" aria-labelledby="MyBookingsModalLabel" aria-hidden="true">
    <div class="vertical-alignment-helper">
        <div class="modal-dialog vertical-align-center">
            <div class="modal-content" style="margin-left:-217px;width:1000px;">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
                     <center><h4 class="modal-title" id="myModalLabel" style="font-weight:bold;">My Booking History</h4></center>
						
                </div>
                <div class="modal-body">
                	  <div class="table-responsive" style="height:100%;width:100%;">
					<table class="table">
				<thead style="color:white;background:#003580;width:1500px;;">
<%
	ResultSet rs2=null;
    String customername1=(String)session.getAttribute("username");
	try
	{
	    Class.forName("oracle.jdbc.driver.OracleDriver");
		Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","satya","satya");
		PreparedStatement ps=con.prepareStatement("select * from user_booked_tickets where customername='"+customername1+"'");
		rs=ps.executeQuery();
	    
 %> 
 					<tr>
 						<th><b>Bus Name</b></th>
						<th><b>Journey Date</b></th>
						<th><b>From</b></th>
						<th><b>To</b></th>
						<th><b>Seat Number</b></th>
						<th><b>Ticket Status</b></th>
					</tr>
				</thead>
			    <tbody>
			    <% 
			    	String paymentstatus="";
				    while(rs.next())
				    {
			    %>
			    	<tr style="color:black;font-size:15px;font-family:sans-serif;">
				        <td><%= rs.getString("busname") %><br><h6 style="color:#f78006;">(From <%=rs.getString("source")%> To <%=rs.getString("destination")  %> -Via <%=rs.getString("via")  %>)</h6></td>
				        <td><%= rs.getString("journey_dt") %></td>
				        <td><%= rs.getString("source") %></td>
				        <td><%= rs.getString("destination") %></td>
				        <td><%= rs.getString("seatnumber") %></td>
				        <%
				        	if(paymentstatus.equals("CONFIRM"))
				        	{
				        %>
				        <td style="color:#08cb08;"><%= rs.getString("paymentstatus") %></td>
				        <%
				        	}
				        	else if(paymentstatus.equals("PENDING"))
				        	{
				        %>
				        <td style="color:orange;"><a href="paymnet.jsp"><%= rs.getString("paymentstatus") %></a></td>
				        <% 
				        	}
				        	else
				        	{
				        %>
				        <td style="color:red;"><%= rs.getString("paymentstatus") %></td>
				        <%
				        	}
				        %>
				    </tr>
				   <%
				   	}
						
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
                    	<button type="button" class="btn btn-primary" data-dismiss="modal" style="width:70px;">Close</button>
                    </center>
                </div>
            </div>
        </div>
    </div>
</div>
</div>

<div class="modal fade" id="EditProfileModal" tabindex="-1" role="dialog" aria-labelledby="EditProfileModalLabel" aria-hidden="true">
    <div class="vertical-alignment-helper">
        <div class="modal-dialog vertical-align-center">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
                     <center><h4 class="modal-title" id="myModalLabel" style="font-weight:bold;">Edit Profile</h4></center>
						
                </div>
                <div class="modal-body">
                	  <div class="table-responsive" style="height:100%;width:100%;">
					<table class="table">
				<thead style="color:white;background:#003580;width:1500px;;">
<%
	ResultSet rs3=null;
    String username2=(String)session.getAttribute("username");
    String lastname="";
    String email="";
    String mobilenumber="";
    String age="";
	try
	{
	    Class.forName("oracle.jdbc.driver.OracleDriver");
		Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","satya","satya");
		PreparedStatement ps=con.prepareStatement("select * from busreservation_system where username='"+username2+"'");
		rs3=ps.executeQuery();
	    
 %> 
 					<tr>
 						<th colspan=2><b><center>Edit Your Profile Data Here</center></b></th>
					</tr>
				</thead>
			    <tbody>
			    <% 
				    while(rs3.next())
				    {
				    	username = rs3.getString("username");
				    	lastname = rs3.getString("lastname");
				    	email = rs3.getString("email");
				    	mobilenumber = rs3.getString("mobilenumber");
				    	age = rs3.getString("age");
			    %>
			    	<tr style="color:black;font-size:15px;font-family:sans-serif;">
				        <td>First Name:-</td>
				        <td><input type="text" class="input-sm" name="username" value="<%= username %>" size="30"></td>
				    </tr>
				    <tr style="color:black;font-size:15px;font-family:sans-serif;">
				        <td>Last Name:-</td>
				        <td><input type="text" class="input-sm" name="lastname" value="<%= rs3.getString("lastname") %>" size="30"></td>
				    </tr>
				    <tr style="color:black;font-size:15px;font-family:sans-serif;">
				        <td>E-Mail Id:-</td>
				        <td><input type="text" class="input-sm" name="email" value="<%= rs3.getString("email") %>" size="30"></td>
				    </tr>
				    <tr style="color:black;font-size:15px;font-family:sans-serif;">
				        <td>Contact Number:-</td>
				        <td><input type="text" class="input-sm" name="mobilenumber" value="<%= rs3.getString("mobilenumber") %>" size="30"></td>
				    </tr>
				    <tr style="color:black;font-size:15px;font-family:sans-serif;">
				        <td>Age:-</td>
				        <td><input type="text" class="input-sm" name="age" value="<%= rs3.getString("age") %>" size="30"></td>
				    </tr>
				   <%
				   	}
						
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
                    	<form action="profileupdate.jsp">
	                    	<input type="hidden" name="username" value="<%= username %>">
	                    	<input type="hidden" name="lastname" value="<%= lastname %>">
	                    	<input type="hidden" name="email" value="<%= email %>">
	                    	<input type="hidden" name="mobilenumber" value="<%= mobilenumber %>">
                    		<input type="hidden" name="age" value="<%= age %>">
	                    	<button type="submit" class="btn btn-primary" style="width:70px;">Update</button>
	                    	<button type="button" class="btn btn-primary" data-dismiss="modal" style="width:70px;">Close</button>
	                    </form>
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
	</script>
	
</body>
</html>