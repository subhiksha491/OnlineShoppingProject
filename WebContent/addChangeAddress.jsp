<%@page import="Project.ConnectionProvider"%>
<%@page import="java.sql.*"%>
<%@include file="changeDetailsHeader.jsp"%>
<%@include file="footer.jsp"%>
<html>
<head>
<link rel="stylesheet" href="css/changeDetails.css">
<link rel="stylesheet" href="css/bootstrap/css/bootstrap.min.css" />
<link rel="stylesheet" href="css/signup.css" />
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<script src='https://kit.fontawesome.com/a076d05399.js'></script>
<title>ADD or Change Address</title>
</head>
<body class="min-height:100vh">
	<%
	String msg = request.getParameter("msg");
	if ("valid".equals(msg)) {
	%>
	<h3 class="alert">Address Successfully Updated !</h3>
	<%
	}
	%>
	<%
	if ("invalid".equals(msg)) {
	%>
	<h3 class="alert">Some thing Went Wrong! Try Again!</h3>
	<%
	}
	%>
	<%
	try {
		Connection conn = ConnectionProvider.getCon();
		Statement stmt = conn.createStatement();
		ResultSet rs = stmt.executeQuery("select * from users where email='" + email + "'");
		while (rs.next()) {
	%>
	<form action="AddChangeAddressAction.jsp" method="post">
		<h3>Enter Address</h3>
		<input class="input-style" type="text" name="address"
			value="<%=rs.getString(7)%>" placeholder="Enter Address" required>
		<hr>
		<h3>Enter city</h3>
		<input class="input-style" type="text" name="city"
			value="<%=rs.getString(8)%>" placeholder="Enter City" required>
		<hr>
		<h3>Enter State</h3>
		<input class="input-style" type="text" name="state"
			value="<%=rs.getString(9)%>" placeholder="Enter State" required>
		<hr>
		<h3>Enter country</h3>
		<input class="input-style" type="text" name="country"
			value="<%=rs.getString(10)%>" placeholder="Enter Country" required>
		<hr>
		<button class="button" type="submit">
			Save <i class='far fa-arrow-alt-circle-right'></i>
		</button>
	</form>
	<%
	}
	} catch (Exception e) {
	System.out.println(e);
	}
	%>
</body>
<br>
<br>
<br>
<br>
</html>