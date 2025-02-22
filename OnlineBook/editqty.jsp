<%@page import="java.sql.*"%>
<%@page import="dbConnect.*"%>
<html>
<body>
<br><br><br>
<center><form action="EditBookQuantity.jsp" method="post">
Book Category<select name="category">

<%try {
	Connection conn = DBConnection.getConn();
	String sql = "select distinct category  from booklist";
	
		PreparedStatement ps = conn.prepareStatement(sql);
		
		ResultSet rs=ps.executeQuery();
		%>
		<%
		while (rs.next()){%><option>
			
			<%String cate=rs.getString(1);
			%>
			<%=cate %></option><%} %>
			<% 
		}catch(Exception e){e.printStackTrace();}%>
			 	
	</select>	
			<input type="submit" value="View" name="View"></form></center>
</body></html>