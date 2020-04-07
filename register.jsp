<%@ page import="java.sql.*"%>
<%
	String userfirstname=request.getParameter("userfirstname");
	String userlastname=request.getParameter("userlastname");
	String email=request.getParameter("email");
	String phonenumber=request.getParameter("phonenumber");
	String age=request.getParameter("age");
	String password=request.getParameter("password");
	try
	{
		Class.forName("oracle.jdbc.driver.OracleDriver");
		Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","satya","satya");
		PreparedStatement ps=ps=con.prepareStatement("insert into busreservation_system(id,username,email,mobilenumber,age,password,lastname) values(busreservation_systems.nextVal,?,?,?,?,?,?)");
			
		ps.setString(1,userfirstname);
		ps.setString(2,email);
		ps.setString(3,phonenumber);
		ps.setString(4,age);
		ps.setString(5,password);
		ps.setString(6,userlastname);
		Integer rs=ps.executeUpdate();
		con.close();
%>
		<script>
			alert("Successfully Registred");
			window.location.href="index.jsp";
		</script>
<%		
		//response.sendRedirect("index.jsp");
				
	}
	catch(Exception e)
	{
		out.println(e);
	}
%>

