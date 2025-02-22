package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dbConnect.DBConnection;

public class EditPriceServlet extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		String id=req.getParameter("bookid");
		
		System.out.println("ID"+id);
		System.out.println("Btn Value"+req.getParameter("EditQty"));
				try {
			Connection conn = DBConnection.getConn();
				
				
					
					String sql = "update booklist set price=? where bookid like ?";
					PreparedStatement ps = conn.prepareStatement(sql);
					System.out.println("Price=" + req.getParameter(id));
					ps.setString(1, req.getParameter(id));
					ps.setString(2, id);
					ps.executeUpdate();

					String category = null;
					ps = conn
							.prepareStatement("select category from booklist where bookid like ?");
					ps.setString(1, id);
					ResultSet rs = ps.executeQuery();

					if (rs.next()) {
						category = rs.getString(1);
					}
					System.out.println("Category=" + category);
					
					req.getRequestDispatcher("EditBookPrice2.jsp?category="+category).forward(req, resp);

				
				} catch (Exception e) {
					e.printStackTrace();
				}

			
	}

}
