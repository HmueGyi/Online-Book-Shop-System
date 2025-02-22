package controller;
import java.io.*;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Enumeration;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dbConnect.DBConnection;

public class DeleteServlet extends HttpServlet {


	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		System.out.print("bbbbb");
String id=req.getParameter("bookid");
		
		System.out.println("ID"+id);
				try {
			Connection conn = DBConnection.getConn();
			String category = null;
			PreparedStatement ps = conn.prepareStatement("select category from booklist where bookid like ?");
			ps.setString(1, id);
			ResultSet rs = ps.executeQuery();

			if (rs.next()) {
				category = rs.getString(1);
			}
			System.out.println("Category=" + category);
			String sql = "delete from booklist where bookid like ?";
			ps = conn.prepareStatement(sql);
			System.out.println("Delete=" + req.getParameter(id));
			
			ps.setString(1, id);
			ps.executeUpdate();
					
					
									
			req.getRequestDispatcher("DeleteBook2.jsp?category="+category).forward(req, resp);

				}catch (Exception e) {
					e.printStackTrace();
				}
	}
}

	
			
