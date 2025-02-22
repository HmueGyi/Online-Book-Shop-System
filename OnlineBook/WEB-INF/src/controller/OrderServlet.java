package controller;

import java.io.IOException;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.text.DateFormat;
import java.text.SimpleDateFormat;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import java.util.*;
import dbConnect.DBConnection;

public class OrderServlet extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		System.out.println("woi");
		String btnName = request.getParameter("Order");
		response.setContentType("text/html");
		HttpSession session = request.getSession();
		if (btnName != null) {
			Connection con = DBConnection.getConn();
			
			String email = (String) session.getAttribute("Email");
			System.out.println(email);
			ArrayList<Book> previousBooks = (ArrayList<Book>) session
					.getAttribute("previousBooks");
			System.out.println("Qty1: "
					+ request.getParameter(previousBooks.get(0).getId()));
			String bookname = null;
			String bookId = null;
			if (previousBooks != null) {
				System.out.println(previousBooks.size());

				ArrayList<String> bookNames = new ArrayList<String>();
				ArrayList<String> qty = new ArrayList<String>();
				ArrayList<String> bookIdList = new ArrayList<String>();
				int price = 0;
				int totalPrice = 0;
				for (int i = 0; i < previousBooks.size(); i++) {
					bookId = previousBooks.get(i).getId();
					bookIdList.add(bookId);
					bookname = previousBooks.get(i).getBookname();
					bookNames.add(bookname);
					System.out.println(bookname);
					try {
						PreparedStatement ps = con
								.prepareStatement("select price from booklist where bookname=?");
						ps.setString(1, bookname);
						ResultSet rs = ps.executeQuery();
						if (rs.next()) {
							price = rs.getInt(1);
						}
						qty.add(request.getParameter(bookId));
						System.out.println("Book Qty="
								+ request.getParameter(bookId));
						int quantity = Integer.parseInt(qty.get(i));
						System.out.println("Quantity= " + quantity);
						System.out.print(qty.get(i));
						totalPrice += (price * quantity);
						System.out.println("Total Price:" + totalPrice);

					} catch (Exception e) {
					}

				}
				System.out.println("Total Price:" + totalPrice);
				DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
				Date date = new Date();
				String today = dateFormat.format(date);
				System.out.println(today);
				String orderid = null;
				try {
					PreparedStatement ps = con
							.prepareStatement("insert into orderlist (email,total_price,date,status) values (?,?,?,?)");
					ps.setString(1, email);
					ps.setInt(2, totalPrice);
					ps.setString(3, today);
					ps.setInt(4, 0);

					ps.executeUpdate();
					System.out.println("orderlist successful");

					ps = con.prepareStatement("select orderid from orderlist order by orderid desc limit 1");

					ResultSet rs = ps.executeQuery();
					if (rs.next()) {
						orderid = rs.getString(1);

					}
					System.out.println("Last Order ID" + orderid);
					int i = 0;
					int bookQty = 0;
					int remainQty = 0;
					int j = 0;
					for (String book_id : bookIdList) {
						ps = con.prepareStatement("insert into orderedbooks values (?,?,?,?)");
						ps.setString(1, orderid);
						ps.setString(2, book_id);
						ps.setString(3, bookNames.get(i));
						ps.setString(4, qty.get(i));

						ps.executeUpdate();
						System.out.println("orderbooks successful");

						ps = con.prepareStatement("select quantity from booklist where bookid like ?");
						ps.setString(1, book_id);
						rs = ps.executeQuery();
						if (rs.next()) {
							bookQty = rs.getInt(1);

						}
						remainQty = bookQty - Integer.parseInt(qty.get(i));
						ps = con.prepareStatement("update booklist set quantity=? where bookid like ?");
						ps.setInt(1, remainQty);
						ps.setString(2, book_id);
						j = ps.executeUpdate();
						System.out.println("booklist update successful");
						i++;

					}
					System.out.println("JJJJJ" + j);
					if (j > 0) {
						request.setAttribute("success",
								"Your order successful!");
						request.getRequestDispatcher("bookStoreloginned.jsp").forward(
								request, response);
						session.removeAttribute("previousBooks");
					}

				} catch (Exception e) {
					e.printStackTrace();
				}

			}
		}else{
			response.sendRedirect("bookStoreloginned.jsp");
			session.removeAttribute("previousBooks");
		}
		}
	}
