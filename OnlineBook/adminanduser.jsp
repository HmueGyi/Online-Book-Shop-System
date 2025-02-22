<%@page import=" java.sql.* "%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <script

     
      crossorigin="anonymous"
    ></script>
    <link rel="stylesheet" href= "/OnlineBook/Login/fontawesome-free-6.1.2-web/css/all.min.css">
    <link rel="stylesheet" href="/OnlineBook/Login/style.css" />
    
    <title>Sign in & Sign up Form</title>
  </head>
  <body>
    <div class="container">
      <div class="forms-container">
        <div class="signin-signup">
          <form action="adminanduser.jsp" class="sign-in-form">
            <h2 class="title">Sign in</h2>
            <div class="input-field">
              <i class="fas fa-user"></i>
              
              
              <input type="text" placeholder="Email Address" name="Email" />
            </div>
            <div class="input-field">
              <i class="fas fa-lock"></i>
              <input type="password" placeholder="Password" name="pass"/>
            </div>
            <input type="submit" value="Login" class="btn solid" name="log"/>
            <p class="social-text">Or Sign in with social platforms</p>
            <div class="social-media">
              <a href="#" class="social-icon">
                <i class="fab fa-facebook-f"></i>
              </a>
              <a href="#" class="social-icon">
                <i class="fab fa-twitter"></i>
              </a>
              <a href="#" class="social-icon">
                <i class="fab fa-google"></i>
              </a>
              <a href="#" class="social-icon">
                <i class="fab fa-linkedin-in"></i>
              </a>
            </div>
          </form>
          <form action="adminanduser.jsp" class="sign-up-form">
            <h2 class="title">Sign up</h2>
            <div class="input-field">
              <i class="fas fa-user"></i>
              <input type="text" placeholder="Username" name="n"/>
            </div>
            <div class="input-field">
              <i class="fas fa-envelope"></i>
              <input type="email" placeholder="Email" name="e"/>
            </div>
            <div class="input-field">
              <i class="fas fa-lock"></i>
              <input type="password" placeholder="Password" name="pw"/>
            </div>
             <div class="input-field">
              <i class="fas fa-lock"></i>
              <input type="password" placeholder="Confirm Password" name="cpw"/>
            </div>
        	<div class="input-field">
              <i class="fas fa-home"></i>
              <input type="text" placeholder="Address" name="add"/>
            </div>
            <div class="input-field">
              <i class="fas fa-phone"></i>
              <input type="text" placeholder="PhoneNumber" name="phone"/>
            </div>
           
            <input type="submit" class="btn" value="Sign up" name="su" />
            <p class="social-text">Or Sign up with social platforms</p>
            <div class="social-media">
              <a href="#" class="social-icon">
                <i class="fab fa-facebook-f"></i>
              </a>
              <a href="#" class="social-icon">
                <i class="fab fa-twitter"></i>
              </a>
              <a href="#" class="social-icon">
                <i class="fab fa-google"></i>
              </a>
              <a href="#" class="social-icon">
                <i class="fab fa-linkedin-in"></i>
              </a>
            </div>
          </form>
        </div>
      </div>

      <div class="panels-container">
        <div class="panel left-panel">
          <div class="content">
            <h3>New here ?</h3>
            <p>
              Welcome to our Online BookShop System.
            </p><br>
            <button class="btn transparent" id="sign-up-btn" >
              Create an account
            </button>
          </div>
          <img src="img/log.svg" class="image" alt="" />
        </div>
        <div class="panel right-panel">
          <div class="content">
            <h3>One of us ?</h3>
            <p>
              Welcome to our Online BookShop System
            </p><br>
            <button class="btn transparent" id="sign-in-btn">
             already have account
            </button>
          </div>
          <img src="img/register.svg" class="image" alt="" />
        </div>
      </div>
    </div>

    <script src="/OnlineBook/Login/app.js"></script>
    <%  
            Class.forName("com.mysql.jdbc.Driver");
     		Connection con=DriverManager.getConnection("jdbc:mysql://localhost/bookshopdb","root","root");
     		
     		 
		 if(request.getParameter("su")!=null){
		 	String name=request.getParameter("n");
		 	String email=request.getParameter("e");
		 	String pw=request.getParameter("pw");
		 	String cpsw=request.getParameter("cpw");
		 	String add=request.getParameter("add");
		 	String ph=request.getParameter("phone");
		 	if(name.equals("") || email.equals("") || pw.equals("") || cpsw.equals("") || add.equals("") || ph.equals("")){	%>
			<script>
				alert("Please fill required field");
			</script>
			<% }
		 	else{
		 		
		 	if(pw.equals(cpsw) ){
					
		 	PreparedStatement ps=con.prepareStatement("insert into user values(?,?,?,?,?);");
		 	ps.setString(1,name);
		 	ps.setString(2,email);
		 	ps.setString(3,pw);
		 	ps.setString(4,add);
		 	ps.setString(5,ph);
		 	ps.executeUpdate();
		 	
		 	}
		 	
		 	else{ %>
		 	<script>
				alert("Password and Confirm Password doesn't match");
			</script><% 
		 	}
		 	}
		 }
	 
         if(request.getParameter("log")!=null){
					System.out.println("Database is");
						String e=request.getParameter("Email");
						String psw=request.getParameter("pass");
						
						 		
						Statement st=con.createStatement();
						ResultSet rs=st.executeQuery("select * from User where Email='"+e+"' and Password='"+psw+"'");
						if(rs.next()){
							session.setAttribute("Email", e);
							session.setAttribute("username",rs.getString(1));
							session.setAttribute("address",rs.getString(4));
							System.out.println("Login Name:"+rs.getString(1));
							response.sendRedirect("bookStoreloginned.jsp");
						}
						else if(e.equals("admin@gmail.com") && psw.equals("admin")){
							 response.sendRedirect("dashboard.jsp");
						 }
						else if(e.equals("") || psw.equals("")){	%>
						<script>
							alert("Please fill email or password");
						</script>
						<% }
						else	{	%>
						<script>
							alert("Wrong Email or Password!");
						</script>
						<%
					}
						} %>
    </body>
	</html>
