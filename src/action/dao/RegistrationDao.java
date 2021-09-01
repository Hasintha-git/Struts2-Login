package action.dao;

import action.dbConnection.CrudUtil;
import action.model.Registration;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class RegistrationDao {
    public boolean Register(Registration registration) throws SQLException, ClassNotFoundException {
        System.out.println(registration.toString());
        String url="INSERT INTO Registration VALUES(?,?,?,?)";

            return CrudUtil.executeUpdate(url,registration.getEmail(),registration.getUserName(),registration.getAddress(),registration.getPassword());


    }

    public Registration signin(String email) throws SQLException, ClassNotFoundException {
        String sql="SELECT * FROM Registration WHERE email=?";
        ResultSet rst = CrudUtil.executeQuery(sql,email);
        if(rst.next()){
            return new Registration(rst.getString(1),rst.getString(2),rst.getString(3),rst.getString(4));
        }
        return null;
    }


    public ArrayList<Registration> loadData() throws SQLException, ClassNotFoundException {
        String sql="SELECT * FROM Registration";
        ResultSet rst = CrudUtil.executeQuery(sql);
        ArrayList<Registration> load = new ArrayList<>();
        while (rst.next()){
            load.add(new Registration(rst.getString(1), rst.getString(2), rst.getString(3), rst.getString(4)));
        }
        return load;
    }
}
