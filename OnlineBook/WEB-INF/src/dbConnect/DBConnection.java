package dbConnect;

import java.sql.*;
public class DBConnection {
	public static Connection getConn() {
		 
		  Connection con = null;
		  String loadDriver = "com.mysql.jdbc.Driver"; // driver name for mysql
		  String dbURL = "jdbc:mysql://localhost/bookshopdb"; // url of the database
		  String dbUSERNAME = "root"; // username to coonect db
		  String dbPASSWORD = "root"; // password to connect db
		  try {
		   Class.forName(loadDriver); // load the driver
		   con = DriverManager.getConnection(dbURL, dbUSERNAME, dbPASSWORD);// get the connection
		  } catch (ClassNotFoundException e) {
		   
		   e.printStackTrace();
		  } catch (SQLException e) {
		   
		   e.printStackTrace();
		  }
		  return con; // return the connection obj.
		 }
}

