<%@page import="java.sql.*"%>
<%@page import="java.io.*"%>
<%@page import="dbConnect.*" %>
<%@page import="java.util.*"%>
<!DOCTYPE html>
<%System.out.println(session.getAttribute("Email")); %>
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
                                <a class="nav-link text-uppercase text-white" href="bookStoreloginned.jsp">Home</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link text-uppercase text-white" href="contactlogin.jsp">Contact</a>
                            </li>
                             
                            <li class="nav-item">
                                <a class="nav-link text-uppercase createline text-white" href="aboutloginned.jsp">About</a>
                            </li>
                            <li><jsp:include page="loginlogout.jsp"></jsp:include></li>
							
                        </ul>
                    </div>
                    <a href="vouncharApp.jsp">
                    <i class="feather-shopping-cart mx-lg-5 text-white d-none d-lg-block" ></i>
                    </a>
                    <ul><li class="nav-item">
                           		<a class="nav-link text-uppercase text-white"><img src="img/user/user2.png" alt="" class="user-profile-img">    <%=session.getAttribute("username")%></a>
                            </li></ul>
                    <!-- <button class="btn-sm text-black " style="padding-top: 7px;">
                        <i class="feather-search"></i>
                    </button> --> 
                    <!-- <form action="" class="form-inline d-none d-lg-block d-flex align-items-center ">
                        <input type="text" class="form-control-sm rounded" style="padding-top: 7px;">
                        <button class="btn-sm text-black " style="padding-top: 7px;">
                            <i class="feather-search"></i>
                        </button>
                    </form> -->
                    
                    	                    
                </nav>
               
            </div>
        </div>
    </header>
   <center><font color="blue"><h2><%=(request.getAttribute("success") == null) ? "" : request.getAttribute("success")%></h2></font></center>
    	<%--Books Category--%>
    	<%Connection conn = DBConnection.getConn(); 
try {
	Statement stmt=conn.createStatement();
	ResultSet rs1=stmt.executeQuery("select distinct category from booklist");
	String category=null;
	if (rs1.next()){
		category=rs1.getString(1);
		System.out.println("Category : "+category);
	
%>
                    <% 
		
		
		String sql="select * from booklist where category like ? and quantity>0";
		
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, category);
			
			ResultSet rs=ps.executeQuery();
%>

<div class="popular container mt-3 mb-3 mt-lg-4">
        <div class="row">
            <div class="col-12">
                <div class="popularTitle d-flex justify-content-between align-items-center">
                
                    <h2><%=category %></h2>
                    <a href="bookseemorelogin.jsp" style="text-decoration:none" class=" text-warning mb-0"><font size="6">See all</font></a>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-12 mt-3 popularBooks">
                   
			<table style="width:100%">
			<tr style="display:flex; justify-content:space-between; width:90%; flex-wrap:wrap;height: 800px;
    ">
				<% while (rs.next()){ 
				String id=rs.getString(1);
				String name=rs.getString(2);
				String author=rs.getString(3);
				String cate=rs.getString(4);
				String price=rs.getString(5);
				String quantity=rs.getString(6);
			
				%>
					
        	
            <form action="addtocart" method="get">
            	<td style="width: 165px; overflow: hidden; margin-left: 10px;" class="mt-5">
           
            	<div class="">
                           <img src=bookServlet?id=<%=id%>
							width="120px" height="120px" class="mb-2"/>
                        </div>
                         <div class="content w-100">
                            <div class="title">
                               <h5 style="    height: 50px;
    overflow: hidden;"> <%=name%></h5>
                            </div>
                            <div class="author">
                               Author: <%=author%>
                            </div>
                            <div class="price ">
                                Price:<%=price%>
                            </div>
                            <div class="order">
                           		<input type="submit" class="btn btn-outline-primary btn-sm cart" name="<%=id%>" value="Add to Cart" id="addto" onclick="ChangeColor()")>
                            </div>
                        
                            </div>
                            
            </td>
            </form>
        
   
				<%
}
%> 	

		</tr>
			
		</table>
	<%}
					}
						catch(Exception e){} %>	
		</div>
		</div>
		</div>
		

						
						<%-- Another Category --%>
						
						

		

                        
            

    <script src="vendor/jquery/dist/jquery.min.js"></script>
    <script
	src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
    <!-- <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/4.6.1/js/bootstrap.min.js" integrity="sha512-UR25UO94eTnCVwjbXozyeVd6ZqpaAE9naiEUBK/A+QDbfSTQFhPGj5lOR6d8tsgbBk84Ggb5A3EkjsOgPRPcKA==" crossorigin="anonymous" referrerpolicy="no-referrer"></script> -->
    <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/feather-icons/4.28.0/feather.min.js"></script>
    <script src="js/app.js"></script>
    <script src="js/autoscroll.js"></script>
    <script>
        	function ChangeColor(){
        		document.getElementById('btn').style.backgroundColor="blue";
        		document.getElementById('btn').style.color="black";
        	}
    </script>
</body>
</html>