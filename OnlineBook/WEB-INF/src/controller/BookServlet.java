package controller;
import java.io.*;
import java.sql.*;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import dbConnect.DBConnection;

@MultipartConfig(maxFileSize = 16177215)
public class BookServlet extends HttpServlet {
	
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.setContentType("image/jpeg");
		String id=request.getParameter("id");
		
		try{Connection con=DBConnection.getConn();
		PreparedStatement ps=con.prepareStatement("select photo from booklist where bookid=?");
		ps.setString(1,id);
		ResultSet rs=ps.executeQuery();
		if(rs.next()){
			byte[] imageData=rs.getBytes("photo");
			OutputStream os=response.getOutputStream();
			os.write(imageData);
			os.flush();
			os.close();
		}
		}catch (Exception e){}
	}

	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		String bookid = request.getParameter("id");
		String bookname = request.getParameter("name");
		String author = request.getParameter("author");
		String category = request.getParameter("cate");
		String price = request.getParameter("price");
		String qty = request.getParameter("qty");
		String desc = request.getParameter("desc");
		
		InputStream inputStream = null;// input stream of uploaded file
		Part part = request.getPart("photo");
		System.out.println("Part"+part);
		if (part != null) {
			System.out.println(part.getName());
			System.out.println(part.getSize());
			System.out.println(part.getContentType());
			inputStream = part.getInputStream();
			System.out.println(inputStream);
		}
		// Now Create a connection and send it to DB...
		Connection conn = DBConnection.getConn();
		String sql = "INSERT INTO booklist  VALUES (?,?,?,?,?,?,?)";
		try {
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, bookid);
			ps.setNString(2, bookname);
			ps.setString(3, author);
			ps.setString(4, category);
			ps.setString(5, price);
			ps.setString(6, qty);
			
			ps.setBlob(7, inputStream);
			
			int i = ps.executeUpdate();
			if (i > 0) {
				request.setAttribute("success", "Book Added Successfully");
				request.getRequestDispatcher("addItems.jsp").forward(request,
						response);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}

}
