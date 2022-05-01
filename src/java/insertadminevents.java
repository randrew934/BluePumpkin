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
public class insertadminevents extends HttpServlet {

    String e_user_id, emp_id, event_id;
    ArrayList user_details = null;
 Connection con;
   PreparedStatement pm, ps, pd;
    ResultSet rs;
  Statement stm;
    DatabaseConnection dbconn;
    
  protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        
        try  {
         e_user_id = request.getParameter("eid");
         int e_userid = Integer.parseInt(e_user_id);
            
            
    con = DriverManager.getConnection("jdbc:mysql://localhost:3306/blue_pumpkin", "root", "");
     //  dbconn= new DatabaseConnection();
     //   con = dbconn.setConnection();
       
     
    String query = "SELECT employee_id, event_id FROM temp_events WHERE e_user_id=?";

     pm=con.prepareStatement(query);
     pm.setInt(1, e_userid);
     rs = pm.executeQuery();
     user_details = new ArrayList();
     

    ps = con.prepareStatement("INSERT INTO accepted_events (employee_id, event_id) values(?,?)");

    while (rs.next()) {
        emp_id = rs.getString("employee_id");
        event_id = rs.getString("event_id");

        ps.setString(1, emp_id);
        ps.setString(2, event_id);
        ps.executeUpdate();
        
      pd = con.prepareStatement("Delete from temp_events where e_user_id = ?");
      pd.setInt(1, e_userid);
      pd.execute();
    }
                  
        con.close();
        request.getRequestDispatcher("adminevents.jsp").include(request, response); 
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
