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
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Ral
 */
public class deleteadminprofiles extends HttpServlet {

    String e_db_id;
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
         e_db_id = request.getParameter("eid");
         int e_dbid = Integer.parseInt(e_db_id);
            
            
    con = DriverManager.getConnection("jdbc:mysql://localhost:3306/blue_pumpkin", "root", "");
           //dbconn= new DatabaseConnection();
           // con = dbconn.setConnection();
       String Sql= "Delete from emp_details where e_db_id = ?";
           
       pm=con.prepareStatement(Sql);
       pm.setInt(1, e_dbid);
       pm.execute();
       con.close();
         
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
