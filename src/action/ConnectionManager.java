package action;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

/**
 * Created by Orlando on 12/07/2017.
 */
public class ConnectionManager {
    private static String url = "jdbc:mysql://localhost:3306/mydb";
    private static String driverName = "com.mysql.jdbc.Driver";
    private static String username = "root";
    private static String password = "ghiaccio";
    private static Connection con;
    private static String urlstring;

    public static Connection getConnection() {
        try {
            Class.forName(driverName);
            try {
                con = DriverManager.getConnection(url, username, password);
            } catch (SQLException ex) {
                System.out.println("Connessione fallita al Database");
            }
        } catch (ClassNotFoundException ex) {
            System.out.println("Driver non treovati");
        }
        return con;
    }
}

