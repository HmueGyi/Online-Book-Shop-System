
<body>
<%



if(session.getAttribute("Email")!=null){
	System.out.println("email"+ session.getAttribute("Email"));
	
%>
<a class="nav-link text-uppercase text-white" href="logout.jsp">Logout</a>

<%}else{ %>
<a class="nav-link text-uppercase text-white" href="login.jsp">Login</a>
<%}%>
</body>