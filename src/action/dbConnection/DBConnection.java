package action.dbConnection;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBConnection {
    private static DBConnection dbconnection;
    private Connection connection;
    private DBConnection() throws ClassNotFoundException, SQLException {
        Class.forName("com.mysql.cj.jdbc.Driver");
        connection= DriverManager.getConnection("jdbc:mysql://localhost:3306/struts2LoginSystem","root","1234");
    }
    public static DBConnection getInstance() throws SQLException, ClassNotFoundException {
        if(dbconnection==null){
            dbconnection=new DBConnection();
        }
        return dbconnection;
    }
    public Connection getConnection(){

        return connection;
    }
}
