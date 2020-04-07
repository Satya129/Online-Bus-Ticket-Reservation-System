<%@ page import="java.sql.*" %>
<%
	ResultSet rs=null;
    String customername=(String)session.getAttribute("username");
	try
	{
	    Class.forName("oracle.jdbc.driver.OracleDriver");
		Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","satya","satya");
		PreparedStatement ps=con.prepareStatement("update user_booked_tickets set paymentstatus='CANCELL' where customername='"+customername+"'");
		rs=ps.executeQuery();
%>		<script>confirm("Do You Really Want To Cancel The Ticket ?")</script>
		<link type="text/css" rel="stylesheet" href="css/bootstrap.css"/>
		<script src="js/jquery-3.2.1.min.js" type="text/javascript"></script>
		<script src="js/jquery.cycle.all.js" type="text/javascript"></script>
		<script src="js/bootstrap.js"></script>
		<style>
			@import url(css/style.css);	
		</style>
			<jsp:include page="header.jsp"></jsp:include>
			<center>
				<I><span class="blinking"><h2>Your Ticket Has Been Cancelled Successfully...</h2></span></I>
				<br><h4>You will get back your money within 5-7 business days.</h4>
				<a href="userhomepage.jsp">Go To Home</a>
			</center>
<%
	}
	catch(Exception e)
	{
		out.print("MyConErr"+e);
	}
%>
		