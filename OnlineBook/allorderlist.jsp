<%@page import="java.sql.*"%>
<%@page import="java.io.*"%>
<%@page import="dbConnect.*"%>
<%@page import="java.util.*"%>
<html>
<body>
<script type="text/javascript">
		function confirmStatus(id) {

			var del = confirm("Are you sure you want to edit status?")

			if (del) {

				window.document.myForm.action = "EditStatusServlet?orderid="
						+ id;
				window.document.myForm.submit();
			} else {
				alert("Edit cancelled!")

			}

		}
	</script>
<h1>Book Order Lists</h1>
				<form name="myForm" method="post">
					<table border="1">
					<tr>
							<th>User Name</th><th>Address</th>
							<th>Phone Number</th><th>BookName</th>
							<th>Quantity</th><th>Total Cost</th>
							<th>Date</th><th>Order Status</th>
						</tr>

						<%
							try {
								Connection conn = DBConnection.getConn();
								String sql = "select * from orderlist";

								PreparedStatement ps = conn.prepareStatement(sql);

								ResultSet rs = ps.executeQuery();
								while (rs.next()) {
									ps = conn
											.prepareStatement("select * from user where email like ?");
									ps.setString(1, rs.getString("email"));
									ResultSet rs2 = ps.executeQuery();
						%>
						
							<%
								if (rs2.next()) {
											String name = rs2.getString(1);
											String addr = rs2.getString(4);
											String phno = rs2.getString(5);
							%>
							<tr>
							<td><%=name%></td>
							<td><%=addr%></td>
							<td><%=phno%></td>
							<%
								}
										ps = conn
												.prepareStatement("select * from orderedbooks where orderid like ?");
										ps.setString(1, rs.getString("orderid"));
										ResultSet rs3 = ps.executeQuery();
							%><td>
								<%
									while (rs3.next()) {
												String bname = rs3.getString(3);
								%> <%=bname%><br> <%}%>
 	
 
							</td>
							<%
								rs3 = ps.executeQuery();
							%><td>
								<%
									while (rs3.next()) {
												String qty = rs3.getString(4);
								%><%=qty%><br> <%
 	}
 %>
							</td>
							<%
								String tcost = rs.getString(3);
										String date = rs.getString(4);
										int status = rs.getInt(5);
							%>

							<td><%=tcost%></td>
							<td><%=date%></td>
							<%
								if (status == 0) {
							%>
							<td>Not Deliver Yet!<br> <input type="submit"
								value="Edit Status"
								onclick="confirmStatus('<%=rs.getString(1)%>')">
							</td>
							<%
								} else {
							%>
							<td>Delivered</td>
							<%
								}
							%>
						</tr>


						<%
							}
							} catch (Exception e) {
							}
						%>
					</table>
				</form>
</body>
</html>