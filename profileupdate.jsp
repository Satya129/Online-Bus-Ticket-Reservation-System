<%@ page import="java.sql.*"%>
<%
	String customername=(String)session.getAttribute("username");
	String username=request.getParameter("username");
	String lastname=request.getParameter("lastname");
	String email=request.getParameter("email");
	String mobilenumber=request.getParameter("mobilenumber");
	String age=request.getParameter("age");
	out.println(customername +" "+username +" " + lastname+" "+email+" "+mobilenumber+" "+age);
	Connection con=null;
	try
	{
		Class.forName("oracle.jdbc.driver.OracleDriver");
		con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","satya","satya");
		PreparedStatement ps=con.prepareStatement("update busreservation_system set username=?,lastname=?,email=?,mobilenumber=?,age=? where username='"+customername+"'");
		con.setAutoCommit(false);
		ps.setString(1,username);
		ps.setString(2,lastname);
		ps.setString(3,email);
		ps.setString(4,mobilenumber);
		ps.setString(5,age);
		ps.executeUpdate();
		con.commit();
		ps.close();
		con.close();
		System.out.print("Update");
	}
	catch(Exception e)
	{
		out.println("MyUpdateErr"+e);
	}
%>