<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>About</title>
    <!-- <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.1.3/css/bootstrap.min.css" integrity="sha512-GQGU0fMMi238uA+a/bdWJfpUGKUkBdgfFdgBm72SUQ6BeyWjoY/ton0tEjH+OSH9iP4Dfh+7HM0I9f5eR0L/4w==" crossorigin="anonymous" referrerpolicy="no-referrer" /> -->
    <link rel="stylesheet" href="vendor/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="Login/fontawesome-free-6.1.2-web/css/all.min.css">
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
        <section class=" container-fluid   align-items-center d-flex mt-4" id="about" >
        <div class="container">
            <div class="row">
                <div class="col-12 col-md-6">
                   <div class="w-100 wow animate__animated animate__slideInLeft">
                        <img src="images/content-2.svg" alt="" class="w-100">
                   </div>
                        
                </div>
                <div class="col-12 col-md-6 d-flex align-items-center second-pg ">
                    <div class="w-100 wow animate__animated animate__slideInRight">
                        <h4 class=" text-secondary">Biography</h4>
                        <h1 class="">Who We Are </h1>
                        <p class="text-black-50">
                            We are attending University of Computer Studies (Monywa).Our major is Computer Science and we are Second Year students.We created this project for people who interested in currency exchange rate.
                            Our goal is to save time for people by creating new software technology.

                        </p><br>
                        <p class="text-black-100">Launched at : 1/9/2022</p><br><br>
                        <p class="text-black-100">Member List</p>
                        <ul>
                            <li class="text-black-50">Hein Htet Aung (Leader)</li>
                            <li  class="text-black-50">Aung Kyaw Thein</li>
                            <li  class="text-black-50">Thet Aung Zin</li>
                            <li class="text-black-50">Hmue Set San</li>
                            <li class="text-black-50">Phyo Thiri Kyaw</li>
                            <li class="text-black-50">Ingyin San</li>
                        </ul>
                       
                    </div>
                    
                </div>
            </div>
        </div>
    </section>
    </body>
    <script>
    <script src="vendor/jquery/dist/jquery.min.js" referrerpolicy="no-referrer"></script>
    <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
    <script src="vendor/wow/wow.min.js"></script>
    <script src="vendor/waypoint/lib/jquery.waypoints.min.js"></script>
    <script src="js/js.js"></script>
    </script>
    </html>
    