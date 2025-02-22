<%@page import="java.sql.*"%>
<%@page import="java.io.*"%>
<%@page import="dbConnect.*"%>
<%@page import="java.util.*"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Admin Dashboard</title>
<!-- <link rel="stylesheet" href="/OnlineBook/additem(Admin)/css1/style.css">
<link rel="stylesheet"
	href="/OnlineBook/additem(Admin)/stylling/theme.css">

<link rel="stylesheet"
	href="/OnlineBook/additem(Admin)/css1/mediaQueries.css">
<link rel="stylesheet"
	href="/OnlineBook/additem(Admin)/vendor/feather-icons-web/feather.css"> -->
	
	<!-- <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.1.3/css/bootstrap.min.css" integrity="sha512-GQGU0fMMi238uA+a/bdWJfpUGKUkBdgfFdgBm72SUQ6BeyWjoY/ton0tEjH+OSH9iP4Dfh+7HM0I9f5eR0L/4w==" crossorigin="anonymous" referrerpolicy="no-referrer" /> -->
    <link rel="stylesheet" href="vendor/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css"
    referrerpolicy="no-referrer">
    <link rel="stylesheet" href="vendor/feather-icons-web/feather.css">
    <link rel="stylesheet" href="css/style.css">
</head>
<body>
	<div class=" container-fluid">
	
	
	
		<div class="row">
			<div class="col-12  col-xl-2 col-lg-3 vh-100 sideBar pt-2 ">
				<!-- menu side bar -->
				<div class="row">
					<div class="col-12 logodiv">
						<div
							class="d-flex p-2 justify-content-between align-items-center ">
							<div class="logo bg-primary text-light rounded pt-1 px-1">
								<i class=" feather-shopping-bag " style="font-size: 32px;"></i>

							</div>
							<span class=" text-uppercase  text-primary me-lg-4 me-md-2 ms-2"
								style="font-weight: 600;">Book Store</span>

							<div class="closebtn btn p-0 d-lg-none d-block ">
								<i class=" feather-x text-dark" style="font-size: 2em;"></i>
							</div>
						</div>
					</div>
					<div class="">
						 <div class="col-12">
							<ul>
								<li class="menu-Item-title  text-secondary">Order
									Management</li>
								<li class="menu-Item-links">
									<div>
										<i class=" feather-calendar"></i> <a href="dashboard.jsp"
											class="">Order List</a>
									</div> </li>
								<li class="menu-Item-links">
									<div>
										<i class=" feather-list"></i> <a href="datalist.jsp" class="">Book
											List</a>
									</div></li>
								<li class="menu-Item-links">
									<div>
										<i class=" feather-plus-circle"></i> <a href="addItems.jsp"
											class="">Add Book</a>
									</div></li>
									<li class="menu-Item-links">
									<div>
										<i class=" feather-list"></i> <a href="EditBookQuantity.jsp"
											class="">Edit Quantity</a>
									</div></li>
									<li class="menu-Item-links">
									<div>
										<i class=" feather-list"></i> <a href="EditBookPrice.jsp"
											class="">Edit Price</a>
									</div></li>
									<li class="menu-Item-links">
									<div>
										<i class="feather-list"></i> <a href="DeleteBook.jsp"
											class="">Delete Book</a>
									</div></li>
									<li class="menu-Item-links">
									<div>
										<i class=" feather-list"></i> <a href="adminlogout.jsp"
											class="">Logout</a>
									</div></li>
									

							</ul>
						</div>
					</div>
				</div>
			</div>

			<div class="col-12 col-xl-10 col-lg-9 vh-100 content p-2">
				<div class="row sticky-top ">
					<div class="col-12 ">
						<div class="nav-bar bg-primary p-2  rounded d-flex justify-content-between align-items-center">
                            <button class="sidebar-btn btn btn-sm  d-flex align-items-center d-lg-none">
                                <i class=" feather-menu text-light" style="font-size: 2em;"></i>
                            </button>

                            
                            <div style="color:white;">
                            	<h2>Admin Dashboard</h2>
                            </div>
                            
                        </div>
					</div>
				</div>
				<%
					Connection conn1 = DBConnection.getConn();
				%>

				<%
					try {
						Statement stmt = conn1.createStatement();
						ResultSet rs1 = stmt
								.executeQuery("select count(orderid) from orderlist");

						while (rs1.next()) {
							int tot = rs1.getInt(1);
							System.out.println("totItem : " + tot);
				%>
				<div class="row mt-3"
					style="display: flex; justify-content: space-around;">
					<div class="col-12 mb-3 col-md-6 col-lg-6 col-xl-3 ">
						<div class=" card status-card">
							<div class=" card-body text-center">
								<div class="row  align-items-center">
									<div class="col-3">
										<i class=" feather-shopping-bag text-primary"
											style="font-size: 3em;"></i>
									</div>
									<div class="col-9 ">
										<p class="mb-0 h3 counter"><%=tot%></p>
										<p class="mb-0">Total Orders</p>
									</div>
								</div>
							</div>
						</div>
					</div>
					<%
						}
						} catch (Exception e) {
						}
					%>

					<%
						try {
							Statement stmt = conn1.createStatement();
							ResultSet rs1 = stmt
									.executeQuery(" select count(email) from user;");

							while (rs1.next()) {
								int user = rs1.getInt(1);
								System.out.println("user : " + user);
					%>
					<div class="col-12 mb-3 col-md-6 col-lg-6 col-xl-3 ">
						<div class=" card status-card">
							<div class=" card-body text-center">
								<div class="row  align-items-center">
									<div class="col-3">
										<i class="feather-users text-primary" style="font-size: 3em;"></i>
									</div>
									<div class="col-9 ">
										<p class="mb-0 h3 counter"><%=user%></p>
										<p class="mb-0">Total Customers</p>
									</div>
								</div>
							</div>
						</div>
					</div>
					<%
						}
						} catch (Exception e) {
						}
					%>

					<%
						try {
							Statement stmt = conn1.createStatement();
							ResultSet rs1 = stmt
									.executeQuery("select count(bookid) from booklist");

							while (rs1.next()) {
								int tot = rs1.getInt(1);
								System.out.println("totItem : " + tot);
					%>
					<div class="col-12 mb-3 col-md-6 col-lg-6 col-xl-3 ">
						<div class=" card status-card">
							<div class=" card-body text-center">
								<div class="row  align-items-center">
									<div class="col-3">
										<i class="feather-package text-primary"
											style="font-size: 3em;"></i>
									</div>
									<div class="col-9 ">
										<p class="mb-0 h3 counter"><%=tot%></p>
										<p class="mb-0">Total Books</p>
									</div>
								</div>
							</div>
						</div>
					</div>

					<%
						}
						} catch (Exception e) {
						}
					%>
				</div>

				<!--  To Insert  -->
				<font color="blue"><h1>Order List</h1>
				<form name="myForm" method="post">
					<table class="table table-striped">
					<tr>
							<th >User Name</th><th>Address</th>
							<th >Phone Number</th><th>BookName</th>
							<th >Quantity</th><th>Total Cost</th>
							<th >Date</th><th>Order Status</th>
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
				</font>
				

				
			</div>



		</div>
	</div>


</body>
<script
	src="/OnlineBook/additem(Admin)/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"
	referrerpolicy="no-referrer"></script>
<script
	src="/OnlineBook/additem(Admin)/vendor/waypoint/lib/jquery.waypoints.min.js"></script>
<script
	src="/OnlineBook/additem(Admin)/vendor/Counter-Up-master/jquery.counterup.js"></script>
<script src="/OnlineBook/additem(Admin)/vendor/chart_js/Chart.min.js"></script>
<script src="/OnlineBook/additem(Admin)/js/app.js"></script>
<script src="/OnlineBook/additem(Admin)/js/autoscroll.js"></script>
</html>