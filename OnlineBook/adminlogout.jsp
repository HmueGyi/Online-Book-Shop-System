<body>
<%
request.getSession(false);
	session.invalidate();

response.sendRedirect("admin.jsp");
	
%>

</body>