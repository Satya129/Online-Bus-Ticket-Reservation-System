<%@ page import="java.sql.*"%>
<%
	String source=request.getParameter("source");
	String destination=request.getParameter("destination");
	ResultSet rs=null;
	try
	{
		Class.forName("oracle.jdbc.driver.OracleDriver");
		Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","satya","satya");
		PreparedStatement ps=con.prepareStatement("select * from buslist where source='"+source+"' and destination='"+destination+"'");
		rs=ps.executeQuery();
%>
<html>
	<head>
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
	
		<div class="table-responsive" style="height:100%;width:100%;">
		<table class="table">
			<thead style="color:white;background:#003580;">
		      <tr>
		        <th>Bus Name</th>
				<th>Type</th>
		        <th>Departure Time</th>
		        <th>Arrival Time</th>
		        <th>Seats</th>
		        <th>Ticket Price</th>
		        <!-- <th>Book Tickets</th> -->
		      </tr>
		    </thead>
		    <tbody>
		    <% 
		    	while(rs.next()){
		    	
		    %>
		    
			 	<tr style="color:black;font-size:15px;font-family:sans-serif;font-weight:bold;">
			        <td><img src="images/bus-icon.png">&nbsp;<%= rs.getString("busname")%> <h6 style="color:#f78006;font-size:14px;cursor:pointer;">(From <%=rs.getString("source")%> To <%=rs.getString("destination")  %> -Via <%=rs.getString("via")  %>)</h6></td>
			       	<td><%= rs.getString("type") %></td>
			        <td><%= rs.getString("departuretime") %></td>
			        <td><%= rs.getString("arrivaltime") %></td>
			        <td><img src="images/seats.png">&nbsp;<%= rs.getString("seats") %></td>
			        <td><%= rs.getString("ticketprice") %></td>
			       <%-- <td>
			        	<form action="chooseseat.jsp" method="post">
				        		<input type="hidden" name="busId" value="<%=rs.getInt("id") %>">
			        			<input type="submit" class="btn btn-primary" value="Book Seat">
			        	</form>
			        </td> --%>
			     </tr>
			     
			     
		    <%
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
			<form action="sourcedestination.jsp">
			<div class="modal-header" style="background:#1ba1a7;color:white;">
				<h3 class="modal-title"><span class="glyphicon glyphicon-remove pull-right" data-dismiss="modal" style="cursor:pointer;color:#f0a825;"></span>Search Route<hr></h3>
					<ul>
						<li><input type="text" class="form-control" name="source" placeholder="From"></li><br>
						<li><input type="text" class="form-control"  name="destination" placeholder="To"></li>
					</ul>
			</div>
			<div class="modal-footer" style="background:#1ba1a7;">
				<button type="submit" class="btn btn-warning">Search</button>
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
	
	<!-- <div class="modal fade" role="dialog" id="cancelticketsModal" style="width:500px;margin-left:500px;margin-top:20px;">
		<div class="modal-content">
		<form action="">
			<div class="modal-header" style="background:#1ba1a7;color:white;">
				<h3 class="modal-title">Cancel Tickets<hr></h3>
				
				<ul>
					<li><input type="text" class="form-control" name="ticketnumber" placeholder="Enter Ticket Number"></li>
				</ul>
			</div>
			<div class="modal-footer" style="background:#1ba1a7;">
				<button type="submit" class="btn btn-warning">Cancel</button>
			</div>	
			</form>
		</div>
	</div> -->
	
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
	
	</body>
</html>