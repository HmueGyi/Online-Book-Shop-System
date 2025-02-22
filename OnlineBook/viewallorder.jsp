<%@page import="java.sql.*"%>
<%@page import="java.io.*"%>
<%@page import="dbConnect.*" %>
<%@page import="java.util.*"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Home</title>
    <!-- <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.1.3/css/bootstrap.min.css" integrity="sha512-GQGU0fMMi238uA+a/bdWJfpUGKUkBdgfFdgBm72SUQ6BeyWjoY/ton0tEjH+OSH9iP4Dfh+7HM0I9f5eR0L/4w==" crossorigin="anonymous" referrerpolicy="no-referrer" /> -->
    <link rel="stylesheet" href="vendor/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css"
    referrerpolicy="no-referrer">
    <link rel="stylesheet" href="vendor/feather-icons-web/feather.css">
    <link rel="stylesheet" href="css/style.css">

</head>
<body>


				
    <header class="container-fluid navigation bg-primary ">
        <div class="container">
            <div class="row d-flex justify-content-lg-end">
                <nav class=" navbar navbar-expand-lg  navbar-light w-100">
                    <a class="navbar-brand logo" href="#">
                        <img src="images/logo1.jpeg" alt="" style="width: 50px; height: 50px; border-radius: 50%;">
                       
                    </a>
                    <div class="navbar-toggler border-0 ">
                        <!-- <i class="fas fa-2x  fa-bars"></i>
                        <i class="fas fa-bars fa-2x menu-icon"></i> -->
                        <div class="startBtn">
                            <div class="menu-barBtn"></div>
                        </div>
                    </div>
					<font class="nav-link text-uppercase text-white">Online Book Shop System</font>
                    <div class="collapse navbar-collapse justify-content-end contentBox " id="navbarSupportedContent">
                        <ul class="navbar-nav " style="width: 52%;
    /* display: flex; */
    justify-content: space-between !important;">
    						
                            <li class="nav-item">
                                <a class="nav-link text-uppercase text-white" href="adminHome.jsp">Home</a>
                            </li>

                            <li class="nav-item">
                                <a class="nav-link text-uppercase createline text-white" href="dashboard.jsp">Dashboard</a>
                            </li>


                           

                            <li class="nav-item">
                                <a class="nav-link text-uppercase text-white" href="Contact.jsp">Contact</a>
                            </li>
                             <li class="nav-item">
                               <jsp:include page="adminloginlogout.jsp"></jsp:include>
                            </li>

                        </ul>
                    </div>
                    
                   
                </nav>
               
            </div>
        </div>
    </header>
   
    	<!-- Insert Here -->
    	
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
<center><font color="blue"><h1>Book Order Lists</h1>
				<form name="myForm" method="post">
					<table class="table table-striped">
					<tr>
							<th scope="col">User Name</th><th>Address</th>
							<th scope="col">Phone Number</th><th>BookName</th>
							<th scope="col">Quantity</th><th>Total Cost</th>
							<th scope="col">Date</th><th>Order Status</th>
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
				</center>
<div class="popular container mt-3 mb-3 mt-lg-4">
        <div class="row">
            <div class="col-12">
                <div class="popularTitle d-flex justify-content-between align-items-center">
                
                   
                    
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-12 mt-3 popularBooks">
                   
			
			
				
		</div>
		</div>
		</div>
		
                    
            

    <script src="vendor/jquery/dist/jquery.min.js"></script>
    <!-- <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/4.6.1/js/bootstrap.min.js" integrity="sha512-UR25UO94eTnCVwjbXozyeVd6ZqpaAE9naiEUBK/A+QDbfSTQFhPGj5lOR6d8tsgbBk84Ggb5A3EkjsOgPRPcKA==" crossorigin="anonymous" referrerpolicy="no-referrer"></script> -->
    <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/feather-icons/4.28.0/feather.min.js"></script>
    <script src="js/app.js"></script>
    <script>
        feather.replace();
        
    </script>
</body>
</html>