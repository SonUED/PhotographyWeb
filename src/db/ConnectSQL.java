
package db;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

public class ConnectSQL {
	private static String DB_URL = "jdbc:sqlserver://localhost:1433;"
            + "databaseName=Service_System;";
    private static String USER_NAME = "sa";
    private static String PASSWORD = "123456789";
	public static Connection getConnection() {
		Connection conn = null;
        try {
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            conn = DriverManager.getConnection(DB_URL, USER_NAME, PASSWORD);
        } catch (Exception ex) {
            System.out.println("connect failure!");
            ex.printStackTrace();
        }
        return conn;
    }

}

