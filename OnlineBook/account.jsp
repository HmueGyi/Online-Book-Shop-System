<%@page import="java.sql.*"%>
<%@page import="java.io.*"%>
<%@page import="dbConnect.*" %>
<%@page import="java.util.*"%>
<body>
<%
Connection conn = DBConnection.getConn(); 
<%
try {
	Statement stmt = conn1.createStatement();
	ResultSet rs1 = stmt
			.executeQuery("select username from user where email="+session.getAttribute("Email"));

	while (rs1.next()) {
		int tot = rs1.getString(1);
		System.out.println("name : " + tot);
System.out.println("Email is "+session.getAttribute("username"));
if(session.getAttribute("Email")!=null){
	
%>
<a class="nav-link text-uppercase text-white" href="logout.jsp">Logout</a>

<%}else{ %>
<a class="nav-link text-uppercase text-white" href="login.jsp">Login</a>
<%}%>
</body>