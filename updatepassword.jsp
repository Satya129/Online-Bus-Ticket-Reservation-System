<%@ page import="java.sql.*"%>
<%
	String oldpassword=request.getParameter("oldpassword");
	String newpassword=request.getParameter("newpassword");
	String confirmpassword=request.getParameter("confirmpassword");
	Connection con=null;
	String pass="";
	int id=0;
	try
	{
		Class.forName("oracle.jdbc.driver.OracleDriver");
		con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","satya","satya");
		PreparedStatement ps=con.prepareStatement("select * from busreservation_system where password='"+oldpassword+"'");
		ResultSet rs=ps.executeQuery();
		while(rs.next())
		{
			id=rs.getInt(1);
			pass=rs.getString(6);
		}
		System.out.println(id+ " "+pass);
		if(pass.equals(oldpassword))
		{
			Statement st1=con.createStatement();
			int i=st1.executeUpdate("update busreservation_system set password='"+newpassword+"' where id='"+id+"'");
			out.println("<script>alert('Password changed successfully');</script>");
			st1.close();
			con.close();
		}
		else
		{
			out.println("Invalid Current Password");
		}
	}
	catch(Exception e)
	{
		out.println("MyUpdateErr"+e);
	}
%>