package action.controller;

import action.dao.RegistrationDao;
import action.model.Registration;
import com.google.gson.Gson;
import org.apache.struts2.ServletActionContext;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;

public class TrainAction {
//    private String name;
//
//
//    public String getName() {
//        return name;
//    }
//
//    public void setName(String name) {
//        this.name = name;
//    }

    private Registration registration;
     RegistrationDao registrationDao=new RegistrationDao();
    public String execute(){

        System.out.println(getRegistration());
        boolean register = false;
        try {
            register = registrationDao.Register(getRegistration());
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }

        if (register){
                return "success";
            }else {
                return "fail";
            }


    }
    protected HttpServletRequest request;

    public void getData() throws IOException {
//        String pass = getRegistration().getPassword();
//        String email = getRegistration().getEmail();
        HttpServletResponse response = ServletActionContext.getResponse();
        HttpServletRequest request = ServletActionContext.getRequest();
        System.out.println("get data on fire");
        String email = request.getParameter("email");
        String pass = request.getParameter("password");
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        Registration r = null;
        String password=null;
        try {
             r = registrationDao.signin(email);
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
        String s=null;
        if (r!=null) {
             password = r.getPassword();
            if (pass.equals(password)) {

                System.out.println(password);
                System.out.println("password correct");

                s = new Gson().toJson("success");
                System.out.println("success");
                    response.getWriter().write(s);


            }else{
                s = new Gson().toJson("fail");
                System.out.println("fail");
                response.getWriter().write(s);

            }
        }else{
            s = new Gson().toJson("null");
            System.out.println("null");
            response.getWriter().write(s);

        }


    }


    public void loadData(){
        String s = null;
        HttpServletResponse response = ServletActionContext.getResponse();
        HttpServletRequest request = ServletActionContext.getRequest();
        try {
            ArrayList<Registration> registrations = registrationDao.loadData();
             s = new Gson().toJson(registrations);
            System.out.println(s);
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        try {
            response.getWriter().write(s);
        } catch (IOException e) {
            e.printStackTrace();
        }
        
    }

    public void updateData(){
        HttpServletResponse response = ServletActionContext.getResponse();
        HttpServletRequest request = ServletActionContext.getRequest();

        String email = request.getParameter("email");
        String userName = request.getParameter("userName");
        String address = request.getParameter("address");
        String password = request.getParameter("password");

        System.out.println(email+" "+address);
        Registration registration = new Registration(email, userName, address, password);
        try {
            boolean update = registrationDao.update(registration);
            response.setContentType("application/json");
            response.setCharacterEncoding("UTF-8");
            String s=null;

        if (update){
            s = new Gson().toJson("success");
            response.getWriter().write(s);
        }else{
            s = new Gson().toJson("fail");
            response.getWriter().write(s);
        }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }

    }
    public Registration getRegistration() {
        return registration;
    }

    public void setRegistration(Registration registration) {
        this.registration = registration;
    }
}
