<%@ page import="java.sql.*"%>
<%
	String username=request.getParameter("username");
	String email=request.getParameter("email");
	String password=request.getParameter("password");
	try
	{
		Class.forName("oracle.jdbc.driver.OracleDriver");
		Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","satya","satya");
		PreparedStatement ps=con.prepareStatement("select * from busreservation_system where email=? and password=?");
		ps.setString(1,email);
		ps.setString(2,password);
		ResultSet rs=ps.executeQuery();
		if(rs.next())
		{
			session.setAttribute("username",rs.getString(2));
			//response.sendRedirect("userhomepage.jsp");
%>		<<script type="text/javascript">
			alert("Login Successful");
			window.location.href="userhomepage.jsp";
		</script>
<% 	
		}
		else
		{%>
			<script type="text/javascript">
				alert("Enter Valid User Id And Password");
				window.location.href="index.jsp";
			</script>
		<%
			//response.sendRedirect("index.jsp");
		}
		rs.close();
		ps.close();
		con.close();
	}
	catch(Exception e)
	{
		out.println(e);
	}
%>