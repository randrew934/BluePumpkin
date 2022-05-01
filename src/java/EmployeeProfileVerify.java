/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.text.SimpleDateFormat;
import java.util.HashMap;
import java.util.Map;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Ral
 */
@WebServlet(urlPatterns = {"/EmployeeProfileVerify"})
public class EmployeeProfileVerify extends HttpServlet {

   String fullname, email, password, dateofbirth;
 Connection con;
   PreparedStatement pm;
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
            password = request.getParameter("formpassword");
            dateofbirth = request.getParameter("formemployeedob");
            
            
       HttpSession session=request.getSession(false);
        String name=(String)session.getAttribute("name"); 
         // SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        //  Date DateOB = (Date) sdf.parse(dateofbirth);
      
          con = DriverManager.getConnection("jdbc:mysql://localhost:3306/blue_pumpkin", "root", "");
          String Sql="update emp_details set loginpassword=?, full_name=?, email=?, dateofbirth=? WHERE logineeid='"+name+"' " ;
          
           pm=con.prepareStatement(Sql);
            
            pm.setString(1, password);
            pm.setString(2, fullname);
            pm.setString(3, email);
            pm.setDate(4, java.sql.Date.valueOf(dateofbirth));
        
        pm.executeUpdate();
        
        request.getRequestDispatcher("Employeeprofile.jsp").include(request, response); 
            
        }
        catch(Exception e){
              
            request.getRequestDispatcher("SessionVerify").include(request, response); 
             
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
