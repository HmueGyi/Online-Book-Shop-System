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
                                <a class="nav-link text-uppercase text-white" href="EditBookPrice.jsp">EditPrice</a>
                            </li>
                             <li class="nav-item">
                                <a class="nav-link text-uppercase text-white" href="EditBookQuantity.jsp">EditQty</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link text-uppercase text-white" href="DeleteBook.jsp">DeleteBook</a>
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
    	
<%if (request.getParameter("View")==null)
{
%>
<jsp:include page="UpdateBooks.jsp" />
<%
}else{
%>

	<script type="text/javascript">
		function confirmEditPrice(id,category) {

			var del = confirm("Are you sure you want to edit price?")

			if (del) {
				
				window.document.myForm.action = "EditPriceServlet?bookid=" + id;
				window.document.myForm.submit();
			}
			else{
				alert("Edit cancelled!")
				window.document.myForm.action = "EditBookPrice2.jsp?category=" + category;
				window.document.myForm.submit();
			}

		}
		
	</script>

<center><font color="blue"><h1>Book List</h1>
				<form name="myForm" method="post">
		<table class="table table-striped">
			<tr>
				<th>Book_id</th>
				<th><center>Book Name</center></th>
				<th>Author</th>
				<th>Category</th>
				<th>Price</th>
				

			</tr>
			<%
				try {
					Connection conn = DBConnection.getConn();
					String sql = "select * from booklist where category like ?";

					PreparedStatement ps = conn.prepareStatement(sql);
					ps.setString(1, request.getParameter("category"));
					ResultSet rs = ps.executeQuery();
					while (rs.next()) {
						String id = rs.getString(1);
						String name = rs.getString(2);
						String author = rs.getString(3);
						String category = rs.getString(4);
						String price = rs.getString(5);
						String quantity = rs.getString(6);
			%>
			<tr>
				<td><%=id%></td>
				<td><%=name%></td>
				<td><%=author%></td>
				<td><%=category%></td>
				<td><input type="text" name=<%=id%> value=<%=price%>> <br>
					<input type="button" name="EditPrice" value="Edit Price"
					onclick="confirmEditPrice('<%=id%>','<%=category%>')">
				</td>
			</tr>

			<%
				}
				} catch (Exception e) {
				}
			%>
		</table>
	</form>
	<%} %>
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