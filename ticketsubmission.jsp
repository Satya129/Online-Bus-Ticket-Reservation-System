<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.sql.*" %>
<%
	String paymentstatus="";
	String customername=request.getParameter("username");
	String seatnumber=request.getParameter("seatnumber");
	String pickup_point=request.getParameter("pickup_point");
	String drop_point=request.getParameter("drop_point");
	String departuretime=request.getParameter("departuretime");
	String arrivaltime=request.getParameter("arrivaltime");
	String conductornumber=request.getParameter("conductornumber");
	String busName=request.getParameter("busname");
	String source=request.getParameter("source");
	String destination=request.getParameter("destination");
	String via=request.getParameter("via");
	String journey_dt=(String)session.getAttribute("journey_dt");
	ResultSet rs1=null;
	try
	{
		Class.forName("oracle.jdbc.driver.OracleDriver");
		Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","satya","satya");
		PreparedStatement ps=con.prepareStatement("insert into user_booked_tickets(id,customername,seatnumber,pickuppoint,"+
				"droppoint,departuretime,arrivaltime,conductornumber,busname,source,destination,via,journey_dt,paymentstatus) values(user_booked_ticket.nextVal,?,?,?,?,?,?,?,?,?,?,?,?,'PENDING')");
		ps.setString(1,customername);
		ps.setString(2,seatnumber);
		ps.setString(3,pickup_point);
		ps.setString(4,drop_point);
		ps.setString(5,departuretime);
		ps.setString(6,arrivaltime);
		ps.setString(7,conductornumber);
		ps.setString(8,busName);
		ps.setString(9,source);
		ps.setString(10,destination);
		ps.setString(11,via);
		ps.setString(12, journey_dt);
		Integer rs=ps.executeUpdate();
		con.close();
		response.sendRedirect("payment.jsp");
	}
	catch(Exception e)
	{
		out.println("MyErr"+e);
	}
		
%>
<%-- <%
	    ResultSet rs=null;
    	String Customername=(String)session.getAttribute("username");
	    try
		{
	    	Class.forName("oracle.jdbc.driver.OracleDriver");
			Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","satya","satya");
			PreparedStatement ps=con.prepareStatement("select * from user_booked_tickets where customername='"+Customername+"'");
			rs=ps.executeQuery();
			
	%> --%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Thank You | Visit Again</title>
	<link type="text/css" rel="stylesheet" href="css/bootstrap.css"/>
	<script src="js/jquery-3.2.1.min.js" type="text/javascript"></script>
	<script src="js/jquery.cycle.all.js" type="text/javascript"></script>
	<script src="js/bootstrap.js"></script>
	<style>
		@import url(css/style.css);	
	</style>
</head>
<body bgcolor="#EDF">
	
	<%-- <jsp:include page="header.jsp"></jsp:include>
	
	<jsp:include page="userhomepagenavbar.jsp"></jsp:include>
	
	<div class="container" style="font-family:sans-serif;font-size:20px;text-align:center;">
			<br><I><span class="blinking">Congratulations..	Your Seat Has Been Booked Successfully</span></I><br>
			<div id="printTicket">
				<h2 style="text-align:left;font-weight:bold;">
					<center><img src="images/bus-icon.png">&nbsp;<%=busName %></center>
					<h6 style="color:#f78006;font-size:14px;">(From <%=source %> To <%=destination %> -Via <%=via%>)</h6>
				</h2><hr>
				<h4 style="font-weight:bold;"> Customer Name:-<%=customername %> </h4>
				<h4 style="font-weight:bold;"> Seat Number:- <%=seatnumber%></h4>
				<h4 style="font-weight:bold;"> Date Of Journey:- <%=journey_dt%></h4>
				<h4 style="font-weight:bold;"> Pick Up Point:- <%=pickup_point %></h4>
				<h4 style="font-weight:bold;"> Drop Point:- <%=drop_point %></h4>
				<h4 style="font-weight:bold;"> Departure Time:- <%=departuretime %></h4>
				<h4 style="font-weight:bold;"> Arrival Time:-  <%=arrivaltime %></h4>
				<h4 style="font-weight:bold;"> Conductor Cont. Number:-<%=conductornumber %> </h4>
				<br>
				<input type="submit" class="btn btn-link" onClick="window.print()" value="Print Ticket" style="font-weight:bold;font-family:sans-serif;font-size:20px;">
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
				     <%
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
                    	<button type="button" class="btn btn-primary" onClick="window.print()" style="width:20%;">Print Ticket</button>
                    	<button type="submit" class="btn btn-primary" style="width:20%;">Cancel Ticket</button></form>
                    	<!-- <button type="button" class="btn btn-primary" data-dismiss="modal" style="width:70px;">Close</button> -->
                    </center>
                </div>
            </div>
        </div>
    </div>
</div>
</div>
	
	<div id="myDiv" style="text-align:center; margin-top:-688px; padding: 150px; height: 400px;">
    		Please wait...<img src="images/loader.gif" width="240" height="29" alt="loading..." /> Loading... <br>
    </div>
	
	<h3 style="font-weight:bold;font-family:sans-serif;font-size:15px;" class="pull-right">N.B :- Print Out Of Ticket Is Mandatory.</h3>
	
	<script type="text/javascript">
		/* document.addEventListener("keydown", myFunction);
		function myFunction(e){
			if(e.ctrlKey && (e.key == "p" || e.charCode == 16 || e.charCode == 112 || e.keyCode == 80) ){
		        e.preventDefault();
		        e.stopImmediatePropagation();
		    }
		}	
		 */
		
	  setTimeout(function() {
	        document.getElementById("myDiv").style.display="none";
	    }, 5000);
	</script> --%>
	
</body>
</html>