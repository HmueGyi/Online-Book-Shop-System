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
    <title>Book List</title>
    
    
    
     <link rel="stylesheet" href="vendor/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css"
    referrerpolicy="no-referrer">
    <link rel="stylesheet" href="vendor/feather-icons-web/feather.css">
    
    <link rel="stylesheet" href="css/style.css">
    <style>
        /* .dataTables_wrapper .dataTables_paginate .paginate_button:hover {
            background: ;
            color: black!important;
            border-radius: 4px;
            border: 1px solid #828282;
        }
 
        .dataTables_wrapper .dataTables_paginate .paginate_button:active {
            background: none;
            color: black!important;
        } */
        .page-item.active .page-link {
            background-color: purple !important;
            border-color: purple;
            
        }
        .page-link{
            color: purple;
        }
        .maximize{
            position: fixed;
            left: 0;
            top: 0;
            width: 100%;
            z-index: 20005;
            height: 100vh;
            overflow: scroll;
        }
        .card{
            transition: 1s;
        }
    </style>
    
</head>
<body>
    <div class=" container-fluid">
        <div class="row">
            <div class="col-12 col-xl-2 col-lg-3 vh-100 sideBar pt-2">
                <div class="row">
                    <div class="col-12 logodiv">
                        <div class="d-flex p-2 justify-content-between align-items-center">
                            <div class="logo bg-primary text-light rounded pt-1 px-1">
                                <i class=" feather-shopping-bag " style="font-size: 32px;"></i>
                                
                            </div>
                            <span class=" text-uppercase  text-primary me-lg-4 me-md-2 ms-2" style="    font-weight: 600;">Book Store</span>

                            <div class="closebtn btn p-0 d-lg-none d-block ">
                                <i class=" feather-x text-dark" style="font-size: 2em;"></i>
                            </div>
                        </div>
                    </div>

                    <!-- Side Menu -->
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
                        <div class="row">
                            <!-- <div class="row"> -->
                                 <div class="col-12 pt-2">
                            <nav aria-label="breadcrumb">
                                <ol class="breadcrumb">
                                <li class="breadcrumb-item"><a href="dashboard.jsp">Home</a></li>
                                
                                <li class="breadcrumb-item active" aria-current="page">Delete Book</li>
                                </ol>
                            </nav>
                        </div>
                            <!-- </div> -->
                
                         </div>
                         	
   
    	<!-- Insert Here -->
    	

<script type="text/javascript">
		function confirmDelete(id,category) {

			var del = confirm("Are you sure you want to delete this book?")

			if (del) {
				
				window.document.myForm.action = "DeleteServlet?bookid=" + id;
				window.document.myForm.submit();
			}
			else{
				alert("Delete cancelled!")
				window.document.myForm.action = "DeleteBook2.jsp?category=" + category;
				window.document.myForm.submit();
			}

		}
		
		
	</script>
<form name="myForm" method="post">
<center><font color="blue"><h1>Book List</h1>	<table class="table table-striped">
<tr>
			<th>Book_id</th>
			<th>Book Name</th>
			<th>Author</th>
			<th>Category</th>
			<th></th>
		</tr>
		
		<% try {
		Connection conn = DBConnection.getConn();
		String sql = "select * from booklist where category like ?";
		
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1,request.getParameter("category"));
			ResultSet rs=ps.executeQuery();
			while (rs.next()){
				String id=rs.getString(1);
				String name=rs.getString(2);
				String author=rs.getString(3);
				String category=rs.getString(4);
				
				%>
				<tr>
			<td><%=id %></td>
			<td><%=name %></td>
			<td><%=author %></td>
			<td><%=category %></td>
			<td><input type="submit" name="delete" value="Delete"
					onclick="confirmDelete('<%=id%>','<%=category%>')"></td>
					</tr>
					<%
			}
			
			}catch(Exception e){e.printStackTrace();}
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
                    </div>
                </div>
            </div>
        </div>
        
       
    </div>
    <script src=""></script>
    <script src="https://cdn.datatables.net/1.10.25/js/jquery.dataTables.min.js"></script>
    <script src="https://cdn.datatables.net/1.10.25/js/dataTables.bootstrap5.min.js"></script>
    <script src="/OnlineBook/additem(Admin)/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
    <script src="/OnlineBook/additem(Admin)/js/autoscroll.js"></script>

    
    <script>
        $(document).ready(function () {
            $("#example").DataTable({
                
            });
        })
        $(".stretch").click(function() {
            $('.card').toggleClass('maximize');
            $('.mini').toggleClass('feather-minimize-2 feather-maximize-2');

        })
        function link(url){
            setTimeout(() => {
                location.href=(`${url}`);
            }, 500);
        }
    </script>
    <!-- <script type="module">
       import {link} from './app.js';
        
    </script> -->
</body>
</html>