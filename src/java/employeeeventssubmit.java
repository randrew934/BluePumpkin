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
@WebServlet(urlPatterns = {"/employeeeventssubmit"})
public class employeeeventssubmit extends HttpServlet {

  
   String emp_id, events_id;
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
         emp_id = request.getParameter("formeventseeid");
         events_id = request.getParameter("formeventseeeventno");
            
            
    //con = DriverManager.getConnection("jdbc:mysql://localhost:3306/blue_pumpkin", "root", "");
           dbconn= new DatabaseConnection();
            con = dbconn.setConnection();
       String Sql="INSERT INTO temp_events(employee_id, event_id)value(?,?)";
           
        pm=con.prepareStatement(Sql);
          pm.setString(1, emp_id);
          pm.setString(2, events_id);
          pm.executeUpdate();
         
        request.getRequestDispatcher("employeeevents").include(request, response); 
            
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
