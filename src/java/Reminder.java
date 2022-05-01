/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Ral
 */
public class Reminder extends HttpServlet {

       String date, query;
       ArrayList <String> birthday = new ArrayList<String>();
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
            LocalDate today = java.time.LocalDate.now();
            date = today.toString();
            
      
      HashMap < String, List<String> > birthdayname = new HashMap < String, List<String> > ();
      birthdayname.put("birthday", birthday);
      
          HttpSession session=request.getSession(false); 
           
        /*  query= "Select * from emp_details WHERE DATE_FORMAT(dateofbirth, '%m-%d') = DATE_FORMAT('"+date+"', '%m-%d')";
            dbconn= new DatabaseConnection();
            con = dbconn.setConnection();
            rs = dbconn.getResult(query,con);
            
            while(rs.next()){
               birthday.add(rs.getString("full_name"));
               request.setAttribute("birthday", birthday);
             
            } */
            
        if(session!=null){  
           
       String name=(String)session.getAttribute("name"); 
       request.getRequestDispatcher("Reminder.jsp").include(request, response);
        }  
        else{  
           request.getRequestDispatcher("login.html").include(request, response);  
        }  
        out.close();   
        }
        catch(Exception e){
              response.sendRedirect("login.html"); 
             
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
