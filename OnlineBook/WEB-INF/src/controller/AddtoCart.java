package controller;
import java.io.*;

import javax.servlet.*;
import javax.servlet.http.*;

import dbConnect.DBConnection;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.*;

import controller.*;
public class AddtoCart	extends HttpServlet {
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
			Book book=new Book();
		
			Enumeration<String> btnName=request.getParameterNames();
			String bookid=btnName.nextElement();
			System.out.print("work"+bookid);
			
			try{Connection con=DBConnection.getConn();
			PreparedStatement ps=con.prepareStatement("select bookname,price,quantity from booklist where bookid like ?");
			ps.setString(1,bookid);
			ResultSet rs=ps.executeQuery();
			book.setId(bookid);
			if(rs.next()){
				book.setBookname(rs.getString(1));
				book.setPrice(rs.getInt(2));
				book.setQty(rs.getInt(3));
				System.out.println("AddToCardRS:Name"+book.getBookname());
				System.out.println("AddToCardRS:Price"+book.getPrice());
				System.out.println("AddToCardRS:Quantity"+book.getQty());
			}

			}catch (Exception e){}
			
			HttpSession session = request.getSession();
			ArrayList<Book> previousBooks = (ArrayList<Book>)session.getAttribute("previousBooks");
			if (previousBooks == null) {
				
				previousBooks = new ArrayList<Book>();
			session.setAttribute("previousBooks", previousBooks);
			System.out.println("Size="+previousBooks.size());
			}
			
			previousBooks.add(book);
				System.out.println("Size in else="+previousBooks.size());
				for(int i=0; i<previousBooks.size(); i++){
					System.out.println("Book Name:"+previousBooks.get(i).getBookname());
				}
			
			
			
			response.setContentType("text/html");
			
			response.sendRedirect("bookseemorelogin.jsp");
			System.out.print("add to cart");
	}		
	
}
