package com.util;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBConnection {

	public static Connection getConnection() {
		
		try {
			String driverName = "com.mysql.cj.jdbc.Driver";
            String dbUrl = "jdbc:mysql://localhost:3306/hmt_ecommerce";
            String userName = "root";
            String password = "root";
            
            Class.forName(driverName);
            //
            
            Connection c = DriverManager.getConnection(dbUrl,userName,password);
            return c;
            
//            if(c != null) {
//            	System.err.println("dbconnection succ");
//            	c.close();
//            }
		}catch (Exception e) {
			e.printStackTrace();
		}
		
		return null;
		
	}
	public static void main(String[] args) {
		System.out.println("---");
		getConnection();
	}
	
}
