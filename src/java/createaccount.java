/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Ral
 */
public class createaccount extends HttpServlet {

    String fullname, employeeid, email, password, logineeid, dateofbirth;
    ArrayList user_details = null;
 Connection con;
   PreparedStatement ps;
    ResultSet rs;
  Statement stm;
    DatabaseConnection dbconn;
    
  protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        
        try  {
           
           fullname = request.getParameter("formfullname");
            email = request.getParameter("formemail");
            logineeid = request.getParameter("formemployeeid");
            password = request.getParameter("formpassword");
            dateofbirth = request.getParameter("formemployeedob");
            
            
    con = DriverManager.getConnection("jdbc:mysql://localhost:3306/blue_pumpkin", "root", "");
     //  dbconn= new DatabaseConnection();
     //   con = dbconn.setConnection();
       
    ps = con.prepareStatement("INSERT INTO emp_details (logineeid, loginpassword, full_name, email, dateofbirth) values(?,?,?,?,?)");
           
            ps.setString(1, logineeid);
            ps.setString(2, password);
            ps.setString(3, fullname);
            ps.setString(4, email);
            ps.setDate(5, java.sql.Date.valueOf(dateofbirth));
        
        ps.executeUpdate();
                  
       // con.close();
        request.getRequestDispatcher("adminprofile.jsp").include(request, response); 
        }
        catch(Exception e){
             request.getRequestDispatcher("AdminVerify").include(request, response); 
             
        }
          finally{
            out.close();
            
        }
    }

  
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }


    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);

    }
    
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
