<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Contact</title>
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
       <section class="container-fluid h-100 mt-4" id="contact">
           <div class="col-12 d-flex justify-content-center text-center py-4" >
                <div>
                    <h4 class="text-secondary">Contact Form</h4>
                    <h1 class="text-uppercase">Get In Touch</h1>
                </div>
           </div>
            <div class="container">
                <div class="row ">
                    <div class="col-12 col-md-6 mb-3 wow animate__animated animate__slideInLeft">
                        <form action="sendMessage.jsp" class="">
                            <div class=" form-group">
                                <input type="text" class=" form-control border-3 mb-3" placeholder="Name" name="name">
                            </div>
                            <div class=" form-group">
                                <input type="text" class=" form-control border-3 mb-3" placeholder="Email Address" name="email">
                            </div>
                            <div class=" form-group">
                                <input type="text" class=" form-control border-3 mb-3" placeholder="Phone Num." name="phno">
                            </div>
                            <div class=" form-group">
                                <textarea  id="" cols="30" rows="7" placeholder="Message" class="px-3 border-3 form-control mb-3 rounded-2 py-2 w-100" name="message"></textarea>
                            </div>
                            <div class="form-group d-flex justify-content-end">
                            <input type="submit" class="btn btn-primary" value="Send Message">
                            </div>
                        </form>
                    </div>
                    <div class="col-12 col-md-6 ">
                        <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3694.273862860985!2d95.06778851115111!3d22.191696282023354!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x30caa1fbc2ab0999%3A0x3220b9ecb8170e9b!2sComputer%20University%20Post%20Office%2C%20Post%20Code%20023102!5e0!3m2!1sen!2smm!4v1660667601362!5m2!1sen!2smm" width="600" height="450" style="border:0;" allowfullscreen="" loading="lazy" referrerpolicy="no-referrer-when-downgrade"></iframe>
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
    
    </html>
    