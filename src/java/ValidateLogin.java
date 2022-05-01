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
import java.sql.SQLException;
import java.sql.Statement;
import java.util.HashMap;
import java.util.Map;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.swing.JOptionPane;

/**
 *
 * @author Ral
 */
public class ValidateLogin extends HttpServlet {
    String logineeid, loginpassword, admin, query;
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
            logineeid = request.getParameter("logineeid");
            loginpassword = request.getParameter("loginpassword");
            admin = "admin";
            
        Map < String, String > loginid = new HashMap < String, String > ();
        loginid.put("loginid", "Your Employeeid or Password is incorrect"); 
        Map < String, String > loginname = new HashMap < String, String > ();
        loginname.put("loginname", logineeid);
      
            
            query= "Select * from emp_details where logineeid='"+logineeid+"' and loginpassword='"+loginpassword+"' ";
            dbconn= new DatabaseConnection();
            con = dbconn.setConnection();
            rs = dbconn.getResult(query,con);
            if(rs.next()){
                HttpSession session=request.getSession();  
                session.setAttribute("name",logineeid);
                request.setAttribute("loginname", loginname);
                if(logineeid.equals(admin)){
                 RequestDispatcher rd =  request.getRequestDispatcher("AdminVerify");
                rd.forward(request, response);   
                }else{
                RequestDispatcher rd =  request.getRequestDispatcher("SessionVerify");
                rd.forward(request, response);
            } 
                
            }
            else{
               request.setAttribute("loginid", loginid);
                RequestDispatcher rd =  request.getRequestDispatcher("login.jsp");
                rd.forward(request, response);
            }
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
