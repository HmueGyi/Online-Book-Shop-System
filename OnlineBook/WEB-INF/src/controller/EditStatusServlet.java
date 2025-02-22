package controller;

import java.sql.*;
import dbConnect.*;

import java.io.IOException;
import java.util.Enumeration;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class EditStatusServlet extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		System.out.println("aaa");
		try {
			Connection conn = DBConnection.getConn();
			Enumeration<String> btnName = req.getParameterNames();
			String bookid = null;
			while ((bookid = btnName.nextElement()) != null) {
				System.out.println("Book ID" + bookid);
  String btnValue = req.getParameter(bookid);
				System.out.println("Btn=" + btnValue);
				if (btnValue.equals("Edit Price")) {
					String sql = "update booklist set price=? where bookid like ?";
					PreparedStatement ps = conn.prepareStatement(sql);
					System.out.println("Price=" + req.getParameter("price"));
					ps.setString(1, req.getParameter("price"));
					ps.setString(2, bookid);
					ps.executeUpdate();

					String category = null;
					ps = conn
							.prepareStatement("select category from booklist where bookid like ?");
					ps.setString(1, bookid);
					ResultSet rs = ps.executeQuery();

					if (rs.next()) {
						category = rs.getString(1);
					}
					System.out.println("Category=" + category);
					req.setAttribute("category", category);
					req.getRequestDispatcher("viewBooktoEdit2.jsp").forward(
							req, resp);

				}
				if (btnValue.equals("Edit Quantity")) {
					String sql = "update booklist set quantity=? where bookid like ?";
					PreparedStatement ps = conn.prepareStatement(sql);
					System.out.println("Quantity=" + req.getParameter("qty"));
					ps.setString(1, req.getParameter("qty"));
					ps.setString(2, bookid);
					ps.executeUpdate();

					String category = null;
					ps = conn
							.prepareStatement("select category from booklist where bookid like ?");
					ps.setString(1, bookid);
					ResultSet rs = ps.executeQuery();

					if (rs.next()) {
						category = rs.getString(1);
					}
					System.out.println("Category=" + category);
					req.setAttribute("category", category);
					req.getRequestDispatcher("viewBooktoEdit2.jsp").forward(
							req, resp);

				}

			}

			
		} catch (Exception e) {
			e.printStackTrace();
		}

	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		System.out.println("Update");
		String id=req.getParameter("orderid");
		System.out.println("OrderID"+id);
		try {
			Connection conn = DBConnection.getConn();
			String sql = "update orderlist set status=1 where orderid like ?";

			String orderid=req.getParameter("orderid");
			
			System.out.println("ID"+orderid);

			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, orderid);

			ps.executeUpdate();
			
			resp.sendRedirect("viewallorder.jsp");

		} catch (Exception e) {
			e.printStackTrace();
		}

	}

}

