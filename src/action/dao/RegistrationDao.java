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


    public ArrayList<Registration> loadData(String countTo, String countFrom) throws SQLException, ClassNotFoundException {
        String sql="SELECT * FROM Registration LIMIT "+countTo+","+countFrom;
        ResultSet rst = CrudUtil.executeQuery(sql);
        ArrayList<Registration> load = new ArrayList<>();
        while (rst.next()){
            load.add(new Registration(rst.getString(1), rst.getString(2), rst.getString(3), rst.getString(4)));
        }
        return load;
    }

    public boolean update(Registration r) throws SQLException, ClassNotFoundException {
        String sql="UPDATE Registration SET userName=?,address=?,password=?  WHERE email=?";
        boolean b = CrudUtil.executeUpdate(sql, r.getUserName(), r.getAddress(),r.getPassword(), r.getEmail());
        return b;
    }

    public boolean delete(String email) throws SQLException, ClassNotFoundException {
        String sql="DELETE FROM Registration WHERE email =?";
        boolean b = CrudUtil.executeUpdate(sql, email);
        return b;
    }

    public ArrayList<Registration> search(String email) {
        String sql="SELECT * FROM Registration WHERE email=?";
        try {
            ResultSet rst = CrudUtil.executeQuery(sql, email);
            ArrayList<Registration> load = new ArrayList<>();

            while (rst.next()) {
                load.add(new Registration(rst.getString(1), rst.getString(2), rst.getString(3), rst.getString(4)));
            }
            return load;
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
        return null;
    }

    public boolean confirmPassword(String email, String password) throws SQLException, ClassNotFoundException {
        String sql="UPDATE Registration SET password=?  WHERE email=?";
        boolean b = CrudUtil.executeUpdate(sql, password,email);
        return b;
    }
}
