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
  <% 
  System.out.println("Session Info:"+session.getAttribute("Email"));
  if(session.getAttribute("Email")==null){
  %>
  
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
              <input type="password" placeholder="Comfrim Password" name="cpw"/>
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
               Welcome to our Online BookShop System
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
    <%}
  else{
	  response.sendRedirect("vouncherApp.jsp");
  }
  
  %>
  </body>
</html>