<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<link type="text/css" rel="stylesheet" href="css/bootstrap.css"/>
	<script src="js/jquery-3.2.1.min.js" type="text/javascript"></script>
	<script src="js/jquery.cycle.all.js" type="text/javascript"></script>
	<script src="js/bootstrap.js"></script>
	<style>
		@import url(css/style.css);
	</style>
	<script>
		function checkcard()
		{
			var card=document.getElementById("cardnumber").value;
			document.getElementById("cvv").value = 3;
		}
	</script>
	
</head>
<body>
	<form action="finalsubmission.jsp" method="post">
		<div><h3>Enter Card Details<img src="images/creditcardicons.png" class="pull-right" style="height:50px;width:520px"><hr></h3></div>
		<div class="row">
		<div class="col-sm-2"></div>
		<div class="col-sm-3" style="margin-top:40px;font-family:sans-serif;font-weight:bold">
			Enter Card Number<br><br>
			Enter Expiry Date<br><br><br>
			Enter Card Holder's Name
		</div>
		<div class="col-sm-7" style="margin-top:40px;">
			<input type="number" name="cardnumber" style="width:375px;" id="cardnumber" required><br><br>
			<select required>
				<option>Jan(01)</option>
				<option>Feb(02)</option>
				<option>Mar(03)</option>
				<option>Apr(04)</option>
				<option>May(05)</option>
				<option>Jun(06)</option>
				<option>Jul(07)</option>
				<option>Aug(08)</option>
				<option>Sept.(09)</option>
				<option>Oct(10)</option>
				<option>Nov(11)</option>
				<option>Dec(12)</option>
			</select>
			<select requied>
				<option>2018</option>
				<option>2019</option>
				<option>2020</option>
				<option>2021</option>
				<option>2022</option>
				<option>2023</option>
				<option>2024</option>
				<option>2025</option>
			</select>
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;CVV</h3><input type="number" name="cvvnumber" id="cvv" style="width:122px;" onfocus="checkcard()"><br><br>
			<input type="text" name="cardholdername" style="width:255px;" required>
						
		</div>
		<br><br><br><input type="submit" value="Make Payment" class="btn btn-primary" style="height:30px;width:150px;">
		</div>
	</form>
</body>
</html>