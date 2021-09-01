package action.dbConnection;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class CrudUtil {
    private static PreparedStatement getPreparedStatement(String sql, Object... ob) throws SQLException, ClassNotFoundException {
        Connection connection= DBConnection.getInstance().getConnection();
        PreparedStatement pstm=connection.prepareStatement(sql);

        for (int i=0;i<ob.length;i++){
            pstm.setObject(i+1,ob[i]);
        }
        return pstm;

    }
    public static boolean executeUpdate(String sql,Object... ob) throws SQLException, ClassNotFoundException {
        PreparedStatement pstm=getPreparedStatement(sql,ob);
        return pstm.executeUpdate()>0;
    }
    public static ResultSet executeQuery(String sql, Object... ob) throws SQLException, ClassNotFoundException {
        PreparedStatement pstm=getPreparedStatement(sql,ob);
        return pstm.executeQuery();
    }


}
