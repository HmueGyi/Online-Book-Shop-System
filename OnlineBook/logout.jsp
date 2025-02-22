<body>
<%
request.getSession(false);
	session.invalidate();

response.sendRedirect("BookStore.jsp");
	
%>

</body>