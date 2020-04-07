<html>
<head>
	<script type="text/javascript">
		function dBack()
		{
			window.history.forward();
		}
		setTimeout("dBack()",0);
	</script>
</head>
<body onload="dBack();">
	<h2>Successfully Log Out....</h2>
	<%
		session.invalidate();
		response.setHeader("Refresh", "2;index.jsp");
		response.sendRedirect("index.jsp");
	%>
</body>
</html>